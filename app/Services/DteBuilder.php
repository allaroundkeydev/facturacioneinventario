<?php
namespace App\Services;

use App\Models\Empresa;
use Carbon\Carbon;

class DteBuilder
{
    protected array $dte = [];

    public function __construct()
    {
        // estructura base con claves necesarias
        $this->dte = [
            'identificacion' => [
                'version' => 1,
                // Por defecto dejamos "00" si quieres (según tu requisito)
                'ambiente' => '00',
                'tipoDte' => '01',
                'numeroControl' => null,
                'codigoGeneracion' => null,
                'tipoModelo' => 1,
                'tipoOperacion' => 1,
                'tipoContingencia' => null,
                'motivoContin' => null,
                'fecEmi' => Carbon::now()->format('Y-m-d'),
                'horEmi' => Carbon::now()->format('H:i:s'),
                'tipoMoneda' => 'USD',
            ],
            'documentoRelacionado' => null,
            'emisor' => [
                'nit' => null,
                'nrc' => null,
                'nombre' => null,
                'codActividad' => null,
                'descActividad' => null,
                'nombreComercial' => null,
                'tipoEstablecimiento' => '02',
                'direccion' => [
                    'departamento' => null,
                    'municipio' => null,
                    'complemento' => null,
                ],
                'telefono' => null,
                'correo' => null,
                'codEstableMH' => null,
                'codEstable' => null,
                'codPuntoVentaMH' => null,
                'codPuntoVenta' => null,
            ],
            'receptor' => [
                'tipoDocumento' => null,
                'numDocumento' => null,
                'nrc' => null,
                'nombre' => null,
                'codActividad' => null,
                'descActividad' => null,
                'direccion' => [
                    'municipio' => null,
                    'departamento' => null,
                    'complemento' => null
                ],
                'telefono' => null,
                'correo' => null,
            ],
            'otrosDocumentos' => null,
            'ventaTercero' => null,
            'cuerpoDocumento' => [],
            'resumen' => [],
            'extension' => [
                'nombEntrega' => null,
                'docuEntrega' => null,
                'nombRecibe' => null,
                'docuRecibe' => null,
                'observaciones' => null,
                'placaVehiculo' => null
            ],
            'apendice' => null,
        ];
    }

    /**
     * Forzar/ajustar identificacion (numeroControl, tipoDte, ambiente, version, tipoMoneda, etc.)
     *
     * @param array $data
     * @return $this
     */
    public function setIdentificacion(array $data): self
    {
        $this->dte['identificacion'] = array_merge($this->dte['identificacion'], $data);
        return $this;
    }

    /**
     * Setear emisor desde modelo Empresa o array
     * @param Empresa|array $empresa
     */
    public function setEmisor($empresa): self
    {
        if ($empresa instanceof Empresa) {
            $this->dte['emisor']['nit'] = $empresa->api_user ?? $empresa->nit;
            $this->dte['emisor']['nrc'] = $empresa->nrc ?? null;
            $this->dte['emisor']['nombre'] = $empresa->razon_social ?? null;
            $this->dte['emisor']['codActividad'] = $empresa->cod_actividad ?? null;
            $this->dte['emisor']['descActividad'] = $empresa->desc_actividad ?? null;
            $this->dte['emisor']['nombreComercial'] = $empresa->nombre_comercial ?? null;
            $this->dte['emisor']['tipoEstablecimiento'] = $empresa->tipo_establecimiento ?? $this->dte['emisor']['tipoEstablecimiento'];
            $this->dte['emisor']['direccion'] = [
                'departamento' => $empresa->departamento ?? null,
                'municipio' => $empresa->municipio ?? null,
                'complemento' => $empresa->direccion ?? null,
            ];
            $this->dte['emisor']['telefono'] = $empresa->telefono ?? null;
            $this->dte['emisor']['correo'] = $empresa->correo ?? null;
            $this->dte['emisor']['codEstableMH'] = $empresa->cod_estable_mh ?? $this->dte['emisor']['codEstableMH'];
            $this->dte['emisor']['codEstable'] = $empresa->cod_estable ?? null;
            $this->dte['emisor']['codPuntoVentaMH'] = $empresa->cod_punto_venta_mh ?? $this->dte['emisor']['codPuntoVentaMH'];
            $this->dte['emisor']['codPuntoVenta'] = $empresa->cod_punto_venta ?? null;
        } elseif (is_array($empresa)) {
            $this->dte['emisor'] = array_merge($this->dte['emisor'], $empresa);
        }
        return $this;
    }

