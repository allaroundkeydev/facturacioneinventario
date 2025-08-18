<x-app-layout>
  <!-- resources\views\dte\factura\create.blade.php -->
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
      {{ __('Emitir Factura (DTE)') }}
    </h2>
  </x-slot>

  <div class="py-6">
    <div class="max-w-4xl mx-auto sm:px-6 lg:px-8">
      <div class="bg-white p-6 rounded-2xl shadow">
        <form action="{{ route('dte.store') }}" method="POST">
          @csrf

          <input type="hidden" name="tipo" value="{{ $tipo->codigo ?? old('tipo') }}">

          <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <!-- Campo principal: DUI/NIT -->
            <div>
              <label class="block text-sm font-medium text-gray-700">Cliente (DUI / NIT)</label>
              <input type="text" name="cliente_numero" id="cliente_numero"
                     value="{{ old('cliente_numero') }}"
                     class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring"
                     placeholder="Ingrese DUI o NIT y presione Enter o salga del campo" />
              @error('cliente_numero')<p class="text-red-600 text-sm">{{ $message }}</p>@enderror
              <p id="cliente-status" class="text-xs text-gray-500 mt-1"></p>
            </div>

            <!-- Sucursal -->
            <div>
              <label class="block text-sm font-medium text-gray-700">Sucursal</label>
              <select name="sucursal_id" id="sucursal_id" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                <option value="">(Ninguna)</option>
                @foreach($sucursales as $s)
                  <option value="{{ $s->id }}" {{ old('sucursal_id') == $s->id ? 'selected' : '' }}>
                    {{ $s->descripcion }}
                  </option>
                @endforeach
              </select>
            </div>

            <!-- Caja -->
            <div>
              <label class="block text-sm font-medium text-gray-700">Caja</label>
              <select name="caja_id" id="caja_id" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                <option value="">(Ninguna)</option>
                @foreach($cajas as $c)
                  <option value="{{ $c->id }}" {{ old('caja_id') == $c->id ? 'selected' : '' }}>
                    {{ $c->descripcion }} ({{ $c->codigo_mh }})
                  </option>
                @endforeach
              </select>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">
            <!-- Campos visibles (readonly) que muestran información del cliente -->
            <div>
              <label class="block text-sm font-medium text-gray-700">Nombre / Razón social</label>
              <input type="text" id="cliente_nombre_view" readonly
                     class="mt-1 block w-full border-gray-200 bg-gray-50 rounded-md shadow-sm" />
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700">Correo</label>
              <input type="email" id="cliente_correo_view" readonly
                     class="mt-1 block w-full border-gray-200 bg-gray-50 rounded-md shadow-sm" />
            </div>

            <div class="col-span-1 md:col-span-2">
              <label class="block text-sm font-medium text-gray-700">Dirección</label>
              <input type="text" id="cliente_direccion_view" readonly
                     class="mt-1 block w-full border-gray-200 bg-gray-50 rounded-md shadow-sm" />
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700">Teléfono</label>
              <input type="text" id="cliente_telefono_view" readonly
                     class="mt-1 block w-full border-gray-200 bg-gray-50 rounded-md shadow-sm" />
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700">Departamento / Municipio</label>
              <input type="text" id="cliente_depmun_view" readonly
                     class="mt-1 block w-full border-gray-200 bg-gray-50 rounded-md shadow-sm" />
            </div>
          </div>

          <!-- Hidden inputs que SI se enviarán al POST (copiamos los valores ahí) -->
          <input type="hidden" name="receptor[tipoDocumento]" id="receptor_tipoDocumento" value="{{ old('receptor.tipoDocumento') }}" />
          <input type="hidden" name="receptor[numDocumento]" id="receptor_numDocumento" value="{{ old('receptor.numDocumento', old('cliente_numero')) }}" />
          <input type="hidden" name="receptor[nrc]" id="receptor_nrc" value="{{ old('receptor.nrc') }}" />
          <input type="hidden" name="receptor[nombre]" id="receptor_nombre" value="{{ old('receptor.nombre') }}" />
          <input type="hidden" name="receptor[codActividad]" id="receptor_codActividad" value="{{ old('receptor.codActividad') }}" />
          <input type="hidden" name="receptor[descActividad]" id="receptor_descActividad" value="{{ old('receptor.descActividad') }}" />
          <input type="hidden" name="receptor[direccion][departamento]" id="receptor_direccion_departamento" value="{{ old('receptor.direccion.departamento') }}" />
          <input type="hidden" name="receptor[direccion][municipio]" id="receptor_direccion_municipio" value="{{ old('receptor.direccion.municipio') }}" />
          <input type="hidden" name="receptor[direccion][complemento]" id="receptor_direccion_complemento" value="{{ old('receptor.direccion.complemento') }}" />
          <input type="hidden" name="receptor[telefono]" id="receptor_telefono" value="{{ old('receptor.telefono') }}" />
          <input type="hidden" name="receptor[correo]" id="receptor_correo" value="{{ old('receptor.correo') }}" />

          <div class="mt-4">
            <label class="block text-sm font-medium text-gray-700">IVA %</label>
            <input type="number" step="0.01" name="iva" value="{{ old('iva', 13) }}"
                   class="mt-1 block w-32 border-gray-300 rounded-md shadow-sm focus:ring" />
          </div>

          <hr class="my-4">

          <!-- Ítems -->
          <div>
            <h3 class="font-semibold mb-2">Ítems</h3>

            <table class="w-full table-auto border-collapse">
              <thead>
                <tr>
                  <th class="border px-2 py-1 text-left">Descripción</th>
                  <th class="border px-2 py-1 text-right">Cantidad</th>
                  <th class="border px-2 py-1 text-right">Precio</th>
                  <th class="border px-2 py-1">Acción</th>
                </tr>
              </thead>
              <tbody id="items-body">
                @if(old('items'))
                  @foreach(old('items') as $i => $it)
                    <tr>
                      <td class="border px-2 py-1">
                        <input name="items[{{ $i }}][descripcion]" value="{{ $it['descripcion'] }}" class="w-full" />
                      </td>
                      <td class="border px-2 py-1">
                        <input name="items[{{ $i }}][cantidad]" value="{{ $it['cantidad'] }}" class="w-20 text-right" />
                      </td>
                      <td class="border px-2 py-1">
                        <input name="items[{{ $i }}][precio]" value="{{ $it['precio'] }}" class="w-28 text-right" />
                      </td>
                      <td class="border px-2 py-1 text-center">
                        <button type="button" class="remove-row px-2 py-1 text-red-600">Eliminar</button>
                      </td>
                    </tr>
                  @endforeach
                @else
                  <tr>
                    <td class="border px-2 py-1">
                      <input name="items[0][descripcion]" class="w-full" />
                    </td>
                    <td class="border px-2 py-1">
                      <input name="items[0][cantidad]" value="1" class="w-20 text-right" />
                    </td>
                    <td class="border px-2 py-1">
                      <input name="items[0][precio]" value="0.00" class="w-28 text-right" />
                    </td>
                    <td class="border px-2 py-1 text-center">
                      <button type="button" class="remove-row px-2 py-1 text-red-600">Eliminar</button>
                    </td>
                  </tr>
                @endif
              </tbody>
            </table>

            <div class="mt-3 flex gap-2">
              <button id="add-item" type="button" class="px-4 py-2 bg-gray-200 rounded">Agregar Ítem</button>
            </div>
          </div>

          <div class="mt-6 flex justify-end">
            <button type="submit" class="px-6 py-2 bg-blue-600 text-gray-400 rounded-xl shadow hover:bg-blue-700">
              Generar DTE (preparar)
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>

  @push('scripts')
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      // ---------- Items add/remove/reindex ----------
      const addBtn = document.getElementById('add-item');
      const tbody  = document.getElementById('items-body');

      function reindex() {
        Array.from(tbody.querySelectorAll('tr')).forEach((tr, idx) => {
          tr.querySelectorAll('input').forEach((inp) => {
            const name = inp.getAttribute('name') || '';
            const newName = name.replace(/items\[\d+\]/, `items[${idx}]`);
            inp.setAttribute('name', newName);
          });
        });
      }

      addBtn.addEventListener('click', () => {
        const idx = tbody.querySelectorAll('tr').length;
        const tr = document.createElement('tr');
        tr.innerHTML = `
          <td class="border px-2 py-1">
            <input name="items[${idx}][descripcion]" class="w-full" />
          </td>
          <td class="border px-2 py-1">
            <input name="items[${idx}][cantidad]" value="1" class="w-20 text-right" />
          </td>
          <td class="border px-2 py-1">
            <input name="items[${idx}][precio]" value="0.00" class="w-28 text-right" />
          </td>
          <td class="border px-2 py-1 text-center">
            <button type="button" class="remove-row px-2 py-1 text-red-600">Eliminar</button>
          </td>
        `;
        tbody.appendChild(tr);
        reindex();
      });

      tbody.addEventListener('click', (e) => {
        if (e.target.matches('.remove-row')) {
          const tr = e.target.closest('tr');
          tr.remove();
          reindex();
        }
      });

      // ---------- Autocompletar cliente ----------
      const inputDoc = document.getElementById('cliente_numero');
      const statusEl = document.getElementById('cliente-status');

      // visibles
      const vNombre = document.getElementById('cliente_nombre_view');
      const vCorreo = document.getElementById('cliente_correo_view');
      const vDireccion = document.getElementById('cliente_direccion_view');
      const vTelefono = document.getElementById('cliente_telefono_view');
      const vDepMun = document.getElementById('cliente_depmun_view');

      // hidden (para enviar)
      const hTipo = document.getElementById('receptor_tipoDocumento');
      const hNum  = document.getElementById('receptor_numDocumento');
      const hNrc  = document.getElementById('receptor_nrc');
      const hNombre = document.getElementById('receptor_nombre');
      const hCodAct = document.getElementById('receptor_codActividad');
      const hDescAct = document.getElementById('receptor_descActividad');
      const hDep = document.getElementById('receptor_direccion_departamento');
      const hMun = document.getElementById('receptor_direccion_municipio');
      const hComp = document.getElementById('receptor_direccion_complemento');
      const hTel = document.getElementById('receptor_telefono');
      const hCorreo = document.getElementById('receptor_correo');

      // URL base: ajusta si tu ruta es diferente
      const buscarBase = "{{ route('clientes.buscar', ['doc' => 'DOC_PLACEHOLDER']) }}";

      async function buscarYCompletar(doc) {
        if (!doc || doc.length < 3) return;
        statusEl.textContent = 'Buscando cliente...';

        try {
          const res = await fetch(buscarBase.replace('DOC_PLACEHOLDER', encodeURIComponent(doc)), {
            headers: { 'Accept': 'application/json' },
            credentials: 'same-origin'
          });

          if (res.status === 200) {
            const json = await res.json();
            if (json.found && json.cliente) {
              const d = json.cliente;
              // visibles
              vNombre.value = d.nombre ?? '';
              vCorreo.value = d.correo ?? '';
              vDireccion.value = d.direccion ?? '';
              vTelefono.value = d.telefono ?? '';
              vDepMun.value = ((d.departamento ?? '') + ' / ' + (d.municipio ?? '')).trim();

              // hidden - populate ALL fields correctly according to MH requirements
              hNum.value = d.nit ?? d.dui ?? doc;
              // Set tipoDocumento based on whether we have NIT or DUI (02 for NIT, 13 for DUI)
              hTipo.value = d.nit ? '02' : (d.dui ? '13' : '13');
              hNrc.value = d.nrc ?? '';
              hNombre.value = d.nombre ?? '';
              hCodAct.value = d.cod_actividad ?? '';
              hDescAct.value = d.desc_actividad ?? '';
              hDep.value = d.departamento ?? '';
              hMun.value = d.municipio ?? '';
              hComp.value = d.direccion ?? '';
              hTel.value = d.telefono ?? '';
              hCorreo.value = d.correo ?? '';

              statusEl.textContent = 'Cliente encontrado.';
            } else {
              clearCliente();
              statusEl.textContent = 'Cliente no encontrado. Complete los datos manualmente.';
              enableManualEditing();
            }
          } else if (res.status === 404) {
            clearCliente();
            statusEl.textContent = 'Cliente no encontrado. Complete los datos manualmente.';
            enableManualEditing();
          } else {
            clearCliente();
            statusEl.textContent = 'Error al buscar cliente.';
          }
        } catch (e) {
          console.error(e);
          statusEl.textContent = 'Error de conexión.';
        }
      }

      function clearCliente() {
        vNombre.value = vCorreo.value = vDireccion.value = vTelefono.value = vDepMun.value = '';
        hTipo.value = hNum.value = hNrc.value = hNombre.value = hCodAct.value = hDescAct.value = '';
        hDep.value = hMun.value = hComp.value = hTel.value = hCorreo.value = '';
      }

      function enableManualEditing() {
        [vNombre, vCorreo, vDireccion, vTelefono].forEach(i => {
          i.readOnly = false;
          i.classList.remove('bg-gray-50');
          i.classList.remove('border-gray-200');
        });
      }

      inputDoc.addEventListener('blur', () => {
        const val = inputDoc.value.trim();
        if (val.length >= 3) buscarYCompletar(val);
      });

      inputDoc.addEventListener('keydown', (e) => {
        if (e.key === 'Enter') {
          e.preventDefault();
          const val = inputDoc.value.trim();
          if (val.length >= 3) buscarYCompletar(val);
        }
      });

      if (inputDoc.value.trim().length > 0) {
        buscarYCompletar(inputDoc.value.trim());
      }

    }); // DOMContentLoaded
  </script>
  @endpush

</x-app-layout>
