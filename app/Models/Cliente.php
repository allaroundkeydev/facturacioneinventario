<?php
//app\Models\Cliente.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    protected $table = 'clientes';
    
    protected $fillable = [
        'nit', 'dui', 'nombre', 'correo', 'complemento',
        'telefono', 'tipo_documento', 'departamento', 'municipio',  // nuevos campos DTE
        'nrc', 'cod_actividad','desc_actividad',
    ];

    public function getTipoDocumentoAttribute()
    {
        return $this->nit ? '02' : '13';
    }

    public function getNumeroDocumentoAttribute()
    {
        return $this->nit ?? $this->dui;
    }

    public function dtes()
    {
        return $this->hasMany(Dte::class);
    }
}