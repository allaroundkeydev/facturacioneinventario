<?php

namespace App\Http\Controllers;

use App\Models\ActividadEconomica;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ActividadController extends Controller
{
    public function suggest(Request $request): JsonResponse
    {
        $q = $request->query('q', '');

        $actividades = ActividadEconomica::where('seleccionable', 1)
            ->where('descripcion', 'LIKE', "%{$q}%")
            ->orderBy('descripcion')
            ->limit(10)
            ->get(['codigo', 'descripcion']);

        return response()->json($actividades);
    }
}
