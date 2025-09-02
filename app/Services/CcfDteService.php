<?php
//app\Services\CcfDteService.php
namespace App\Services;

use App\Models\Dte;
use App\Models\Empresa;
use App\Models\Token;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;
use Exception;

class CcfDteService
{
    protected string $haciendaUrl;
    protected string $signerUrl;

    public function __construct()
    {
        $this->haciendaUrl = rtrim(config('services.dte.hacienda_url', env('DTE_HACIENDA_URL', 'https://apitest.dtes.mh.gob.sv')), '/');
        $signer = config('services.dte.signer_url', env('DTE_SIGNER_URL', 'http://localhost:8113'));
        $this->signerUrl = rtrim($signer, '/');
    }

    /**
     * Emite (firma + envía) un DTE CCF (tipo 03) y actualiza la fila correspondiente.
     *
     * @param Dte $dte
     * @return array
     * @throws Exception
     */
    public function emitir(Dte $dte): array
    {
        // 1) Cargar user y empresa emisora
        $user = $dte->usuario_id ? \App\Models\User::find($dte->usuario_id) : null;
        if (! $user) {
            throw new Exception("No se encontró el usuario asociado al DTE (usuario_id={$dte->usuario_id}).");
        }

        $empresa = $user->empresa ?? null;
        if (! $empresa instanceof Empresa) {
            throw new Exception('Empresa emisora no encontrada para el usuario.');
        }

        // 2) Obtener token válido para la empresa
        $token = $this->getTokenForEmpresa($empresa);

        // 3) Preparar DTE (array)
        $dteArray = $dte->dte_json;
        if (! is_array($dteArray)) {
            throw new Exception('El campo dte_json del DTE no es un array válido.');
        }

        // 3.1 Sanear/normalizar para CCF justo antes de firmar/enviar
        // (evita depender de otros puntos de la app)
        $dteArray = $this->sanitizeForCcf($dteArray);

        // Log resumido del DTE que vamos a firmar (no loguear la firma completa)
        Log::info('DTE (CCF) previo a firmar - resumen: ' . json_encode([
            'tipoDte' => $dteArray['identificacion']['tipoDte'] ?? null,
            'version' => $dteArray['identificacion']['version'] ?? null,
            'codigoGeneracion' => $dteArray['identificacion']['codigoGeneracion'] ?? null,
            'emisor_nit' => $dteArray['emisor']['nit'] ?? null,
            'receptor_nit' => $dteArray['receptor']['nit'] ?? null,
            'resumen_subTotal' => $dteArray['resumen']['subTotal'] ?? null,
            'resumen_ivaPerci1' => $dteArray['resumen']['ivaPerci1'] ?? null,
            'items_count' => count($dteArray['cuerpoDocumento'] ?? []),
        ]));

        // 4) Firmar en Docker
        $jwtFirmado = $this->signWithDocker($empresa, $dteArray);

        if (empty($jwtFirmado)) {
            throw new Exception('Firma vacía: el firmador no devolvió contenido válido.');
        }

        // 5) Inyectar firma dentro del documento DTE
        $dteArray['firmaElectronica'] = $jwtFirmado;

        // 6) Preparar paquete para Hacienda
        $paquete = [
            'ambiente'         => $dteArray['identificacion']['ambiente'] ?? null,
            'idEnvio'          => time(),
            'version'          => (int)($dteArray['identificacion']['version'] ?? 3),
            'tipoDte'          => $dteArray['identificacion']['tipoDte'] ?? '03',
            'documento'        => $jwtFirmado,
        ];

        Log::info('DTE -> Envío a Hacienda (resumen payload): ' . json_encode([
            'idEnvio' => $paquete['idEnvio'],
            'tipoDte' => $paquete['tipoDte'],
            'ambiente'=> $paquete['ambiente'],
            'documento_length' => strlen($jwtFirmado)
        ]));

        // 7) Envío a Hacienda
        $urlSend = $this->haciendaUrl . '/fesv/recepciondte/';
        $response = Http::withToken($token)
            ->acceptJson()
            ->timeout(90)
            ->post($urlSend, $paquete);

        $httpCode = $response->status();
        $respBody = $response->body();
        $respJson = null;
        try {
            $respJson = $response->json();
        } catch (\Throwable $ex) {
            Log::warning("No se pudo parsear JSON de respuesta Hacienda: " . $ex->getMessage());
        }

        Log::info("Respuesta Hacienda HTTP {$httpCode} - body: " . substr($respBody, 0, 4000));

        // 8) Guardar respuesta en DTE
        $dte->respuesta_json = $respJson ?? $respBody;
        $dte->estado = $respJson['estado'] ?? ($httpCode === 200 ? 'PROCESADO' : 'ERROR_' . $httpCode);
        $dte->codigo_generacion = $respJson['codigoGeneracion'] ?? $dte->codigo_generacion;
        $dte->save();

        if ($httpCode !== 200) {
            throw new Exception("Hacienda devolvió HTTP {$httpCode}: " . substr($respBody, 0, 2000));
        }

        return [
            'http_code' => $httpCode,
            'estado'    => $dte->estado,
            'codigo'    => $dte->codigo_generacion,
            'response'  => $respJson ?? $respBody,
        ];
    }

