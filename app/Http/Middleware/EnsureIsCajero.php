<?php

// app/Http/Middleware/EnsureIsCajero.php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EnsureIsCajero
{
    public function handle(Request $request, Closure $next)
    {
        // Si no está en cajeros, aborta
        if (! Auth::user()->cajero()->exists()) {
            abort(403, 'No autorizado');
        }
        return $next($request);
    }
}
