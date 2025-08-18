<x-app-layout>
  <x-slot name="header">{{ __('Editar Producto') }}</x-slot>
  <div class="py-6">
    <div class="max-w-md mx-auto bg-white p-6 rounded-lg shadow">
      <form action="{{ route('productos.update',$producto) }}" method="POST">
        @csrf @method('PUT')

        @foreach(['codigo','descripcion','unidad_medida','precio_unitario'] as $field)
          <div class="mt-4">
            <label for="{{ $field }}" class="block text-sm font-medium text-gray-700">
              {{ ucfirst(str_replace('_',' ',$field)) }}
            </label>
            <input type="{{ in_array($field,['precio_unitario']) ? 'number':'text' }}"
                   step="{{ $field==='precio_unitario'?'0.01':null }}"
                   name="{{ $field }}" id="{{ $field }}"
                   value="{{ old($field, $producto->$field) }}"
                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
            @error($field)<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
          </div>
        @endforeach

        {{-- Stock: solo si gestiona inventario --}}
        @if(auth()->user()->empresa->gestiona_stock)
          <div class="mt-4">
            <label for="stock" class="block text-sm font-medium text-gray-700">
              Stock
            </label>
            <input
              type="number"
              name="stock"
              id="stock"
              value="{{ old('stock') }}"
              class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring"
            />
            @error('stock')
              <span class="text-red-600 text-sm">{{ $message }}</span>
            @enderror
          </div>
        @endif

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
