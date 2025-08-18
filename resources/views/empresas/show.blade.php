<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Datos de mi Empresa') }}
        </h2>
    </x-slot>

    <div class="py-6">
        <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white p-6 rounded-2xl shadow">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div><strong>NIT:</strong> {{ $empresa->nit }}</div>
                    <div><strong>NRC:</strong> {{ $empresa->nrc }}</div>
                    <div><strong>Razón Social:</strong> {{ $empresa->razon_social }}</div>
                    <div><strong>Dirección:</strong> {{ $empresa->direccion }}</div>
                    <div><strong>Teléfono:</strong> {{ $empresa->telefono }}</div>
                    <div><strong>Correo:</strong> {{ $empresa->correo }}</div>
                    <div><strong>Departamento:</strong> {{ $empresa->departamento }}</div>
                    <div><strong>Municipio:</strong> {{ $empresa->municipio }}</div>
                    <div><strong>Código Actividad:</strong> {{ $empresa->cod_actividad }}</div>
                </div>
                <div class="mt-6 flex justify-end">
                    <a href="{{ route('empresa.edit') }}" class="px-6 py-2 bg-yellow-500 text-white rounded-xl shadow hover:bg-yellow-600 transition">
                        Editar
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>