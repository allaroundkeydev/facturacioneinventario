@csrf
<!-- resources\views\dte\clientes\form.blade.php -->

<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
  <!-- Tipo Documento -->
  <div>
    <label for="tipo_documento" class="block text-sm font-medium text-gray-700">Tipo Documento</label>
    <select name="tipo_documento" id="tipo_documento"
            class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
      <option value="02" {{ old('tipo_documento', $cliente->tipo_documento ?? '') == '02' ? 'selected' : '' }}>
        Contribuyente (NIT)
      </option>
      <option value="13" {{ old('tipo_documento', $cliente->tipo_documento ?? '') == '13' ? 'selected' : '' }}>
        Consumidor Final (DUI)
      </option>
    </select>
    @error('tipo_documento')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <!-- NIT -->
  <div>
    <label for="nit" class="block text-sm font-medium text-gray-700">NIT</label>
    <input type="text" name="nit" id="nit"
           value="{{ old('nit', $cliente->nit ?? '') }}"
           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
    @error('nit')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <!-- DUI -->
  <div>
    <label for="dui" class="block text-sm font-medium text-gray-700">DUI</label>
    <input type="text" name="dui" id="dui"
           value="{{ old('dui', $cliente->dui ?? '') }}"
           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
    @error('dui')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <!-- Nombre -->
  <div>
    <label for="nombre" class="block text-sm font-medium text-gray-700">Nombre</label>
    <input type="text" name="nombre" id="nombre"
           value="{{ old('nombre', $cliente->nombre ?? '') }}"
           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
    @error('nombre')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <!-- Correo -->
  <div>
    <label for="correo" class="block text-sm font-medium text-gray-700">Correo</label>
    <input type="email" name="correo" id="correo"
           value="{{ old('correo', $cliente->correo ?? '') }}"
           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
    @error('correo')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <!-- Teléfono -->
  <div>
    <label for="telefono" class="block text-sm font-medium text-gray-700">Teléfono</label>
    <input type="text" name="telefono" id="telefono"
           value="{{ old('telefono', $cliente->telefono ?? '') }}"
           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
    @error('telefono')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <!-- Departamento -->
  <div>
    <label for="departamento" class="block text-sm font-medium text-gray-700">Departamento</label>
    <select name="departamento" id="departamento"
            class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
      <option value="">Seleccione</option>
      @foreach($departamentos as $dep)
        <option value="{{ $dep->codigo }}"
          {{ old('departamento', $cliente->departamento ?? '') == $dep->codigo ? 'selected' : '' }}>
          {{ $dep->nombre }}
        </option>
      @endforeach
    </select>
    @error('departamento')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <!-- Municipio -->
  <div>
    <label for="municipio" class="block text-sm font-medium text-gray-700">Municipio</label>
    <select name="municipio" id="municipio"
            class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
      <option value="">Seleccione</option>
      @foreach($municipios as $mun)
        <option value="{{ $mun->codigo }}"
          {{ old('municipio', $cliente->municipio ?? '') == $mun->codigo ? 'selected' : '' }}>
          {{ $mun->nombre }}
        </option>
      @endforeach
    </select>
    @error('municipio')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <!-- ---------- Campos CON CONTRIBUYENTE (ocultos por defecto si tipo != 02) ---------- -->
  <div id="campos-contribuyente" class="col-span-1 md:col-span-2 {{ (old('tipo_documento', $cliente->tipo_documento ?? '') == '02') ? '' : 'hidden' }}">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
      <!-- NRC -->
      <div>
        <label for="nrc" class="block text-sm font-medium text-gray-700">NRC</label>
        <input type="text" name="nrc" id="nrc"
               value="{{ old('nrc', $cliente->nrc ?? '') }}"
               class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
        @error('nrc')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
      </div>

      <!-- Código actividad (autocomplete) -->
      <div class="relative">
        <label for="cod_actividad" class="block text-sm font-medium text-gray-700">Código Actividad</label>
        <input type="text" id="cod_actividad" name="cod_actividad" autocomplete="off"
               value="{{ old('cod_actividad', $cliente->cod_actividad ?? '') }}"
               class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
        @error('cod_actividad')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror

        <ul id="actividad-suggestions"
            class="absolute z-10 mt-1 w-full bg-white border border-gray-300 rounded-md max-h-40 overflow-auto hidden">
          <!-- JS rellenará -->
        </ul>
      </div>

      <!-- Descripción actividad (autocompletada, enviada al backend) -->
      <div>
        <label for="desc_actividad" class="block text-sm font-medium text-gray-700">Descripción de Actividad</label>
        <input type="text" name="desc_actividad" id="desc_actividad"
               value="{{ old('desc_actividad', $cliente->desc_actividad ?? '') }}"
               class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring bg-gray-50"
               placeholder="Descripción autocompletada" readonly aria-readonly="true" />
        @error('desc_actividad')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
      </div>
    </div>
  </div>
