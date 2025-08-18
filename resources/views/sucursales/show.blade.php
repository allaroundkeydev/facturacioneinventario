<x-app-layout>
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
      {{ __('Detalle de Sucursal') }}
    </h2>
  </x-slot>

  <div class="py-6">
    <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
      <div class="bg-white p-6 rounded-lg shadow space-y-4">
        <div><strong>Código MH:</strong> {{ $sucursal->codigo_mh }}</div>
        <div><strong>Descripción:</strong> {{ $sucursal->descripcion }}</div>
        <div><strong>Dirección:</strong> {{ $sucursal->direccion }}</div>

        <div class="mt-4 flex space-x-2">
          <a href="{{ route('sucursales.edit', $sucursal) }}"
             class="px-4 py-2 bg-yellow-500 text-white rounded hover:bg-yellow-600">
            Editar
          </a>
          <form action="{{ route('sucursales.destroy', $sucursal) }}" method="POST">
            @csrf @method('DELETE')
            <button type="submit"
                    onclick="return confirm('¿Eliminar sucursal?')"
                    class="px-4 py-2 bg-red-600 text-white rounded hover:bg-red-700">
              Eliminar
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</x-app-layout>
