<?php
// src/DTEService.php

class DTEService {
    private $pdo;
    private $haciendaUrl = 'https://apitest.dtes.mh.gob.sv';

    public function __construct(PDO $pdo) {
        $this->pdo = $pdo;
    }

    /**
     * Emite la factura electrónica: recupera token, firma el DTE y lo envía a Hacienda.
     *
     * @param string $jsonDte   JSON de DTE sin firma (string)
     * @param int    $usuarioId
     * @return array            Respuesta decodificada de Hacienda
     * @throws Exception
     */
    public function emitirFactura(string $jsonDte, int $usuarioId): array {
        //
        // 1) Obtener credenciales del emisor (API, clave privada, NIT)
        //
        $stmt = $this->pdo->prepare(
            'SELECT api_user, api_pass, priv_key_pass, nit 
             FROM usuarios WHERE id = ?'
        );
        $stmt->execute([$usuarioId]);
        $u = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!$u) {
            throw new Exception('Emisor no encontrado en BD.');
        }
        // Limpiamos posibles guiones/puntos del NIT
        $nit = preg_replace('/\D/', '', $u['nit']);
        $apiuser = $u['api_user'] ?? '';
        //
        // 2) TOKEN: recuperar de BD o solicitar uno nuevo
        //
        $stmt = $this->pdo->prepare('SELECT token, expire_at FROM tokens WHERE usuario_id = ?');
        $stmt->execute([$usuarioId]);
        $tokRow = $stmt->fetch(PDO::FETCH_ASSOC);
        $now    = new DateTime();

        if ($tokRow && new DateTime($tokRow['expire_at']) > $now) {
            // Todavía no ha expirado
            $token = $tokRow['token'];
        } else {
            // Solicitar nuevo token
            $postFields = http_build_query([
                'user' => $u['api_user'],
                'pwd'  => $u['api_pass']
            ]);

            $logFile = sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'curl_debug.txt';
            $fhAuth  = fopen($logFile, 'a');
            if (!$fhAuth) {
                throw new Exception("No se pudo abrir archivo de log en: $logFile");
            }

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
                CURLOPT_VERBOSE        => true,
                CURLOPT_STDERR         => $fhAuth
            ]);
            $authResp = curl_exec($chAuth);
            $code     = curl_getinfo($chAuth, CURLINFO_HTTP_CODE);
            curl_close($chAuth);
            fclose($fhAuth);

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
            $expireAt = (new DateTime())
                ->add(new DateInterval('PT23H59M'))
                ->format('Y-m-d H:i:s');

            $upsert = $this->pdo->prepare(
                'REPLACE INTO tokens (usuario_id, token, expire_at) VALUES (?, ?, ?)'
            );
            $upsert->execute([$usuarioId, $token, $expireAt]);
        }

        //
        // 3) FIRMAR en Docker
        //
        $dteArray = json_decode($jsonDte, true);
        if (!is_array($dteArray)) {
            throw new Exception('El JSON de DTE no es válido: ' . json_last_error_msg());
        }

        $payloadFirm = json_encode([
            'nit'         => $apiuser,
            'activo'      => true,
            'passwordPri' => $u['priv_key_pass'],
            'dteJson'     => $dteArray
        ], JSON_UNESCAPED_SLASHES);
        if ($payloadFirm === false) {
            throw new Exception('Error al codificar payloadFirm: ' . json_last_error_msg());
        }

        $logFile = sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'curl_debug.txt';
        $fhFirm  = fopen($logFile, 'a');
        if (!$fhFirm) {
            throw new Exception("No se pudo abrir archivo de log en: $logFile");
        }
        $chFirm = curl_init('http://localhost:8113/firmardocumento/');
        curl_setopt_array($chFirm, [
            CURLOPT_POST           => true,
            CURLOPT_POSTFIELDS     => $payloadFirm,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER     => [
                'Content-Type: application/json',
                'User-Agent: factura-electronica-client'
            ],
            CURLOPT_VERBOSE        => true,
            CURLOPT_STDERR         => $fhFirm
        ]);
        $firmResp = curl_exec($chFirm);
        $code     = curl_getinfo($chFirm, CURLINFO_HTTP_CODE);
        curl_close($chFirm);
        fclose($fhFirm);

        if ($firmResp === false || $code !== 200) {
            throw new Exception("Firma falló, HTTP $code, respuesta: $firmResp");
        }
        $firmData = json_decode($firmResp, true);
        if (!isset($firmData['body']) || !is_string($firmData['body'])) {
            throw new Exception('No se recibió firmaElectronica válida. Respuesta firma: ' . print_r($firmData, true));
        }
        $jwtFirmado = $firmData['body'];

        // 4) Inyectar firma dentro del documento DTE
        $dteArray['firmaElectronica'] = $jwtFirmado;
