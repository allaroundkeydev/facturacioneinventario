<x-app-layout>
  <x-slot name="header">{{ __('Nuevo Cajero') }}</x-slot>
  <div class="py-6">
    <div class="max-w-md mx-auto bg-white p-6 rounded-lg shadow">
      <form action="{{ route('cajeros.store') }}" method="POST">
        @csrf

        <div>
          <label for="name" class="block text-sm font-medium text-gray-700">Nombre</label>
          <input type="text" name="name" id="name" value="{{ old('name') }}"
                 class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" required>
          @error('name')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
        </div>

        <div class="mt-4">
          <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
          <input type="email" name="email" id="email" value="{{ old('email') }}"
                 class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" required>
          @error('email')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
        </div>

        <div class="mt-4">
          <label for="password" class="block text-sm font-medium text-gray-700">Contraseña</label>
          <input type="password" name="password" id="password"
                 class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" required>
          @error('password')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
        </div>

        <div class="mt-4">
          <label for="password_confirmation" class="block text-sm font-medium text-gray-700">
            Confirmar Contraseña
          </label>
          <input type="password" name="password_confirmation" id="password_confirmation"
                 class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" required>
        </div>

        <div class="mt-6 flex justify-end">
          <button type="submit"
                  class="px-6 py-2 bg-blue-600 text-gray-350 rounded hover:bg-blue-700">
            Crear Cajero
          </button>
        </div>
      </form>
    </div>
  </div>
</x-app-layout>
