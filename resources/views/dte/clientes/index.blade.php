<x-app-layout>
  <!-- resources\views\dte\clientes\index.blade.php -->
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
      {{ __('Clientes') }}
    </h2>
  </x-slot>

  <div class="py-6">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
      @if(session('success'))
        <div class="mb-4 p-4 bg-green-100 text-green-800 rounded">
          {{ session('success') }}
        </div>
      @endif

      <div class="flex justify-end mb-4">
        <a href="{{ route('clientes.create') }}"
           class="bg-blue-500 hover:bg-blue-500 text-white-400 font-bold py-2 px-4 rounded cursor-pointer">
          Nuevo Cliente
        </a>
      </div>

      <div class="bg-white shadow rounded-lg overflow-hidden">
        <table class="min-w-full table-auto">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-4 py-2 text-left">Nombre</th>
              <th class="px-4 py-2 text-left">Documento</th>
              <th class="px-4 py-2 text-left">Correo</th>
              <th class="px-4 py-2 text-left">Teléfono</th>
              <th class="px-4 py-2 text-left">Acciones</th>
            </tr>
          </thead>
          <tbody>
            @forelse($clientes as $c)
              <tr class="border-t">
                <td class="px-4 py-2">{{ $c->nombre }}</td>
                <td class="px-4 py-2">
                  {{ $c->tipo_documento === '02' ? $c->nit : $c->dui }}
                </td>
                <td class="px-4 py-2">{{ $c->correo }}</td>
                <td class="px-4 py-2">{{ $c->telefono }}</td>
                <td class="px-4 py-2 space-x-2">
                  <a href="{{ route('clientes.edit', $c) }}"
                     class="text-blue-600 hover:underline">Editar</a>
                  <form action="{{ route('clientes.destroy', $c) }}" method="POST" class="inline">
                    @csrf @method('DELETE')
                    <button type="submit"
                            onclick="return confirm('¿Eliminar cliente?')"
                            class="text-red-600 hover:underline">
                      Eliminar
                    </button>
                  </form>
                </td>
              </tr>
            @empty
              <tr>
                <td colspan="5" class="px-4 py-2 text-center text-gray-500">
                  No hay clientes registrados.
                </td>
              </tr>
            @endforelse
          </tbody>
        </table>
      </div>

      <div class="mt-4">
        {{ $clientes->links() }}
      </div>
    </div>
  </div>
</x-app-layout>
