<?php

use App\Http\Middleware\EnsureIsAdmin;
use App\Http\Middleware\EnsureIsCajero;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
->withMiddleware(function (Middleware $middleware): void {
    $middleware->alias([
        'admin'  => \App\Http\Middleware\EnsureIsAdmin::class,
        'cajero' => \App\Http\Middleware\EnsureIsCajero::class,
    ]);
})
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();
