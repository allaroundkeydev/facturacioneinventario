<?php
//app\Services\DTEService.php
namespace App\Services;

use App\Models\Empresa;
use App\Models\Dte;
use Illuminate\Support\Facades\DB;
use Exception;

class DTEService
{
    private $haciendaUrl = 'https://apitest.dtes.mh.gob.sv';

    public function __construct()
    {
        // Use the environment variable for the production URL if available
        $this->haciendaUrl = env('HACIENDA_API_URL', $this->haciendaUrl);
    }

    /**
     * Emite la factura electrónica: recupera token, firma el DTE y lo envía a Hacienda.
     *
     * @param Dte $dte   Modelo Dte con los datos del DTE
     * @return array     Respuesta decodificada de Hacienda
     * @throws Exception
     */
    public function emitirFactura(Dte $dte): array
    {
        $empresa = Empresa::where('usuario_id', $dte->usuario_id)->first();
        if (!$empresa) {
            throw new Exception('Emisor no encontrado en BD.');
        }

        // 1) Obtener credenciales del emisor (API, clave privada, NIT)
        $apiUser = $empresa->api_user ?? '';
        $apiPass = $empresa->api_password ?? '';
        $privKeyPass = $empresa->key_password ?? '';

        // Limpiamos posibles guiones/puntos del NIT
        $nit = preg_replace('/\D/', '', $empresa->nit);

        // 2) TOKEN: recuperar de BD o solicitar uno nuevo
        $token = $this->obtenerToken($empresa->id, $apiUser, $apiPass);

        // 3) FIRMAR en Docker
        $dteArray = $dte->dte_json;
        if (!is_array($dteArray)) {
            throw new Exception('El JSON de DTE no es válido.');
        }

        $payloadFirm = [
            'nit'         => $apiUser,
            'activo'      => true,
            'passwordPri' => $privKeyPass,
            'dteJson'     => $dteArray
        ];

        $jwtFirmado = $this->firmarDocumento($payloadFirm);

        // 4) Inyectar firma dentro del documento DTE
        $dteArray['firmaElectronica'] = $jwtFirmado;

        // 5) Preparar paquete para Hacienda (firma ya dentro de 'documento')
        $paquete = [
            'ambiente'         => $dteArray['identificacion']['ambiente'],
            'idEnvio'          => time(),
            'version'          => (int)$dteArray['identificacion']['version'],
            'tipoDte'          => $dteArray['identificacion']['tipoDte'],
            'documento'        => $jwtFirmado,
        ];

        $envioPayload = json_encode(
            $paquete,
            JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT
        );

        if ($envioPayload === false) {
            throw new Exception('Error al codificar payload: ' . json_last_error_msg());
        }

        // 6) Envío a Hacienda
        $response = $this->enviarDTE($envioPayload, $token);

        // 7) Actualizar el registro DTE con la respuesta
        $dte->update([
            'respuesta_json' => $response,
            'estado' => $response['estado'] ?? 'DESCONOCIDO'
        ]);

        return $response;
    }

