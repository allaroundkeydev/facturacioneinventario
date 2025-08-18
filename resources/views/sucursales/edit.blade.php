<x-app-layout>
  <x-slot name="header">{{ __('Editar Sucursal') }}</x-slot>
  <div class="py-6">
    <div class="max-w-md mx-auto sm:px-6 lg:px-8 bg-white p-6 rounded-lg shadow">
      <form action="{{ route('sucursales.update', $sucursal) }}" method="POST">
        @csrf @method('PUT')

        <div class="space-y-4">
          <div>
            <label for="codigo_mh" class="block text-sm font-medium text-gray-700">Código MH</label>
            <input type="text" name="codigo_mh" id="codigo_mh"
                   value="{{ old('codigo_mh', $sucursal->codigo_mh) }}"
                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
          </div>

          <div>
            <label for="descripcion" class="block text-sm font-medium text-gray-700">Descripción *</label>
            <input type="text" name="descripcion" id="descripcion"
                   value="{{ old('descripcion', $sucursal->descripcion) }}"
                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" required />
            @error('descripcion')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
          </div>

          <div>
            <label for="direccion" class="block text-sm font-medium text-gray-700">Dirección</label>
            <textarea name="direccion" id="direccion"
                      class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">{{ old('direccion', $sucursal->direccion) }}</textarea>
          </div>
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
