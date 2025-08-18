<x-app-layout>
<!-- resources\views\dte\clientes\create.blade.php -->
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
      {{ __('Nuevo Cliente') }}
    </h2>
  </x-slot>

  <div class="py-6">
    <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
      <div class="bg-white p-6 rounded-2xl shadow">
        <form action="{{ route('clientes.store') }}" method="POST">
          @include('dte.clientes.form')
          <div class="mt-6 flex justify-end">
            <button type="submit"
                    class="px-6 py-2 bg-blue-600 text-white-500 rounded-xl shadow hover:bg-blue-700">
              Guardar Cliente
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</x-app-layout>
