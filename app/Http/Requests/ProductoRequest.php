<?php
namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProductoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() && auth()->user()->role === 'admin';
    }

    public function rules(): array
    {
        $empresaId = auth()->user()->empresa->id;

        // regla única por empresa
        $uniqueCodigo = Rule::unique('productos','codigo')
                            ->where(fn($q) => $q->where('empresa_id',$empresaId));

        if ($this->isMethod('PUT')) {
            $producto = $this->route('producto');
            $uniqueCodigo = $uniqueCodigo->ignore($producto->id);
        }

        // reglas base
        $rules = [
            'codigo'          => ['required','string','max:50',$uniqueCodigo],
            'descripcion'     => ['required','string','max:255'],
            'unidad_medida'   => ['required','string','max:10'],
            'precio_unitario' => ['required','numeric','min:0'],
        ];

        // solo si la empresa gestiona stock, validamos stock
        if (auth()->user()->empresa->gestiona_stock) {
            $rules['stock'] = ['required','integer','min:0'];
        }

        return $rules;
    }
}
