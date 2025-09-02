<?php
// routes/web.php

use Illuminate\Support\Facades\Route;

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
use App\Http\Controllers\DTE\EnviarDteController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

// Pública
Route::get('/', fn() => view('welcome'));

// Auth (Jetstream/Breeze)
require __DIR__ . '/auth.php';

// ——————————————————————————————————————————————————————————————————————————————
// 1) Ruta Dashboard global
// ——————————————————————————————————————————————————————————————————————————————
Route::get('/dashboard', fn() => view('dashboard'))
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

// ——————————————————————————————————————————————————————————————————————————————
// 2) Rutas que requieren login y email verificado
// ——————————————————————————————————————————————————————————————————————————————
Route::middleware(['auth', 'verified'])->group(function () {

    // PERFIL
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // EMISIÓN DTE (admin y cajero)
    // Selección de tipo DTE
    Route::get('/dte/tipo', [DashboardController::class, 'selectTipo'])->name('dte.tipo.select');
    Route::post('/dte/tipo', [DashboardController::class, 'handleTipo'])->name('dte.tipo.handle');

    // Listado de DTEs
    Route::get('/dte', [DashboardController::class, 'dteIndex'])->name('dte.index');

    // Formularios de creación
    Route::get('/dte/create', [FacturaController::class, 'create'])->name('dte.create');
    Route::post('/dte', [FacturaController::class, 'store'])->name('dte.store');

    Route::get('/dte/ccf/create', [FacturaController::class, 'createCcf'])->name('dte.ccf.create');

    // Nuevo flujo: preparar → seleccionar pago → confirmar
    Route::post('/dte/preparar', [FacturaController::class, 'preparar'])->name('dte.preparar');
    Route::post('/dte/ccf/preparar', [FacturaController::class, 'prepararCcf'])->name('dte.ccf.preparar');

    Route::get('/dte/pago', [FacturaController::class, 'seleccionarPago'])->name('dte.pago');
    Route::post('/dte/confirmar', [FacturaController::class, 'confirmar'])->name('dte.confirmar');
    Route::post('/dte/ccf/confirmar', [FacturaController::class, 'confirmarCcf'])->name('dte.ccf.confirmar');

    // Clientes
    Route::get('/clientes/buscar', [ClienteController::class, 'buscar'])->name('clientes.buscar');
    Route::post('/clientes', [ClienteController::class, 'store'])->name('clientes.store');

    // Envío de DTEs
    Route::post('/dte/enviar/{dte}', [EnviarDteController::class, 'enviar'])->name('dte.enviar');
    Route::post('/dte/enviar-pendientes', [EnviarDteController::class, 'enviarPendientes'])->name('dte.enviar-pendientes');

    // ————————————————————————————————————————————————————————————————————————
    // 3) Rutas de Administrador (rol `admin`)
    // ————————————————————————————————————————————————————————————————————————
    Route::middleware('admin')->group(function () {
        // CRUD Empresa + Emisor DTE
        Route::get('/empresa', [EmpresaController::class, 'show'])->name('empresa.show');
        Route::get('/empresa/create', [EmpresaController::class, 'create'])->name('empresa.create');
        Route::post('/empresa', [EmpresaController::class, 'store'])->name('empresa.store');
        Route::get('/empresa/edit', [EmpresaController::class, 'edit'])->name('empresa.edit');
        Route::put('/empresa', [EmpresaController::class, 'update'])->name('empresa.update');
        Route::get('/empresa/panel', [EmpresaController::class, 'panel'])->name('empresa.panel');

        Route::get('/empresa/emisor', [EmpresaController::class, 'showEmisor'])->name('empresa.emisor.show');
        Route::post('/empresa/emisor', [EmpresaController::class, 'storeEmisor'])->name('empresa.emisor.store');
        Route::get('/empresa/emisor/edit', [EmpresaController::class, 'editEmisor'])->name('empresa.emisor.edit');
        Route::put('/empresa/emisor', [EmpresaController::class, 'updateEmisor'])->name('empresa.emisor.update');

        // CRUD Sucursales, Cajas, Clientes, Cajeros
        Route::resource('sucursales', SucursalController::class)->except(['show']);
        Route::resource('cajas', CajaController::class)->except(['show']);
        Route::resource('clientes', ClienteController::class)->except(['show']);
        Route::resource('cajeros', CajeroController::class)->except(['show']);

        // Asignaciones cajero↔caja
        Route::post('cajas/{caja}/asignar', [AsignacionController::class, 'store'])->name('cajas.asignar');
        Route::post('cajas/{caja}/desasignar', [AsignacionController::class, 'destroy'])->name('cajas.desasignar');
        Route::post('cajas/{caja}/cerrar', [AsignacionController::class, 'cerrar'])->name('cajas.cerrar');

        // CRUD Asignaciones
        Route::resource('asignaciones', AsignacionController::class)->only(['index', 'create', 'store', 'destroy']);

        // CRUD Productos y Servicios
        Route::resource('productos', ProductoController::class)->except(['show']);
        Route::resource('servicios', ServicioController::class)->except(['show']);
    });

    // ————————————————————————————————————————————————————————————————————————
    // 4) Endpoints auxiliares
    // ————————————————————————————————————————————————————————————————————————
    Route::get('/municipios/{departamento}', [MunicipioController::class, 'getByDepartamento']);
    Route::get('/actividades', [ActividadController::class, 'suggest']);
});