    /**
     * Setear receptor (cliente). $receptor puede ser array o stdClass o Eloquent Model
     */
public function setReceptor($receptor, ?string $numDocumento = null): self
{
    // Si es un Eloquent Model, conviértelo con toArray() (más fiable)
    if ($receptor instanceof \Illuminate\Database\Eloquent\Model) {
        $receptor = $receptor->toArray();
    }

    // Si es objeto stdClass, transformarlo a array
    if (is_object($receptor)) {
        $receptor = (array) $receptor;
    }

    if (is_array($receptor)) {
        // Normalizar nombres que pueden venir de distintos lugares
        $nombre = $receptor['nombre'] 
                  ?? $receptor['razon_social'] 
                  ?? $receptor['nombre_comercial'] 
                  ?? null;

        $nrc = $receptor['nrc'] ?? null;
        $cod_actividad = $receptor['cod_actividad'] ?? $receptor['codActividad'] ?? null;
        $desc_actividad = $receptor['desc_actividad'] ?? $receptor['descActividad'] ?? null;

        // Dirección: puede venir como campos planos o en sub-array 'direccion'
        $departamento = $receptor['departamento'] 
                        ?? ($receptor['direccion']['departamento'] ?? null) 
                        ?? null;
        $municipio = $receptor['municipio'] 
                     ?? ($receptor['direccion']['municipio'] ?? null) 
                     ?? null;
        $complemento = $receptor['complemento'] 
                       ?? ($receptor['direccion']['complemento'] ?? $receptor['direccion'] ?? null) 
                       ?? null;

        $this->dte['receptor']['tipoDocumento'] = $receptor['tipoDocumento'] ?? $receptor['tipo_documento'] ?? $this->dte['receptor']['tipoDocumento'];
        $this->dte['receptor']['numDocumento']  = $numDocumento ?? ($receptor['numDocumento'] ?? $receptor['num_documento'] ?? $this->dte['receptor']['numDocumento']);
        $this->dte['receptor']['nrc'] = null;
        $this->dte['receptor']['nombre'] = $nombre ?? $this->dte['receptor']['nombre'];
        $this->dte['receptor']['direccion'] = [
            'departamento' => $departamento,
            'municipio' => $municipio,
            'complemento' => $complemento,
        ];
        $this->dte['receptor']['telefono'] = $receptor['telefono'] ?? $this->dte['receptor']['telefono'];
        $this->dte['receptor']['correo']   = $receptor['correo'] ?? $this->dte['receptor']['correo'];
        $this->dte['receptor']['codActividad'] = $cod_actividad ?? $this->dte['receptor']['codActividad'];
        $this->dte['receptor']['descActividad'] = $desc_actividad ?? $this->dte['receptor']['descActividad'];
    }

    return $this;
}


