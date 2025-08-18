<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CajaRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            // No validamos sucursal_id porque lo asignamos / filtramos en el controller
            'codigo_mh'   => ['nullable', 'string', 'max:10'],
            'descripcion' => ['required', 'string', 'max:255'],
        ];
    }

    public function messages(): array
    {
        return [
            'codigo_mh.required' => 'El código MH es obligatorio.',
            'codigo_mh.max'      => 'El código MH no puede exceder 10 caracteres.',
        ];
    }
}
