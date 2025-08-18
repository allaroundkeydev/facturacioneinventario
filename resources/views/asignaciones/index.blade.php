<x-app-layout>
  <x-slot name="header">{{ __('Asignaciones Cajero → Caja') }}</x-slot>
  <div class="py-6">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
      @if(session('success'))
        <div class="mb-4 p-4 bg-green-100 text-green-800 rounded">
          {{ session('success') }}
        </div>
      @endif

      <div class="flex justify-end mb-4">
        <a href="{{ route('asignaciones.create') }}"
           class="px-4 py-2 bg-blue-600 text-gray-400 rounded hover:bg-blue-700">
          Nueva Asignación
        </a>
      </div>

      <table class="min-w-full bg-white shadow rounded-lg">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-4 py-2">Caja</th>
            <th class="px-4 py-2">Sucursal</th>
            <th class="px-4 py-2">Cajero</th>
            <th class="px-4 py-2">Asignado En</th>
            <th class="px-4 py-2 text-right">Acción</th>
          </tr>
        </thead>
        <tbody>
          @forelse($asignaciones as $a)
            <tr class="border-t">
              <td class="px-4 py-2">{{ $a->codigo_mh }} – {{ $a->caja_descripcion }}</td>
              <td class="px-4 py-2">{{ $a->sucursal_descripcion }}</td>
              <td class="px-4 py-2">{{ $a->cajero_nombre }}</td>
              <td class="px-4 py-2">{{ $a->asignado_en }}</td>
              <td class="px-4 py-2 text-right">
                <form action="{{ route('asignaciones.destroy', $a->caja_id) }}" method="POST" class="inline">
                  @csrf @method('DELETE')
                  <input type="hidden" name="cajero_id" value="{{ $a->cajero_id }}">
                  <button onclick="return confirm('Eliminar esta asignación?')"
                          class="px-2 py-1 bg-red-600 text-white rounded hover:bg-red-700">
                    Eliminar
                  </button>
                </form>
              </td>
            </tr>
          @empty
            <tr>
              <td colspan="5" class="px-4 py-2 text-center text-gray-500">
                No hay asignaciones registradas.
              </td>
            </tr>
          @endforelse
        </tbody>
      </table>

      <div class="mt-4">
        {{ $asignaciones->links() }}
      </div>
    </div>
  </div>
</x-app-layout>
