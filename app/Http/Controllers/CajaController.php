<?php
namespace App\Http\Controllers;

use App\Http\Requests\CajaRequest;
use App\Models\Caja;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class CajaController extends Controller
{
    public function index(): View
    {
        $empresa     = auth()->user()->empresa;
        $sucursalIds = $empresa->sucursales()->pluck('id');
        $cajas       = Caja::whereIn('sucursal_id', $sucursalIds)
                            ->with('sucursal')
                            ->paginate(10);

        return view('cajas.index', compact('cajas'));
    }

    public function create(): View
    {
        $sucursales = auth()->user()->empresa->sucursales;
        return view('cajas.create', compact('sucursales'));
    }

    public function store(CajaRequest $request): RedirectResponse
    {
        $empresa = auth()->user()->empresa;
        if (! $empresa->sucursales->contains('id', $request->sucursal_id)) {
            abort(403, 'Sucursal inválida');
        }

        Caja::create($request->validated() + ['sucursal_id' => $request->sucursal_id]);

        return redirect()->route('cajas.index')
                         ->with('success', 'Caja creada correctamente.');
    }

    public function edit(int $id): View
    {
        $empresa     = auth()->user()->empresa;
        $sucursalIds = $empresa->sucursales()->pluck('id');
        // Buscamos la caja directamente en esas sucursales
        $caja = Caja::whereIn('sucursal_id', $sucursalIds)
                    ->findOrFail($id);

        $sucursales = $empresa->sucursales;
        return view('cajas.edit', compact('caja', 'sucursales'));
    }

    public function update(CajaRequest $request, int $id): RedirectResponse
    {
        $empresa     = auth()->user()->empresa;
        $sucursalIds = $empresa->sucursales()->pluck('id');
        $caja = Caja::whereIn('sucursal_id', $sucursalIds)
                    ->findOrFail($id);

        if (! $empresa->sucursales->contains('id', $request->sucursal_id)) {
            abort(403, 'Sucursal inválida');
        }

        $caja->update($request->validated() + ['sucursal_id' => $request->sucursal_id]);

        return redirect()->route('cajas.index')
                         ->with('success', 'Caja actualizada correctamente.');
    }

    public function destroy(int $id): RedirectResponse
    {
        $empresa     = auth()->user()->empresa;
        $sucursalIds = $empresa->sucursales()->pluck('id');
        $caja = Caja::whereIn('sucursal_id', $sucursalIds)
                    ->findOrFail($id);

        $caja->delete();

        return redirect()->route('cajas.index')
                         ->with('success', 'Caja eliminada correctamente.');
    }
}
