<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sucursal extends Model
{
    // forzamos el nombre correcto de la tabla
    protected $table = 'sucursales';

    protected $fillable = [
        'empresa_id', 'codigo_mh', 'descripcion', 'direccion',
    ];

    /**
     * Relación inversa a Empresa
     */
    public function empresa()
    {
        // campo local: empresa_id
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }
}
