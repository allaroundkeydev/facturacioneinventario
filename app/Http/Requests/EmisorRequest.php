<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmisorRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            // Datos de establecimiento (ya no obligatorios en este paso)
            'tipo_establecimiento' => ['nullable', 'exists:tipos_establecimiento,codigo'],
            'cod_estable_mh'       => ['nullable', 'string', 'max:10'],
            'cod_estable_int'      => ['nullable', 'string', 'max:10'],
            'cod_punto_venta_mh'   => ['nullable', 'string', 'max:10'],
            'cod_punto_venta_int'  => ['nullable', 'string', 'max:10'],

            // Único archivo que contiene publicKey + privateKey
           'certificado' => [
            'required',
            'file',
            'max:5120',  // opcional: máximo ~5 MB
            function($attribute, $value, $fail) {
                // tomar extensión del nombre original
                $ext = strtolower($value->getClientOriginalExtension());
                if (! in_array($ext, ['crt','cer','xml','pem'])) {
                    $fail('El archivo debe tener extensión .crt, .cer, .xml o .pem.');
                }
            },
        ],

            // Contraseña que protege la clave privada interna
            'key_password' => ['required', 'string', 'max:100'],

            // Credenciales API Hacienda
            'api_user'     => ['required', 'string', 'max:100'],
            'api_password' => ['required', 'string', 'max:100'],
        ];
    }

    public function messages(): array
    {
        return [
            // Establecimiento
            'tipo_establecimiento.exists'    => 'Tipo de establecimiento inválido.',
            'cod_estable_mh.max'             => 'El código MH no puede exceder 10 caracteres.',
            'cod_estable_int.max'            => 'El código interno no puede exceder 10 caracteres.',
            'cod_punto_venta_mh.max'         => 'El punto de venta MH no puede exceder 10 caracteres.',
            'cod_punto_venta_int.max'        => 'El punto de venta interno no puede exceder 10 caracteres.',

            // Certificado
            'certificado.required'           => 'Debe subir el certificado que contiene su clave pública y privada.',
            'certificado.mimes'              => 'El archivo debe ser .crt, .cer, .xml o .pem.',
            'certificado.mimetypes'          => 'El certificado no tiene un formato válido.',

            // Contraseña privada
            'key_password.required'          => 'La contraseña de la clave privada es obligatoria.',
            'key_password.max'               => 'La contraseña de la clave privada no puede exceder 100 caracteres.',

            // API
            'api_user.required'              => 'El usuario de la API es obligatorio.',
            'api_user.max'                   => 'El usuario de la API no puede exceder 100 caracteres.',
            'api_password.required'          => 'La contraseña de la API es obligatoria.',
            'api_password.max'               => 'La contraseña de la API no puede exceder 100 caracteres.',
        ];
    }
}
