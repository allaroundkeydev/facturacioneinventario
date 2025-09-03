<?php
//app\Http\Controllers\DTE\FacturaController.php
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

    // Helpers de precisión
protected function r6(float $v): float { return round($v, 6); }
protected function r2(float $v): float { return round($v, 2); }

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
// Paso 1: Preparar Factura genérica
public function preparar(Request $request): RedirectResponse
{
    $validated = $request->validate([
        'tipo' => ['required','string'],
        'cliente_numero' => ['required','string'],
        'iva' => ['nullable','numeric'],
        'descuento_global' => ['nullable','numeric','min:0'],
        'items' => ['required','array','min:1'],
        'items.*.descripcion' => ['required','string'],
        'items.*.cantidad' => ['required','numeric','min:0.000001'],
        'items.*.precio' => ['required','numeric','min:0'],
        'items.*.montoDescu' => ['nullable','numeric','min:0'],
    ]);

    session([
        'dte_draft' => ['isCcf' => false, 'payload' => $validated],
        'dte_total' => $this->calcularTotalServer($validated, false)
    ]);

    return redirect()->route('dte.pago');
}

// Paso 1: Preparar CCF
public function prepararCcf(Request $request): RedirectResponse
{
    $validated = $request->validate([
        'receptor.numDocumento' => ['required','string'],
        'items' => ['required','array','min:1'],
        'items.*.cantidad' => ['required','numeric','min:0.000001'],
        'items.*.precio' => ['required','numeric','min:0'],
        'items.*.montoDescu' => ['nullable','numeric','min:0'],
        'iva' => ['nullable','numeric'],
        'descuento_global' => ['nullable','numeric','min:0'],
    ]);

    session([
        'dte_draft' => ['isCcf' => true, 'payload' => $validated],
        'dte_total' => $this->calcularTotalServer($validated, true)
    ]);

    return redirect()->route('dte.pago');
}

// Paso 2: Seleccionar forma de pago
public function seleccionarPago()
{
    $draft = session('dte_draft');
    if (!$draft) return redirect()->route('dte.index')->with('error','No hay datos para procesar.');

    $formasPago = \DB::table('formas_pago')->orderBy('codigo')->get();
    $plazos = \DB::table('plazos')->orderBy('codigo')->get();

    return view('dte.pago', [
        'total' => session('dte_total') ?? 0,
        'formasPago' => $formasPago,
        'plazos' => $plazos,
        'isCcf' => (bool)($draft['isCcf'] ?? false),
    ]);
}

// Paso 3: Confirmar Factura
public function confirmar(Request $request): RedirectResponse
{
    $draft = session('dte_draft');
    if (!$draft || ($draft['isCcf'] ?? false)) {
        return redirect()->route('dte.index')->with('error','Flujo inválido.');
    }
    $pago = $this->validatePago($request);
    return $this->finalizarFactura($draft['payload'], $pago);
}

// Paso 3: Confirmar CCF
public function confirmarCcf(Request $request): RedirectResponse
{
    $draft = session('dte_draft');
    if (!$draft || !($draft['isCcf'] ?? false)) {
        return redirect()->route('dte.index')->with('error','Flujo inválido.');
    }
    $pago = $this->validatePago($request);
    return $this->finalizarCcf($draft['payload'], $pago);
}

