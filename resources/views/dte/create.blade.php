<x-app-layout>
  <!-- resources\views\dte\create.blade.php -->
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
      {{ __('Emitir Factura') }}
    </h2>
  </x-slot>

  <div class="py-6">
    <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
      <div class="bg-white p-6 rounded-2xl shadow">
        @if($tipo)
          <p class="text-sm text-gray-600">Tipo seleccionado: <strong>{{ $tipo->codigo }} — {{ $tipo->descripcion }}</strong></p>
        @else
          <p class="text-sm text-gray-600">No se recibió un tipo específico. Se usará el formulario por defecto.</p>
        @endif

        <form action="{{ route('dte.store') }}" method="POST">
          @csrf

          {{-- Enviamos el tipo elegido para que se use en store() --}}
          <input type="hidden" name="tipo_documento_id" value="{{ $tipo->id ?? '' }}">

          {{-- Aquí va el resto del formulario de factura (cliente, items, totales...) --}}
          <div class="mt-4">
            <label class="block text-sm font-medium text-gray-700">Número de documento receptor (DUI/NIT)</label>
            <input type="text" name="rec_numDocumento" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
          </div>

          {{-- ejemplo de campos de ítem (tú debes tener una UI dinámica para varios items) --}}
          <div class="mt-4">
            <label class="block text-sm font-medium text-gray-700">Descripción</label>
            <input type="text" name="item_descripcion[]" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
          </div>
          <div class="mt-4 grid grid-cols-3 gap-3">
            <input type="number" step="1" name="item_cantidad[]" placeholder="Cantidad" class="border rounded p-2" />
            <input type="number" step="0.01" name="item_precio[]" placeholder="Precio (incluye IVA)" class="border rounded p-2" />
            <input type="text" name="item_codigo[]" placeholder="Código" class="border rounded p-2" />
          </div>

          <div class="mt-6 flex justify-end">
            <button type="submit" class="px-6 py-2 bg-green-600 text-white rounded-xl hover:bg-green-700">
              Enviar DTE (probar)
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</x-app-layout>
