<?php

namespace App\Http\Controllers\DTE;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use App\Models\TipoDocumento;
use App\Models\Cliente;
use App\Models\Sucursal;
use App\Models\Caja;
use App\Models\Producto;
use App\Models\Dte;
use App\Services\DteBuilder;
use App\Helpers\DteHelper;

class FacturaController extends Controller
{
    /**
     * Mostrar formulario de creación de factura (DTE tipo Factura).
     */
    public function create(Request $request): View
    {
        $empresa = auth()->user()->empresa;
        if (! $empresa) {
            return redirect()->route('empresa.create')->with('error', 'Debe registrar su empresa primero.');
        }
        
        // tipo (código MH) pasado como query param ?tipo=01
        $tipoCodigo = $request->query('tipo');
        $tipo = $tipoCodigo ? TipoDocumento::where('codigo', $tipoCodigo)->first() : null;

        // Cargar datos necesarios para el formulario
        $clientes   = Cliente::orderBy('nombre')->get();
        $sucursales = $empresa->sucursales()->orderBy('descripcion')->get();
        $cajas      = Caja::whereIn('sucursal_id', $sucursales->pluck('id')->toArray())->get();
        $productos  = Producto::where('empresa_id', $empresa->id)->orderBy('descripcion')->get();

        return view('dte.factura.create', compact(
            'tipo', 'clientes', 'sucursales', 'cajas', 'productos', 'empresa'
        ));
    }

    /**
     * Guardar (preparar) el DTE — aquí únicamente validamos y guardamos el JSON en la BD.
     * La firma / envío a Hacienda lo implementaremos separadamente.
     */
    public function store(Request $request): RedirectResponse
    {
        $empresa = auth()->user()->empresa;
        if (! $empresa) {
            return redirect()->route('empresa.create')->with('error', 'Empresa no configurada.');
        }

        // Validación básica (ajusta según tu schema real)
        $validated = $request->validate([
            'tipo' => ['required', 'string'],
            'cliente_numero' => ['required', 'string'],
            'sucursal_id' => ['nullable', 'integer', 'exists:sucursales,id'],
            'caja_id' => ['nullable', 'integer', 'exists:cajas,id'],
            'iva' => ['nullable', 'numeric'],
            'items' => ['required', 'array', 'min:1'],
            'items.*.descripcion' => ['required', 'string'],
            // CORRECCIÓN: separar 'numeric' y 'min' en elementos distintos
            'items.*.cantidad' => ['required', 'numeric', 'min:0.01'],
            'items.*.precio' => ['required', 'numeric', 'min:0'],
            // Campos del receptor (hidden inputs del formulario)
            'receptor.tipoDocumento' => ['nullable', 'string'],
            'receptor.numDocumento' => ['nullable', 'string'],
            'receptor.nrc' => ['nullable', 'string'],
            'receptor.nombre' => ['nullable', 'string'],
            'receptor.codActividad' => ['nullable', 'string'],
            'receptor.descActividad' => ['nullable', 'string'],
            'receptor.direccion.departamento' => ['nullable', 'string'],
            'receptor.direccion.municipio' => ['nullable', 'string'],
            'receptor.direccion.complemento' => ['nullable', 'string'],
            'receptor.telefono' => ['nullable', 'string'],
            'receptor.correo' => ['nullable', 'string'],
        ]);

        // Buscar cliente por DUI/NIT
        $cliente = Cliente::where('nit', $validated['cliente_numero'])
                    ->orWhere('dui', $validated['cliente_numero'])
                    ->first();

        // Construir estructura DTE usando DteBuilder
        $builder = new DteBuilder();
        $builder->setEmisor($empresa);
        
        if ($cliente) {
            $builder->setReceptor($cliente, $validated['cliente_numero']);
        } else {
            // Si no se encuentra cliente, usar los datos del formulario
            $builder->setReceptor((object)[
                'nrc' => $validated['receptor']['nrc'] ?? null,
                'nombre' => $validated['receptor']['nombre'] ?? null,
                'municipio' => $validated['receptor']['direccion']['municipio'] ?? null,
                'departamento' => $validated['receptor']['direccion']['departamento'] ?? null,
                'direccion' => $validated['receptor']['direccion']['complemento'] ?? null,
                'telefono' => $validated['receptor']['telefono'] ?? null,
                'correo' => $validated['receptor']['correo'] ?? null,
                'cod_actividad' => $validated['receptor']['codActividad'] ?? null,
                'desc_actividad' => $validated['receptor']['descActividad'] ?? null,
            ], $validated['cliente_numero']);
        }
        
        $items = [];
        foreach ($validated['items'] as $item) {
            $items[] = [
                'descripcion' => $item['descripcion'],
                'cantidad' => $item['cantidad'],
                'precio' => $item['precio'],
            ];
        }
        
        $builder->setItems($items, $validated['iva'] ?? 0);
        $jsonDte = $builder->build();
        
        // Actualizar tipoDte y numeroControl
        $jsonDte['identificacion']['tipoDte'] = $validated['tipo'];
        $jsonDte['identificacion']['numeroControl'] = 'DTE-' . $validated['tipo'] . '-' .
                         ($empresa->cod_estable_mh ?? '0001') .
                         ($empresa->cod_punto_venta_mh ?? '0001') . '-' .
                         str_pad(rand(1, 999999999999999), 15, '0', STR_PAD_LEFT);

        // Generar código de generación
        $codigoGeneracion = DteHelper::uuidV4();
        $jsonDte['identificacion']['codigoGeneracion'] = $codigoGeneracion;

        // Guardar DTE en la tabla dtes (estado pendiente)
        $dte = Dte::create([
            'usuario_id' => auth()->id(),
            'dte_json' => $jsonDte,
            'respuesta_json' => null,
            'codigo_generacion' => $codigoGeneracion,
            'estado' => 'PENDIENTE',
        ]);

        return redirect()->route('dte.index')->with('success', 'DTE creado (pendiente firma/envío).');
    }
}
