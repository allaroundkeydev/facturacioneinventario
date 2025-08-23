<!-- resources/views/dte/clientes/edit.blade.php -->
<x-app-layout>
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
      {{ __('Editar Cliente') }}
    </h2>
  </x-slot>

  <div class="py-6">
    <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
      <div class="bg-white p-6 rounded-2xl shadow">
        <form action="{{ route('clientes.update', $cliente) }}" method="POST">
          @method('PUT')
          @include('dte.clientes.form')

          <div class="mt-6 flex items-center justify-end gap-3">
            <a href="{{ route('clientes.index') }}"
               class="px-4 py-2 rounded-xl border border-gray-300 text-gray-700 hover:bg-gray-50">
              Cancelar
            </a>
            <button type="submit"
                    class="px-6 py-2 bg-green-600 text-white rounded-xl shadow hover:bg-green-700">
              Actualizar Cliente
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</x-app-layout>
