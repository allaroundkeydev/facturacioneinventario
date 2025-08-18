<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;

class ClienteController extends Controller
{
    public function index(): View
    {
        $clientes = Cliente::orderBy('nombre')->paginate(15);
        return view('clientes.index', compact('clientes'));
    }

    public function create(): View
    {
        // Si necesitas pasar catálogos (departamentos/municipios) los puedes cargar aquí
        $departamentos = \App\Models\Departamento::all();
        return view('clientes.create', compact('departamentos'));
    }

    public function store(Request $request): RedirectResponse
    {
        $data = $request->validate([
            'nit'         => ['nullable','string','max:20','unique:clientes,nit'],
            'dui'         => ['nullable','string','max:20','unique:clientes,dui'],
            'nombre'      => ['required','string','max:255'],
            'correo'      => ['nullable','email','max:255'],
            'direccion'   => ['nullable','string','max:500'],
            'telefono'    => ['nullable','string','max:30'],
            'tipo_documento' => ['nullable','string','max:5'],
            'departamento'   => ['nullable','exists:departamentos,codigo'],
            'municipio'      => ['nullable','exists:municipios,codigo'],
        ]);

        Cliente::create($data);

        return redirect()->route('clientes.index')->with('success', 'Cliente creado correctamente.');
    }

    public function edit(Cliente $cliente): View
    {
        $departamentos = \App\Models\Departamento::all();
        return view('clientes.edit', compact('cliente', 'departamentos'));
    }

    public function update(Request $request, Cliente $cliente): RedirectResponse
    {
        $data = $request->validate([
            'nit'         => ['nullable','string','max:20','unique:clientes,nit,'.$cliente->id],
            'dui'         => ['nullable','string','max:20','unique:clientes,dui,'.$cliente->id],
            'nombre'      => ['required','string','max:255'],
            'correo'      => ['nullable','email','max:255'],
            'direccion'   => ['nullable','string','max:500'],
            'telefono'    => ['nullable','string','max:30'],
            'tipo_documento' => ['nullable','string','max:5'],
            'departamento'   => ['nullable','exists:departamentos,codigo'],
            'municipio'      => ['nullable','exists:municipios,codigo'],
        ]);

        $cliente->update($data);

        return redirect()->route('clientes.index')->with('success', 'Cliente actualizado correctamente.');
    }

    public function destroy(Cliente $cliente): RedirectResponse
    {
        $cliente->delete();

        return redirect()->route('clientes.index')->with('success', 'Cliente eliminado correctamente.');
    }
}
