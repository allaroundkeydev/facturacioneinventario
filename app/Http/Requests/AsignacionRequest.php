<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AsignacionRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() && auth()->user()->role === 'admin';
    }

    public function rules(): array
    {
        return [
            'caja_id'   => ['required','exists:cajas,id'],
            'cajero_id' => ['required','exists:cajeros,id'],
        ];
    }

    public function messages(): array
    {
        return [
            'caja_id.required'   => 'Debes seleccionar una caja.',
            'caja_id.exists'     => 'Caja no válida.',
            'cajero_id.required' => 'Debes seleccionar un cajero.',
            'cajero_id.exists'   => 'Cajero no válido.',
        ];
    }
}
