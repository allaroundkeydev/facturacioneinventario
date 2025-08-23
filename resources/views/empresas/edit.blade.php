<!-- resources/views/empresas/edit.blade.php -->
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Editar Empresa') }}
        </h2>
    </x-slot>

    <div class="py-6">
        <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white p-6 rounded-2xl shadow">
                <form action="{{ route('empresa.update') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <!-- NIT -->
                        <div>
                            <label for="nit" class="block font-medium text-sm text-gray-700">NIT</label>
                            <input type="text" name="nit" id="nit"
                                   value="{{ old('nit', $empresa->nit) }}"
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                            @error('nit')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <!-- NRC -->
                        <div>
                            <label for="nrc" class="block font-medium text-sm text-gray-700">NRC</label>
                            <input type="text" name="nrc" id="nrc"
                                   value="{{ old('nrc', $empresa->nrc) }}"
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                            @error('nrc')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <!-- Razón Social -->
                        <div class="col-span-1 md:col-span-2">
                            <label for="razon_social" class="block font-medium text-sm text-gray-700">Razón Social</label>
                            <input type="text" name="razon_social" id="razon_social"
                                   value="{{ old('razon_social', $empresa->razon_social) }}"
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                            @error('razon_social')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <!-- Dirección -->
                        <div class="col-span-1 md:col-span-2">
                            <label for="direccion" class="block font-medium text-sm text-gray-700">Dirección</label>
                            <input type="text" name="direccion" id="direccion"
                                   value="{{ old('direccion', $empresa->direccion) }}"
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                            @error('direccion')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>



                        <!-- Teléfono -->
                        <div>
                            <label for="telefono" class="block font-medium text-sm text-gray-700">Teléfono</label>
                            <input type="text" name="telefono" id="telefono"
                                   value="{{ old('telefono', $empresa->telefono) }}"
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                            @error('telefono')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <!-- Correo -->
                        <div>
                            <label for="correo" class="block font-medium text-sm text-gray-700">Correo</label>
                            <input type="email" name="correo" id="correo"
                                   value="{{ old('correo', $empresa->correo) }}"
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                            @error('correo')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <!-- Departamento -->
                        <div>
                            <label for="departamento" class="block font-medium text-sm text-gray-700">Departamento</label>
                            <select name="departamento" id="departamento"
                                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                                <option value="">Seleccione</option>
                                @foreach($departamentos as $dep)
                                    <option value="{{ $dep->codigo }}"
                                        {{ old('departamento', $empresa->departamento) == $dep->codigo ? 'selected' : '' }}>
                                        {{ $dep->nombre }}
                                    </option>
                                @endforeach
                            </select>
                            @error('departamento')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <!-- Municipio -->
                        <div>
                            <label for="municipio" class="block font-medium text-sm text-gray-700">Municipio</label>
                            <select name="municipio" id="municipio"
                                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                                <option value="">Seleccione</option>
                                @foreach($municipios as $mun)
                                    <option value="{{ $mun->codigo }}"
                                        {{ old('municipio', $empresa->municipio) == $mun->codigo ? 'selected' : '' }}>
                                        {{ $mun->nombre }}
                                    </option>
                                @endforeach
                            </select>
                            @error('municipio')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <!-- Código Actividad -->
                        <div class="relative col-span-1 md:col-span-2">
                            <label for="cod_actividad" class="block font-medium text-sm text-gray-700">
                                Código Actividad
                            </label>
                            <input type="text" id="cod_actividad" name="cod_actividad" autocomplete="off"
                                   value="{{ old('cod_actividad', $empresa->cod_actividad) }}"
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                            @error('cod_actividad')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                            <ul id="actividad-suggestions"
                                class="absolute z-10 mt-1 w-full bg-white border border-gray-300 rounded-md max-h-40 overflow-auto hidden">
                            </ul>
                        </div>

                        <!-- Descripción actividad -->
                        <div class="col-span-1 md:col-span-2">
                            <label for="desc_actividad" class="block font-medium text-sm text-gray-700">Descripción de Actividad</label>
                            <input type="text" name="desc_actividad" id="desc_actividad"
       value="{{ old('desc_actividad', $empresa->desc_actividad ?? '') }}"
       class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring bg-gray-50"
       placeholder="Descripción de la actividad (autocompletada)" readonly aria-readonly="true">
                            @error('desc_actividad')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <!-- Gestionar Inventario -->
                        <div class="mt-4 flex items-center">
                          <input type="checkbox"
                                 name="gestiona_stock"
                                 id="gestiona_stock"
                                 value="1"
                                 {{ old('gestiona_stock', $empresa->gestiona_stock) ? 'checked' : '' }}
                                 class="h-4 w-4 text-blue-600 border-gray-300 rounded">
                          <label for="gestiona_stock" class="ml-2 block text-sm text-gray-700">
                            Activar gestión de inventario (stock)
                          </label>
                        </div>
                        @error('gestiona_stock')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror

                    </div>

                    <div class="mt-6 flex justify-end">
                        <button type="submit"
                                class="px-6 py-2 bg-green-600 text-white rounded-xl shadow hover:bg-green-700">
                            Actualizar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    @push('scripts')
    <script>
    document.addEventListener('DOMContentLoaded', () => {
      // --- Municipios ---
      const departamento = document.getElementById('departamento');
      const municipio  = document.getElementById('municipio');

      departamento?.addEventListener('change', async () => {
        municipio.innerHTML = '<option>Cargando...</option>';
        const depId = departamento.value;
        if (!depId) {
          municipio.innerHTML = '<option value="">Seleccione</option>';
          return;
        }
        try {
          const res  = await fetch(`/municipios/${depId}`);
          const data = await res.json();
          municipio.innerHTML = '<option value="">Seleccione</option>';
          data.forEach(m => {
            municipio.insertAdjacentHTML(
              'beforeend',
              `<option value="${m.codigo}">${m.nombre}</option>`
            );
          });
        } catch (e) {
          municipio.innerHTML = '<option value="">Error al cargar</option>';
          console.error(e);
        }
      });

      // --- Actividades - sugerencias (mejoradas: llenan también desc_actividad) ---
const inputAct = document.getElementById('cod_actividad');
const listAct  = document.getElementById('actividad-suggestions');
let debounce;

function renderActividadItems(items) {
  listAct.innerHTML = '';
  if (!items || items.length === 0) {
    listAct.innerHTML = '<li class="p-2 text-gray-500">Sin resultados</li>';
    return;
  }
  // cada <li> incluye data-codigo y data-desc para autocompletar ambos campos
  items.forEach(act => {
    const safeDesc = (act.descripcion || '').replace(/"/g, '&quot;');
    listAct.insertAdjacentHTML('beforeend',
      `<li data-codigo="${act.codigo}" data-desc="${safeDesc}"
           class="p-2 cursor-pointer hover:bg-gray-100">
         <strong>${act.codigo}</strong> — ${act.descripcion}
       </li>`);
  });
}

inputAct?.addEventListener('input', () => {
  clearTimeout(debounce);
  const q = inputAct.value.trim();
  if (q.length < 1) { // mostrar resultados incluso con 1 caracter
    listAct.classList.add('hidden');
    return;
  }
  debounce = setTimeout(async () => {
    try {
      const res   = await fetch(`/actividades?q=${encodeURIComponent(q)}`);
      if (!res.ok) throw new Error('Error fetching actividades');
      const items = await res.json();
      renderActividadItems(items);
      listAct.classList.remove('hidden');
    } catch (e) {
      console.error(e);
      listAct.innerHTML = '<li class="p-2 text-red-500">Error al buscar actividades</li>';
      listAct.classList.remove('hidden');
    }
  }, 250);
});

// click en sugerencia -> setear código y descripción
listAct?.addEventListener('click', e => {
  const li = e.target.closest('li[data-codigo]');
  if (!li) return;
  const codigo = li.getAttribute('data-codigo') || '';
  const desc   = li.getAttribute('data-desc') || '';
  inputAct.value = codigo;
  const descInput = document.getElementById('desc_actividad');
  if (descInput) {
    descInput.value = desc;
  }
  listAct.classList.add('hidden');
});

// Si el usuario escribe el código y sale del campo (blur), intentar autocompletar exacto
inputAct?.addEventListener('blur', async () => {
  const val = inputAct.value.trim();
  if (!val) return;
  try {
    const res = await fetch(`/actividades?q=${encodeURIComponent(val)}`);
    if (!res.ok) return;
    const items = await res.json();
    // si hay exactamente 1 resultado que coincida con el código, auto-llenar desc
    if (Array.isArray(items) && items.length === 1) {
      const only = items[0];
      const descInput = document.getElementById('desc_actividad');
      if (descInput) descInput.value = only.descripcion || '';
    } else {
      // si hay varias coincidencias, no cambiamos nada (el usuario deberá elegir)
    }
  } catch (e) {
    console.error('Autocomplete actividad blur error', e);
  }
});


      listAct?.addEventListener('click', e => {
        if (e.target.matches('li[data-codigo]')) {
          inputAct.value = e.target.getAttribute('data-codigo');
          listAct.classList.add('hidden');
        }
      });

      document.addEventListener('click', e => {
        if (inputAct && listAct && !inputAct.contains(e.target) && !listAct.contains(e.target)) {
          listAct.classList.add('hidden');
        }
      });
    });
    </script>
    @endpush

</x-app-layout>
