<?php
//routes\web.php
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\EmpresaController;
use App\Http\Controllers\SucursalController;
use App\Http\Controllers\CajaController;
use App\Http\Controllers\DTE\ClienteController;
use App\Http\Controllers\CajeroController;
use App\Http\Controllers\AsignacionController;
use App\Http\Controllers\DTE\DashboardController;
use App\Http\Controllers\DTE\FacturaController;
use App\Http\Controllers\MunicipioController;
use App\Http\Controllers\ActividadController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\ServicioController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

// Pública
Route::get('/', fn() => view('welcome'));

// Auth (Jetstream/Breeze)
require __DIR__.'/auth.php';

// ——————————————————————————————————————————————————————————————————————————————
// 1) Ruta Dashboard global (todos los autenticados la veían antes)
// ——————————————————————————————————————————————————————————————————————————————
Route::get('/dashboard', function(){
    return view('dashboard');
})->middleware(['auth','verified'])
  ->name('dashboard');

// ——————————————————————————————————————————————————————————————————————————————
// 2) Rutas que requieren login y email verificado
// ——————————————————————————————————————————————————————————————————————————————
Route::middleware(['auth','verified'])->group(function(){

    // PERFIL
    Route::get('/profile', [ProfileController::class, 'edit'])
         ->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])
         ->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])
         ->name('profile.destroy');

    // EMISIÓN DTE (admin y cajero)
// Mostrar formulario de selección de tipo DTE
Route::get('/dte/tipo', [App\Http\Controllers\DTE\DashboardController::class, 'selectTipo'])
     ->name('dte.tipo.select')
     ->middleware(['auth','verified']);

// Enviar selección y redirigir al formulario concreto
Route::post('/dte/tipo', [App\Http\Controllers\DTE\DashboardController::class, 'handleTipo'])
     ->name('dte.tipo.handle')
     ->middleware(['auth','verified']);



    Route::get('/dte',        [DashboardController::class,'dteIndex'])
         ->name('dte.index');
// Rutas de FacturaController
         Route::get('/dte/create', [\App\Http\Controllers\DTE\FacturaController::class, 'create'])
     ->name('dte.create')
     ->middleware(['auth','verified']);
Route::post('/dte', [\App\Http\Controllers\DTE\FacturaController::class, 'store'])
     ->name('dte.store')
     ->middleware(['auth','verified']);

     // formulario específico CCF
Route::get('/dte/ccf/create', [\App\Http\Controllers\DTE\FacturaController::class, 'createCcf'])
    ->name('dte.ccf.create')
    ->middleware(['auth','verified']);

    // Formulario CCF (preparar / crear)
Route::get('/dte/ccf/create', [\App\Http\Controllers\DTE\FacturaController::class, 'createCcf'])
    ->name('dte.ccf.create')
    ->middleware(['auth','verified']);

// Guardar CCF (preparar DTE y guardar en BD)
Route::post('/dte/ccf', [\App\Http\Controllers\DTE\FacturaController::class, 'storeCcf'])
    ->name('dte.ccf.store')
    ->middleware(['auth','verified']);


// Ruta para buscar cliente por DUI/NIT (GET) usando query param ?doc=...
    // Ejemplo: /clientes/buscar?doc=04319321-6
    Route::get('/clientes/buscar', [\App\Http\Controllers\DTE\ClienteController::class, 'buscar'])
         ->name('clientes.buscar')
         ->middleware(['auth','verified']);

          // Ruta para crear cliente vía AJAX/form normal (POST).
    // Si la petición es AJAX/JSON, el controlador responde JSON (201 + cliente creado).
    Route::post('/clientes', [\App\Http\Controllers\DTE\ClienteController::class, 'store'])
         ->name('clientes.store')
         ->middleware(['auth','verified']);


// Rutas para enviar DTEs
    Route::post('/dte/enviar/{dte}', [\App\Http\Controllers\DTE\EnviarDteController::class, 'enviar'])
         ->name('dte.enviar')
         ->middleware(['auth','verified']);
    Route::post('/dte/enviar-pendientes', [\App\Http\Controllers\DTE\EnviarDteController::class, 'enviarPendientes'])
         ->name('dte.enviar-pendientes')
         ->middleware(['auth','verified']);


    // ————————————————————————————————————————————————————————————————————————
    // 3) Rutas de Administrador (rol `admin`)
    // ————————————————————————————————————————————————————————————————————————
    Route::middleware('admin')->group(function(){
        // CRUD Empresa + Emisor DTE
        Route::get('/empresa',                 [EmpresaController::class, 'show'])
             ->name('empresa.show');
        Route::get('/empresa/create',          [EmpresaController::class, 'create'])
             ->name('empresa.create');
        Route::post('/empresa',                [EmpresaController::class, 'store'])
             ->name('empresa.store');
        Route::get('/empresa/edit',            [EmpresaController::class, 'edit'])
             ->name('empresa.edit');
        Route::put('/empresa',                 [EmpresaController::class, 'update'])
             ->name('empresa.update');
        Route::get('/empresa/panel',           [EmpresaController::class, 'panel'])
             ->name('empresa.panel');

        Route::get('/empresa/emisor',          [EmpresaController::class, 'showEmisor'])
             ->name('empresa.emisor.show');
        Route::post('/empresa/emisor',         [EmpresaController::class, 'storeEmisor'])
             ->name('empresa.emisor.store');
        Route::get('/empresa/emisor/edit',     [EmpresaController::class, 'editEmisor'])
             ->name('empresa.emisor.edit');
        Route::put('/empresa/emisor',          [EmpresaController::class, 'updateEmisor'])
             ->name('empresa.emisor.update');

        // CRUD Sucursales, Cajas, Clientes, Cajeros
        Route::resource('sucursales', SucursalController::class)
             ->except(['show']);
        Route::resource('cajas',      CajaController::class)
             ->except(['show']);
        Route::resource('clientes', ClienteController::class)
     ->except(['show']);
        Route::resource('cajeros',    CajeroController::class)
             ->except(['show']);

        // Asignaciones cajero↔caja
        Route::post('cajas/{caja}/asignar',    [AsignacionController::class,'store'])
             ->name('cajas.asignar');
        Route::post('cajas/{caja}/desasignar', [AsignacionController::class,'destroy'])
             ->name('cajas.desasignar');

        // CRUD Asignaciones
    Route::resource('asignaciones', AsignacionController::class)
         ->only(['index','create','store','destroy']);

         //CRUD Productos y Servicios

         Route::resource('productos', ProductoController::class)
     ->except(['show']);

Route::resource('servicios', ServicioController::class)
     ->except(['show']);

     Route::post('cajas/{caja}/cerrar', [AsignacionController::class, 'cerrar'])
     ->name('cajas.cerrar');
    });

    // ————————————————————————————————————————————————————————————————————————
    // 4) Endpoints auxiliares
    // ————————————————————————————————————————————————————————————————————————
    Route::get('/municipios/{departamento}', [MunicipioController::class, 'getByDepartamento']);
    Route::get('/actividades',               [ActividadController::class, 'suggest']);

});
