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
        $clienteId = $this->route('cliente')?->id ?? null;

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
                'max:12',
                Rule::unique('clientes', 'dui')->ignore($clienteId),
            ],
            'nombre' => ['required', 'string', 'max:255'],
            'correo' => ['nullable', 'email', 'max:255'],
            'complemento' => ['nullable', 'string', 'max:500'],
            'telefono' => ['nullable', 'string', 'max:20'],
            'tipo_documento' => ['required', Rule::in(['02','13'])],
            'departamento' => ['required', 'exists:departamentos,codigo'],
            'municipio'    => ['required', 'exists:municipios,codigo'],

            // Campos para contribuyentes (NIT). Se exigen sólo cuando tipo_documento = 02
            'nrc'            => ['sometimes', 'required_if:tipo_documento,02', 'string', 'max:20'],
            'cod_actividad'  => ['sometimes', 'required_if:tipo_documento,02', 'string', 'max:10'],
            // descripción requerida si se agregó código
            'desc_actividad' => ['sometimes', 'required_with:cod_actividad', 'string', 'max:255'],
        ];
    }

    public function messages(): array
    {
        return [
            'nit.unique'            => 'El NIT ya está registrado.',
            'nit.max'               => 'El NIT no debe exceder 14 caracteres.',
            'dui.unique'            => 'El DUI ya está registrado.',
            'dui.max'               => 'El DUI no debe exceder 12 caracteres.',
            'nombre.required'       => 'El nombre es obligatorio.',
            'nombre.max'            => 'El nombre no debe exceder 255 caracteres.',
            'correo.email'          => 'El correo debe ser una dirección válida.',
            'correo.max'            => 'El correo no debe exceder 255 caracteres.',
            'complemento.max'       => 'La dirección no debe exceder 500 caracteres.',
            'telefono.max'          => 'El teléfono no debe exceder 20 caracteres.',
            'tipo_documento.required' => 'Seleccione el tipo de documento.',
            'tipo_documento.in'       => 'Tipo de documento inválido.',
            'departamento.required' => 'Seleccione un departamento.',
            'departamento.exists'   => 'Departamento inválido.',
            'municipio.required'    => 'Seleccione un municipio.',
            'municipio.exists'      => 'Municipio inválido.',

            // Messages para contribuyente
            'nrc.required_if'           => 'El NRC es obligatorio para contribuyentes (NIT).',
            'cod_actividad.required_if' => 'El código de actividad es obligatorio para contribuyentes (NIT).',
            'desc_actividad.required_with' => 'La descripción de actividad es requerida cuando se indica el código.',
        ];
    }
}
