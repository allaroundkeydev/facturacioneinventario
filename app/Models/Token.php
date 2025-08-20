<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Token extends Model
{
    use HasFactory;

    // 🔹 CRÍTICO: Configurar correctamente la clave primaria
    protected $table = 'tokens';
    protected $primaryKey = 'empresa_id';
    public $incrementing = false;
    protected $keyType = 'int';

    protected $fillable = [
        'empresa_id',
        'token',
        'expire_at',
    ];

    protected $casts = [
        'expire_at' => 'datetime',
    ];

    public function empresa(): BelongsTo
    {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }
}