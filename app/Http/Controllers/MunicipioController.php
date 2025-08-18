<?php
namespace App\Http\Controllers;

use App\Models\Municipio;
use Illuminate\Http\JsonResponse;

class MunicipioController extends Controller
{
    /**
     * Devuelve JSON de municipios para un departamento dado.
     */
    public function getByDepartamento(string $departamento): JsonResponse
    {
        // Busca municipios por departamento_id y ordénalos por nombre
        $municipios = Municipio::where('departamento_id', $departamento)
                        ->orderBy('nombre')
                        ->get(['codigo', 'nombre']);

        return response()->json($municipios);
    }
}
