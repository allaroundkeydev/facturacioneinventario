<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\UnidadMedida;

class Producto extends Model
{
    protected $table = 'productos';

    protected $fillable = [
        'empresa_id',
        'codigo',
        'descripcion',
        'unidad_medida',
        'precio_unitario',
        'stock',
    ];

    public function empresa()
    {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }

    public function unidadMedida()
    {
        return $this->belongsTo(
            UnidadMedida::class,
            'unidad_medida',   // campo en productos
            'descripcion'      // clave en unidades_medida
        );
    }
}