$dteArray['firmaElectronica'] = $jwtFirmado;
        // 5) Preparar paquete para Hacienda (firma ya dentro de 'documento')
        
           //$paquete ['ambiente']= $dteArray['identificacion']['ambiente'];
           //$paquete ['idEnvio']= intval(time());
           //$paquete ['version']= (int)$dteArray['identificacion']['version'];
           //$paquete ['tipoDte'] = $dteArray['identificacion']['tipoDte'];
           //$paquete ['codigoGeneracion'] = $dteArray['identificacion']['codigoGeneracion'];
           //$paquete ['codigoGeneracion'] = $dteArray['identificacion']['codigoGeneracion'];
           //$paquete = $dteArray;
          //$paquete['firmaElectronica'] = $jwtFirmado;
           // 6) Envío a Hacienda
$paquete = [
    'ambiente'         => $dteArray['identificacion']['ambiente'],            // 4
    'idEnvio'          => time(),                                              // 5
    'version'          => (int)$dteArray['identificacion']['version'],         // 6
    'tipoDte'          => $dteArray['identificacion']['tipoDte'],              // 7
    'documento'        => $jwtFirmado,                                           // 8: **objeto**, no string**
   // 'codigoGeneracion' => $dteArray['identificacion']['codigoGeneracion'],     // 9
];


        $envioPayload = json_encode(
    $paquete,
    JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT
);
if ($envioPayload === false) {
    throw new Exception('Error al codificar payload: '.json_last_error_msg());
}

echo "<h4>Payload que se enviará a Hacienda:</h4><pre>"
   . htmlspecialchars($envioPayload, ENT_QUOTES, 'UTF-8')
   . "</pre>";
 
        // 7) Envío a Hacienda

// 7.1) Preparamos el log de envío
$logFile = sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'curl_debug.txt';
$fhSend  = fopen($logFile, 'a');
if (!$fhSend) {
    throw new Exception("No se pudo abrir archivo de log en: $logFile");
}

// 7.2) Volcamos el payload al log
fwrite($fhSend, "\n\n--- INICIO DE ENVÍO A HACIENDA " . date('Y-m-d H:i:s') . " ---\n");
fwrite($fhSend, $envioPayload . "\n");



// 7.3) Configuramos y ejecutamos el cURL
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
    CURLOPT_VERBOSE        => true,
    CURLOPT_STDERR         => $fhSend,
]);

$sendResp = curl_exec($chSend);
$code     = curl_getinfo($chSend, CURLINFO_HTTP_CODE);

// 7.4) Decodificamos la respuesta
$responseData = json_decode($sendResp, true);

// 7.5) Insertar en la tabla dtes
$codigoGen = $responseData['codigoGeneracion'] ?? null;

$stmt = $this->pdo->prepare("
    INSERT INTO dtes (
        usuario_id,
        dte_json,
        respuesta_json,
        estado,
        codigo_generacion
    ) VALUES (?, ?, ?, ?, ?)
");

$stmt->execute([
    $usuarioId,
    json_encode($dteArray, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES),
    json_encode($responseData, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES),
    $responseData['estado'] ?? 'DESCONOCIDO',
    $codigoGen
]);

// 7.6) Cerramos el cURL y el log
curl_close($chSend);
fwrite($fhSend, "\n--- RESPUESTA HACIENDA HTTP $code ---\n");
fwrite($fhSend, $sendResp . "\n");
fwrite($fhSend, "--- FIN ENVÍO A HACIENDA ---\n");
fclose($fhSend);

// 7.7) Comprobamos HTTP code y devolvemos
if ($sendResp === false) {
    throw new Exception('Error CURL envío DTE (sendResp false). Revisa el log en: ' . $logFile);
}
if ($code !== 200) {
    $descEnvio = $responseData['descripcionMsg'] 
               ?? $responseData['error'] 
               ?? json_encode($responseData);
    throw new Exception("Error en envío DTE ($code): $descEnvio");
}

return $responseData;
    }
}