// Validar y normalizar pagos
protected function validatePago(Request $request): array
{
    $data = $request->validate([
        'pago_tipo' => ['required','in:efectivo,tarjeta,otras'],
        'efectivo_monto' => ['nullable','numeric','min:0'],
        'tarjeta_codigo' => ['nullable','in:02,03'],
        'tarjeta_monto' => ['nullable','numeric','min:0'],
        'tarjeta_referencia' => ['nullable','string','max:50'],
        'otras' => ['nullable','array'],
        'otras.*.codigo' => ['nullable','string','max:2'],
        'otras.*.monto' => ['nullable','numeric','min:0'],
        'otras.*.referencia' => ['nullable','string','max:50'],
        'otras.*.plazo' => ['nullable','regex:/^0[1-3]$/'],
        'otras.*.periodo' => ['nullable','integer','min:1'],
    ]);

    $total = session('dte_total') ?? 0;
    $pagos = [];

    if ($data['pago_tipo'] === 'efectivo') {
        $monto = $this->r2((float)($data['efectivo_monto'] ?? $total));
        $monto = $monto > 0 ? min($monto, $this->r2($total)) : $this->r2($total);
        $pagos[] = ['codigo' => '01', 'montoPago' => $monto, 'referencia' => null, 'plazo' => null, 'periodo' => null];
    } elseif ($data['pago_tipo'] === 'tarjeta') {
        $codigo = $data['tarjeta_codigo'] ?? '02';
        $monto  = $this->r2((float)($data['tarjeta_monto'] ?? $total));
        $monto = $monto > 0 ? min($monto, $this->r2($total)) : $this->r2($total);
        $pagos[] = ['codigo' => $codigo, 'montoPago' => $monto, 'referencia' => $data['tarjeta_referencia'] ?? null, 'plazo' => null, 'periodo' => null];
    } else {
        foreach (($data['otras'] ?? []) as $row) {
            $codigo = $row['codigo'] ?? null;
            $monto  = isset($row['monto']) ? $this->r2((float)$row['monto']) : 0;
            if (!$codigo || $monto <= 0) continue;
            $pagos[] = [
                'codigo' => $codigo,
                'montoPago' => $monto,
                'referencia' => $row['referencia'] ?? null,
                'plazo' => $row['plazo'] ?? null,
                'periodo' => isset($row['periodo']) ? (int)$row['periodo'] : null,
            ];
        }
    }

    if (empty($pagos)) {
        $pagos[] = ['codigo' => '01', 'montoPago' => $this->r2((float)$total), 'referencia' => null, 'plazo' => null, 'periodo' => null];
    }

    return ['pagos' => $pagos];
}

// Calcular total con 6 decimales
protected function calcularTotalServer(array $payload, bool $isCcf): float
{
    $ivaPct = (float)($payload['iva'] ?? 0);
    $glob = (float)($payload['descuento_global'] ?? 0);

    $base = 0.0; $iva = 0.0;

foreach ($payload['items'] as $it) {
        $qty = (float)($it['cantidad'] ?? 0);
        $precio = (float)($it['precio'] ?? 0);
        $desc = (float)($it['montoDescu'] ?? 0);

        // precio con IVA en formulario
        $priceNoIva = $ivaPct > 0 ? ($precio / (1 + $ivaPct/100)) : $precio;

        // base con descuento por ítem
        $lineaBase = max(0, ($priceNoIva * $qty) - $desc);
        $base += $this->r6($lineaBase);

        // IVA a partir del precio informado con IVA
        $lineaIva = ($precio - $priceNoIva) * $qty;
        $iva += $this->r6($lineaIva);
    }

    $base = max(0, $base - $glob);
    return $this->r2($base + $iva);
}

