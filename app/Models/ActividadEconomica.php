<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActividadEconomica extends Model
{
    protected $table = 'actividad_economica';  // nombre real de tu tabla
    protected $fillable = ['codigo', 'descripcion', 'seleccionable'];
}
