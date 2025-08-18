<?php

namespace App\Http\Controllers\DTE;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use App\Models\TipoDocumento;
use App\Models\Dte;

class DashboardController extends Controller
{
    public function selectTipo(): View
    {
        $tipos = TipoDocumento::orderBy('codigo')->get();
        return view('dte.select_tipo', compact('tipos'));
    }

    public function handleTipo(Request $request)
    {
        // Validamos únicamente el campo enviado
        $data = $request->validate([
            'tipo' => ['nullable', 'string'],
            'tipo_documento_id' => ['nullable', 'integer'],
        ]);

        $codigo = null;

        if (!empty($data['tipo'])) {
            $t = TipoDocumento::where('codigo', $data['tipo'])->first();
            if (! $t) {
                return back()->withErrors(['tipo' => 'Tipo de documento no válido'])->withInput();
            }
            $codigo = $t->codigo;
        } elseif (!empty($data['tipo_documento_id'])) {
            $t = TipoDocumento::find($data['tipo_documento_id']);
            if (! $t) {
                return back()->withErrors(['tipo_documento_id' => 'Tipo de documento no válido'])->withInput();
            }
            $codigo = $t->codigo;
        } else {
            return back()->withErrors(['tipo' => 'Seleccione un tipo de documento.'])->withInput();
        }

        // Redirigimos a la ruta de creación pasando el código como query param
        return redirect()->route('dte.create', ['tipo' => $codigo]);
    }

    /**
     * Muestra el listado de DTEs
     */
    public function dteIndex()
    {
        $dtes = Dte::orderBy('created_at', 'desc')->paginate(10);
        return view('dte.index', compact('dtes'));
    }
}
