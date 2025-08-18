<?php

namespace App\Http\Controllers;

use App\Http\Requests\AsignacionRequest;
use App\Models\Caja;
use App\Models\Cajero;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Illuminate\Support\Facades\DB;

class AsignacionController extends Controller
{
    /** Listar todas las asignaciones */
    public function index(): View
    {
        $empresaId = auth()->user()->empresa->id;

        // Obtenemos todas las parejas cajero↔caja de esta empresa
        $asignaciones = DB::table('cajero_caja AS cc')
            ->join('cajas AS c', 'cc.caja_id', '=', 'c.id')
            ->join('cajeros AS cj', 'cc.cajero_id', '=', 'cj.id')
            ->join('users AS u', 'cj.user_id', '=', 'u.id')
            ->join('sucursales AS s', 'c.sucursal_id', '=', 's.id')
            ->where('cj.empresa_id', $empresaId)
            ->where('s.empresa_id', $empresaId)
            ->select(
                'cc.caja_id','cc.cajero_id',
                'cc.created_at AS asignado_en',
                'u.name AS cajero_nombre',
                'c.codigo_mh','c.descripcion AS caja_descripcion',
                's.descripcion AS sucursal_descripcion'
            )
            ->orderByDesc('cc.created_at')
            ->paginate(10);

        return view('asignaciones.index', compact('asignaciones'));
    }

    /** Mostrar formulario de nueva asignación */
    public function create(): View
    {
        $empresaId = auth()->user()->empresa->id;

        $cajas   = Caja::whereHas('sucursal', fn($q) => 
                     $q->where('empresa_id', $empresaId))
                   ->get();

        $cajeros = Cajero::where('empresa_id', $empresaId)
                   ->with('user')
                   ->get();

        return view('asignaciones.create', compact('cajas','cajeros'));
    }

    /** Guardar asignación */
    public function store(AsignacionRequest $request): RedirectResponse
    {
        $caja   = Caja::findOrFail($request->caja_id);
        $cajero = Cajero::findOrFail($request->cajero_id);

        // Incluimos 'asignado_desde' (ahora mismo); 'asignado_hasta' quedará NULL
    $caja->cajeros()->attach(
        $request->input('cajero_id'),
        ['asignado_desde' => now()]
    );

        $empresaId = auth()->user()->empresa->id;
        abort_unless($caja->sucursal->empresa_id === $empresaId, 403);
        abort_unless($cajero->empresa_id           === $empresaId, 403);

        // Evitar duplicados exactos
        if (! $caja->cajeros()->where('cajero_id', $cajero->id)->exists()) {
            $caja->cajeros()->attach($cajero->id);
        }

        return redirect()
            ->route('asignaciones.index')
            ->with('success','Cajero asignado a caja.');
    }

    /** Eliminar asignación */
    public function destroy(AsignacionRequest $request, Caja $caja): RedirectResponse
    {
        $cajero = Cajero::findOrFail($request->cajero_id);

        $empresaId = auth()->user()->empresa->id;
        abort_unless($caja->sucursal->empresa_id === $empresaId, 403);
        abort_unless($cajero->empresa_id           === $empresaId, 403);

        $caja->cajeros()->detach($cajero->id);

        return redirect()
            ->route('asignaciones.index')
            ->with('success','Asignación eliminada.');
    }

    public function cerrar(Request $request, Caja $caja): RedirectResponse
{
    // Solo admin o el propio cajero que está activo
    $cajeroId = $request->input('cajero_id');
    $asig = $caja->cajeros()
                 ->wherePivot('cajero_id', $cajeroId)
                 ->orderByDesc('pivot_created_at')
                 ->first();

    abort_unless($asig, 404);
    // Asegurarnos que pertenece a la empresa…
    $empresaId = auth()->user()->empresa->id;
    abort_unless($caja->sucursal->empresa_id === $empresaId, 403);
    abort_unless($asig->empresa_id           === $empresaId, 403);

    // Actualizamos la columna pivot:
    $caja->cajeros()
         ->updateExistingPivot(
             $cajeroId,
             ['asignado_hasta' => now()]
         );

    return back()->with('success','Caja cerrada para este cajero.');
}
}
