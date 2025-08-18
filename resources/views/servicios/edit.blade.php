<x-app-layout>
  <x-slot name="header">{{ __('Editar Servicio') }}</x-slot>
  <div class="py-6">
    <div class="max-w-md mx-auto bg-white p-6 rounded-lg shadow">
      <form action="{{ route('servicios.update', $servicio) }}" method="POST">
        @csrf @method('PUT')

        {{-- Código --}}
        <div>
          <label for="codigo" class="block text-sm font-medium text-gray-700">
            Código
          </label>
          <input type="text"
                 name="codigo"
                 id="codigo"
                 value="{{ old('codigo', $servicio->codigo) }}"
                 class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
          @error('codigo')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
        </div>

        {{-- Descripción --}}
        <div class="mt-4">
          <label for="descripcion" class="block text-sm font-medium text-gray-700">
            Descripción
          </label>
          <input type="text"
                 name="descripcion"
                 id="descripcion"
                 value="{{ old('descripcion', $servicio->descripcion) }}"
                 class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
          @error('descripcion')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
        </div>

        {{-- Precio Unitario --}}
        <div class="mt-4">
          <label for="precio_unitario" class="block text-sm font-medium text-gray-700">
            Precio Unitario
          </label>
          <input type="number"
                 step="0.01"
                 name="precio_unitario"
                 id="precio_unitario"
                 value="{{ old('precio_unitario', $servicio->precio_unitario) }}"
                 class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
          @error('precio_unitario')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
        </div>

        <div class="mt-6 flex justify-end">
          <button type="submit"
                  class="px-6 py-2 bg-green-600 text-white rounded hover:bg-green-700">
            Actualizar
          </button>
        </div>
      </form>
    </div>
  </div>
</x-app-layout>
