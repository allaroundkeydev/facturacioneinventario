<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SucursalRequest extends FormRequest
{
    public function authorize(): bool
    {
        // Solo usuarios autenticados
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            // No validamos empresa_id porque se asigna desde el controller
            'codigo_mh'   => ['nullable', 'string', 'max:10'],
            'descripcion' => ['required', 'string', 'max:255'],
            'direccion'   => ['nullable', 'string'],
        ];
    }

    public function messages(): array
    {
        return [
            'descripcion.required' => 'La descripción es obligatoria.',
            'descripcion.max'      => 'La descripción no puede exceder 255 caracteres.',
        ];
    }
}
