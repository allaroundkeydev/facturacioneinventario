<x-app-layout>
  <!-- resources\views\dte\select_tipo.blade.php -->
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
      {{ __('Seleccionar Tipo de DTE') }}
    </h2>
  </x-slot>

  <div class="py-6">
    <div class="max-w-xl mx-auto sm:px-6 lg:px-8">
      <div class="bg-white p-6 rounded-2xl shadow">
        <form action="{{ route('dte.tipo.handle') }}" method="POST">
  @csrf

  <p class="mb-4 text-sm text-gray-600">Seleccione el tipo de Documento Electrónico que desea emitir:</p>

  <div class="space-y-2">
    @foreach($tipos as $t)
      <label class="flex items-center gap-3 p-2 border rounded hover:bg-gray-50">
        {{-- Enviamos **codigo** (más portable). Si prefieres enviar id cambia value por {{ $t->id }} --}}
        <input type="radio" name="tipo" value="{{ $t->codigo }}"
               class="form-radio" {{ old('tipo') == $t->codigo ? 'checked' : '' }}>
        <div>
          <div class="font-medium">{{ $t->codigo ?? '' }} — {{ $t->descripcion }}</div>
          @if($t->codigo == old('tipo'))
            <div class="text-xs text-gray-500">Seleccionado</div>
          @endif
        </div>
      </label>
    @endforeach
  </div>

  @error('tipo')<p class="text-red-600 mt-2">{{ $message }}</p>@enderror

  <div class="mt-6 flex justify-end">
    <button type="submit"
            class="px-6 py-2 bg-blue-600 text-gray-400 rounded-xl shadow hover:bg-blue-700">
      Continuar
    </button>
  </div>
</form>

      </div>
    </div>
  </div>
</x-app-layout>
