<x-app-layout>
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
      {{ __('Datos de Emisor DTE') }}
    </h2>
  </x-slot>

  <div class="py-6">
    <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
      <div class="bg-white p-6 rounded-2xl shadow">
        @php
          $empresa = auth()->user()->empresa;
          $action  = $empresa->tipo_establecimiento
                       ? route('empresa.emisor.update')
                       : route('empresa.emisor.store');
        @endphp

        <form action="{{ $action }}" method="POST" enctype="multipart/form-data">
          @csrf
          @if($empresa->tipo_establecimiento) @method('PUT') @endif

          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            {{-- Establecimiento opcional --}}
            <div>
              <label for="tipo_establecimiento" class="block text-sm font-medium text-gray-700">
                Tipo de Establecimiento
              </label>
              <select name="tipo_establecimiento" id="tipo_establecimiento"
                      class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                <option value="">(ninguno)</option>
                @foreach(\App\Models\TipoEstablecimiento::all() as $t)
                  <option value="{{ $t->codigo }}"
                    {{ old('tipo_establecimiento', $empresa->tipo_establecimiento) == $t->codigo ? 'selected' : '' }}>
                    {{ $t->descripcion ?? $t->codigo }}
                  </option>
                @endforeach
              </select>
              @error('tipo_establecimiento')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
            </div>

            {{-- Códigos opcionales --}}
            <div>
              <label for="cod_estable_mh" class="block text-sm font-medium text-gray-700">
                Código Establecimiento MH
              </label>
              <input type="text" name="cod_estable_mh" id="cod_estable_mh"
                     value="{{ old('cod_estable_mh', $empresa->cod_estable_mh) }}"
                     class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
              @error('cod_estable_mh')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
            </div>

            <div>
              <label for="cod_estable_int" class="block text-sm font-medium text-gray-700">
                Código Establecimiento Interno
              </label>
              <input type="text" name="cod_estable_int" id="cod_estable_int"
                     value="{{ old('cod_estable_int', $empresa->cod_estable_int) }}"
                     class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
              @error('cod_estable_int')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
            </div>

            <div>
              <label for="cod_punto_venta_mh" class="block text-sm font-medium text-gray-700">
                Punto de Venta MH
              </label>
              <input type="text" name="cod_punto_venta_mh" id="cod_punto_venta_mh"
                     value="{{ old('cod_punto_venta_mh', $empresa->cod_punto_venta_mh) }}"
                     class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
              @error('cod_punto_venta_mh')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
            </div>

            <div>
              <label for="cod_punto_venta_int" class="block text-sm font-medium text-gray-700">
                Punto de Venta Interno
              </label>
              <input type="text" name="cod_punto_venta_int" id="cod_punto_venta_int"
                     value="{{ old('cod_punto_venta_int', $empresa->cod_punto_venta_int) }}"
                     class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
              @error('cod_punto_venta_int')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
            </div>

            {{-- Certificado (único archivo) --}}
            <div class="col-span-1 md:col-span-2">
              <label for="certificado" class="block text-sm font-medium text-gray-700">
                Certificado (XML/.crt/.pem)
              </label>
              <input type="file" name="certificado" id="certificado"
                     accept=".xml,.crt,.cer,.pem"
                     class="mt-1 block w-full text-sm text-gray-700" />
              @error('certificado')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
            </div>

            {{-- Contraseña de clave privada --}}
            <div class="col-span-1 md:col-span-2">
              <label for="key_password" class="block text-sm font-medium text-gray-700">
                Contraseña Clave Privada
              </label>
              <input type="password" name="key_password" id="key_password"
                     value="{{ old('key_password', $empresa->key_password) }}"
                     class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
              @error('key_password')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
            </div>

            {{-- Credenciales API Hacienda --}}
            <div class="col-span-1 md:col-span-2">
              <label for="api_user" class="block text-sm font-medium text-gray-700">
                Usuario API Hacienda
              </label>
              <input type="text" name="api_user" id="api_user"
                     value="{{ old('api_user', $empresa->api_user) }}"
                     class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
              @error('api_user')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
            </div>

            <div class="col-span-1 md:col-span-2">
              <label for="api_password" class="block text-sm font-medium text-gray-700">
                Contraseña API Hacienda
              </label>
              <input type="password" name="api_password" id="api_password"
               value="{{ old('api_password', $empresa->api_password) }}"
                     class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
              @error('api_password')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
            </div>
          </div>

          <div class="mt-6 flex justify-end">
            <button type="submit"
                    class="px-6 py-2 bg-blue-600 text-white rounded-xl shadow hover:bg-blue-700">
              {{ $empresa->tipo_establecimiento ? 'Actualizar' : 'Guardar' }}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</x-app-layout>
