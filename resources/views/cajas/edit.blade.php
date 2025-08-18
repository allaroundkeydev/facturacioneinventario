<x-app-layout>
  <x-slot name="header">{{ __('Editar Caja') }}</x-slot>
  <div class="py-6">
    <div class="max-w-md mx-auto sm:px-6 lg:px-8 bg-white p-6 rounded-lg shadow">
      <form action="{{ route('cajas.update', $caja) }}" method="POST">
        @csrf @method('PUT')

        <div class="space-y-4">
          <div>
            <label for="sucursal_id" class="block text-sm font-medium text-gray-700">Sucursal *</label>
            <select name="sucursal_id" id="sucursal_id"
                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" required>
              <option value="">Seleccione</option>
              @foreach(auth()->user()->empresa->sucursales as $s)
                <option value="{{ $s->id }}"
                  {{ old('sucursal_id', $caja->sucursal_id) == $s->id ? 'selected' : '' }}>
                  {{ $s->descripcion }}
                </option>
              @endforeach
            </select>
          </div>

          <div>
            <label for="codigo_mh" class="block text-sm font-medium text-gray-700">Código MH *</label>
            <input type="text" name="codigo_mh" id="codigo_mh"
                   value="{{ old('codigo_mh', $caja->codigo_mh) }}"
                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring"  />
            @error('codigo_mh')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
          </div>

          <div>
            <label for="descripcion" class="block text-sm font-medium text-gray-700">Descripción</label>
            <input type="text" name="descripcion" id="descripcion"
                   value="{{ old('descripcion', $caja->descripcion) }}"
                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" required />
          </div>
        </div>

        <div class="mt-6 flex justify-end">
          <button type="submit"
                  class="px-6 py-2 bg-green-600 text-blue-200 rounded hover:bg-green-700">
            Actualizar
          </button>
        </div>
      </form>
    </div>
  </div>
</x-app-layout>
