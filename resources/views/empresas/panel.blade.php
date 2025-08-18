<x-app-layout>
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
      {{ __('Panel de Empresa') }}
    </h2>
  </x-slot>

  <div class="py-12 space-y-6">
    <div class="max-w-3xl mx-auto sm:px-6 lg:px-8 grid grid-cols-1 md:grid-cols-3 gap-6">

      <!-- Editar Empresa -->
      <a href="{{ route('empresa.edit') }}"
         class="p-6 bg-white rounded-2xl shadow hover:shadow-lg transition flex flex-col items-center">
        <span class="text-3xl">✏️</span>
        <h3 class="mt-2 text-lg font-medium text-gray-900">Editar Empresa</h3>
      </a>

      <!-- Sucursales -->
      <a href="{{ route('sucursales.index') }}"
         class="p-6 bg-white rounded-2xl shadow hover:shadow-lg transition flex flex-col items-center">
        <span class="text-3xl">📍</span>
        <h3 class="mt-2 text-lg font-medium text-gray-900">Sucursales</h3>
      </a>

      <!-- Cajas -->
      <a href="{{ route('cajas.index') }}"
         class="p-6 bg-white rounded-2xl shadow hover:shadow-lg transition flex flex-col items-center">
        <span class="text-3xl">🗄️</span>
        <h3 class="mt-2 text-lg font-medium text-gray-900">Cajas</h3>
      </a>

      <!-- Cajeros -->
      <a href="{{ route('cajeros.index') }}"
         class="p-6 bg-white rounded-2xl shadow hover:shadow-lg transition flex flex-col items-center">
        <span class="text-3xl">👥</span>
        <h3 class="mt-2 text-lg font-medium text-gray-900">Cajeros</h3>
      </a>

      <!-- Emisor DTE -->
      <a href="{{ route(auth()->user()->empresa->tipo_establecimiento
                ? 'empresa.emisor.edit'
                : 'empresa.emisor.show') }}"
         class="p-6 bg-white rounded-2xl shadow hover:shadow-lg transition flex flex-col items-center">
        <span class="text-3xl">🖋️</span>
        <h3 class="mt-2 text-lg font-medium text-gray-900">
          {{ auth()->user()->empresa->tipo_establecimiento
               ? 'Editar Emisor DTE'
               : 'Configurar Emisor DTE' }}
        </h3>
      </a>

      <!-- Clientes -->
      <!-- Clientes -->
      @if(Route::has('clientes.index'))
      <a href="{{ route('clientes.index') }}"
         class="p-6 bg-white rounded-2xl shadow hover:shadow-lg transition flex flex-col items-center">
        <span class="text-3xl">👤</span>
        <h3 class="mt-2 text-lg font-medium text-gray-900">Clientes</h3>
      </a>
      @endif

      <!-- Productos -->
      <a href="{{ route('productos.index') }}"
         class="p-6 bg-white rounded-2xl shadow hover:shadow-lg transition flex flex-col items-center">
        <span class="text-3xl">📦</span>
        <h3 class="mt-2 text-lg font-medium text-gray-900">Productos</h3>
      </a>

      <!-- Servicios -->
      <a href="{{ route('servicios.index') }}"
         class="p-6 bg-white rounded-2xl shadow hover:shadow-lg transition flex flex-col items-center">
        <span class="text-3xl">🛠️</span>
        <h3 class="mt-2 text-lg font-medium text-gray-900">Servicios</h3>
      </a>

      <!-- Emitir DTE -->
      <a href="{{ route('dte.tipo.select') }}"
         class="p-6 bg-white rounded-2xl shadow hover:shadow-lg transition flex flex-col items-center">
        <span class="text-3xl">🧾</span>
        <h3 class="mt-2 text-lg font-medium text-gray-900">Emitir DTE</h3>
      </a>

      <!-- Asignaciones de Cajeros a Cajas -->
      <a href="{{ route('asignaciones.index') }}"
         class="p-6 bg-white rounded-2xl shadow hover:shadow-lg transition flex flex-col items-center">
        <span class="text-3xl">🔄</span>
        <h3 class="mt-2 text-lg font-medium text-gray-900">
          Asignar Cajeros a Cajas
        </h3>
      </a>

    </div>
  </div>
</x-app-layout>
