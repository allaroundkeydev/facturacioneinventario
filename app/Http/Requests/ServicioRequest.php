<?php
namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ServicioRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() && auth()->user()->role === 'admin';
    }

    public function rules(): array
    {
        $empresaId = auth()->user()->empresa->id;

        $uniqueCodigo = Rule::unique('servicios','codigo')
                            ->where(fn($q) => $q->where('empresa_id',$empresaId));

        if ($this->isMethod('PUT')) {
            $servicio = $this->route('servicio');
            $uniqueCodigo = $uniqueCodigo->ignore($servicio->id);
        }

        return [
            'codigo'          => ['required','string','max:50',$uniqueCodigo],
            'descripcion'     => ['required','string','max:255'],
            'precio_unitario' => ['required','numeric','min:0'],
        ];
    }
}
