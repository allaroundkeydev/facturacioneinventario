<?php
// webhook-deploy.php

// ---------------------
// CONFIGURACIÓN
// ---------------------
$secret = 'Salmo121'; // Cambia por tu clave secreta
$projectDir = '/homepages/13/d4299072200/htdocs/fdte/facturacioneinventario';
$composer = '/usr/bin/php8.3-cli ~/composer.phar';
$logFile = $projectDir . '/deploy.log';
$notifyEmail = 'allaroundkey.dev@gmail.com'; // tu correo para notificaciones

// ---------------------
// VERIFICAR FIRMA DE GITHUB
// ---------------------
$signature = $_SERVER['HTTP_X_HUB_SIGNATURE_256'] ?? '';
$payload = file_get_contents('php://input');
$hash = 'sha256=' . hash_hmac('sha256', $payload, $secret);

if (!hash_equals($hash, $signature)) {
    http_response_code(403);
    file_put_contents($logFile, date('[Y-m-d H:i:s] ') . "Acceso denegado: firma no válida\n", FILE_APPEND);
    exit('Acceso denegado');
}

// ---------------------
// FUNCIONES DE LOG Y ERROR
// ---------------------
function logExec($cmd, $logFile, $notifyEmail) {
    $output = [];
    $returnVar = 0;
    exec($cmd . ' 2>&1', $output, $returnVar);

    $logEntry = date('[Y-m-d H:i:s] ') . "Comando: $cmd\n";
    $logEntry .= implode("\n", $output) . "\n";
    $logEntry .= date('[Y-m-d H:i:s] ') . "Código de salida: $returnVar\n\n";

    file_put_contents($logFile, $logEntry, FILE_APPEND);

    if ($returnVar !== 0) {
        // Enviar correo si hay error
        $subject = "Error en deploy Laravel";
        $message = "Se produjo un error al ejecutar el comando:\n$cmd\n\nSalida:\n" . implode("\n", $output);
        @mail($notifyEmail, $subject, $message);
    }

    return $returnVar;
}

// ---------------------
// EJECUTAR DEPLOY
// ---------------------
logExec("cd $projectDir && git pull origin main", $logFile, $notifyEmail);
logExec("$composer install --no-dev --optimize-autoloader", $logFile, $notifyEmail);
logExec("php8.3-cli $projectDir/artisan migrate --force", $logFile, $notifyEmail);
logExec("php8.3-cli $projectDir/artisan config:cache", $logFile, $notifyEmail);
logExec("php8.3-cli $projectDir/artisan route:cache", $logFile, $notifyEmail);
logExec("php8.3-cli $projectDir/artisan view:cache", $logFile, $notifyEmail);
logExec("chmod -R 775 $projectDir/storage $projectDir/bootstrap/cache", $logFile, $notifyEmail);

// ---------------------
// FIN
// ---------------------
file_put_contents($logFile, date('[Y-m-d H:i:s] ') . "Deploy completado ✅\n\n", FILE_APPEND);
echo "Deploy ejecutado. Revisa deploy.log para detalles.\n";
