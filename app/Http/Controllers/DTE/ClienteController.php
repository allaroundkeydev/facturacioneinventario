<?php

namespace App\Http\Controllers\DTE;

use App\Http\Controllers\Controller;
use App\Http\Requests\ClienteRequest;
use App\Models\Cliente;
use App\Models\Departamento;
use App\Models\Municipio;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Http\JsonResponse;

class ClienteController extends Controller
{
    /**
     * Muestra un listado paginado de clientes.
     */
    public function index(Request $request): View
    {
        $clientes = Cliente::orderBy('nombre')
            ->paginate(10)
            ->withQueryString();

        return view('dte.clientes.index', compact('clientes'));
    }

    /**
     * Muestra el formulario para crear un nuevo cliente.
     */
    public function create(): View
    {
        $departamentos = Departamento::all();
        // inicialmente vacío, se cargan municipios vía JS al seleccionar departamento
        $municipios = collect();

        return view('dte.clientes.create', compact('departamentos', 'municipios'));
    }

    /**
     * Almacena el cliente nuevo.
     * Si la petición es AJAX / espera JSON, devuelve JSON con el cliente creado (201).
     * Si es petición web normal, redirige a la lista.
     */
    public function store(ClienteRequest $request)
    {
        // Los datos validados
        $data = $request->validated();

        $cliente = Cliente::create($data);

        // Si se espera JSON (AJAX/front fetch), devolver el cliente creado con 201
        if ($request->wantsJson() || $request->ajax() || $request->header('Accept') === 'application/json') {
            // Seleccionar solo campos seguros/útiles para el frontend
            $out = $cliente->only([
                'id',
                'nit', 'dui', 'nombre', 'correo', 'complemento', 'telefono',
                'tipo_documento', 'departamento', 'municipio', 'nrc',
                'cod_actividad', 'desc_actividad'
            ]);
            return response()->json($out, 201);
        }

        // Petición normal: redirigir
        return redirect()
            ->route('clientes.index')
            ->with('success', 'Cliente creado correctamente.');
    }

    /**
     * Muestra el formulario para editar un cliente existente.
     */
    public function edit(Cliente $cliente): View
    {
        $departamentos = Departamento::all();
        // Obtener municipios del departamento actual del cliente
        $municipios = Municipio::where('departamento_id', $cliente->departamento)->get();

        return view('dte.clientes.edit', compact('cliente', 'departamentos', 'municipios'));
    }

    /**
     * Actualiza los datos del cliente.
     */
    public function update(ClienteRequest $request, Cliente $cliente): RedirectResponse
    {
        $cliente->update($request->validated());

        return redirect()
            ->route('clientes.index')
            ->with('success', 'Cliente actualizado correctamente.');
    }

    /**
     * Elimina un cliente.
     */
    public function destroy(Cliente $cliente): RedirectResponse
    {
        $cliente->delete();

        return redirect()
            ->route('clientes.index')
            ->with('success', 'Cliente eliminado correctamente.');
    }

    /**
     * Buscar cliente por query param 'doc' (DUI o NIT).
     * Responde JSON con la forma:
     *  - 200 => { found: true, cliente: { ... } }
     *  - 404 => { found: false } (o 404 status)
     *  - 400 => { found: false, message: 'No se indicó documento' }
     */
    public function buscar(Request $request): JsonResponse
    {
        $doc = trim((string) $request->query('doc', ''));

        if ($doc === '') {
            return response()->json(['found' => false, 'message' => 'No se indicó documento'], 400);
        }

        $cliente = Cliente::where('nit', $doc)
                          ->orWhere('dui', $doc)
                          ->first();

        if (! $cliente) {
            return response()->json(['found' => false], 404);
        }

        // Seleccionamos solo los campos que necesitamos en el formulario
        $data = $cliente->only([
            'id',
            'nit',
            'dui',
            'nombre',
            'correo',
            'complemento',
            'telefono',
            'tipo_documento',
            'departamento',
            'municipio',
            'nrc',
            'cod_actividad',
            'desc_actividad'
        ]);

        return response()->json(['found' => true, 'cliente' => $data], 200);
    }


    public function buscarPorNombre(Request $request)
{
    $term = $request->query('name');

    $clientes = Cliente::where('nombre', 'like', "%{$term}%")
        ->limit(10)
        ->select([
            'dui',
            'nit',
            'nombre',
            'telefono',
            'correo',
            'complemento as direccion',  // aliasamos complemento
            'departamento',
            'municipio',
            'nrc',
            'cod_actividad',
            'desc_actividad',
        ])
        ->get();

    return response()->json($clientes);
}

    /**
     * Alternativa: búsqueda por ruta con parámetro (opcional)
     * Si tienes una ruta como /clientes/buscar/{doc} puedes mapearla a este método.
     */
    public function buscarPorDocumento(string $doc): JsonResponse
    {
        $doc = trim($doc);

        $cliente = Cliente::where('nit', $doc)
                    ->orWhere('dui', $doc)
                    ->first();

        if (! $cliente) {
            return response()->json(['found' => false], 404);
        }

        $data = $cliente->only([
            'id',
            'nit',
            'dui',
            'nombre',
            'correo',
            'complemento',
            'telefono',
            'tipo_documento',
            'departamento',
            'municipio',
            'nrc',
            'cod_actividad',
            'desc_actividad'
        ]);

        return response()->json(['found' => true, 'cliente' => $data], 200);
    }
}
