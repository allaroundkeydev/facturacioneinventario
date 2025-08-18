<?php

// app/Http/Middleware/EnsureIsAdmin.php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EnsureIsAdmin
{
    public function handle(Request $request, Closure $next)
    {
        // Sólo si NO es cajero
        if (Auth::user()->cajero()->exists()) {
            abort(403, 'No autorizado');
        }
        return $next($request);
    }
}
