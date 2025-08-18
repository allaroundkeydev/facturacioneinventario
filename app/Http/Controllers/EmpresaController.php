<?php

namespace App\Http\Controllers;

use App\Models\Empresa;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use App\Http\Requests\EmpresaRequest;
use App\Http\Requests\EmisorRequest;

class EmpresaController extends Controller
{
    /**
     * Listado de todas las empresas (solo para administradores globales, si aplica).
     */
    public function index(): View
    {
        $empresas = Empresa::with('user')->paginate(10);
        return view('empresas.index', compact('empresas'));
    }

    /**
     * Mostrar formulario de creación.
     */
    public function create(): View
    {
        $departamentos = \App\Models\Departamento::all();
        $municipios   = \App\Models\Municipio::all();
        return view('empresas.create', compact('departamentos', 'municipios'));
    }

    /**
     * Almacenar nueva empresa asociada al usuario actual.
     */
    public function store(EmpresaRequest $request): RedirectResponse
    {
        // Validamos y creamos la empresa vinculada al user
        auth()->user()
            ->empresa()                  // relación hasOne
            ->create($request->validated());

        return redirect()->route('empresa.panel')
                         ->with('success', 'Empresa registrada');
    }

    /**
     * Mostrar los datos de la empresa del usuario.
     */
    public function show(): View|RedirectResponse
    {
        $empresa = auth()->user()->empresa;
        if (! $empresa) {
            return redirect()->route('empresa.create');
        }
        return view('empresas.show', compact('empresa'));
    }

    /**
     * Formulario de edición de empresa.
     */
    public function edit(): View
    {
        $empresa       = auth()->user()->empresa;
        $departamentos = \App\Models\Departamento::all();
        $municipios    = \App\Models\Municipio::all();
        return view('empresas.edit', compact('empresa', 'departamentos', 'municipios'));
    }

    /**
     * Actualizar datos de la empresa, incluyendo gestiona_stock.
     */
    public function update(EmpresaRequest $request): RedirectResponse
    {
        $empresa = auth()->user()->empresa;

        // Obtenemos los datos validados (incluye 'gestiona_stock')
        $data = $request->validated();

        // Si el checkbox no vino, aseguramos setting en false
        if (! isset($data['gestiona_stock'])) {
            $data['gestiona_stock'] = false;
        }

        $empresa->update($data);

        return redirect()->route('empresa.show')
                         ->with('success', 'Datos de empresa actualizados');
    }

    /**
     * Panel central de la empresa.
     */
    public function panel(): View|RedirectResponse
    {
        $empresa = auth()->user()->empresa;
        if (! $empresa) {
            return redirect()->route('empresa.create');
        }
        return view('empresas.panel', compact('empresa'));
    }

    /**
     * Mostrar formulario para configurar datos de Emisor DTE.
     */
    public function showEmisor(): View|RedirectResponse
    {
        $empresa = auth()->user()->empresa;
        if (! $empresa) {
            return redirect()->route('empresa.create');
        }
        return view('empresas.emisor', compact('empresa'));
    }

    /**
     * Guardar o actualizar los datos de Emisor DTE.
     */
    public function storeEmisor(EmisorRequest $request): RedirectResponse
    {
        $empresa = auth()->user()->empresa;
        $data    = $request->validated();

        // Subida de certificado único (publicKey+privateKey)
        if ($file = $request->file('certificado')) {
            $ext      = $file->getClientOriginalExtension();
            $filename = $empresa->nit . '.' . $ext;
            $path     = $file->storeAs('certificados', $filename);
            $data['crt_path'] = $path;
            $data['key_path'] = $path;
        }

        // Otros campos obligatorios del Emisor
        $data['key_password'] = $request->input('key_password');
        $data['api_user']     = $request->input('api_user');
        $data['api_password'] = $request->input('api_password');

        $empresa->update($data);

        return redirect()->route('empresa.panel')
                         ->with('success', 'Datos de emisor DTE guardados');
    }

    /**
     * Mostrar formulario de edición de Emisor DTE.
     */
    public function editEmisor(): View
    {
        return $this->showEmisor();
    }

    /**
     * Actualizar Emisor DTE (reusa storeEmisor).
     */
    public function updateEmisor(EmisorRequest $request): RedirectResponse
    {
        return $this->storeEmisor($request);
    }
}
