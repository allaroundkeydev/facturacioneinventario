<?php

namespace App\Http\Controllers;

use App\Http\Requests\SucursalRequest;
use App\Models\Sucursal;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class SucursalController extends Controller
{
    public function index(): View
    {
        // Obtenemos las sucursales de la empresa del usuario
        $sucursales = auth()->user()
                             ->empresa
                             ->sucursales()
                             ->paginate(10);

        return view('sucursales.index', compact('sucursales'));
    }

    public function create(): View
    {
        return view('sucursales.create');
    }

    public function store(SucursalRequest $request): RedirectResponse
    {
        // Creamos la sucursal asignando empresa_id automáticamente
        auth()->user()
             ->empresa
             ->sucursales()
             ->create($request->validated());

        return redirect()
            ->route('sucursales.index')
            ->with('success', 'Sucursal creada correctamente.');
    }

public function edit($id): View
{
    // Buscamos la sucursal *solo* en esta empresa
    $sucursal = auth()->user()
                      ->empresa
                      ->sucursales()
                      ->findOrFail($id);

    return view('sucursales.edit', compact('sucursal'));
}

public function update(SucursalRequest $request, $id): RedirectResponse
{
    $sucursal = auth()->user()
                      ->empresa
                      ->sucursales()
                      ->findOrFail($id);

    $sucursal->update($request->validated());

    return redirect()
        ->route('sucursales.index')
        ->with('success', 'Sucursal actualizada correctamente.');
}

public function destroy($id): RedirectResponse
{
    $sucursal = auth()->user()
                      ->empresa
                      ->sucursales()
                      ->findOrFail($id);

    $sucursal->delete();

    return redirect()
        ->route('sucursales.index')
        ->with('success', 'Sucursal eliminada correctamente.');
}


    private function authorizeSucursal(Sucursal $sucursal): void
    {
        // Solo permite acciones sobre sucursales de la empresa actual
        if ($sucursal->empresa_id !== auth()->user()->empresa->id) {
            abort(403, 'No autorizado');
        }
    }
}
