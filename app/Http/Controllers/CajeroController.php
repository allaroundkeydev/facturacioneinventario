<?php

namespace App\Http\Controllers;

use App\Http\Requests\CajeroRequest;
use App\Models\Cajero;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Illuminate\Support\Facades\Hash;

class CajeroController extends Controller
{
    public function index(): View
    {
        // Solo cajeros de la empresa actual
        $empresaId = auth()->user()->empresa->id;
        $cajeros = Cajero::with('user')
                         ->where('empresa_id', $empresaId)
                         ->paginate(10);

        return view('cajeros.index', compact('cajeros'));
    }

    public function create(): View
    {
        return view('cajeros.create');
    }

    public function store(CajeroRequest $request): RedirectResponse
    {
        // 1) Crear el usuario del cajero
        $user = User::create([
            'name'     => $request->input('name'),
            'email'    => $request->input('email'),
            'password' => Hash::make($request->input('password')),
        ]);

        // 2) Crear el cajero ligado a la empresa del admin
        Cajero::create([
            'user_id'    => $user->id,
            'empresa_id' => auth()->user()->empresa->id,
        ]);

        return redirect()
            ->route('cajeros.index')
            ->with('success', 'Cajero creado correctamente.');
    }

    public function edit(Cajero $cajero): View
    {
        // Asegurar que pertenece a la empresa
        abort_unless($cajero->empresa_id === auth()->user()->empresa->id, 403);

        return view('cajeros.edit', compact('cajero'));
    }

    public function update(CajeroRequest $request, Cajero $cajero): RedirectResponse
    {
        abort_unless($cajero->empresa_id === auth()->user()->empresa->id, 403);

        $data = $request->validated();

        // Actualizar datos de usuario
        $userData = [
            'name'  => $data['name'],
            'email' => $data['email'],
        ];
        if (! empty($data['password'])) {
            $userData['password'] = Hash::make($data['password']);
        }
        $cajero->user()->update($userData);

        return redirect()
            ->route('cajeros.index')
            ->with('success', 'Cajero actualizado correctamente.');
    }

    public function destroy(Cajero $cajero): RedirectResponse
    {
        abort_unless($cajero->empresa_id === auth()->user()->empresa->id, 403);

        // Eliminar primero el registro de cajero y luego el User
        $user = $cajero->user;
        $cajero->delete();
        $user->delete();

        return redirect()
            ->route('cajeros.index')
            ->with('success', 'Cajero eliminado correctamente.');
    }
}