</div>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', () => {
  const qs = (s, root=document) => root.querySelector(s);
  const qsa = (s, root=document) => Array.from(root.querySelectorAll(s));

  // --- Municipios dinámicos ---
  const departamento = qs('#departamento');
  const municipio  = qs('#municipio');
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
        municipio.insertAdjacentHTML('beforeend',
          `<option value="${m.codigo}">${m.nombre}</option>`);
      });
    } catch (e) {
      municipio.innerHTML = '<option value="">Error al cargar</option>';
      console.error(e);
    }
  });

  // --- Mostrar/Ocultar campos contribuyente ---
  const tipoDocumento = qs('#tipo_documento');
  const camposContribuyente = qs('#campos-contribuyente');
  function toggleContribuyente() {
    if (!tipoDocumento || !camposContribuyente) return;
    if (tipoDocumento.value === '02') {
      camposContribuyente.classList.remove('hidden');
    } else {
      camposContribuyente.classList.add('hidden');
    }
  }
  tipoDocumento?.addEventListener('change', toggleContribuyente);
  // inicializa en carga
  toggleContribuyente();

  // --- Autocomplete actividades (igual que empresas) ---
  const inputAct = qs('#cod_actividad');
  const listAct  = qs('#actividad-suggestions');
  const descInput = qs('#desc_actividad');
  let debounce;

  function renderActividadItems(items) {
    if (!listAct) return;
    listAct.innerHTML = '';
    if (!items || items.length === 0) {
      listAct.innerHTML = '<li class="p-2 text-gray-500">Sin resultados</li>';
      return;
    }
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
    if (q.length < 1) {
      listAct?.classList.add('hidden');
      return;
    }
    debounce = setTimeout(async () => {
      try {
        const res   = await fetch(`/actividades?q=${encodeURIComponent(q)}`, {
          headers: { 'Accept': 'application/json' },
          credentials: 'same-origin'
        });
        if (!res.ok) throw new Error('Error fetching actividades');
        const items = await res.json();
        renderActividadItems(items);
        listAct.classList.remove('hidden');
      } catch (e) {
        console.error(e);
        if (listAct) {
          listAct.innerHTML = '<li class="p-2 text-red-500">Error al buscar actividades</li>';
          listAct.classList.remove('hidden');
        }
      }
    }, 250);
  });

  // click en sugerencia -> setear código y descripción
  listAct?.addEventListener('click', e => {
    const li = e.target.closest('li[data-codigo]');
    if (!li) return;
    const codigo = li.getAttribute('data-codigo') || '';
    const desc   = li.getAttribute('data-desc') || '';
    if (inputAct) inputAct.value = codigo;
    if (descInput) descInput.value = desc;
    listAct.classList.add('hidden');
  });

  // Si blur y hay un único match intenta autocompletar descripción
  inputAct?.addEventListener('blur', async () => {
    const val = inputAct.value.trim();
    if (!val) return;
    try {
      const res = await fetch(`/actividades?q=${encodeURIComponent(val)}`, {
        headers: { 'Accept': 'application/json' },
        credentials: 'same-origin'
      });
      if (!res.ok) return;
      const items = await res.json();
      if (Array.isArray(items) && items.length === 1) {
        if (descInput) descInput.value = items[0].descripcion || '';
      }
    } catch (e) {
      console.error('Autocomplete actividad blur error', e);
    }
  });

  // cerrar lista si click fuera
  document.addEventListener('click', (e) => {
    if (inputAct && listAct && !inputAct.contains(e.target) && !listAct.contains(e.target)) {
      listAct.classList.add('hidden');
    }
  });

});
</script>
@endpush
