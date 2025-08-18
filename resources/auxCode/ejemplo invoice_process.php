<?php
// public/invoice_process.php

session_start();
if (empty($_SESSION['usuario_id'])) {
    header('Location: index.php');
    exit;
}

date_default_timezone_set('America/El_Salvador');

require __DIR__ . '/../src/config.php';
require __DIR__ . '/../src/DTEService.php';

// ————————————————
//  Función para generar un UUIDv4 en mayúsculas (8-4-4-4-12, A-F0-9)
// ————————————————
function generarUuidV4(): string {
    $data = random_bytes(16);
    // Ajustamos los bits para RFC 4122 versión 4
    $data[6] = chr((ord($data[6]) & 0x0f) | 0x40);
    $data[8] = chr((ord($data[8]) & 0x3f) | 0x80);
    $hex = bin2hex($data);
    return strtoupper(
        substr($hex,  0,  8) . '-' .
        substr($hex,  8,  4) . '-' .
        substr($hex, 12,  4) . '-' .
        substr($hex, 16,  4) . '-' .
        substr($hex, 20, 12)
    );
}

// ————————————————
//  Convierte un número decimal a texto (en USD y centavos)
// ————————————————
function numeroALetras(float $numero): string {
    $formatter = new NumberFormatter("es", NumberFormatter::SPELLOUT);
    $partes = explode('.', number_format($numero, 2, '.', ''));
    $entero = $formatter->format($partes[0]);
    $centavos = str_pad($partes[1], 2, '0', STR_PAD_RIGHT);
    if ($centavos === '00') {
        return strtoupper("$entero DÓLARES");
    }
    return strtoupper("$entero DÓLARES CON $centavos CENTAVOS");
}

/**
 * Elimina recursivamente las claves que tengan valor `null` o
 * que sean arreglos vacíos. (opcional, según tu esquema)
 */
function eliminarCamposNulos(array $arr): array {
    foreach ($arr as $k => &$v) {
        if (is_array($v)) {
            $v = eliminarCamposNulos($v);
            if (empty($v)) {
                unset($arr[$k]);
            }
        } elseif ($v === null) {
            unset($arr[$k]);
        }
    }
    return $arr;
}


// =====================
// 1) Recuperar datos del emisor desde BD
// =====================
$stmt = $pdo->prepare('SELECT * FROM usuarios WHERE id = ?');
$stmt->execute([ $_SESSION['usuario_id'] ]);
$em = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$em) {
    die('Emisor no encontrado.');
}
// Limpiamos espacios en NRC (si los hay)
$em['nrc'] = isset($em['nrc']) ? trim($em['nrc']) : null;

// Validamos “departamento” y “municipio” del emisor
if (!preg_match('/^0[1-9]|1[0-9]|20$/', $em['departamento'] ?? '')) {
    $em['departamento'] = '01';
}
//if (!preg_match('/^0[1-9]|1[0-9]|24$/', $em['municipio'] ?? '')) {
//    $em['municipio'] = '01';
//}

// =================================
// 2) Recuperar datos del receptor (cliente) del formulario
// =================================
$doc = trim($_POST['rec_numDocumento'] ?? '');
if ($doc === '') {
    die('No se recibió el número de documento del receptor.');
}
$stmt = $pdo->prepare('SELECT * FROM clientes WHERE nit = ? OR dui = ?');
$stmt->execute([$doc, $doc]);
$rec = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$rec) {
    die('Receptor no encontrado en BD.');
}
// Validamos dep/mun del receptor
$rec['direccion'] = trim($rec['direccion'] ?? '');
//if (!preg_match('/^0[1-9]|1[0-9]|20$/', $rec['departamento'] ?? '')) {
//    $rec['departamento'] = '01';
//}
//if (!preg_match('/^0[1-9]|1[0-9]|20$/', $rec['municipio'] ?? '')) {
//    $rec['municipio'] = '01';
//}

