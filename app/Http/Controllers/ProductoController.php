<?php
namespace App\Http\Controllers;

use App\Http\Requests\ProductoRequest;
use App\Models\Producto;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;

class ProductoController extends Controller
{
    public function index(): View
    {
        $productos = Producto::where('empresa_id', auth()->user()->empresa->id)
                              ->paginate(10);
        return view('productos.index', compact('productos'));
    }

    public function create(): View
    {
        return view('productos.create');
    }

    public function store(ProductoRequest $request): RedirectResponse
    {
        $data = $request->validated();
        $data['empresa_id'] = auth()->user()->empresa->id;
        Producto::create($data);

        return redirect()->route('productos.index')
                         ->with('success','Producto creado.');
    }

    public function edit(Producto $producto): View
    {
        abort_unless($producto->empresa_id===auth()->user()->empresa->id,403);
        return view('productos.edit', compact('producto'));
    }

    public function update(ProductoRequest $request, Producto $producto): RedirectResponse
    {
        abort_unless($producto->empresa_id===auth()->user()->empresa->id,403);
        $producto->update($request->validated());

        return redirect()->route('productos.index')
                         ->with('success','Producto actualizado.');
    }

    public function destroy(Producto $producto): RedirectResponse
    {
        abort_unless($producto->empresa_id===auth()->user()->empresa->id,403);
        $producto->delete();

        return redirect()->route('productos.index')
                         ->with('success','Producto eliminado.');
    }
}
