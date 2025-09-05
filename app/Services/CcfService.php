<?php
//app\Services\CcfService.php
namespace App\Services;

use App\Models\Dte;
use App\Models\Empresa;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Exception;
use Carbon\Carbon;

class CcfService
{
    protected Empresa $empresa;

    public function __construct(Empresa $empresa)
    {
        $this->empresa = $empresa;
    }

    /**
     * Construye, valida y crea un registro DTE (tipo 03 - CCF).
     *
     * @param array $input  Datos ya validados del request (receptor, items, iva, etc.)
     * @param \App\Models\User $user  Usuario que crea el DTE
     * @return Dte
     * @throws Exception
     */
    public function createFromArray(array $input, $user): Dte
    {
        // 1) Normalizar receptor
        $receptor = $input['receptor'] ?? [];
        // aceptar nit en varios keys por compatibilidad
        $rawNit = $receptor['nit'] ?? $receptor['numDocumento'] ?? $receptor['num_documento'] ?? $receptor['numDocumento'] ?? null;
        $nombre = $receptor['nombre'] ?? $receptor['razon_social'] ?? $receptor['nombre_comercial'] ?? null;
        $nombreComercialIn = $receptor['nombreComercial'] ?? $receptor['nombre_comercial'] ?? null;

        if (empty($rawNit) && empty($nombreComercialIn)) {
            // NIT puede ser obligatorio en tu flujo CCF; si no lo tienes, exige por política
            throw new Exception('Para CCF se requiere receptor.nit (o al menos receptor.nombreComercial).');
        }

        // Normalizar nit: quitar cualquier no-dígito
        $nitNorm = $rawNit !== null ? preg_replace('/\D/', '', (string)$rawNit) : '';
        if ($nitNorm === '') {
            // Si no hay NIT usable, aún permitimos continuar solo si hay nombreComercial:
            // pero Hacienda exige NIT para CCF. Mejor lanzar error claro.
            throw new Exception('NIT inválido o vacío para el receptor. Corrija el NIT antes de continuar.');
        }

        // 2) Normalizar/forzar nrc como string (no null). Hacienda espera string con formato.
        $nrc = $receptor['nrc'] ?? $receptor['NRC'] ?? null;
        if (empty($nrc)) {
            // placeholder aceptable: '00000000' (ajústalo si tu normativa requiere guion)
            $nrc = '00000000';
        } else {
            // quitar espacios y asegurar string
            $nrc = (string) $nrc;
        }

        // Forzar nombreComercial: obligatorio en CCF
        $nombreComercial = $nombreComercialIn ?? $nombre ?? 'N/A';

        // Construcción receptor normalizado, **sin** campos prohibidos como numDocumento o tipoDocumento
        $receptorNormalized = [
            'nit' => $nitNorm,
            'nombreComercial' => $nombreComercial,
            'nombre' => $nombre ?? $nombreComercial,
            'nrc' => $nrc,
            'codActividad' => $receptor['codActividad'] ?? $receptor['cod_actividad'] ?? null,
            'descActividad' => $receptor['descActividad'] ?? $receptor['desc_actividad'] ?? null,
            'telefono' => $receptor['telefono'] ?? null,
            'correo' => $receptor['correo'] ?? null,
            'direccion' => [
                'departamento' => $receptor['direccion']['departamento'] ?? ($receptor['departamento'] ?? null),
                'municipio' => $receptor['direccion']['municipio'] ?? ($receptor['municipio'] ?? null),
                'complemento' => $receptor['direccion']['complemento'] ?? ($receptor['complemento'] ?? null),
            ],
        ];

        // 3) Items: procesar con descuentos
        $rawItems = $input['items'] ?? [];
        if (empty($rawItems) || !is_array($rawItems)) {
            throw new Exception('Items inválidos para CCF.');
        }

        $descuentoGeneral = floatval($input['descuento_general'] ?? 0);
        $ivaPct = floatval($input['iva'] ?? 13.0);

        // Calcular total bruto para distribuir descuento
        $totalVentaBruta = 0;
        foreach ($rawItems as $it) {
            $totalVentaBruta += floatval($it['cantidad'] ?? 0) * floatval($it['precio'] ?? 0);
        }

        $items = [];
        $totalVentasNetas = 0.0;
        $calculatedIva = 0.0;
        $totalDescuentos = 0.0;

        foreach ($rawItems as $i => $it) {
            $cantidad = floatval($it['cantidad'] ?? 0);
            $precioConIVA = floatval($it['precio'] ?? 0);
            $itemDescuentoIndividual = floatval($it['descuento'] ?? 0);
            $itemValorBruto = $cantidad * $precioConIVA;

            $descuentoProporcional = 0;
            if ($totalVentaBruta > 0) {
                $descuentoProporcional = ($itemValorBruto / $totalVentaBruta) * $descuentoGeneral;
            }
            $montoDescuConIVA = $itemDescuentoIndividual + $descuentoProporcional;

            // Para CCF, el precio unitario y el descuento se expresan SIN IVA
            $precioUnitarioSinIva = $ivaPct > 0 ? $precioConIVA / (1 + $ivaPct / 100) : $precioConIVA;
            $montoDescuSinIva = $ivaPct > 0 ? $montoDescuConIVA / (1 + $ivaPct / 100) : $montoDescuConIVA;

            $ventaNeta = ($cantidad * $precioUnitarioSinIva) - $montoDescuSinIva;
            $ivaItem = $ventaNeta * ($ivaPct / 100);

            $totalVentasNetas += $ventaNeta;
            $calculatedIva += $ivaItem;
            $totalDescuentos += $montoDescuConIVA;

            // Para CCF, el IVA se reporta en el array de tributos del item
            $tributos = ['20']; // 20 = IVA

            $item = [
                'numItem' => $i + 1,
                'tipoItem' => $it['tipoItem'] ?? 1,
                'numeroDocumento' => $it['numeroDocumento'] ?? null,
                'codigo' => $it['codigo'] ?? null,
                'descripcion' => $it['descripcion'] ?? '',
                'cantidad' => $cantidad,
                'uniMedida' => $it['uniMedida'] ?? 59,
                'precioUni' => round($precioUnitarioSinIva, 6),
                'montoDescu' => round($montoDescuSinIva, 6),
                'ventaNoSuj' => 0,
                'ventaExenta' => 0,
                'ventaGravada' => round($ventaNeta, 6),
                'tributos' => $tributos,
                'psv' => 0.0,
                'noGravado' => 0,
            ];
            $items[] = $item;
        }

        // 4) Emisor
        $emisor = [
            'nit' => $this->empresa->api_user ?? $this->empresa->nit,
            'nrc' => $this->empresa->nrc ?? null,
            'nombre' => $this->empresa->razon_social ?? $this->empresa->nombre_comercial ?? null,
            'codActividad' => $this->empresa->cod_actividad ?? null,
            'descActividad' => $this->empresa->desc_actividad ?? null,
            'nombreComercial' => $this->empresa->nombre_comercial ?? $this->empresa->razon_social ?? $this->empresa->nombre ?? 'EMISOR',
            'tipoEstablecimiento' => $this->empresa->tipo_establecimiento ?? '02',
            'direccion' => [
                'departamento' => $this->empresa->departamento ?? null,
                'municipio' => $this->empresa->municipio ?? null,
                'complemento' => $this->empresa->direccion ?? null,
            ],
            'telefono' => $this->empresa->telefono ?? null,
            'correo' => $this->empresa->correo ?? null,
            'codEstableMH' => $this->empresa->cod_estable_mh ?? 'M001',
            'codEstable' => $this->empresa->cod_estable ?? null,
            'codPuntoVentaMH' => $this->empresa->cod_punto_venta_mh ?? 'P001',
            'codPuntoVenta' => $this->empresa->cod_punto_venta ?? null,
        ];

        // 5) Resumen
        $subTotal = $totalVentasNetas;
        $montoTotalOperacion = $subTotal + $calculatedIva;

        $resumen = [
            'totalNoSuj' => 0,
            'totalExenta' => 0,
            'totalGravada' => round($subTotal, 2),
            'subTotalVentas' => round($subTotal, 2),
            'descuNoSuj' => 0,
            'descuExenta' => 0,
            'descuGravada' => round($totalDescuentos, 2),
            'porcentajeDescuento' => 0,
            'totalDescu' => round($totalDescuentos, 2),
            'tributos' => [
                [
                    'codigo' => '20',
                    'descripcion' => 'Impuesto al Valor Agregado 13%',
                    'valor' => round($calculatedIva, 2)
                ]
            ],
            'subTotal' => round($subTotal, 2),
            'ivaPerci1' => 0.00,
            'ivaRete1' => 0,
            'reteRenta' => 0,
            'montoTotalOperacion' => round($montoTotalOperacion, 2),
            'totalNoGravado' => 0,
            'totalPagar' => round($montoTotalOperacion, 2),
            'totalLetras' => $this->numeroALetrasInt($montoTotalOperacion),
            'saldoFavor' => 0,
            'condicionOperacion' => 1,
            'pagos' => [
                [
                    'codigo' => $input['pagos'][0]['codigo'] ?? '01',
                    'montoPago' => round($montoTotalOperacion, 2),
                    'referencia' => $input['pagos'][0]['referencia'] ?? null,
                    'plazo' => $input['pagos'][0]['plazo'] ?? null,
                    'periodo' => $input['pagos'][0]['periodo'] ?? null,
                ]
            ],
            'numPagoElectronico' => $input['numPagoElectronico'] ?? null,
        ];

        // 6) Identificacion (version 3, tipoDte 03)
        $codigoGeneracion = Str::upper(Str::uuid()->toString());
        $tipoPad = '03';
        $numeroControl = 'DTE-' . $tipoPad . '-' . ($emisor['codEstableMH'] ?? 'M001') . ($emisor['codPuntoVentaMH'] ?? 'P001') . '-' . str_pad(rand(1, 999999999999999), 15, '0', STR_PAD_LEFT);

        $identificacion = [
            'version' => 3,
            'ambiente' => config('services.dte.ambiente', '00'),
            'tipoDte' => '03',
            'tipoModelo' => 1,
            'tipoOperacion' => 1,
            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            'fecEmi' => Carbon::now()->format('Y-m-d'),
            'horEmi' => Carbon::now()->format('H:i:s'),
            'tipoMoneda' => $input['tipoMoneda'] ?? 'USD',
            'tipoContingencia' => null,
            'motivoContin' => null,
        ];

        // 7) Estructura final DTE para CCF
        $dteArray = [
            'identificacion' => $identificacion,
            'documentoRelacionado' => null,
            'emisor' => $emisor,
            'receptor' => $receptorNormalized,
            'otrosDocumentos' => null,
            'ventaTercero' => null,
            'cuerpoDocumento' => $items,
            'resumen' => $resumen,
            'extension' => $input['extension'] ?? null,
            'apendice' => $input['apendice'] ?? null,
        ];

        // 8) Validaciones
        $errors = $this->validateCcfArray($dteArray);
        if (!empty($errors)) {
            Log::warning('Validación CCF fallida', ['errors' => $errors, 'dte' => $dteArray]);
            throw new Exception('Validación CCF: ' . implode('; ', $errors));
        }

        // 9) Crear registro DTE en BD
        $dteModel = Dte::create([
            'usuario_id' => $user->id,
            'empresa_id' => $this->empresa->id,
            'tipo' => '03',
            'codigo_generacion' => $codigoGeneracion,
            'dte_json' => $dteArray,
            'estado' => 'CREADO',
        ]);

        Log::info("CCF creado id={$dteModel->id}, empresa_id={$this->empresa->id}");

        return $dteModel;
    }

