<?php

namespace App\Http\Controllers\DTE;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Log;
use App\Models\TipoDocumento;
use App\Models\Cliente;
use App\Models\Sucursal;
use App\Models\Caja;
use App\Models\Producto;
use App\Models\Dte;
use App\Services\DteBuilder;
use App\Services\CcfService;
use App\Helpers\DteHelper;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Exception;

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

        // Evitar faltas si receptor no existe en validated
        $validatedReceptor = $validated['receptor'] ?? [];

        // Buscar cliente por DUI/NIT (si existe)
        $cliente = Cliente::where('nit', $validated['cliente_numero'])
                    ->orWhere('dui', $validated['cliente_numero'])
                    ->first();

        // Construir estructura DTE usando DteBuilder
        $builder = new DteBuilder();

        // 1) EMISOR: setear desde la empresa y asegurar códigos MH por defecto
        $builder->setEmisor($empresa);

        // Asegurar codEstableMH y codPuntoVentaMH (valores requeridos por validate())
        $codEstableMH = $empresa->cod_estable_mh ?? $empresa->codEstableMH ?? 'M001';
        $codPuntoVentaMH = $empresa->cod_punto_venta_mh ?? $empresa->codPuntoVentaMH ?? 'P001';

        // Re-aplicar defaults mínimos para el emisor
        $builder->setEmisor([
            'codEstableMH'     => (string) $codEstableMH,
            'codPuntoVentaMH'  => (string) $codPuntoVentaMH,
            'nit'              => $empresa->api_user ?? $empresa->nit,
            'nombre'           => $empresa->razon_social ?? ($empresa->nombre_comercial ?? 'EMISOR'),
            'descActividad'    => (string) ($empresa->desc_actividad ?? '')
        ]);

        // 2) RECEPTOR: tomamos los valores directamente de la tabla clientes si existe,
        //    sino usamos los valores proporcionados por el formulario (validatedReceptor)
        $numDocumento = $validated['cliente_numero'];

        // Determinar tipo documento (si proviene del formulario prefierelo;
        // si no, tomar tipo_documento de la tabla clientes o inferir por longitud)
        if (!empty($validatedReceptor['tipoDocumento'])) {
            $receptorTipo = $validatedReceptor['tipoDocumento'];
        } elseif ($cliente && !empty($cliente->tipo_documento)) {
            $receptorTipo = $cliente->tipo_documento;
        } else {
            // Inferir: NIT suele tener más de 9 dígitos (ajusta según tu lógica)
            $digits = preg_replace('/\D/', '', (string)$numDocumento);
            $receptorTipo = (strlen($digits) > 9) ? '02' : '13';
        }

        // Si es DUI (13) intentamos formatearlo con el guion
        if ($receptorTipo === '13') {
            $digits = preg_replace('/\D+/', '', (string)$numDocumento);
            if (strlen($digits) === 9) {
                $numDocumento = substr($digits, 0, 8) . '-' . substr($digits, 8, 1);
            }
        }

        // Nombre del receptor: priorizar la columna nombre de clientes si existe,
        // luego el campo del formulario, sino un fallback seguro.
        $receptorNombre = $cliente?->nombre ?? ($validatedReceptor['nombre'] ?? null);
        if (empty($receptorNombre)) {
            $receptorNombre = ($receptorTipo === '13') ? 'CONSUMIDOR FINAL' : 'CLIENTE';
        }

        // --- Aquí: tomar municipio/departamento/complemento DIRECTAMENTE de la tabla clientes ---
        if ($cliente) {
    // pasa un array limpio con toArray() para evitar problemas de cast
    $builder->setReceptor($cliente->toArray(), $validated['cliente_numero']);
} else {
    // Si no existe cliente, se usa el bloque con los datos del formulario
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


        // --- obtener receptor validado (si existe) ---
$validatedReceptor = $validated['receptor'] ?? [];

// Si $cliente existe (consulta previa), preferir sus campos.
// Si no, usar lo enviado por formulario en receptor.direccion OR receptor.{departamento,municipio,complemento}
$dirDepartamento = $cliente->departamento ?? ($validatedReceptor['direccion']['departamento'] ?? ($validatedReceptor['departamento'] ?? null));
$dirMunicipio    = $cliente->municipio    ?? ($validatedReceptor['direccion']['municipio']    ?? ($validatedReceptor['municipio'] ?? null));
$dirComplemento  = $cliente->complemento  ?? ($validatedReceptor['direccion']['complemento']  ?? ($validatedReceptor['complemento'] ?? null));

// Normalizar strings vacíos a null (opcional, según schema)
$dirDepartamento = $dirDepartamento === '' ? null : $dirDepartamento;
$dirMunicipio    = $dirMunicipio === '' ? null : $dirMunicipio;
$dirComplemento  = $dirComplemento === '' ? null : $dirComplemento;

// Construir payload del receptor (usa los valores calculados)
$receptorPayload = [
    'tipoDocumento' => $receptorTipo,
    'numDocumento'  => $numDocumento,
    'nrc'           => $cliente->nrc ?? ($validatedReceptor['nrc'] ?? null),
    'nombre'        => $receptorNombre,
    'codActividad'  => $cliente->cod_actividad ?? ($validatedReceptor['codActividad'] ?? null),
    'descActividad' => $cliente->desc_actividad ?? ($validatedReceptor['descActividad'] ?? null),
    'direccion' => [
        'departamento' => $dirDepartamento,
        'municipio'    => $dirMunicipio,
        'complemento'  => $dirComplemento,
    ],
    'telefono' => $cliente->telefono ?? ($validatedReceptor['telefono'] ?? null),
    'correo'   => $cliente->correo ?? ($validatedReceptor['correo'] ?? null),
];

        // Log resumido para depuración (puedes quitar luego)
        Log::info('DTE -> receptorPayload (directo desde clientes o fallback):', [
            'cliente_id' => $cliente?->id ?? null,
            'receptorPayload' => $receptorPayload,
        ]);

        // Setear receptor en el builder
        $builder->setReceptor($receptorPayload, $numDocumento);

        // 3) Ítems: preparar y setear
        $items = [];
        foreach ($validated['items'] as $item) {
            $items[] = [
                'descripcion' => $item['descripcion'],
                'cantidad' => $item['cantidad'],
                'precio' => $item['precio'],
            ];
        }
        $ivaPct = floatval($validated['iva'] ?? 0);
        $builder->setItems($items, $ivaPct);

        // 4) Identificación: tipoDte, numeroControl, codigoGeneracion y ambiente
        $tipoPad = str_pad(ltrim($validated['tipo'], '0'), 2, '0', STR_PAD_LEFT);
        $numeroControl = 'DTE-' . $tipoPad . '-' .
                         ($codEstableMH ?? 'M001') .
                         ($codPuntoVentaMH ?? 'P001') . '-' .
                         str_pad(rand(1, 999999999999999), 15, '0', STR_PAD_LEFT);

        $codigoGeneracion = DteHelper::uuidV4();

        $builder->setIdentificacion([
            'tipoDte' => $tipoPad,
            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            // dejamos ambiente por defecto (ej. "00") a menos que quieras otra cosa
            'ambiente' => $builder->build()['identificacion']['ambiente'] ?? '00',
        ]);

        // DEBUG log resumido
        Log::info('Preparando DTE - resumen', [
            'usuario_id' => auth()->id(),
            'empresa_id' => $empresa->id ?? null,
            'tipoDte' => $tipoPad,
            'numeroControl' => $numeroControl,
            'codigoGeneracion' => $codigoGeneracion,
            'items_count' => count($items),
            'receptor_tipo' => $receptorPayload['tipoDocumento'],
            'receptor_nombre' => $receptorPayload['nombre'],
            'emisor_codEstableMH' => $codEstableMH,
            'emisor_codPuntoVentaMH' => $codPuntoVentaMH,
        ]);

        // Validar antes de construir JSON final
        $validation = $builder->validate();
        if ($validation !== true) {
            $msg = 'DTE inválido. Campos faltantes o inconsistentes: ' . implode(', ', $validation);
            Log::warning('DTE inválido antes de guardar', ['errors' => $validation, 'payload' => $receptorPayload]);
            return redirect()->back()->withInput()->with('error', $msg);
        }

        // Construir el array final del DTE
        $jsonDte = $builder->build();

        // Guardar DTE en la tabla dtes (estado pendiente)
        try {
            $dte = Dte::create([
                'usuario_id' => auth()->id(),
                'dte_json' => $jsonDte, // Dte model tiene $casts para array
                'respuesta_json' => null,
                'codigo_generacion' => $codigoGeneracion,
                'estado' => 'PENDIENTE',
            ]);
            Log::info("DTE guardado id={$dte->id} usuario_id=" . auth()->id());
        } catch (\Throwable $e) {
            Log::error('Error creando DTE: ' . $e->getMessage(), ['trace' => $e->getTraceAsString()]);
            return redirect()->back()->withInput()->with('error', 'Error interno al guardar DTE. Revisa logs.');
        }

        return redirect()->route('dte.index')->with('success', 'DTE creado (pendiente firma/envío).');
    }

    // --- Mostrar formulario CCF (reusa la vista factura/create que ya tienes)
    // --- Mostrar formulario CCF (reusa la vista factura/create que ya tienes)
