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
     */
    public function store(ClienteRequest $request): RedirectResponse
    {
        Cliente::create($request->validated());

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



    public function buscar(Request $request): JsonResponse
    {
        $doc = trim($request->query('doc', ''));

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
            'id','nit','dui','nombre','correo','direccion','telefono',
            'tipo_documento','departamento','municipio'
        ]);

        return response()->json(['found' => true, 'data' => $data]);
    }

    public function buscarPorDocumento(string $doc): JsonResponse
    {
        $doc = trim($doc);

        // Busca por NIT o DUI exacto
        $cliente = Cliente::where('nit', $doc)
                    ->orWhere('dui', $doc)
                    ->first();

        if (! $cliente) {
            return response()->json(['found' => false], 404);
        }

        // Selecciona solo los campos necesarios para no sobreexponer la entidad
        $data = $cliente->only([
            'id',
            'nit',
            'dui',
            'nombre',
            'correo',
            'direccion',
            'telefono',
            'tipo_documento',
            'departamento',
            'municipio',
            'nrc',
            'cod_actividad',
            'desc_actividad'
        ]);

        return response()->json([
            'found'   => true,
            'cliente' => $data
        ], 200);
    }




}
