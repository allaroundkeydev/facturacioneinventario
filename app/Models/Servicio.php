<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Servicio extends Model
{
    protected $table = 'servicios';

    protected $fillable = [
        'empresa_id',
        'codigo',
        'descripcion',
        'precio_unitario',
    ];

    public function empresa()
    {
        return $this->belongsTo(Empresa::class,'empresa_id');
    }
}