    /**
     * Recibe items en formato simple: [{descripcion, cantidad, precio}, ...]
     * Los precios son asumidos con IVA incluido tal como hace tu ejemplo.
     */
    public function setItems(array $items, float $ivaPct = 0): self
    {
        $this->dte['cuerpoDocumento'] = [];
        $subTotal = 0.0;
        $totalIva = 0.0;

        foreach ($items as $i => $it) {
            $cantidad = isset($it['cantidad']) ? floatval($it['cantidad']) : 0.0;
            $precioConIVA = isset($it['precio']) ? floatval($it['precio']) : 0.0;

            $ventaGravada = round($precioConIVA * $cantidad, 2);
            // ivaItem = (precioConIVA * cantidad) * ivaPct / (100 + ivaPct)
            $ivaItem = $ivaPct > 0 ? round($ventaGravada * $ivaPct / (100 + $ivaPct), 2) : 0.00;

            $subTotal += $ventaGravada;
            $totalIva += $ivaItem;

            $this->dte['cuerpoDocumento'][] = [
                'numItem' => $i + 1,
                'tipoItem' => $it['tipoItem'] ?? 2,
                'numeroDocumento' => $it['numeroDocumento'] ?? null,
                'cantidad' => $cantidad,
                'codigo' => $it['codigo'] ?? null,
                'codTributo' => $it['codTributo'] ?? null,
                'uniMedida' => $it['uniMedida'] ?? 59,
                'descripcion' => $it['descripcion'] ?? '',
                'precioUni' => round($precioConIVA, 2),
                'montoDescu' => $it['montoDescu'] ?? 0,
                'ventaNoSuj' => 0,
                'ventaExenta' => 0,
                'ventaGravada' => $ventaGravada,
                'tributos' => $it['tributos'] ?? null,
                'psv' => $it['psv'] ?? 0,
                'noGravado' => 0,
                'ivaItem' => $ivaItem
            ];
        }

        // llenar resumen provisional (se completará en build())
        $this->dte['resumen'] = [
            'totalNoSuj' => 0,
            'totalExenta' => 0,
            'totalGravada' => round($subTotal, 2),
            'subTotalVentas' => round($subTotal, 2),
            'descuNoSuj' => 0,
            'descuExenta' => 0,
            'descuGravada' => 0,
            'porcentajeDescuento' => 0,
            'totalDescu' => 0,
            'tributos' => [],
            'subTotal' => round($subTotal, 2),
            'ivaRete1' => 0,
            'reteRenta' => 0,
            'montoTotalOperacion' => round($subTotal, 2),
            'totalNoGravado' => 0,
            'totalPagar' => round($subTotal, 2),
            'totalLetras' => $this->numeroALetras(round($subTotal,2)),
            'totalIva' => round($totalIva, 2),
            'saldoFavor' => 0,
            'condicionOperacion' => 1,
            'pagos' => [
                [
                    'codigo' => '03',
                    'montoPago' => round($subTotal, 2),
                    'plazo' => null,
                    'referencia' => "",
                    'periodo' => null
                ]
            ],
            'numPagoElectronico' => null
        ];

        return $this;
    }

    /**
     * Generar número en letras (simple). Puedes reemplazar por NumberFormatter si quieres.
     */
    protected function numeroALetras(float $numero): string
    {
        // Usa NumberFormatter si está disponible
        if (class_exists(\NumberFormatter::class)) {
            $formatter = new \NumberFormatter("es", \NumberFormatter::SPELLOUT);
            $partes = explode('.', number_format($numero, 2, '.', ''));
            $entero = $formatter->format($partes[0]);
            $centavos = str_pad($partes[1], 2, '0', STR_PAD_LEFT);
            if ($centavos === '00') {
                return strtoupper("$entero DÓLARES");
            }
            return strtoupper("$entero DÓLARES CON $centavos CENTAVOS");
        }
        return strtoupper(number_format($numero, 2, '.', ''));
    }

    /**
     * Build: realiza validaciones finales, ajusta cualquier valor faltante y devuelve el array final
     */
    public function build(): array
    {
        // Asegurar que identificacion tiene codigoGeneracion y numeroControl
        if (empty($this->dte['identificacion']['codigoGeneracion'])) {
            $this->dte['identificacion']['codigoGeneracion'] = $this->uuidV4();
        }
        if (empty($this->dte['identificacion']['numeroControl'])) {
            // Default generico (mejor asignarlo fuera, pero dejamos fallback)
            $this->dte['identificacion']['numeroControl'] = 'DTE-' .
                str_pad((int)($this->dte['identificacion']['tipoDte'] ?? '1'), 2, '0', STR_PAD_LEFT) . '-' .
                ($this->dte['emisor']['codEstableMH'] ?? 'M001') .
                ($this->dte['emisor']['codPuntoVentaMH'] ?? 'P001') . '-' .
                str_pad(rand(1, 999999999999999), 15, '0', STR_PAD_LEFT);
        }

        // Recalcular resumen si cuerpoDocumento tiene items
        $subTotal = 0.0; $totalIva = 0.0;
        foreach ($this->dte['cuerpoDocumento'] as $it) {
            $subTotal += floatval($it['ventaGravada'] ?? 0);
            $totalIva += floatval($it['ivaItem'] ?? 0);
        }
        $subTotal = round($subTotal, 2);
        $totalIva = round($totalIva, 2);
        $montoTotalOperacion = $subTotal;
        $totalPagar = $montoTotalOperacion;

        $this->dte['resumen']['totalGravada'] = $subTotal;
        $this->dte['resumen']['subTotal'] = $subTotal;
        $this->dte['resumen']['montoTotalOperacion'] = $montoTotalOperacion;
        $this->dte['resumen']['totalPagar'] = $totalPagar;
        $this->dte['resumen']['totalIva'] = $totalIva;
        $this->dte['resumen']['totalLetras'] = $this->numeroALetras($totalPagar);
        $this->dte['resumen']['pagos'][0]['montoPago'] = $totalPagar;

        // Optional: eliminar claves null para limpiar
        // $this->dte = $this->eliminarCamposNulos($this->dte);

        return $this->dte;
    }

