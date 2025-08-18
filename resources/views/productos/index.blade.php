<x-app-layout>
  <x-slot name="header">{{ __('Productos') }}</x-slot>
  <div class="py-6">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
      @if(session('success'))
        <div class="mb-4 p-4 bg-green-100 text-green-800 rounded">
          {{ session('success') }}
        </div>
      @endif

      <div class="flex justify-end mb-4">
        <a href="{{ route('productos.create') }}"
           class="px-4 py-2 bg-blue-600 text-red-100 rounded hover:bg-blue-700">
          Nuevo Producto
        </a>
      </div>

      <table class="min-w-full bg-white shadow rounded-lg">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-4 py-2">Código</th>
            <th class="px-4 py-2">Descripción</th>
            <th class="px-4 py-2">U. Medida</th>
            <th class="px-4 py-2">Precio</th>
            <th class="px-4 py-2">Stock</th>
            <th class="px-4 py-2 text-right">Acciones</th>
          </tr>
        </thead>
        <tbody>
          @forelse($productos as $p)
            <tr class="border-t">
              <td class="px-4 py-2">{{ $p->codigo }}</td>
              <td class="px-4 py-2">{{ $p->descripcion }}</td>
              <td class="px-4 py-2">{{ $p->unidad_medida }}</td>
              <td class="px-4 py-2">{{ number_format($p->precio_unitario,2) }}</td>
              <td class="px-4 py-2">{{ $p->stock }}</td>
              <td class="px-4 py-2 text-right">
                <a href="{{ route('productos.edit',$p) }}"
                   class="px-2 py-1 bg-yellow-500 text-white rounded hover:bg-yellow-600">
                  Editar
                </a>
                <form action="{{ route('productos.destroy',$p) }}" method="POST" class="inline">
                  @csrf @method('DELETE')
                  <button onclick="return confirm('Eliminar producto?')"
                          class="px-2 py-1 bg-red-600 text-white rounded hover:bg-red-700">
                    Eliminar
                  </button>
                </form>
              </td>
            </tr>
          @empty
            <tr>
              <td colspan="6" class="px-4 py-2 text-center text-gray-500">
                No hay productos.
              </td>
            </tr>
          @endforelse
        </tbody>
      </table>

      <div class="mt-4">{{ $productos->links() }}</div>
    </div>
  </div>
</x-app-layout>
