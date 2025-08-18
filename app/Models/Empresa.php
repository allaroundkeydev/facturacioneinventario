<?php
//app\Models\Empresa.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Empresa extends Model
{
    protected $table = 'empresas';
    
    protected $fillable = [
    'usuario_id', 'nit', 'dui', 'razon_social', 'nrc', 'direccion',
    'telefono', 'correo', 'cod_actividad', 'desc_actividad',
    'nombre_comercial', 'tipo_establecimiento', 'departamento',
    'municipio', 'cod_estable_mh', 'cod_estable_int',
    'cod_punto_venta_mh', 'cod_punto_venta_int',
    'crt_path', 'key_path', 'key_password',
    'api_user', 'api_password','gestiona_stock',
];

public function user()
{
    return $this->belongsTo(\App\Models\User::class, 'usuario_id');
}


    public function sucursales()
    {
        return $this->hasMany(Sucursal::class, 'empresa_id');
    }

    public function dtes()
    {
        return $this->hasMany(Dte::class, 'usuario_id');
    }

    public function cajeros()
{
    return $this->hasMany(Cajero::class, 'empresa_id');
}

public function productos()
{
    return $this->hasMany(Producto::class,'empresa_id');
}

public function servicios()
{
    return $this->hasMany(Servicio::class,'empresa_id');
}



}