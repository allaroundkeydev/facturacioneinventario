<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password'          => 'hashed',
        ];
    }

    /**
     * Relación a la empresa (si existe).
     */
    public function empresa()
    {
        return $this->hasOne(\App\Models\Empresa::class, 'usuario_id');
    }

    /**
     * Relación a cajero (si existe).
     */
    public function cajero()
    {
        return $this->hasOne(\App\Models\Cajero::class, 'user_id');
    }

    /**
     * Accesor para rol dinámico.
     *
     * @return string 'cajero' o 'admin'
     */
    public function getRoleAttribute(): string
    {
        return $this->cajero()->exists() ? 'cajero' : 'admin';
    }
}
