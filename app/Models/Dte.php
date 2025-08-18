<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//app\Models\Dte.php
class Dte extends Model
{
    protected $table = 'dtes';

    protected $fillable = [
        'usuario_id',
        'dte_json',
        'respuesta_json',
        'estado',
        'codigo_generacion',
    ];

    protected $casts = [
        'dte_json' => 'array',
        'respuesta_json' => 'array',
    ];
}
