<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

     <div class="py-12">
    <div class="max-w-2xl mx-auto">
      @if(auth()->user()->role === 'admin')
        {{-- Admin: puede gestionar empresa --}}
        @if(auth()->user()->empresa)
          <a href="{{ route('empresa.panel') }}" class="button">
            {{ __('Ir al Panel de Empresa') }}
          </a>
        @else
          <a href="{{ route('empresa.create') }}" class="button">
            {{ __('Registrar mi Empresa') }}
          </a>
        @endif
      @else
        {{-- Cajero: solo emisión de DTE --}}
        <a href="{{ route('dte.create') }}" class="button">
          {{ __('Emitir DTE') }}
        </a>
      @endif
    </div>
  </div>
</x-app-layout>
