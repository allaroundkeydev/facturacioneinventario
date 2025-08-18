<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cajero extends Model
{
    protected $table = 'cajeros';

    protected $fillable = [
        'user_id',
        'empresa_id',
    ];

    /**
     * Relación al usuario.
     */
    public function user()
    {
        return $this->belongsTo(\App\Models\User::class, 'user_id');
    }

    /**
     * Cajas asignadas (historial).
     */
     public function empresa()
    {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }

    public function cajas()
    {
        return $this->belongsToMany(
            \App\Models\Caja::class,
            'cajero_caja',
            'cajero_id',
            'caja_id'
        )
        ->withPivot(['asignado_desde','asignado_hasta'])
        ->withTimestamps();
    }
}