// =================================
// 3) IVA e ítems recibidos por POST
// =================================
$ivaPct  = floatval($_POST['iva'] ?? 0);
$cods    = $_POST['item_codigo']      ?? [];
$descs   = $_POST['item_descripcion'] ?? [];
$cants   = $_POST['item_cantidad']    ?? [];
$precios = $_POST['item_precio']      ?? [];

// ===============================
// 4) Generar númeroControl & UUID
// ===============================
$idControl = 'DTE-01-M001P001-' . str_pad(rand(1, 999), 15, '0', STR_PAD_LEFT);
$codigoGen = generarUuidV4();

// ================================
// 5) Armado completo del JSON DTE (array PHP)
// ================================
$jsonDte = [

    // 5.1) identificacion
    'identificacion' => [
        'version'          => 1,
        'ambiente'         => '00',
        'tipoDte'          => '01',
        'numeroControl'    => $idControl,
        'codigoGeneracion' => $codigoGen,
        'tipoModelo'       => 1,
        'tipoOperacion'    => 1,
        'tipoContingencia' => null,
        'motivoContin'     => null,
        'fecEmi'           => date('Y-m-d'),
        'horEmi'           => date('H:i:s'),
        'tipoMoneda'       => 'USD'
    ],

    // 5.2) documentoRelacionado (debe ir aunque sea null)
    'documentoRelacionado' => null,

  // 5.3) Emisor: incluir los códigos de MH y punto de venta (o valores por defecto)
'emisor' => [
    'nit'                 => $em['api_user'],
    'nrc'                 => $em['nrc'] ?? null,
    'nombre'              => $em['razon_social'],
    'codActividad'        => $em['codActividad'] ?? null,
    'descActividad'       => $em['descActividad'] ?? null,
    'nombreComercial'     => $em['nombreComercial'] ?? null,
    'tipoEstablecimiento' => $em['tipoEstablecimiento'] ?? '02',
    'direccion'           => [
        'departamento' => $em['departamento'],
        'municipio'    => $em['municipio'],
        'complemento'  => $em['direccion'] ?? null
    ],
    'telefono'            => $em['telefono'] ?? null,
    'correo'              => $em['correo']   ?? null,
    // Valores requeridos por Hacienda (proporcionados en BD o por defecto)
    'codEstableMH'       => $em['codEstableMH']   ?? 'M001',
    'codEstable'         => $em['codEstable']     ?? null,
    'codPuntoVentaMH'    => $em['codPuntoVentaMH'] ?? 'P001',
    'codPuntoVenta'      => $em['codPuntoVenta']   ?? null
],

    // 5.4) receptor
    'receptor' => [
        'tipoDocumento' => (is_numeric($doc) && strlen($doc) > 10) ? '02' : '13',
        'numDocumento'  => $doc,
        'nrc'           => null,
        'nombre'        => $rec['nombre'],
        'codActividad'  => null,
        'descActividad' => null,
        'direccion' => [
            'municipio'    => $rec['municipio'],
            'departamento' => $rec['departamento'],
            'complemento'  => $rec['direccion'] ?? null
        ],
        'telefono'      => $rec['telefono'] ?? null,
        'correo'        => $rec['correo']   ?? null
    ],

    // 5.5) otrosDocumentos y ventaTercero (null)
    'otrosDocumentos' => null,
    'ventaTercero'    => null,

    // 5.6) cuerpoDocumento (array de ítems)
    'cuerpoDocumento' => [],

    // 5.7) resumen (se completará luego)
    'resumen' => [],

    // 5.8) extension (todas las claves, aunque sean null)
    'extension' => [
        'nombEntrega'   => null,
        'docuEntrega'   => null,
        'nombRecibe'    => null,
        'docuRecibe'    => null,
        'observaciones' => null,
        'placaVehiculo' => null
    ],

    // 5.9) apendice
    'apendice' => null,

    // 5.10) Por ahora NO incluir “firmaElectronica” hasta el paso de firma
];

// ======================================
// 6) Recorremos cada ítem para completar cuerpoDocumento
// ======================================
$subTotal = 0.00;
$totalIva  = 0.00;