    /**
     * Sanitiza un array DTE para cumplir el esquema CCF (v3 - tipo 03)
     */
    protected function sanitizeForCcf(array $dte): array
    {
        // Forzar identificacion CCF V3
        $dte['identificacion']['version'] = 3;
        $dte['identificacion']['tipoDte'] = '03';
        // asegurar ambient/fechas mínimos
        $dte['identificacion']['fecEmi'] = $dte['identificacion']['fecEmi'] ?? Carbon::now()->format('Y-m-d');
        $dte['identificacion']['horEmi'] = $dte['identificacion']['horEmi'] ?? Carbon::now()->format('H:i:s');

        // Emisor: asegurar nombreComercial si falta
        if (empty($dte['emisor']['nombreComercial'])) {
            $dte['emisor']['nombreComercial'] = $dte['emisor']['nombre'] ?? 'EMISOR';
        }
        // Asegurar codEstableMH / codPuntoVentaMH (placeholders si falta)
        $dte['emisor']['codEstableMH'] = $dte['emisor']['codEstableMH'] ?? 'M001';
        $dte['emisor']['codPuntoVentaMH'] = $dte['emisor']['codPuntoVentaMH'] ?? 'P001';

        // Receptor: normalizar. Aceptamos numDocumento/tipoDocumento en entrada,
        // pero HACIENDA exige 'nit' y 'nombreComercial' y 'nrc' con formato correcto.
        $r = $dte['receptor'] ?? [];

        // mapear numDocumento -> nit
        $rawNit = $r['nit'] ?? $r['numDocumento'] ?? $r['num_documento'] ?? null;
        $nitDigits = $rawNit ? preg_replace('/\D+/', '', (string)$rawNit) : '';

        $r['nit'] = $nitDigits ?: ''; // dejar string (vacío marcará error en validación hacienda si realmente falta)
        // nombreComercial obligatorio: fallback a nombre o 'CLIENTE'
        $r['nombreComercial'] = $r['nombreComercial'] ?? $r['nombre'] ?? $r['razon_social'] ?? 'CLIENTE';
        // nombre
        $r['nombre'] = $r['nombre'] ?? $r['nombreComercial'];

        // nrc: normalizar a solo dígitos (Hacienda espera formato particular; ajusta si tienes reglas)
        $nrcRaw = $r['nrc'] ?? null;
        $nrcDigits = $nrcRaw ? preg_replace('/\D+/', '', (string)$nrcRaw) : '';
        if ($nrcDigits === '') {
            // placeholder seguro: 8 ceros (mejor si tienes reglas reales)
            $nrcDigits = str_repeat('0', 8);
        } elseif (strlen($nrcDigits) > 8) {
            $nrcDigits = substr($nrcDigits, 0, 8);
        }
        $r['nrc'] = $nrcDigits;

        // eliminar campos no permitidos por CCF
        unset($r['numDocumento'], $r['num_documento'], $r['tipoDocumento'], $r['tipo_documento']);

        $dte['receptor'] = $r;

        // Items: eliminar ivaItem si existe y campos prohibidos
        if (!empty($dte['cuerpoDocumento']) && is_array($dte['cuerpoDocumento'])) {
            foreach ($dte['cuerpoDocumento'] as $k => $it) {
                if (isset($dte['cuerpoDocumento'][$k]['ivaItem'])) {
                    unset($dte['cuerpoDocumento'][$k]['ivaItem']);
                }
                if (isset($dte['cuerpoDocumento'][$k]['totalIva'])) {
                    unset($dte['cuerpoDocumento'][$k]['totalIva']);
                }
            }
        }

        // Resumen: eliminar totalIva si existe, asegurar ivaPerci1
        if (isset($dte['resumen']['totalIva'])) {
            unset($dte['resumen']['totalIva']);
        }

        $res = $dte['resumen'] ?? [];
        if (! array_key_exists('ivaPerci1', $res)) {
            // intentar calcular ivaPerci1 a partir de totalPagar - subTotal (si posible)
            $sub = floatval($res['subTotal'] ?? $res['subTotalVentas'] ?? 0);
            $total = floatval($res['totalPagar'] ?? 0);
            $ivaCalc = round(max(0, $total - $sub), 2);
            $dte['resumen']['ivaPerci1'] = $ivaCalc;
        }

        // asegurar subTotal y totalPagar mínimos
        $dte['resumen']['subTotal'] = $dte['resumen']['subTotal'] ?? ($dte['resumen']['subTotalVentas'] ?? 0);
        $dte['resumen']['totalPagar'] = $dte['resumen']['totalPagar'] ?? $dte['resumen']['subTotal'];

        return $dte;
    }

