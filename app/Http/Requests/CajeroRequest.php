<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CajeroRequest extends FormRequest
{
    public function authorize(): bool
    {
        // Solo admins pueden crear/editar cajeros
        return auth()->check() && auth()->user()->role === 'admin';
    }

    public function rules(): array
    {
        $rules = [
            'name'                  => ['required', 'string', 'max:255'],
            'email'                 => ['required', 'email', 'max:255', 'unique:users,email'],
            'password'              => ['required', 'string', 'min:8', 'confirmed'],
        ];

        // Al editar, permitimos que el email propio no choque con unique
        if ($this->isMethod('PUT') || $this->isMethod('PATCH')) {
            $cajero = $this->route('cajero');
            $rules['email'] = [
                'required','email','max:255',
                // exclude the current user's email
                'unique:users,email,'.$cajero->user_id,
            ];
            // Hacer password opcional en edición
            $rules['password'] = ['nullable', 'string', 'min:8', 'confirmed'];
        }

        return $rules;
    }

    public function messages(): array
    {
        return [
            'name.required'     => 'El nombre es obligatorio.',
            'email.required'    => 'El correo es obligatorio.',
            'email.email'       => 'Debes ingresar un correo válido.',
            'email.unique'      => 'Este correo ya está en uso.',
            'password.required' => 'La contraseña es obligatoria.',
            'password.min'      => 'La contraseña debe tener al menos 8 caracteres.',
            'password.confirmed'=> 'La confirmación de contraseña no coincide.',
        ];
    }
}
