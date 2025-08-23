<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Registrar Empresa') }}
        </h2>
    </x-slot>

    <div class="py-6">
        <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white p-6 rounded-2xl shadow">
                <form action="{{ route('empresa.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block font-medium text-sm text-gray-700" for="nit">NIT</label>
                            <input type="text" name="nit" id="nit" value="{{ old('nit') }}" 
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50">
                            @error('nit')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <div>
                            <label class="block font-medium text-sm text-gray-700" for="nrc">NRC</label>
                            <input type="text" name="nrc" id="nrc" value="{{ old('nrc') }}" 
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50">
                            @error('nrc')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <div class="col-span-1 md:col-span-2">
                            <label class="block font-medium text-sm text-gray-700" for="razon_social">Razón Social</label>
                            <input type="text" name="razon_social" id="razon_social" value="{{ old('razon_social') }}" 
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50">
                            @error('razon_social')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <!-- Dirección principal -->
                        <div class="col-span-1 md:col-span-2">
                            <label class="block font-medium text-sm text-gray-700" for="direccion">Dirección</label>
                            <input type="text" name="direccion" id="direccion" value="{{ old('direccion') }}" 
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50">
                            @error('direccion')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <div>
                            <label class="block font-medium text-sm text-gray-700" for="telefono">Teléfono</label>
                            <input type="text" name="telefono" id="telefono" value="{{ old('telefono') }}" 
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50">
                            @error('telefono')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <div>
                            <label class="block font-medium text-sm text-gray-700" for="correo">Correo</label>
                            <input type="email" name="correo" id="correo" value="{{ old('correo') }}" 
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50">
                            @error('correo')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <div>
                            <label class="block font-medium text-sm text-gray-700" for="departamento">Departamento</label>
                            <select name="departamento" id="departamento" 
                                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50">
                                <option value="">Seleccione</option>
                                @foreach($departamentos as $dep)
                                    <option value="{{ $dep->codigo }}" {{ old('departamento') == $dep->codigo ? 'selected' : '' }}>
                                        {{ $dep->nombre }}
                                    </option>
                                @endforeach
                            </select>
                            @error('departamento')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <div>
                            <label class="block font-medium text-sm text-gray-700" for="municipio">Municipio</label>
                            <select name="municipio" id="municipio" 
                                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50">
                                <option value="">Seleccione</option>
                                @foreach($municipios as $mun)
                                    <option value="{{ $mun->codigo }}" {{ old('municipio') == $mun->codigo ? 'selected' : '' }}>
                                        {{ $mun->nombre }}
                                    </option>
                                @endforeach
                            </select>
                            @error('municipio')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <div class="relative col-span-1 md:col-span-2">
                            <label for="cod_actividad" class="block font-medium text-sm text-gray-700">Código Actividad</label>
                            <input type="text" id="cod_actividad" name="cod_actividad" autocomplete="off"
                                   value="{{ old('cod_actividad') }}"
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                            @error('cod_actividad')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror

                            <ul id="actividad-suggestions"
                                class="absolute z-10 mt-1 w-full bg-white border border-gray-300 rounded-md max-h-40 overflow-auto hidden">
                            </ul>
                        </div>

                        <!-- Descripción actividad (nuevo campo) -->
                        <div class="col-span-1 md:col-span-2">
                            <label for="desc_actividad" class="block font-medium text-sm text-gray-700">Descripción de Actividad</label>
                            <input type="text" name="desc_actividad" id="desc_actividad"
       value="{{ old('desc_actividad', $empresa->desc_actividad ?? '') }}"
       class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring bg-gray-50"
       placeholder="Descripción de la actividad (autocompletada)" readonly aria-readonly="true">
                            @error('desc_actividad')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <div class="mt-4 col-span-1 md:col-span-2">
                            <label class="block font-medium text-sm text-gray-700" for="nombre_comercial">Nombre Comercial</label>
                            <input type="text" name="nombre_comercial" id="nombre_comercial" value="{{ old('nombre_comercial') }}"
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                            @error('nombre_comercial')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                        <div class="col-span-1 md:col-span-2">
                            <label class="block font-medium text-sm text-gray-700" for="tipo_establecimiento">Tipo Establecimiento</label>
                            <input type="text" name="tipo_establecimiento" id="tipo_establecimiento" value="{{ old('tipo_establecimiento') }}"
                                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                            @error('tipo_establecimiento')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>

                    </div>

                    <div class="mt-6 flex justify-end">
                        <button type="submit" 
                                class="px-6 py-2 bg-blue-600 text-gray-50 rounded-xl shadow hover:bg-blue-700 transition">
                            Guardar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    @push('scripts')
    <script>
    document.addEventListener('DOMContentLoaded', () => {
      // Municipios (mismo comportamiento que antes)
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
