<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class EmpresaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        // Solo usuarios autenticados pueden crear o editar su Empresa
        return auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     */
    public function rules(): array
    {
        // Identificar si es actualización o creación
        $empresaId = auth()->user()->empresa->id ?? null;

        return [
            'nit'             => [
                'required',
                'string',
                'max:17',
                Rule::unique('empresas', 'nit')->ignore($empresaId),
            ],
            'nrc'             => ['required', 'string', 'max:12'],
            'razon_social'    => ['required', 'string', 'max:255'],
            'direccion'       => ['required', 'string', 'max:255'],
            'telefono'        => ['required', 'regex:/^[0-9]{8,10}$/'],
            'correo'          => ['required', 'email', 'max:255'],
            'departamento'    => ['required', 'exists:departamentos,codigo'],
            'municipio'       => ['required', 'exists:municipios,codigo'],
            'cod_actividad'   => [
                'required',
                'string',
                'max:10',
                'exists:actividad_economica,codigo'
            ],

            // Gestión de inventario (checkbox)
            'gestiona_stock'  => ['nullable', 'boolean'],
        ];
    }

    /**
     * Custom messages for validation errors.
     */
    public function messages(): array
    {
        return [
            'nit.required'           => 'El NIT es obligatorio.',
            'nit.unique'             => 'El NIT ya está registrado.',
            'nrc.required'           => 'El NRC es obligatorio.',
            'direccion.required'     => 'La dirección es obligatoria.',
            'telefono.required'      => 'El teléfono es obligatorio.',
            'telefono.regex'         => 'El teléfono debe contener entre 8 y 10 dígitos.',
            'correo.required'        => 'El correo es obligatorio.',
            'correo.email'           => 'El correo debe ser una dirección válida.',
            'departamento.required'  => 'Seleccione un departamento.',
            'departamento.exists'    => 'Seleccione un departamento válido.',
            'municipio.required'     => 'Seleccione un municipio.',
            'municipio.exists'       => 'Seleccione un municipio válido.',
            'cod_actividad.required' => 'El código de actividad es obligatorio.',
            'cod_actividad.exists'   => 'Seleccione un código de actividad válido.',
            'gestiona_stock.boolean' => 'El valor de gestión de stock no es válido.',
        ];
    }
}