protected function finalizarFactura(array $data, array $pago): RedirectResponse
{
    $empresa = auth()->user()->empresa;
    if (!$empresa) {
        return redirect()
            ->route('empresa.create')
            ->with('error', 'Empresa no configurada.');
    }

    // Instanciar el builder y setear emisor
    $builder = new \App\Services\DteBuilder();
    $builder->setEmisor($empresa);

    // === RECEPTOR ===
    // Aquí reutilizas tu lógica actual para obtener datos del cliente/receptor
    // desde $data['cliente_numero'] o campos del formulario.
    // Ejemplo:
    $cliente = \App\Models\Cliente::where('numero_documento', $data['cliente_numero'])->first();
    if (!$cliente) {
        return redirect()
            ->route('dte.create')
            ->with('error', 'Cliente no encontrado.');
    }
    $builder->setReceptor([
        'nombre' => $cliente->nombre,
        'tipoDocumento' => $cliente->tipo_documento,
        'numDocumento' => $cliente->numero_documento,
        'direccion' => $cliente->direccion,
        'telefono' => $cliente->telefono,
        'correo' => $cliente->correo,
        'nrc' => null // Factura: NRC siempre null
    ], $cliente->numero_documento);

    // === ÍTEMS ===
    $items = array_map(function ($it) {
        return [
            'descripcion' => $it['descripcion'],
            'cantidad'    => (float)$it['cantidad'],
            'precio'      => (float)$it['precio'],
            'montoDescu'  => (float)($it['montoDescu'] ?? 0),
        ];
    }, $data['items']);

    $builder->setItems($items, (float)($data['iva'] ?? 0));

    // Descuento global
    if (!empty($data['descuento_global'])) {
        $builder->setGlobalDiscount((float)$data['descuento_global']);
    }

    // === IDENTIFICACIÓN ===
    // Reutiliza tu bloque actual para setIdentificacion
    $builder->setIdentificacion([
        'version' => '3',
        'ambiente' => config('services.dte.ambiente', '00'),
        'tipoDte' => $data['tipo'],
        'numeroControl' => $this->generarNumeroControl($empresa, $data['tipo']),
        'codigoGeneracion' => $this->generarCodigoGeneracion(),
        'tipoModelo' => '1',
        'tipoOperacion' => '1',
        'tipoContingencia' => null,
        'motivoContin' => null,
        'fecEmi' => now()->format('Y-m-d'),
        'horEmi' => now()->format('H:i:s'),
    ]);

    // === PAGOS ===
    $builder->setPagos($pago['pagos']);

    // === VALIDACIÓN ===
    $validation = $builder->validate();
    if ($validation !== true) {
        return redirect()
            ->route('dte.create')
            ->with('error', 'DTE inválido: ' . implode(', ', $validation));
    }

    // === GUARDAR EN BD ===
    $jsonDte = $builder->build(); // Aquí ya sale con 2 decimales
    try {
        \App\Models\Dte::create([
            'usuario_id'        => auth()->id(),
            'empresa_id'        => $empresa->id,
            'dte_json'          => $jsonDte,
            'respuesta_json'    => null,
            'codigo_generacion' => $jsonDte['identificacion']['codigoGeneracion'] ?? null,
            'estado'            => 'PENDIENTE',
        ]);
    } catch (\Throwable $e) {
        \Log::error('Error creando DTE: ' . $e->getMessage());
        return redirect()
            ->route('dte.create')
            ->with('error', 'Error interno al guardar DTE.');
    }

    // Limpiar sesión
    session()->forget(['dte_draft', 'dte_total']);

    return redirect()
        ->route('dte.index')
        ->with('success', 'DTE preparado con forma de pago.');
}

protected function finalizarCcf(array $data, array $pago): RedirectResponse
{
    $user = auth()->user();
    $empresa = $user->empresa ?? null;

    if (!$empresa) {
        return back()->with('error', 'Empresa emisora no configurada.');
    }

    // === ÍTEMS ===
    // Incluimos descuento por ítem y global
    $data['items'] = array_map(function ($it) {
        return [
            'descripcion' => $it['descripcion'] ?? '',
            'cantidad'    => (float)$it['cantidad'],
            'precio'      => (float)$it['precio'],
            'montoDescu'  => (float)($it['montoDescu'] ?? 0),
        ];
    }, $data['items']);

    $data['descuento_global'] = (float)($data['descuento_global'] ?? 0);

    // === PAGOS ===
    $data['pagos'] = $pago['pagos'];

    // === NRC ===
    // En CCF sí se incluye NRC del receptor si lo tiene
    if (isset($data['receptor']) && is_array($data['receptor'])) {
        $data['receptor']['nrc'] = $data['receptor']['nrc'] ?? '';
    }

    // === CREACIÓN DEL DTE CCF ===
    $ccfService = new \App\Services\CcfService($empresa);

    try {
        // createFromArray debe encargarse de:
        // - setEmisor
        // - setReceptor (con NRC)
        // - setItems (con descuentos)
        // - setGlobalDiscount
        // - setPagos
        // - setIdentificacion
        // - validar y guardar en BD
        $dteModel = $ccfService->createFromArray($data, $user);
    } catch (\Exception $e) {
        \Log::error('Error creando CCF: ' . $e->getMessage());
        return redirect()
            ->route('dte.ccf.create')
            ->with('error', 'Error creando CCF: ' . $e->getMessage());
    }

    // Limpiar sesión
    session()->forget(['dte_draft', 'dte_total']);

    return redirect()
        ->route('dte.index')
        ->with('success', 'CCF preparado con forma de pago (ID: ' . $dteModel->id . ').');
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
