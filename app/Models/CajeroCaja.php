<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class CajeroCaja extends Pivot
{
    protected $table = 'cajero_caja';

    public $incrementing = true;

    protected $fillable = [
        'cajero_id',
        'caja_id',
        'asignado_desde',
        'asignado_hasta',
    ];

    const CREATED_AT = 'asignado_desde';
    const UPDATED_AT = null;
}
