<?php
namespace App\Services;

use App\Helpers\DteHelper;
use App\Models\Empresa;
use App\Models\Cliente;
use Carbon\Carbon;

class DteBuilder
{
    protected array $identificacion = [];
    protected array $emisor = [];
    protected array $receptor = [];
    protected array $items = [];
    protected float $ivaPct = 0.0;

    public function setEmisor(Empresa $empresa): self
    {
        // Mapeo según campos que tienes en tabla empresas
        $this->emisor = [
            'nit'                 => $empresa->nit ?? $empresa->api_user ?? null,
            'nrc'                 => $empresa->nrc ?? null,
            'nombre'              => $empresa->razon_social ?? null,
            'codActividad'        => $empresa->cod_actividad ?? null,
            'descActividad'       => $empresa->desc_actividad ?? 'Venta de productos de tecnología',
            'nombreComercial'     => $empresa->nombre_comercial ?? null,
            'tipoEstablecimiento' => $empresa->tipo_establecimiento ?? '02',
            'direccion'           => [
                'departamento' => $empresa->departamento ?? '12',
                'municipio'    => $empresa->municipio ?? '22',
                'complemento'  => $empresa->direccion ?? '',
            ],
            'telefono'            => $empresa->telefono ?? null,
            'correo'              => $empresa->correo ?? null,
            'codEstableMH'       => $empresa->cod_estable_mh ?? 'M001',
            'codEstable'         => $empresa->cod_estable_int ?? null,
            'codPuntoVentaMH'    => $empresa->cod_punto_venta_mh ?? 'P001',
            'codPuntoVenta'      => $empresa->cod_punto_venta_int ?? null,
        ];

        return $this;
    }

    public function setReceptor(object $cliente, string $doc): self
    {
        // Formatear el número de documento según el tipo
        $tipoDocumento = (is_numeric($doc) && strlen($doc) > 10) ? '02' : '13';
        $numDocumento = $doc;
        
        // Si es DUI (tipo 13), formatearlo con guión
        if ($tipoDocumento === '13' && strlen($doc) === 9) {
            $numDocumento = substr($doc, 0, 8) . '-' . substr($doc, 8, 1);
        }

        $this->receptor = [
            'tipoDocumento' => $tipoDocumento,
            'numDocumento'  => $numDocumento,
            'nrc'           => $cliente->nrc ?? null,
            'nombre'        => $cliente->nombre ?? null,
            'codActividad'  => $cliente->cod_actividad ?? null,
            'descActividad' => $cliente->desc_actividad ?? null,
            'direccion' => [
                'departamento' => $cliente->departamento ?? '12',
                'municipio'    => $cliente->municipio ?? '22',
                'complemento'  => $cliente->direccion ?? ''
            ],
            'telefono'      => $cliente->telefono ?? null,
            'correo'        => $cliente->correo ?? null
        ];

        return $this;
    }

    /**
     * $items: array de ítems con campos: descripcion, cantidad, precio (precio INCLUYE IVA)
     * $ivaPct: porcentaje IVA (ej: 13)
     */
    public function setItems(array $items, float $ivaPct = 0.0): self
    {
        $this->ivaPct = $ivaPct;
        $this->items = $items;
        return $this;
    }

    public function build(): array
    {
        // Identificacion
        $codigoGen = DteHelper::uuidV4();
        $numControl = 'DTE-01-M001P001-' . str_pad(rand(1, 999999999999999), 15, '0', STR_PAD_LEFT);

        $identificacion = [
            'version'          => 1,
            'ambiente'         => '00',
            'tipoDte'          => '01',
            'numeroControl'    => $numControl,
            'codigoGeneracion' => $codigoGen,
            'tipoModelo'       => 1,
            'tipoOperacion'    => 1,
            'tipoContingencia' => null,
            'motivoContin'     => null,
            'fecEmi'           => Carbon::now()->toDateString(),
            'horEmi'           => Carbon::now()->format('H:i:s'),
            'tipoMoneda'       => 'USD',
        ];

        // Cuerpo documento
        $cuerpo = [];
        $subTotal = 0.0;
        $totalIva = 0.0;

        foreach ($this->items as $i => $it) {
            $cantidad = floatval($it['cantidad'] ?? 1);
            $precioConIVA = floatval($it['precio'] ?? 0.0);

            $ventaGravada = round($precioConIVA * $cantidad, 2);
            $ivaItem = round($ventaGravada * $this->ivaPct / (100 + $this->ivaPct), 2);

            $subTotal += round($ventaGravada, 2);
            $totalIva += $ivaItem;

            $cuerpo[] = [
                'numItem'         => $i + 1,
                'tipoItem'        => 2,
                'numeroDocumento' => null,
                'cantidad'        => $cantidad,
                'codigo'          => $it['codigo'] ?? null,
                'codTributo'      => null,
                'uniMedida'       => $it['uniMedida'] ?? 59,
                'descripcion'     => $it['descripcion'] ?? '',
                'precioUni'       => round($precioConIVA, 2),
                'montoDescu'      => 0,
                'ventaNoSuj'      => 0,
                'ventaExenta'     => 0,
                'ventaGravada'    => $ventaGravada,
                'tributos'        => null,
                'psv'             => 0,
                'noGravado'       => 0,
                'ivaItem'         => $ivaItem,
            ];
        }

        $totalOperacion = round($subTotal, 2);

        $resumen = [
            'totalNoSuj'          => 0,
            'totalExenta'         => 0,
            'totalGravada'        => $subTotal,
            'subTotalVentas'      => $subTotal,
            'descuNoSuj'          => 0,
            'descuExenta'         => 0,
            'descuGravada'        => 0,
            'porcentajeDescuento' => 0,
            'totalDescu'          => 0,
            'tributos'            => [],
            'subTotal'            => $subTotal,
            'ivaRete1'            => 0,
            'reteRenta'           => 0,
            'montoTotalOperacion' => $totalOperacion,
            'totalNoGravado'      => 0,
            'totalPagar'          => $totalOperacion,
            'totalLetras'         => DteHelper::numeroALetras($totalOperacion),
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

        $json = [
            'identificacion'       => $identificacion,
            'documentoRelacionado' => null,
            'emisor'               => $this->emisor,
            'receptor'             => $this->receptor,
            'otrosDocumentos'      => null,
            'ventaTercero'         => null,
            'cuerpoDocumento'      => $cuerpo,
            'resumen'              => $resumen,
            'extension'            => [
                'nombEntrega'   => null,
                'docuEntrega'   => null,
                'nombRecibe'    => null,
                'docuRecibe'    => null,
                'observaciones' => null,
                'placaVehiculo' => null
            ],
            'apendice'             => null,
            // firmaElectronica se añade en DTEService
        ];

        return $json;
    }
}
