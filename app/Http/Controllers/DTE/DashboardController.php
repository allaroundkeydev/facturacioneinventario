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

    /**
     * Maneja la selección de tipo de DTE.
     * Redirige a formulario específico para CCF (03) o al formulario genérico de creación.
     *
     * @param Request $request
     * @return RedirectResponse
     */
    public function handleTipo(Request $request): RedirectResponse
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

        // Si es CCF (03) ir al formulario específico de CCF
        if ($codigo === '03') {
            return redirect()->route('dte.ccf.create', ['tipo' => $codigo]);
        }

        // En otros casos redirigimos a la creación genérica (puedes usar create que ya tengas)
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