// --- Mostrar formulario CCF (reusa la vista factura/create que ya tienes)
    public function createCcf(Request $request)
    {
        $user = Auth::user();
        $empresa = $user->empresa ?? null;

        $sucursales = $empresa ? Sucursal::where('empresa_id', $empresa->id)->get() : collect();
        // OJO: no buscar cajas por empresa_id directamente si tu modelo está por sucursal.
        // mejor obtener cajas por sucursal list:
        $cajas = collect();
        if ($empresa) {
            $sucursalesIds = $sucursales->pluck('id')->toArray();
            if (!empty($sucursalesIds)) {
                $cajas = \App\Models\Caja::whereIn('sucursal_id', $sucursalesIds)->get();
            }
        }

        $tipo = TipoDocumento::where('codigo', '03')->first();

        return view('dte.factura.create', compact('tipo', 'sucursales', 'cajas'));
    }

    // --- Guardar CCF: delegar en CcfService
    public function storeCcf(Request $request)
    {
        $user = Auth::user();
        $empresa = $user->empresa ?? null;
        if (! $empresa) {
            return back()->with('error', 'Empresa emisora no configurada para este usuario.');
        }

        // Reglas básicas (suficientes para crear el CCF)
        $rules = [
            'receptor.numDocumento' => ['required','string'],
            'receptor.nombre' => ['nullable','string'],
            'items' => ['required','array','min:1'],
            'items.*.cantidad' => ['required','numeric','min:0.00000001'],
            'items.*.precio' => ['required','numeric'],
            'iva' => ['nullable','numeric'],
        ];

        $v = Validator::make($request->all(), $rules);
        if ($v->fails()) {
            return back()->withErrors($v)->withInput();
        }

        $input = $request->all();

        // instanciar servicio CCF con la empresa actual
        $ccfService = new \App\Services\CcfService($empresa);

        try {
            $dteModel = $ccfService->createFromArray($input, $user);
        } catch (Exception $e) {
            \Log::error('Error creando CCF: '.$e->getMessage());
            return back()->withInput()->with('error', 'Error creando CCF: ' . $e->getMessage());
        }

        return redirect()->route('dte.index')->with('success', 'Comprobante CCF preparado correctamente (ID: '.$dteModel->id.').');
    }
}
