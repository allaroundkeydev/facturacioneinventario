<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Caja extends Model
{
    protected $table = 'cajas';
    
    protected $fillable = [
        'sucursal_id', 'codigo_mh', 'descripcion'
    ];

    public function sucursal()
    {
        return $this->belongsTo(Sucursal::class);
    }

    public function dtes()
    {
        return $this->hasMany(Dte::class);
    }

    public function cajeros()
{
    return $this->belongsToMany(
        \App\Models\Cajero::class,
        'cajero_caja',
        'caja_id',
        'cajero_id'
    )
    ->withPivot(['asignado_desde','asignado_hasta'])
    ->withTimestamps();
}


}