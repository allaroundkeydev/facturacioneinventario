<x-app-layout>
  <x-slot name="header">{{ __('Cajas') }}</x-slot>
  <div class="py-6">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

      @if(session('success'))
        <div class="mb-4 p-4 bg-green-100 text-green-800 rounded">
          {{ session('success') }}
        </div>
      @endif

      <div class="flex justify-end mb-4">
        <a href="{{ route('cajas.create') }}"
           class="px-4 py-2 bg-blue-600 text-green-500 rounded hover:bg-blue-700">
          Nueva Caja
        </a>
      </div>

      <div class="bg-white shadow rounded-lg p-6">
        <table class="min-w-full table-auto">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-4 py-2">Sucursal</th>
              <th class="px-4 py-2">Código MH</th>
              <th class="px-4 py-2">Descripción</th>
              <th class="px-4 py-2 text-right">Acciones</th>
            </tr>
          </thead>
          <tbody>
            @forelse($cajas as $c)
              <tr class="border-t">
                <td class="px-4 py-2">{{ $c->sucursal->descripcion }}</td>
                <td class="px-4 py-2">{{ $c->codigo_mh }}</td>
                <td class="px-4 py-2">{{ $c->descripcion }}</td>
                <td class="px-4 py-2 text-right space-x-2">
                  <a href="{{ route('cajas.edit', $c) }}"
                     class="px-2 py-1 bg-yellow-500 text-blue-500 rounded hover:bg-yellow-600">
                    Editar
                  </a>
                  <form action="{{ route('cajas.destroy', $c) }}" method="POST" class="inline">
                    @csrf @method('DELETE')
                    <button onclick="return confirm('¿Eliminar caja?')"
                            class="px-2 py-1 bg-red-600 text-white rounded hover:bg-red-700">
                      Eliminar
                    </button>
                  </form>
                </td>
              </tr>
            @empty
              <tr>
                <td colspan="4" class="px-4 py-2 text-center text-gray-500">
                  No hay cajas registradas.
                </td>
              </tr>
            @endforelse
          </tbody>
        </table>

        <div class="mt-4">
          {{ $cajas->links() }}
        </div>
      </div>
    </div>
  </div>
</x-app-layout>
