<x-app-layout>
  <x-slot name="header">{{ __('Nueva Asignación') }}</x-slot>
  <div class="py-6">
    <div class="max-w-md mx-auto bg-white p-6 rounded-lg shadow">
      <form action="{{ route('asignaciones.store') }}" method="POST">
        @csrf

        <div>
          <label for="caja_id" class="block text-sm font-medium text-gray-700">
            Caja
          </label>
          <select name="caja_id" id="caja_id" required
                  class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
            <option value="">Selecciona una caja</option>
            @foreach($cajas as $c)
              <option value="{{ $c->id }}" {{ old('caja_id')==$c->id?'selected':'' }}>
                {{ $c->codigo_mh }} – {{ $c->descripcion }}
              </option>
            @endforeach
          </select>
          @error('caja_id')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
        </div>

        <div class="mt-4">
          <label for="cajero_id" class="block text-sm font-medium text-gray-700">
            Cajero
          </label>
          <select name="cajero_id" id="cajero_id" required
                  class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
            <option value="">Selecciona un cajero</option>
            @foreach($cajeros as $cj)
              <option value="{{ $cj->id }}" {{ old('cajero_id')==$cj->id?'selected':'' }}>
                {{ $cj->user->name }}
              </option>
            @endforeach
          </select>
          @error('cajero_id')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
        </div>

        <div class="mt-6 flex justify-end">
          <button type="submit"
                  class="px-6 py-2 bg-blue-600 text-gray-400 rounded hover:bg-blue-700">
            Asignar
          </button>
        </div>
      </form>
    </div>
  </div>
</x-app-layout>
