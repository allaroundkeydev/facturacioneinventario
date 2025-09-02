<?php
//app\Services\DTEService.php
namespace App\Services;

use App\Models\Dte;
use App\Models\Empresa;
use App\Models\Token;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;
use Exception;

class DTEService
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
     * Emite (firma + envía) un DTE y actualiza la fila correspondiente.
     *
     * @param  Dte  $dte
     * @return array Resumen de la respuesta
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

        // 4) Firmar en Docker
        $jwtFirmado = $this->signWithDocker($empresa, $dteArray);

        // Comprobar que se obtuvo algo del firmador
        if (empty($jwtFirmado)) {
            throw new Exception('Firma vacía: el firmador no devolvió contenido válido.');
        }

        // 5) Inyectar firma dentro del documento DTE (como hace el ejemplo)
        $dteArray['firmaElectronica'] = $jwtFirmado;

        // 6) Preparar paquete para Hacienda (siguiendo el ejemplo)
        $paquete = [
            'ambiente'         => $dteArray['identificacion']['ambiente'],
            'idEnvio'          => time(),
            'version'          => (int)$dteArray['identificacion']['version'],
            'tipoDte'          => $dteArray['identificacion']['tipoDte'],
            'documento'        => $jwtFirmado,  // JWT firmado como string
        ];

        // Log breve del payload (no incluir la firma completa)
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
            // no pudo parsear JSON
            Log::warning("No se pudo parsear JSON de respuesta Hacienda: " . $ex->getMessage());
        }

        // Log completo de respuesta (útil para depuración)
        Log::info("Respuesta Hacienda HTTP {$httpCode} - body: " . substr($respBody, 0, 4000));

        // 8) Guardar respuesta en DTE
        $dte->respuesta_json = $respJson ?? $respBody;
        $dte->estado = $respJson['estado'] ?? ($httpCode === 200 ? 'PROCESADO' : 'ERROR_' . $httpCode);
        $dte->codigo_generacion = $respJson['codigoGeneracion'] ?? $dte->codigo_generacion;
        $dte->save();

        if ($httpCode !== 200) {
            // Lanzar excepción con el body (acotado) para que la UI lo muestre si corresponde
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
     * Obtiene o solicita token para la empresa.
     *
     * @param Empresa $empresa
     * @return string
     * @throws Exception
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

        // 🔹 MÉTODO MÁS SEGURO: Buscar y actualizar o crear manualmente
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
     *
     * @param Empresa $empresa
     * @param array $dteArray
     * @return string
     * @throws Exception
     */
    protected function signWithDocker(Empresa $empresa, array $dteArray): string
    {
        $payload = [
            'nit'         => $empresa->api_user ?? $empresa->nit ?? null,
            'activo'      => true,
            'passwordPri' => $empresa->key_password ?? null,
            'dteJson'     => $dteArray,
        ];

        // Log resumen (sin password)
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

        // Si el firmador devuelve ['body' => 'jwt_string'], extraer el body
        if (isset($json['body']) && is_string($json['body'])) {
            return $json['body'];
        }

        // Si devuelve directamente el JWT
        if (is_string($json)) {
            return $json;
        }

        // Fallback
        throw new Exception('El firmador no devolvió un JWT válido: ' . json_encode($json));
    }
}