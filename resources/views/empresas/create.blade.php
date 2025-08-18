<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Registrar Empresa') }}
        </h2>
    </x-slot>

    <div class="py-6">
        <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white p-6 rounded-2xl shadow">
                <form action="{{ route('empresa.store') }}" method="POST">
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
                                    <option value="{{ $dep->codigo }}">{{ $dep->nombre }}</option>
                                @endforeach
                            </select>
                            @error('departamento')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>
                        <div>
                            <label class="block font-medium text-sm text-gray-700" for="municipio">Municipio</label>
                            <select name="municipio" id="municipio" 
                                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50">
                                <option value="">Seleccione</option>
                                <!-- Los municipios se cargarán vía JS al seleccionar departamento -->
<select name="municipio" id="municipio" 
        class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50">
    <option value="">Seleccione</option>
</select>
@error('municipio')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
<script>
document.addEventListener('DOMContentLoaded', () => {
  // --- Municipios ---
  const departamento = document.getElementById('departamento');
  const municipio  = document.getElementById('municipio');

  departamento.addEventListener('change', async () => {
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

  // --- Actividades ---
  const inputAct = document.getElementById('cod_actividad');
  const listAct  = document.getElementById('actividad-suggestions');
  let debounce;

  inputAct.addEventListener('input', () => {
    clearTimeout(debounce);
    const q = inputAct.value.trim();
    if (q.length < 2) {
      listAct.classList.add('hidden');
      return;
    }
    debounce = setTimeout(async () => {
      try {
        const res   = await fetch(`/actividades?q=${encodeURIComponent(q)}`);
        const items = await res.json();
        listAct.innerHTML = '';
        if (items.length === 0) {
          listAct.innerHTML = '<li class="p-2 text-gray-500">Sin resultados</li>';
        } else {
          items.forEach(act => {
            listAct.innerHTML +=
              `<li data-codigo="${act.codigo}" 
                   class="p-2 cursor-pointer hover:bg-gray-100">
                 ${act.codigo} – ${act.descripcion}
               </li>`;
          });
        }
        listAct.classList.remove('hidden');
      } catch (e) {
        console.error(e);
      }
    }, 300);
  });

  listAct.addEventListener('click', e => {
    if (e.target.matches('li[data-codigo]')) {
      inputAct.value = e.target.getAttribute('data-codigo');
      listAct.classList.add('hidden');
    }
  });

  document.addEventListener('click', e => {
    if (!inputAct.contains(e.target) && !listAct.contains(e.target)) {
      listAct.classList.add('hidden');
    }
  });
});
</script>
                            </select>
                            @error('municipio')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
                        </div>
                        

                    <div class="relative">
  <label for="cod_actividad" class="block font-medium text-sm text-gray-700">Código Actividad</label>
  <input
    type="text"
    id="cod_actividad"
    name="cod_actividad"
    autocomplete="off"
    value="{{ old('cod_actividad', $empresa->cod_actividad ?? '') }}"
    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring focus:ring-opacity-50"
  >
  @error('cod_actividad')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror

  <!-- Aquí debe ir el UL para sugerencias -->
  <ul id="actividad-suggestions"
      class="absolute z-10 mt-1 w-full bg-white border border-gray-300 rounded-md max-h-40 overflow-auto hidden">
    <!-- JS lo llenará con <li> -->
  </ul>
</div>

                    <div class="mt-6 flex justify-end">
                        <button type="submit" 
                                class="px-6 py-2 bg-blue-600 text-gray-500 rounded-xl shadow hover:bg-blue-700 transition">
                            Guardar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>