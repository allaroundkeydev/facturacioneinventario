<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoEstablecimiento extends Model
{
    protected $table = 'tipos_establecimiento';
    protected $primaryKey = 'codigo';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;
}