    /**
     * Comprueba campos requeridos y devuelve array de errores o true si OK.
     * Ejecutar BEFORE de firmar.
     */
    public function validate(): array|bool
    {
        $errors = [];

        $ident = $this->dte['identificacion'];
        $requiredIdent = ['version','ambiente','tipoDte','numeroControl','codigoGeneracion','fecEmi','horEmi','tipoMoneda'];
        foreach ($requiredIdent as $k) {
            if (empty($ident[$k]) && $ident[$k] !== '0') $errors[] = "identificacion.$k";
        }

        // Emisor
        $em = $this->dte['emisor'];
        foreach (['nit','nombre','codEstableMH','codPuntoVentaMH'] as $k) {
            if (empty($em[$k])) $errors[] = "emisor.$k";
        }
        if (empty($em['direccion']['departamento'])) $errors[] = "emisor.direccion.departamento";
        if (empty($em['direccion']['municipio'])) $errors[] = "emisor.direccion.municipio";

        // Receptor
        $r = $this->dte['receptor'];
        foreach (['tipoDocumento','numDocumento','nombre'] as $k) {
            if (empty($r[$k])) $errors[] = "receptor.$k";
        }

        // Items
        if (empty($this->dte['cuerpoDocumento']) || !is_array($this->dte['cuerpoDocumento'])) {
            $errors[] = "cuerpoDocumento.empty";
        } else {
            foreach ($this->dte['cuerpoDocumento'] as $idx => $it) {
                if (!isset($it['cantidad']) || $it['cantidad'] <= 0) $errors[] = "cuerpoDocumento.$idx.cantidad";
                if (!isset($it['precioUni'])) $errors[] = "cuerpoDocumento.$idx.precioUni";
                if (!isset($it['ventaGravada'])) $errors[] = "cuerpoDocumento.$idx.ventaGravada";
            }
        }

        // Totales consistentes
        $calcSub = 0; $calcIva = 0;
        foreach ($this->dte['cuerpoDocumento'] as $it) {
            $calcSub += floatval($it['ventaGravada'] ?? 0);
            $calcIva += floatval($it['ivaItem'] ?? 0);
        }
        if (abs($calcSub - ($this->dte['resumen']['subTotal'] ?? 0)) > 0.01) $errors[] = "resumen.subTotal_mismatch";
        if (abs($calcIva - ($this->dte['resumen']['totalIva'] ?? 0)) > 0.01) $errors[] = "resumen.totalIva_mismatch";

        return empty($errors) ? true : $errors;
    }

    /**
     * Generador de UUID v4 (mayúsculas)
     */
    protected function uuidV4(): string
    {
        $data = random_bytes(16);
        $data[6] = chr((ord($data[6]) & 0x0f) | 0x40);
        $data[8] = chr((ord($data[8]) & 0x3f) | 0x80);
        $hex = bin2hex($data);
        return strtoupper(
            substr($hex, 0, 8) . '-' .
            substr($hex, 8, 4) . '-' .
            substr($hex, 12, 4) . '-' .
            substr($hex, 16, 4) . '-' .
            substr($hex, 20, 12)
        );
    }

    /**
     * Eliminar claves nulas (opcional)
     */
    protected function eliminarCamposNulos(array $arr): array
    {
        foreach ($arr as $k => &$v) {
            if (is_array($v)) {
                $v = $this->eliminarCamposNulos($v);
                if (empty($v)) unset($arr[$k]);
            } elseif ($v === null) {
                unset($arr[$k]);
            }
        }
        return $arr;
    }
}