    /**
     * Obtiene un token de autenticación de Hacienda
     *
     * @param int $empresaId
     * @param string $apiUser
     * @param string $apiPass
     * @return string Token de autenticación
     * @throws Exception
     */
    private function obtenerToken(int $empresaId, string $apiUser, string $apiPass): string
    {
        // Verificar si ya tenemos un token válido
        $tokenRecord = DB::table('tokens')->where('usuario_id', $empresaId)->first();
        $now = new \DateTime();

        if ($tokenRecord && new \DateTime($tokenRecord->expire_at) > $now) {
            // Todavía no ha expirado
            return $tokenRecord->token;
        }

        // Solicitar nuevo token
        $postFields = http_build_query([
            'user' => $apiUser,
            'pwd'  => $apiPass
        ]);

        $chAuth = curl_init(rtrim($this->haciendaUrl, '/') . '/seguridad/auth/');
        curl_setopt_array($chAuth, [
            CURLOPT_POST           => true,
            CURLOPT_POSTFIELDS     => $postFields,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER     => [
                'Content-Type: application/x-www-form-urlencoded',
                'User-Agent: factura-electronica-client'
            ],
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_SSL_VERIFYHOST => false,
        ]);

        $authResp = curl_exec($chAuth);
        $code     = curl_getinfo($chAuth, CURLINFO_HTTP_CODE);
        curl_close($chAuth);

        if ($authResp === false) {
            throw new Exception('Error CURL auth (sin respuesta).');
        }
        if ($code !== 200) {
            throw new Exception("Auth falló, HTTP $code, respuesta: $authResp");
        }

        $authData = json_decode($authResp, true);
        if (!isset($authData['status']) || strtoupper($authData['status']) !== 'OK') {
            $err = $authData['error'] ?? json_encode($authData);
            throw new Exception("Auth rechazado: $err");
        }

        $bearer = $authData['body']['token'] ?? '';
        $token  = preg_replace('/^Bearer\s+/i', '', trim($bearer));

        // Expira en ~24 horas
        $expireAt = (new \DateTime())
            ->add(new \DateInterval('PT23H59M'))
            ->format('Y-m-d H:i:s');

        // Guardar o actualizar el token en la base de datos
        DB::table('tokens')->updateOrInsert(
            ['usuario_id' => $empresaId],
            ['token' => $token, 'expire_at' => $expireAt]
        );

        return $token;
    }

    /**
     * Firma el documento DTE usando el servicio Docker
     *
     * @param array $payload Datos para la firma
     * @return string JWT firmado
     * @throws Exception
     */
    private function firmarDocumento(array $payload): string
    {
        $payloadJson = json_encode($payload, JSON_UNESCAPED_SLASHES);
        if ($payloadJson === false) {
            throw new Exception('Error al codificar payloadFirm: ' . json_last_error_msg());
        }

        $chFirm = curl_init('http://localhost:8113/firmardocumento/');
        curl_setopt_array($chFirm, [
            CURLOPT_POST           => true,
            CURLOPT_POSTFIELDS     => $payloadJson,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER     => [
                'Content-Type: application/json',
                'User-Agent: factura-electronica-client'
            ],
        ]);

        $firmResp = curl_exec($chFirm);
        $code     = curl_getinfo($chFirm, CURLINFO_HTTP_CODE);
        curl_close($chFirm);

        if ($firmResp === false || $code !== 200) {
            throw new Exception("Firma falló, HTTP $code, respuesta: $firmResp");
        }

        $firmData = json_decode($firmResp, true);
        if (!isset($firmData['body']) || !is_string($firmData['body'])) {
            throw new Exception('No se recibió firmaElectronica válida. Respuesta firma: ' . print_r($firmData, true));
        }

        return $firmData['body'];
    }

    /**
     * Envía el DTE firmado a Hacienda
     *
     * @param string $envioPayload Payload del DTE a enviar
     * @param string $token Token de autenticación
     * @return array Respuesta de Hacienda
     * @throws Exception
     */
    private function enviarDTE(string $envioPayload, string $token): array
    {
        $chSend = curl_init(rtrim($this->haciendaUrl, '/') . '/fesv/recepciondte/');
        curl_setopt_array($chSend, [
            CURLOPT_POST           => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POSTFIELDS     => $envioPayload,
            CURLOPT_HTTPHEADER     => [
                'Authorization: Bearer ' . $token,
                'User-Agent: factura-electronica-client',
                'Content-Type: application/json',
                'Accept: application/json',
            ],
        ]);

        $sendResp = curl_exec($chSend);
        $code     = curl_getinfo($chSend, CURLINFO_HTTP_CODE);
        curl_close($chSend);

        if ($sendResp === false) {
            throw new Exception('Error CURL envío DTE (sendResp false).');
        }
        if ($code !== 200) {
            $responseData = json_decode($sendResp, true);
            $descEnvio = $responseData['descripcionMsg']
                ?? $responseData['error']
                ?? json_encode($responseData);
            throw new Exception("Error en envío DTE ($code): $descEnvio");
        }

        return json_decode($sendResp, true);
    }
}
