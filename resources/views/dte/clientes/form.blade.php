@csrf
<!-- resources\views\dte\clientes\form.blade.php -->
<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
  <!-- Nit / DUI según tipo -->
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

  <div>
    <label for="nit" class="block text-sm font-medium text-gray-700">NIT</label>
    <input type="text" name="nit" id="nit"
           value="{{ old('nit', $cliente->nit ?? '') }}"
           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
    @error('nit')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <div>
    <label for="dui" class="block text-sm font-medium text-gray-700">DUI</label>
    <input type="text" name="dui" id="dui"
           value="{{ old('dui', $cliente->dui ?? '') }}"
           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
    @error('dui')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <div>
    <label for="nombre" class="block text-sm font-medium text-gray-700">Nombre</label>
    <input type="text" name="nombre" id="nombre"
           value="{{ old('nombre', $cliente->nombre ?? '') }}"
           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
    @error('nombre')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <div>
    <label for="correo" class="block text-sm font-medium text-gray-700">Correo</label>
    <input type="email" name="correo" id="correo"
           value="{{ old('correo', $cliente->correo ?? '') }}"
           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
    @error('correo')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <div>
    <label for="telefono" class="block text-sm font-medium text-gray-700">Teléfono</label>
    <input type="text" name="telefono" id="telefono"
           value="{{ old('telefono', $cliente->telefono ?? '') }}"
           class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring" />
    @error('telefono')<span class="text-red-600 text-sm">{{ $message }}</span>@enderror
  </div>

  <!-- Departamento y Municipio -->
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
</div>
