<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;

class ActividadController extends Controller
{
    /**
     * GET /actividades?q=...
     * Devuelve array JSON de objetos { codigo, descripcion }.
     */
    public function suggest(Request $request)
    {
        $q = trim((string) $request->query('q', ''));

        $items = DB::table('actividad_economica')
            ->select('codigo', 'descripcion')
            ->when($q !== '', function ($query) use ($q) {
                $like = '%' . $q . '%';
                $query->where(function ($q2) use ($like) {
                    $q2->where('codigo', 'like', $like)
                       ->orWhere('descripcion', 'like', $like);
                });
            })
            ->where(function($query) {
                // Si tienes columna 'seleccionable' opcional, filtra solo los seleccionables
                if (\Schema::hasColumn('actividad_economica', 'seleccionable')) {
                    $query->where('seleccionable', 1);
                }
            })
            ->orderBy('codigo')
            ->limit(30)
            ->get();

        return response()->json($items);
    }
}
