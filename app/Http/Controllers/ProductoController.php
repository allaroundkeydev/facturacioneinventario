<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;          
use Illuminate\Support\Facades\Auth;
use App\Models\Producto;
use App\Http\Requests\ProductoRequest;
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

/**
     * Devuelve hasta 10 productos por código o descripción
     * Filtra por empresa y deshabilita los sin stock si aplica.
     */
        /**
     * Autocomplete de productos por código o descripción,
     * filtrado por la única empresa del usuario.
     */
    public function autocomplete(Request $request)
    {
        // término de búsqueda
        $q = $request->query('query', '');

        // id de la empresa (hasOne)
        $empresaId = Auth::user()->empresa->id;

        $productos = Producto::with('unidadMedida')
            // 1. filtro por empresa
            ->where('empresa_id', $empresaId)
            // 2. término en código o descripción
            ->where(function($qb) use ($q) {
                $qb->where('codigo', 'like', "%{$q}%")
                   ->orWhere('descripcion', 'like', "%{$q}%");
            })
            ->limit(10)
            ->get()
            // 3. mapeo al JSON que el frontend espera
            ->map(function($p) {
    return [
        'id'             => $p->id,
        'codigo'         => $p->codigo,
        'descripcion'    => $p->descripcion,
        // castear a float aquí
        'precio'         => (float) $p->precio_unitario,
        'unidad_codigo'  => $p->unidadMedida->codigo ?? null,
        'stock'          => $p->stock,
        'disabled'       => (Auth::user()->empresa->gestiona_stock ?? false)
                             && ($p->stock <= 0),
    ];
});


        return response()->json($productos);
    }




}