foreach ($cods as $i => $cod) {
    $cantidad    = floatval($cants[$i]);
    // Este “precio” ya INCLUYE IVA:
    $precioConIVA = floatval($precios[$i]);

    // 1) ventaGravada = precioConIVA × cantidad:
    $ventaGravada = round($precioConIVA * $cantidad, 2);

    // 2) ivaItem = ventaGravada × ivaPct / (100 + ivaPct):
    $ivaItem = round($ventaGravada * $ivaPct / (100 + $ivaPct), 2);

    // 3) Acumular para el resumen:
    $subTotal += round($ventaGravada, 2);
    $totalIva  += $ivaItem;

    $jsonDte['cuerpoDocumento'][] = [
        'numItem'       => $i + 1,
        'tipoItem'      => 2,
        'numeroDocumento' => null,
        'cantidad'      => $cantidad,
        'codigo'        => null,
        'codTributo'    => null,
        'uniMedida'     => 59,
        'descripcion'   => $descs[$i],
        'precioUni'     => round($precioConIVA, 2),
        'montoDescu'    => 0,
        'ventaNoSuj'    => 0,
        'ventaExenta'   => 0,
        'ventaGravada'  => $ventaGravada,
        'tributos'      => null,
        'psv'           => 0,
        'noGravado'     => 0,
        'ivaItem'       => $ivaItem
    ];
}

// -------------------------------------------
// 7) Resumen: calcular totales incluyendo IVA
// -------------------------------------------
$totalOperacion = round($subTotal, 2);

$jsonDte['resumen'] = [
    'totalNoSuj'          => 0,
    'totalExenta'         => 0,
    'totalGravada'        => $subTotal,
    'subTotalVentas'      => $subTotal,
    'descuNoSuj'          => 0,
    'descuExenta'         => 0,
    'descuGravada'        => 0,
    'porcentajeDescuento' => 0,
    'totalDescu'          => 0,
    'tributos' => [],
    'subTotal'            => $subTotal,
    'ivaRete1'            => 0,
    'reteRenta'           => 0,
    // Ahora SIN sumar IVA nuevamente:
    'montoTotalOperacion' => $totalOperacion,
    'totalNoGravado'      => 0,
    // Total a pagar = mismo monto de la operación (pues no hay retenciones ni cargos)
    'totalPagar'          => $totalOperacion,
    'totalLetras'         => numeroALetras($totalOperacion),
    // El IVA sigue informativo:
    'totalIva'            => $totalIva,
    'saldoFavor'          => 0,
    'condicionOperacion'  => 1,
    'pagos' => [
        [
            'codigo'     => '03',
            'montoPago'  => $totalOperacion,
            'plazo'      => null,
            'referencia' => "",
            'periodo'    => null
        ]
    ],
    'numPagoElectronico'  => null
];

// ============================================
// 8) (Opcional) Eliminar claves `null` y arrays vacíos
//    (si tu esquema requiere que algunos nodos aparezcan aunque sean null, omite esto)
// ============================================
//$jsonDte = eliminarCamposNulos($jsonDte);

// —————————————
// 9) FIRMAR y ENVIAR
// —————————————
$dteService = new DTEService($pdo);

try {
    $payloadSinFirma = json_encode($jsonDte, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
    file_put_contents(__DIR__.'/debug_dte.json', $payloadSinFirma);
    echo "<pre>$payloadSinFirma</pre>";
    if ($payloadSinFirma === false) {
        throw new Exception('Error al codificar JSON DTE → ' . json_last_error_msg());
    }
error_log('Directorio temporal de PHP: ' . sys_get_temp_dir());
    $response = $dteService->emitirFactura($payloadSinFirma, $_SESSION['usuario_id']);

    echo "<h4>Factura enviada con éxito. Respuesta de Hacienda:</h4><pre>";
    print_r($response);
    echo "</pre>";
} catch (Exception $e) {
    error_log('Directorio temporal de PHP: ' . sys_get_temp_dir());
    echo "<h4>Error al emitir la factura:</h4><pre>"
         . $e->getMessage() . "</pre>";
}
