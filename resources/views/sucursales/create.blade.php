<x-app-layout>
  <x-slot name="header">{{ __('Crear Sucursal') }}</x-slot>
  <div class="py-6">
    <div class="max-w-md mx-auto sm:px-6 lg:px-8 bg-white p-6 rounded-lg shadow">
      <form action="{{ route('sucursales.store') }}" method="POST">
        @csrf

        <div class="space-y-4">
          <div>
            <label for="codigo_mh" class="block text-sm font-medium text-gray-700">Código MH</label>
            <input type="text" name="codigo_mh" id="codigo_mh"
                   value="{{ old('codigo_mh') }}"
                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
            @error('codigo_mh')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
          </div>

          <div>
            <label for="descripcion" class="block text-sm font-medium text-gray-700">Descripción *</label>
            <input type="text" name="descripcion" id="descripcion"
                   value="{{ old('descripcion') }}"
                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" required />
            @error('descripcion')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
          </div>

          <div>
            <label for="direccion" class="block text-sm font-medium text-gray-700">Dirección</label>
            <textarea name="direccion" id="direccion"
                      class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">{{ old('direccion') }}</textarea>
            @error('direccion')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
          </div>
        </div>

        <div class="mt-6 flex justify-end">
          <button type="submit"
                  class="px-6 py-2 bg-blue-600 text-blue-500 rounded hover:bg-blue-700">
            Guardar
          </button>
        </div>
      </form>
    </div>
  </div>
</x-app-layout>
