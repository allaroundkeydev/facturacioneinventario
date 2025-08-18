<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ClienteRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        // Al usar Route Model Binding, $this->cliente contendrá la instancia en update
        $clienteId = $this->cliente->id ?? null;

        return [
            'nit' => [
                'nullable',
                'string',
                'max:14',
                Rule::unique('clientes', 'nit')->ignore($clienteId),
            ],
            'dui' => [
                'nullable',
                'string',
                'max:10',
                Rule::unique('clientes', 'dui')->ignore($clienteId),
            ],
            'nombre' => ['required', 'string', 'max:255'],
            'correo' => ['nullable', 'email', 'max:255'],
            'direccion' => ['nullable', 'string', 'max:500'],
            'telefono' => ['nullable', 'string', 'max:20'],
            'tipo_documento' => ['required', Rule::in(['02','13'])],
            'departamento' => ['required', 'exists:departamentos,codigo'],
            'municipio'    => ['required', 'exists:municipios,codigo'],
        ];
    }

    public function messages(): array
    {
        return [
            'nit.unique'            => 'El NIT ya está registrado.',
            'nit.max'               => 'El NIT no debe exceder 14 caracteres.',
            'dui.unique'            => 'El DUI ya está registrado.',
            'dui.max'               => 'El DUI no debe exceder 10 caracteres.',
            'nombre.required'       => 'El nombre es obligatorio.',
            'nombre.max'            => 'El nombre no debe exceder 255 caracteres.',
            'correo.email'          => 'El correo debe ser una dirección válida.',
            'correo.max'            => 'El correo no debe exceder 255 caracteres.',
            'direccion.max'         => 'La dirección no debe exceder 500 caracteres.',
            'telefono.max'          => 'El teléfono no debe exceder 20 caracteres.',
            'tipo_documento.required' => 'Seleccione el tipo de documento.',
            'tipo_documento.in'       => 'Tipo de documento inválido.',
            'departamento.required' => 'Seleccione un departamento.',
            'departamento.exists'   => 'Departamento inválido.',
            'municipio.required'    => 'Seleccione un municipio.',
            'municipio.exists'      => 'Municipio inválido.',
        ];
    }
}
