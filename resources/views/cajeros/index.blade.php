<x-app-layout>
  <x-slot name="header">{{ __('Cajeros') }}</x-slot>
  <div class="py-6">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

      @if(session('success'))
        <div class="mb-4 p-4 bg-green-100 text-green-800 rounded">
          {{ session('success') }}
        </div>
      @endif

      <div class="flex justify-end mb-4">
        <a href="{{ route('cajeros.create') }}"
           class="px-4 py-2 bg-blue-600 text-blue-100 rounded hover:bg-blue-700">
          Nuevo Cajero
        </a>
      </div>

      <table class="min-w-full bg-white shadow rounded-lg">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-4 py-2">#</th>
            <th class="px-4 py-2">Nombre</th>
            <th class="px-4 py-2">Email</th>
            <th class="px-4 py-2 text-right">Acciones</th>
          </tr>
        </thead>
        <tbody>
          @forelse($cajeros as $c)
            <tr class="border-t">
              <td class="px-4 py-2">{{ $c->id }}</td>
              <td class="px-4 py-2">{{ $c->user->name }}</td>
              <td class="px-4 py-2">{{ $c->user->email }}</td>
              <td class="px-4 py-2 text-right space-x-2">
                <a href="{{ route('cajeros.edit',$c) }}"
                   class="px-2 py-1 bg-blue-500 text-gray-400 rounded hover:bg-yellow-600">
                  Editar
                </a>
                <form action="{{ route('cajeros.destroy',$c) }}" method="POST" class="inline">
                  @csrf @method('DELETE')
                  <button onclick="return confirm('Eliminar cajero?')"
                          class="px-2 py-1 bg-red-600 text-red-400 rounded hover:bg-red-700">
                    Eliminar
                  </button>
                </form>
              </td>
            </tr>
          @empty
            <tr>
              <td colspan="4" class="px-4 py-2 text-center text-gray-500">
                No hay cajeros registrados.
              </td>
            </tr>
          @endforelse
        </tbody>
      </table>

      <div class="mt-4">{{ $cajeros->links() }}</div>
    </div>
  </div>
</x-app-layout>
