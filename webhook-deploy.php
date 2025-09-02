<?php
// webhook-deploy.php

// ---------------------
// CONFIGURACIÓN
// ---------------------
$secret = 'Salmo121'; // Cambia por tu clave secreta
$projectDir = '/homepages/13/d4299072200/htdocs/fdte/facturacioneinventario';
$composer = '/usr/bin/php8.3-cli ~/composer.phar';
$logFile = $projectDir . '/deploy.log';

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
// FUNCIONES DE LOG
// ---------------------
function logExec($cmd, $logFile) {
    $output = [];
    $returnVar = 0;
    exec($cmd . ' 2>&1', $output, $returnVar);
    file_put_contents($logFile, date('[Y-m-d H:i:s] ') . "Comando: $cmd\n", FILE_APPEND);
    file_put_contents($logFile, implode("\n", $output) . "\n", FILE_APPEND);
    file_put_contents($logFile, date('[Y-m-d H:i:s] ') . "Código de salida: $returnVar\n\n", FILE_APPEND);
    return $returnVar;
}

// ---------------------
// EJECUTAR DEPLOY
// ---------------------
logExec("cd $projectDir && git pull origin main", $logFile);
logExec("$composer install --no-dev --optimize-autoloader", $logFile);
logExec("php8.3-cli $projectDir/artisan migrate --force", $logFile);
logExec("php8.3-cli $projectDir/artisan config:cache", $logFile);
logExec("php8.3-cli $projectDir/artisan route:cache", $logFile);
logExec("php8.3-cli $projectDir/artisan view:cache", $logFile);
logExec("chmod -R 775 $projectDir/storage $projectDir/bootstrap/cache", $logFile);

// ---------------------
// FIN
// ---------------------
file_put_contents($logFile, date('[Y-m-d H:i:s] ') . "Deploy completado ✅\n\n", FILE_APPEND);
echo "Deploy ejecutado. Revisa deploy.log para detalles.\n";