    /**
     * Validaciones simples para la estructura CCF que exige Hacienda.
     * Devuelve array de errores (vacío si OK).
     */
    protected function validateCcfArray(array $dte): array
    {
        $errs = [];

        // identificacion
        $ident = $dte['identificacion'] ?? [];
        if (($ident['version'] ?? null) != 3) $errs[] = 'identificacion.version debe ser 3';
        if (($ident['tipoDte'] ?? null) != '03') $errs[] = 'identificacion.tipoDte debe ser 03';

        // emisor
        $em = $dte['emisor'] ?? [];
        foreach (['nit','nombre','codEstableMH','codPuntoVentaMH','nombreComercial'] as $k) {
            if (empty($em[$k])) $errs[] = "emisor.$k requerido";
        }

        // receptor: CCF exige nit, nombreComercial, nombre, nrc
        $r = $dte['receptor'] ?? [];
        foreach (['nit','nombreComercial','nombre','nrc'] as $k) {
            if (!isset($r[$k]) || $r[$k] === '' || $r[$k] === null) $errs[] = "receptor.$k requerido";
        }

        // resumen: ivaPerci1 debe existir (puede ser 0)
        $res = $dte['resumen'] ?? [];
        if (!array_key_exists('ivaPerci1', $res)) $errs[] = 'resumen.ivaPerci1 requerido';

        // items: no debe contener ivaItem y tributos debe ser array
        foreach ($dte['cuerpoDocumento'] ?? [] as $idx => $it) {
            if (isset($it['ivaItem'])) $errs[] = "cuerpoDocumento.$idx no debe contener ivaItem";
            if (!array_key_exists('ventaGravada', $it)) $errs[] = "cuerpoDocumento.$idx ventaGravada requerido";
            if (array_key_exists('tributos', $it) && !is_array($it['tributos'])) $errs[] = "cuerpoDocumento.$idx.tributos debe ser array";
        }

        return $errs;
    }