    /**
     * Obtiene o solicita token para la empresa.
     */
    protected function getTokenForEmpresa(Empresa $empresa): string
    {
        $now = Carbon::now();
        $tokRow = Token::where('empresa_id', $empresa->id)->first();

        if ($tokRow && $tokRow->expire_at && Carbon::parse($tokRow->expire_at)->greaterThan($now)) {
            Log::info("Token válido encontrado para empresa_id={$empresa->id}");
            return $tokRow->token;
        }

        // Solicitar nuevo token
        $urlAuth = $this->haciendaUrl . '/seguridad/auth/';

        $resp = Http::asForm()
            ->acceptJson()
            ->timeout(30)
            ->post($urlAuth, [
                'user' => $empresa->api_user,
                'pwd'  => $empresa->api_password,
            ]);

        if (! $resp->ok()) {
            Log::error("Auth HACIENDA falló HTTP {$resp->status()} - body: " . $resp->body());
            throw new Exception("Auth a Hacienda falló. HTTP {$resp->status()}");
        }

        $json = $resp->json();
        if (! isset($json['status']) || strtoupper($json['status']) !== 'OK') {
            $err = $json['error'] ?? json_encode($json);
            throw new Exception("Auth rechazado por Hacienda: " . $err);
        }

        $bearer = $json['body']['token'] ?? null;
        if (! $bearer) {
            throw new Exception('No se recibió token en la respuesta de auth.');
        }

        $token = preg_replace('/^Bearer\s+/i', '', trim($bearer));
        $expireAt = Carbon::now()->addHours(23)->addMinutes(59)->toDateTimeString();

        $existingToken = Token::where('empresa_id', $empresa->id)->first();

        if ($existingToken) {
            $existingToken->update([
                'token' => $token,
                'expire_at' => $expireAt,
            ]);
        } else {
            Token::create([
                'empresa_id' => $empresa->id,
                'token' => $token,
                'expire_at' => $expireAt,
            ]);
        }

        Log::info("Token obtenido y guardado para empresa_id={$empresa->id} (expira: {$expireAt})");

        return $token;
    }

    /**
     * Llama al firmador Docker y retorna la firma/resultado.
     */
    protected function signWithDocker(Empresa $empresa, array $dteArray): string
    {
        $payload = [
            'nit'         => $empresa->api_user ?? $empresa->nit ?? null,
            'activo'      => true,
            'passwordPri' => $empresa->key_password ?? null,
            'dteJson'     => $dteArray,
        ];

        $tmp = $payload;
        unset($tmp['passwordPri']);
        Log::info('Llamando firmador (docker) - payload summary: ' . json_encode($tmp));

        $urlFirm = $this->signerUrl . '/firmardocumento/';
        Log::info("Firmador URL utilizada: {$urlFirm}");

        $resp = Http::timeout(60)
            ->withHeaders([
                'User-Agent' => 'factura-electronica-client',
                'Content-Type' => 'application/json',
            ])
            ->post($urlFirm, $payload);

        if (! $resp->ok()) {
            Log::error("Firma falló HTTP {$resp->status()} - body: " . $resp->body());
            throw new Exception("Firma falló, HTTP {$resp->status()}");
        }

        $json = $resp->json();

        if (isset($json['body']) && is_string($json['body'])) {
            return $json['body'];
        }

        if (is_string($json)) {
            return $json;
        }

        throw new Exception('El firmador no devolvió un JWT válido: ' . json_encode($json));
    }
}
