<?php
namespace App\Http\Controllers;

use App\Http\Requests\ServicioRequest;
use App\Models\Servicio;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;

class ServicioController extends Controller
{
    public function index(): View
    {
        $servicios = Servicio::where('empresa_id', auth()->user()->empresa->id)
                              ->paginate(10);
        return view('servicios.index', compact('servicios'));
    }

    public function create(): View
    {
        return view('servicios.create');
    }

    public function store(ServicioRequest $request): RedirectResponse
    {
        $data = $request->validated();
        $data['empresa_id'] = auth()->user()->empresa->id;
        Servicio::create($data);

        return redirect()->route('servicios.index')
                         ->with('success','Servicio creado.');
    }

    public function edit(Servicio $servicio): View
    {
        abort_unless($servicio->empresa_id===auth()->user()->empresa->id,403);
        return view('servicios.edit', compact('servicio'));
    }

    public function update(ServicioRequest $request, Servicio $servicio): RedirectResponse
    {
        abort_unless($servicio->empresa_id===auth()->user()->empresa->id,403);
        $servicio->update($request->validated());

        return redirect()->route('servicios.index')
                         ->with('success','Servicio actualizado.');
    }

    public function destroy(Servicio $servicio): RedirectResponse
    {
        abort_unless($servicio->empresa_id===auth()->user()->empresa->id,403);
        $servicio->delete();

        return redirect()->route('servicios.index')
                         ->with('success','Servicio eliminado.');
    }
}