    /**
     * Convertir subtotal entero a texto mayúsculas (DÓLARES)
     */
protected function descripcionTributo(string $codigo): string
{
    $map = [
        '20' => 'Impuesto al Valor Agregado (IVA 13%)',
        '51' => 'Bebidas Alcohólicas',
        '52' => 'Cerveza',
        '53' => 'Productos del Tabaco',
        '54' => 'Bebidas Carbonatadas o Gaseosas Simples o Endulzadas',
        '55' => 'Otros Específicos',
        '58' => 'Alcohol',
        '77' => 'Importador de Jugos, Néctares, Bebidas con Jugo y Refrescos',
        '78' => 'Distribuidor de Jugos, Néctares, Bebidas con Jugo y Refrescos',
        '79' => 'Sobre Llamadas Telefónicas Provenientes del Ext.',
        '85' => 'Detallista de Jugos, Néctares, Bebidas con Jugo y Refrescos',
        '86' => 'Fabricante de Preparaciones Concentradas o en Polvo',
        '91' => 'Fabricante de Jugos, Néctares, Bebidas con Jugo y Refrescos',
        '92' => 'Importador de Preparaciones Concentradas o en Polvo',
        'A1' => 'Específicos y Ad-Valorem',
        'A5' => 'Bebidas Gaseosas, Isotónicas, Deportivas, Fortificantes, Energizantes o Estimulantes',
        'A7' => 'Alcohol Etílico',
        'A9' => 'Sacos Sintéticos',
    ];
    return $map[$codigo] ?? 'Tributo';
}


    protected function numeroALetrasInt(float $numero): string
    {
        if (class_exists(\NumberFormatter::class)) {
            $formatter = new \NumberFormatter("es", \NumberFormatter::SPELLOUT);
            $entero = (int) round($numero);
            $texto = $formatter->format($entero);
            return strtoupper($texto . ' DÓLARES');
        }
        return strtoupper(number_format($numero, 2, '.', ''));
    }
}