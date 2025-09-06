<x-app-layout>
    <!-- resources\views\dte\factura\create.blade.php -->
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
      {{ __('Emitir Factura (DTE)') }}
    </h2>
  </x-slot>

  <div class="py-6">
    <div class="max-w-5xl mx-auto sm:px-6 lg:px-8">
      <div class="bg-white p-6 rounded-2xl shadow">

        {{-- Mensajes --}}
        @if(session('error'))
          <div class="mb-4 p-3 bg-red-50 text-red-700 rounded">{{ session('error') }}</div>
        @endif
        @if(session('success'))
          <div class="mb-4 p-3 bg-green-50 text-green-700 rounded">{{ session('success') }}</div>
        @endif

        <form 
    action="{{ $tipo && $tipo->codigo === '03' ? route('dte.ccf.store') : route('dte.store') }}" 
    method="POST" 
    id="dteForm"
>
          @csrf

          <input type="hidden" name="tipo" value="{{ $tipo->codigo ?? old('tipo', '01') }}">

          <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            {{-- Cliente (DUI/NIT) --}}
            <div class="relative">
            <label class="block text-sm font-medium text-gray-700">Cliente (DUI / NIT / Nombre)</label>
            <input 
              type="text" name="cliente_numero" id="cliente_numero"
              class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring"
              placeholder="Ingrese DUI, NIT o nombre"
              autocomplete="off"
            />
        <p id="cliente-status" class="text-xs text-gray-500 mt-1"></p>

  <!-- contenedor de sugerencias: aparecerá debajo del input -->
  <div 
    id="cliente-suggestions" 
    class="absolute z-20 w-full bg-white border border-gray-200 rounded shadow mt-1 hidden max-h-56 overflow-auto"
  ></div>
</div>

            {{-- Sucursal --}}
            <div>
              <label class="block text-sm font-medium text-gray-700">Sucursal</label>
              <select name="sucursal_id" id="sucursal_id" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                <option value="">{{ __('(Ninguna)') }}</option>
                @foreach($sucursales as $s)
                  <option value="{{ $s->id }}" {{ old('sucursal_id') == $s->id ? 'selected' : '' }}>
                    {{ $s->descripcion }}
                  </option>
                @endforeach
              </select>
            </div>

            {{-- Caja --}}
            <div>
              <label class="block text-sm font-medium text-gray-700">Caja</label>
              <select name="caja_id" id="caja_id" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring">
                <option value="">{{ __('(Ninguna)') }}</option>
                @foreach($cajas as $c)
                  <option value="{{ $c->id }}" {{ old('caja_id') == $c->id ? 'selected' : '' }}>
                    {{ $c->descripcion }} ({{ $c->codigo_mh ?? '' }})
                  </option>
                @endforeach
              </select>
            </div>
          </div>

          {{-- VISIBLES (readonly) que se llenan al buscar cliente --}}
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">
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

          {{-- Hidden inputs que SI se enviarán al POST (estructura esperada por controller) --}}
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

          {{-- IVA y totales visibles --}}
          <div class="mt-4 grid grid-cols-1 md:grid-cols-5 gap-4 items-end">
            <div>
              <label class="block text-sm font-medium text-gray-700">IVA (%)</label>
              <input type="number" step="0.01" name="iva" id="ivaPct" value="{{ old('iva', 13) }}"
                     class="mt-1 block w-32 border-gray-300 rounded-md shadow-sm focus:ring" />
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700">Subtotal (Base)</label>
              <input type="text" id="subtotal_view" readonly class="mt-1 block w-40 border-gray-200 bg-gray-50 rounded-md shadow-sm text-right" />
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700">IVA monto</label>
              <input type="text" id="iva_monto_view" readonly class="mt-1 block w-40 border-gray-200 bg-gray-50 rounded-md shadow-sm text-right" />
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700">Descuento (-)</label>
                <input type="number" step="0.000001" name="descuento_general" id="descuentoGeneral" value="{{ old('descuento_general', 0) }}"
                        class="mt-1 block w-32 border-gray-300 rounded-md shadow-sm focus:ring" />
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700">Total</label>
              <input type="text" id="total_view" readonly class="mt-1 block w-40 border-gray-200 bg-gray-50 rounded-md shadow-sm text-right" />
            </div>
          </div>

          <hr class="my-4">

          {{-- Ítems: tabla dinámica --}}
<div>
  <h3 class="font-semibold mb-2">Ítems</h3>
  <table class="w-full table-auto border-collapse">
    <thead>
      <tr>
        <th class="border px-2 py-1 text-left">Código</th>
        <th class="border px-2 py-1 text-left">Descripción</th>
        <th class="border px-2 py-1 text-right">Cantidad</th>
        <th class="border px-2 py-1 text-right">Precio (con IVA)</th>
        <th class="border px-2 py-1 text-right">Descuento</th>
        <th class="border px-2 py-1">Acción</th>
      </tr>
    </thead>
    <tbody id="items-body">
      @if(old('items'))
        @foreach(old('items') as $i => $it)
          <tr>
            <td class="border px-2 py-1">
              <div class="relative">
                <input
                  type="text"
                  id="item-busqueda-{{ $i }}"
                  class="item-busqueda w-full"
                  placeholder="Código o descripción…"
                  value="{{ $it['codigo'] }}"
                  autocomplete="off"
                />
                <div
                  id="item-suggestions-{{ $i }}"
                  class="item-suggestions absolute z-10 w-full bg-white border rounded shadow hidden max-h-40 overflow-auto"
                ></div>
                <input
                  type="hidden"
                  name="items[{{ $i }}][producto_id]"
                  class="item-producto-id"
                  value="{{ $it['producto_id'] ?? '' }}"
                />
                <input
                  type="hidden"
                  name="items[{{ $i }}][unidad_codigo]"
                  class="item-unidad-codigo"
                  value="{{ $it['unidad_codigo'] ?? '' }}"
                />
              </div>
            </td>
            <td class="border px-2 py-1">
              <input
                type="text"
                name="items[{{ $i }}][descripcion]"
                class="item-descripcion w-full"
                value="{{ $it['descripcion'] }}"
                readonly
              />
            </td>
            <td class="border px-2 py-1 text-right">
              <input
                type="number"
                name="items[{{ $i }}][cantidad]"
                value="{{ $it['cantidad'] }}"
                class="w-20 text-right cantidad-input"
                step="0.01"
              />
            </td>
            <td class="border px-2 py-1 text-right">
              <input
                type="number"
                name="items[{{ $i }}][precio]"
                value="{{ $it['precio'] }}"
                class="w-28 text-right precio-input"
                step="0.000001"
              />
            </td>
            <td class="border px-2 py-1 text-right">
              <input
                type="number"
                name="items[{{ $i }}][descuento]"
                value="{{ $it['descuento'] }}"
                class="w-28 text-right descuento-input"
                step="0.000001"
              />
            </td>
            <td class="border px-2 py-1 text-center">
              <button type="button" class="remove-row px-2 py-1 text-red-600">
                Eliminar
              </button>
            </td>
          </tr>
        @endforeach
      @else
        <tr>
          <td class="border px-2 py-1">
            <div class="relative">
              <input
                type="text"
                id="item-busqueda-0"
                class="item-busqueda w-full"
                placeholder="Código o descripción…"
                autocomplete="off"
              />
              <div
                id="item-suggestions-0"
                class="item-suggestions absolute z-10 w-full bg-white border rounded shadow hidden max-h-40 overflow-auto"
              ></div>
              <input
                type="hidden"
                name="items[0][producto_id]"
                class="item-producto-id"
              />
              <input
                type="hidden"
                name="items[0][unidad_codigo]"
                class="item-unidad-codigo"
              />
            </div>
          </td>
          <td class="border px-2 py-1">
            <input
              type="text"
              name="items[0][descripcion]"
              class="item-descripcion w-full"
              readonly
            />
          </td>
          <td class="border px-2 py-1 text-right">
            <input
              type="number"
              name="items[0][cantidad]"
              value="1"
              class="w-20 text-right cantidad-input"
              step="0.01"
            />
          </td>
          <td class="border px-2 py-1 text-right">
            <input
              type="number"
              name="items[0][precio]"
              value="0.00"
              class="w-28 text-right precio-input"
              step="0.000001"
            />
          </td>
          <td class="border px-2 py-1 text-right">
            <input
              type="number"
              name="items[0][descuento]"
              value="0.00"
              class="w-28 text-right descuento-input"
              step="0.000001"
            />
          </td>
          <td class="border px-2 py-1 text-center">
            <button type="button" class="remove-row px-2 py-1 text-red-600">
              Eliminar
            </button>
          </td>
        </tr>
      @endif
    </tbody>
  </table>

  <div class="mt-3 flex gap-2">
    <button id="add-item" type="button" class="px-4 py-2 bg-gray-200 rounded">
      Agregar Ítem
    </button>
  </div>
</div>


          

          {{-- ... justo encima del botón Generar DTE ... --}}
<hr class="my-6">

{{-- Forma de Pago --}}
<div class="mt-6">
  <h3 class="font-semibold mb-3">Forma de Pago</h3>

  {{-- Selector principal (opción: clickable cards o un select) --}}
  <div id="payment-method-selector" class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
    <div data-payment-method="cash"
         class="payment-option p-4 bg-white rounded-2xl shadow border-2 border-transparent cursor-pointer hover:border-blue-500 transition flex items-center space-x-3">
      <span class="text-3xl">💵</span>
      <span class="text-lg font-medium text-gray-800">Efectivo</span>
    </div>
    <div data-payment-method="card"
         class="payment-option p-4 bg-white rounded-2xl shadow border-2 border-transparent cursor-pointer hover:border-blue-500 transition flex items-center space-x-3">
      <span class="text-3xl">💳</span>
      <span class="text-lg font-medium text-gray-800">Tarjeta</span>
    </div>
    <div data-payment-method="other"
         class="payment-option p-4 bg-white rounded-2xl shadow border-2 border-transparent cursor-pointer hover:border-blue-500 transition flex items-center space-x-3">
      <span class="text-3xl">📄</span>
      <span class="text-lg font-medium text-gray-800">Otros</span>
    </div>
  </div>

  {{-- Aquí aparecerán los campos específicos --}}
  <div id="payment-details" class="mt-4"></div>
</div>

{{-- Hidden inputs para el pago --}}
<!-- contenedor donde añadiremos bloques de pago -->
<div id="pagos-container"></div>
<button 
  type="button" 
  id="add-payment" 
  class="mt-4 px-4 py-2 bg-gray-200 rounded hover:bg-gray-300"
>
  Agregar forma de pago
</button>





          

          <div class="mt-6 flex justify-end">
            <button type="submit" class="px-6 py-2 bg-blue-600 text-white rounded-xl shadow hover:bg-blue-700">
              Generar DTE (preparar)
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>

  {{-- Modal para registrar cliente (opcional) --}}
  <div class="fixed z-10 inset-0 overflow-y-auto hidden" id="clienteModal" aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" aria-hidden="true"></div>
      <div class="inline-block align-bottom bg-white rounded-lg px-4 pt-5 pb-4 text-left overflow-hidden shadow-xl transform transition-all sm:align-middle sm:max-w-lg sm:w-full">
        <div>
          <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-title">Registrar Cliente</h3>
          <div class="mt-2">
            <form id="clienteForm">
              @csrf
              <div class="grid grid-cols-1 gap-2">
                <input type="text" id="m_nit" name="nit" placeholder="NIT" class="border rounded p-2" />
                <input type="text" id="m_dui" name="dui" placeholder="DUI" class="border rounded p-2" />
                <input type="text" id="m_nombre" name="nombre" placeholder="Nombre *" required class="border rounded p-2" />
                <input type="email" id="m_correo" name="correo" placeholder="Correo" class="border rounded p-2" />
                {{-- CAMBIO: direccion -> complemento --}}
                <textarea id="m_complemento" name="complemento" placeholder="Complemento / Dirección" class="border rounded p-2"></textarea>
                <input type="text" id="m_telefono" name="telefono" placeholder="Teléfono" class="border rounded p-2" />
              </div>
              <div class="mt-3 flex justify-end">
                <button type="button" id="clienteCancel" class="px-3 py-1 bg-gray-200 rounded">Cancelar</button>
                <button type="submit" class="ml-2 px-3 py-1 bg-blue-600 text-white rounded">Guardar</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    window.formasPago = @json($formasPago ?? []);
  </script>
  @push('scripts')
  <script>
  // true = controla stock, false = no controla stock → permite producto libre
  window.gestionaStock = {{ auth()->user()->empresa->gestiona_stock ? 'true' : 'false' }};
</script>


  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const rutaNombre = '{{ url("clientes/buscar-nombre") }}';


      // ---------- helpers ----------
      const qs = (s, root=document) => root.querySelector(s);
      const qsa = (s, root=document) => Array.from(root.querySelectorAll(s));

      // ---------- Lógica de Items & Totales ----------
      const inputDoc = qs('#cliente_numero');
      const tbody = qs('#items-body');

      
      function reindex() {
  qsa('#items-body tr').forEach((tr, idx) => {
    // autocomplete
    tr.querySelector('.item-busqueda').id = `item-busqueda-${idx}`;
    tr.querySelector('.item-suggestions').id = `item-suggestions-${idx}`;
    // producto_id
    tr.querySelector('.item-producto-id').name   = `items[${idx}][producto_id]`;
    // unidad_codigo
    tr.querySelector('.item-unidad-codigo').name = `items[${idx}][unidad_codigo]`;
    // descripción readonly
    tr.querySelector('.item-descripcion').name   = `items[${idx}][descripcion]`;

    // cantidad, precio y descuento
    tr.querySelector('.cantidad-input').name      = `items[${idx}][cantidad]`;
    tr.querySelector('.precio-input').name        = `items[${idx}][precio]`;
    tr.querySelector('.descuento-input').name     = `items[${idx}][descuento]`;
  });

  calcTotals();
}



      // 2) Crear nueva fila al hacer click en “Agregar Ítem”
qs('#add-item').addEventListener('click', () => {
  const idx = tbody.querySelectorAll('tr').length;
  const tr  = document.createElement('tr');
  tr.innerHTML = `
    <td class="border px-2 py-1">
      <div class="relative">
        <input
          type="text"
          id="item-busqueda-${idx}"
          class="item-busqueda w-full"
          placeholder="Código o descripción…"
          autocomplete="off"
        />
        <div
          id="item-suggestions-${idx}"
          class="item-suggestions absolute z-10 w-full bg-white border rounded shadow hidden max-h-40 overflow-auto"
        ></div>
        <input type="hidden" class="item-producto-id" />
        <input type="hidden" class="item-unidad-codigo" />
      </div>
    </td>
    <td class="border px-2 py-1">
      <input type="text" class="item-descripcion w-full" readonly />
    </td>
    <td class="border px-2 py-1 text-right">
      <input type="number" value="1" step="0.01" class="cantidad-input w-20 text-right" />
    </td>
    <td class="border px-2 py-1 text-right">
      <input type="number" value="0.00" step="0.000001" class="precio-input w-28 text-right" />
    </td>
    <td class="border px-2 py-1 text-right">
      <input type="number" value="0.00" step="0.000001" class="descuento-input w-28 text-right" />
    </td>
    <td class="border px-2 py-1 text-center">
      <button type="button" class="remove-row px-2 py-1 text-red-600">Eliminar</button>
    </td>
  `;
  tbody.appendChild(tr);
  reindex();

  // Aquí podrías inicializar tu autocomplete pasándole `idx`…
  // setupItemAutocomplete(idx);
});



      // 3) Eliminar fila
tbody.addEventListener('click', (e) => {
  if (e.target.matches('.remove-row')) {
    e.target.closest('tr').remove();
    reindex();
  }
});




      // 4) Tu cálculo de totales queda igual
function elementValues() {
  return qsa('#items-body tr').map(tr => ({
    qty:      parseFloat(tr.querySelector('.cantidad-input').value || 0),
    price:    parseFloat(tr.querySelector('.precio-input').value  || 0),
    discount: parseFloat(tr.querySelector('.descuento-input').value || 0),
  }));
}


      function calcTotals() {
  const ivaPct       = parseFloat(qs('#ivaPct').value    || 0);
  const descGeneral  = parseFloat(qs('#descuentoGeneral').value || 0);
  let subtotalFinal  = 0, ivaMontoFinal = 0, totalSinDesc = 0;

  const vals = elementValues();
  vals.forEach(v => totalSinDesc += v.price * v.qty);
  vals.forEach(v => {
    const sinDesc = v.price * v.qty;
    const prop   = totalSinDesc > 0
      ? (sinDesc / totalSinDesc) * descGeneral
      : 0;
    const montoDescItem = v.discount + prop;
    const totalConIva   = sinDesc - montoDescItem;
    const base          = ivaPct > 0
      ? totalConIva / (1 + ivaPct/100)
      : totalConIva;
    subtotalFinal += base;
    ivaMontoFinal += (totalConIva - base);
  });

  const totalFinal = subtotalFinal + ivaMontoFinal;
  qs('#subtotal_view').value   = subtotalFinal.toFixed(2);
  qs('#iva_monto_view').value  = ivaMontoFinal.toFixed(2);
  qs('#total_view').value      = totalFinal.toFixed(2);

  document.dispatchEvent(
    new CustomEvent('totalUpdated', { detail: { total: totalFinal.toFixed(2) } })
  );
}



      // 5) Recalcular totales al cambiar inputs
qs('#dteForm').addEventListener('input', (e) => {
  if (e.target.matches(
      '.cantidad-input, .precio-input, .descuento-input, #ivaPct, #descuentoGeneral'
    )) {
    calcTotals();
  }
});



      // ─── Lógica para Forma de Pago (multi-bloque) ───
let pagoIndex      = 0;
let activePagoIdx  = null;
const pagosContainer = qs('#pagos-container');
const addPaymentBtn  = qs('#add-payment');

const paymentSelector         = qs('#payment-method-selector');
const paymentDetailsContainer = qs('#payment-details');


// 1) Renderiza el HTML base de un bloque de pago
function renderPagoBlock(idx) {
  return `
    <div class="pago-block mt-2 p-2 border rounded bg-gray-50" data-idx="${idx}">
      <div class="flex justify-between items-center mb-2 pago-header">
        <span class="pago-number text-sm font-medium">
          Forma de pago #${idx + 1}
        </span>
        <div>
          <button type="button" data-action="edit"
                  class="text-blue-600 hover:underline mr-2">
            Editar
          </button>
          <button type="button" data-action="delete"
                  class="text-red-600 hover:underline">
            Eliminar
          </button>
        </div>
      </div>
      <span class="pago-summary text-sm text-gray-800">[Sin configurar]</span>
      <input type="hidden" name="pagos[${idx}][codigo]"    class="pago-codigo" />
      <input type="hidden" name="pagos[${idx}][montoPago]" class="pago-monto" />
      <input type="hidden" name="pagos[${idx}][referencia]"class="pago-ref" />
    </div>
  `;
}



function getCurrentPagoEls() {
  const block = qs(`.pago-block[data-idx="${activePagoIdx}"]`);
  return {
    summaryEl: block.querySelector('.pago-summary'),
    codigoEl:  block.querySelector('.pago-codigo'),
    montoEl:   block.querySelector('.pago-monto'),
    refEl:     block.querySelector('.pago-ref'),
  };
}


// 2) Añade un bloque nuevo y lo marca como activo
function addPaymentBlock() {
  pagosContainer.insertAdjacentHTML('beforeend', renderPagoBlock(pagoIndex));
  activePagoIdx = pagoIndex;
  pagoIndex++;
  paymentDetailsContainer.innerHTML = '';
  reindexPagos();
  const { montoEl } = getCurrentPagoEls();
montoEl.value = getRemaining().toFixed(2);

}

// 3) Obtiene los <input> dentro del bloque activo
function getCurrentPagoEls() {
  const block = qs(`.pago-block[data-idx="${activePagoIdx}"]`);
  return {
    summaryEl: block.querySelector('.pago-summary'),
    codigoEl:  block.querySelector('.pago-codigo'),
    montoEl:   block.querySelector('.pago-monto'),
    refEl:     block.querySelector('.pago-ref'),
  };
}

// 4) Genera el primer bloque al cargar la página
addPaymentBlock();

// 5) Permite agregar más formas de pago al botón
addPaymentBtn.addEventListener('click', addPaymentBlock);
// 6bis) Edit / Delete con un solo listener en el container
pagosContainer.addEventListener('click', e => {
  const action = e.target.dataset.action;
  if (!action) return;

  const block = e.target.closest('.pago-block');
  const idx   = Number(block.dataset.idx);

  if (action === 'delete') {
    block.remove();
    reindexPagos();
    paymentDetailsContainer.innerHTML = '';
    return;
  }

  if (action === 'edit') {
    // 1) Marco este bloque como activo
    activePagoIdx = idx;
    qsa('.pago-block').forEach(b => b.classList.remove('ring','ring-blue-300'));
    block.classList.add('ring','ring-blue-300');

    // 2) Leo el método que ya estuviera guardado (o 'cash' si es nuevo)
    const { codigoEl, refEl } = getCurrentPagoEls();
    const method = codigoEl.value || 'cash';

    // 3) Destildo/tildo el selector principal
    qsa('[data-payment-method]').forEach(el =>
      el.classList.remove('border-blue-500','bg-blue-50')
    );
    qs(`[data-payment-method="${method}"]`)
      ?.classList.add('border-blue-500','bg-blue-50');

    // 4) Reabro el formulario de detalles
    updatePaymentDetails(method);

    // 5) Pre‐lleno la referencia y el select si ya existían
    if (method === 'card') {
      qs('#card_referencia').value = refEl.value || '';
    }
    else if (method === 'other') {
      qs('#other_payment_method').value = codigoEl.value || '';
      qs('#other_referencia').value = refEl.value || '';
    }
  }
});


// 6) Cuando el usuario elige Efectivo/Tarjeta/Otros
paymentSelector.addEventListener('click', e => {
  const card = e.target.closest('[data-payment-method]');
  if (!card) return;

  qsa('[data-payment-method]').forEach(el =>
    el.classList.remove('border-blue-500','bg-blue-50')
  );
  card.classList.add('border-blue-500','bg-blue-50');

  updatePaymentDetails(card.dataset.paymentMethod);
});

// 7) Plantillas de HTML según método
const paymentTemplates = {
  cash: `
    <div class="p-4 bg-gray-50 rounded-lg">
      <label>Monto Recibido</label>
      <input id="monto_recibido" type="number" step="0.01" class="mt-1 w-full" placeholder="0.00"/>
      <p>Cambio: <span id="cambio_view">0.00</span></p>
    </div>`,
  card: `
    <div class="p-4 bg-gray-50 rounded-lg">
      <button type="button" data-card-type="02" class="payment-card-type-btn px-4 py-2 bg-white border rounded-md">Débito</button>
      <button type="button" data-card-type="03" class="payment-card-type-btn px-4 py-2 bg-white border rounded-md">Crédito</button>
      <input id="card_referencia" type="text" class="mt-2 w-full" placeholder="Referencia"/>
    </div>`,
  other: `
    <div class="p-4 bg-gray-50 rounded-lg">
      <select id="other_payment_method" class="mt-1 w-full border rounded">
        <option value="">--Seleccione--</option>
      </select>
      <input id="other_referencia" type="text" class="mt-2 w-full" placeholder="Detalle"/>
    </div>`
};

function reindexPagos() {
  const blocks = qsa('.pago-block');
  blocks.forEach((block, newIdx) => {
    block.dataset.idx = newIdx;
    qs('.pago-number', block).textContent = `Forma de pago #${newIdx + 1}`;
    block.querySelector('.pago-codigo').name    = `pagos[${newIdx}][codigo]`;
    block.querySelector('.pago-monto').name     = `pagos[${newIdx}][montoPago]`;
    block.querySelector('.pago-ref').name       = `pagos[${newIdx}][referencia]`;
  });
  pagoIndex = blocks.length;
  updateDeleteButtons();
}

function updateDeleteButtons() {
  const blocks = qsa('.pago-block');
  blocks.forEach(block => {
    const btn = block.querySelector('[data-action="delete"]');
    btn.style.visibility = blocks.length > 1 ? 'visible' : 'hidden';
  });
}

function getPaidTotal() {
  return qsa('.pago-block').reduce((sum, block) => {
    const m = parseFloat(block.querySelector('.pago-monto').value) || 0;
    return sum + m;
  }, 0);
}

function getRemaining() {
  const total = parseFloat(qs('#total_view').value) || 0;
  return total - getPaidTotal();
}


// 8) Rellena el contenedor de detalles y engancha eventos
function updatePaymentDetails(method) {
  paymentDetailsContainer.innerHTML = paymentTemplates[method]||'';
  const { codigoEl, montoEl, refEl } = getCurrentPagoEls();
  montoEl.value = qs('#total_view').value || '';

  if (method === 'cash') {
  const inpRecibido = qs('#monto_recibido');
  inpRecibido.addEventListener('input', e => {
    const total   = parseFloat(qs('#total_view').value) || 0;
    const recibio = parseFloat(e.target.value) || 0;
    qs('#cambio_view').textContent = (recibio - total).toFixed(2);

    const { summaryEl, codigoEl, montoEl } = getCurrentPagoEls();
    codigoEl.value = '01';
    montoEl.value  = total.toFixed(2); // montoPago = total factura
    summaryEl.textContent = `Efectivo – $${total.toFixed(2)} (Cambio: ${ (recibio-total).toFixed(2) })`;
  });
}


  if (method === 'card') {
  paymentDetailsContainer.innerHTML = paymentTemplates.card;
  const { summaryEl, codigoEl, montoEl, refEl } = getCurrentPagoEls();

  // preseleccionar botón guardado
  qsa('.payment-card-type-btn').forEach(btn => {
    const active = btn.dataset.cardType === codigoEl.value;
    btn.classList.toggle('bg-blue-200', active);
    btn.classList.toggle('border-blue-400', active);
  });

  // listeners
  qsa('.payment-card-type-btn').forEach(btn =>
    btn.addEventListener('click', e => {
      qsa('.payment-card-type-btn').forEach(b =>
        b.classList.remove('bg-blue-200','border-blue-400')
      );
      e.currentTarget.classList.add('bg-blue-200','border-blue-400');
      codigoEl.value = e.currentTarget.dataset.cardType;

      const label = codigoEl.value === '02' ? 'Tarjeta Débito' : 'Tarjeta Crédito';
      summaryEl.textContent = `${label} – $${montoEl.value}` +
        (refEl.value ? ` (Ref: ${refEl.value})` : '');
    })
  );

  qs('#card_referencia').value = refEl.value || '';
  qs('#card_referencia').addEventListener('input', e => {
    refEl.value = e.target.value;
    const label = codigoEl.value === '02' ? 'Tarjeta Débito' : 'Tarjeta Crédito';
    summaryEl.textContent = `${label} – $${montoEl.value}` +
      (refEl.value ? ` (Ref: ${refEl.value})` : '');
  });
}


  if (method === 'other') {
    const select = qs('#other_payment_method');
    window.formasPago
      .filter(fp => !['01','02','03'].includes(fp.codigo))
      .forEach(fp => {
        const opt = document.createElement('option');
        opt.value = fp.codigo;
        opt.textContent = `${fp.codigo} – ${fp.descripcion}`;
        select.appendChild(opt);
      });
    select.addEventListener('change', e => {
      codigoEl.value = e.target.value;
    });
    qs('#other_referencia').addEventListener('input', e => {
      refEl.value = e.target.value;
    });
  }



  function updatePaymentDetails(method) {
  paymentDetailsContainer.innerHTML = paymentTemplates[method] || '';
  const { summaryEl, codigoEl, montoEl, refEl } = getCurrentPagoEls();

  // monto siempre es el total
  montoEl.value = qs('#total_view').value || '';

  if (method === 'cash') {
    qs('#monto_recibido').addEventListener('input', e => {
      const total = parseFloat(qs('#total_view').value) || 0;
      const rec   = parseFloat(e.target.value) || 0;
      qs('#cambio_view').textContent = (rec - total).toFixed(2);
      codigoEl.value = '01';
      // **resumen**
      summaryEl.textContent = `Efectivo – $${montoEl.value}`;
    });
  }

  if (method === 'card') {
    qsa('.payment-card-type-btn').forEach(btn =>
      btn.addEventListener('click', e => {
        qsa('.payment-card-type-btn').forEach(b =>
          b.classList.remove('bg-blue-200','border-blue-400')
        );
        e.currentTarget.classList.add('bg-blue-200','border-blue-400');

        const tipo = e.currentTarget.dataset.cardType;
        codigoEl.value = tipo;
        summaryEl.textContent = 
          (tipo === '02' ? 'Tarjeta Débito' : 'Tarjeta Crédito') +
          ` – $${montoEl.value}`;
      })
    );
    qs('#card_referencia').addEventListener('input', e => {
      refEl.value = e.target.value;
      summaryEl.textContent += ` (Ref: ${e.target.value})`;
    });
  }

  if (method === 'other') {
    const select = qs('#other_payment_method');
    window.formasPago
      .filter(fp => !['01','02','03'].includes(fp.codigo))
      .forEach(fp => {
        const opt = document.createElement('option');
        opt.value = fp.codigo;
        opt.textContent = `${fp.codigo} – ${fp.descripcion}`;
        select.appendChild(opt);
      });
    select.addEventListener('change', e => {
      codigoEl.value = e.target.value;
      const desc = window.formasPago.find(fp=>fp.codigo===e.target.value).descripcion;
      summaryEl.textContent = `${desc} – $${montoEl.value}`;
    });
    qs('#other_referencia').addEventListener('input', e => {
      refEl.value = e.target.value;
      summaryEl.textContent += ` (Ref: ${e.target.value})`;
    });
  }
}





}


// ——— Autocomplete por nombre ———
const suggestions = qs('#cliente-suggestions');
let debounceTimer;

inputDoc.addEventListener('input', e => {
  const q = e.target.value.trim();
  clearTimeout(debounceTimer);

  if (/^\d/.test(q) || q.length < 3) {
    suggestions.classList.add('hidden');
    return;
  }

  debounceTimer = setTimeout(async () => {
    try {
      const res = await fetch( `${rutaNombre}?name=${encodeURIComponent(q)}`, { headers:{ 'Accept':'application/json' } }
  );

      const list = await res.json();
      if (!list.length) {
        suggestions.classList.add('hidden');
        return;
      }
      suggestions.innerHTML = list.map(c => `
        <div
          class="px-3 py-2 hover:bg-gray-100 cursor-pointer"
          data-doc="${c.dui||c.nit}"
          data-json='${JSON.stringify(c)}'
        >
          ${c.nombre} — ${c.dui||c.nit}
        </div>
      `).join('');
      suggestions.classList.remove('hidden');
    } catch {
      suggestions.classList.add('hidden');
    }
  }, 300);
});

suggestions.addEventListener('click', e => {
  const item = e.target.closest('div[data-doc]');
  if (!item) return;
  const client = JSON.parse(item.dataset.json);
  const doc = item.dataset.doc;

  suggestions.classList.add('hidden');
  inputDoc.value = doc;
  buscarYCompletar(doc);

  vNombre.value    = client.nombre;
  vCorreo.value    = client.correo;
  vDireccion.value = client.direccion;
  vTelefono.value  = client.telefono;
  vDepMun.value    = `${client.departamento||''} / ${client.municipio||''}`;
});

inputDoc.addEventListener('blur', () => {
  setTimeout(() => suggestions.classList.add('hidden'), 200);
});


      // ---------- Autocompletar cliente ----------
      
      const statusEl = qs('#cliente-status');
      const vNombre = qs('#cliente_nombre_view');
      const vCorreo = qs('#cliente_correo_view');
      const vDireccion = qs('#cliente_direccion_view');
      const vTelefono = qs('#cliente_telefono_view');
      const vDepMun = qs('#cliente_depmun_view');
      const hTipo = qs('#receptor_tipoDocumento');
      const hNum  = qs('#receptor_numDocumento');
      const hNrc  = qs('#receptor_nrc');
      const hNombre = qs('#receptor_nombre');
      const hCodAct = qs('#receptor_codActividad');
      const hDescAct = qs('#receptor_descActividad');
      const hDep = qs('#receptor_direccion_departamento');
      const hMun = qs('#receptor_direccion_municipio');
      const hComp = qs('#receptor_direccion_complemento');
      const hTel = qs('#receptor_telefono');
      const hCorreo = qs('#receptor_correo');
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
              vNombre.value = d.nombre ?? '';
              vCorreo.value = d.correo ?? '';
              vDireccion.value = (d.complemento ?? d.direccion ?? '');
              vTelefono.value = d.telefono ?? '';
              vDepMun.value = ((d.departamento ?? '') + ' / ' + (d.municipio ?? '')).trim();
              hNum.value = d.nit ?? d.dui ?? doc;
              hTipo.value = d.nit ? '02' : (d.dui ? '13' : '13');
              hNrc.value = d.nrc ?? '';
              hNombre.value = d.nombre ?? '';
              hCodAct.value = d.cod_actividad ?? '';
              hDescAct.value = d.desc_actividad ?? '';
              hDep.value = d.departamento ?? '';
              hMun.value = d.municipio ?? '';
              hComp.value = (d.complemento ?? d.direccion ?? '');
              hTel.value = d.telefono ?? '';
              hCorreo.value = d.correo ?? '';
              statusEl.textContent = 'Cliente encontrado.';
            } else {
              clearCliente();
              statusEl.textContent = 'Cliente no encontrado. Puede registrarlo.';
              openClienteModalWithNumber(doc);
            }
          } else {
            clearCliente();
            statusEl.textContent = 'Cliente no encontrado. Puede registrarlo.';
            openClienteModalWithNumber(doc);
          }
        } catch (e) {
          console.error(e);
          statusEl.textContent = 'Error de conexión.';
        }
      }

      function clearCliente() { /* ... */ }
      function openClienteModalWithNumber(doc) { /* ... */ }

      inputDoc.addEventListener('blur', () => buscarYCompletar(inputDoc.value.trim()));
      inputDoc.addEventListener('keydown', (e) => { if (e.key === 'Enter') { e.preventDefault(); buscarYCompletar(inputDoc.value.trim()); } });

      // ... (código del modal de cliente)

      calcTotals(); // Cómputo inicial
    });
  </script>
  <!-- ── Autocomplete Productos ── -->

<script>
document.addEventListener('DOMContentLoaded', () => {
  const route = '{{ route("productos.autocomplete") }}';
  const tbody = document.querySelector('#items-body');

  // delegamos el input en tbody
  tbody.addEventListener('input', e => {
    if (!e.target.matches('.item-busqueda')) return;

    const input     = e.target;
    const row       = input.closest('tr');
    const suggestEl = row.querySelector('.item-suggestions');
    const q         = input.value.trim();

    clearTimeout(input._debounce);
    if (q.length < 2) {
      suggestEl.innerHTML = '';
      return suggestEl.classList.add('hidden');
    }

    input._debounce = setTimeout(async () => {
      let res, text, items;
      try {
        res = await fetch(
          `${route}?query=${encodeURIComponent(q)}`,
          {
            headers:     { 'Accept': 'application/json' },
            credentials: 'same-origin'           // <— aquí
          }
        );

        console.log('Autocomplete status:', res.status);
        const contentType = res.headers.get('Content-Type') || '';
        console.log('Content-Type:', contentType);

        // Si no es JSON, apuntamos el body para debug
        if (!contentType.includes('application/json')) {
          text = await res.text();
          console.error('Respuesta inesperada:', text);
          throw new Error('No JSON');
        }

        items = await res.json();
        console.log('Autocomplete items:', items);
      }
      catch (err) {
        // muestra por qué falló
        console.warn('Autocomplete error:', err);
        suggestEl.innerHTML = '';
        return suggestEl.classList.add('hidden');
      }

      if (!items.length) {
  suggestEl.innerHTML = '';

  // Si NO gestiona stock, permitimos crear producto libre
  if (!window.gestionaStock) {
    suggestEl.innerHTML = `
      <div
        class="px-3 py-2 cursor-pointer text-blue-600"
        data-free
      >
        Sin coinsidencias, agregar como: "${q}"
      </div>`;
    suggestEl.classList.remove('hidden');
    return;
  }

  // Si sí gestiona stock, simplemente ocultamos
  return suggestEl.classList.add('hidden');
}


      // pinta sugerencias
      suggestEl.innerHTML = items.map(p => `
        <div
          class="px-3 py-2 flex justify-between ${
            p.disabled
              ? 'text-gray-400 cursor-not-allowed'
              : 'hover:bg-gray-100 cursor-pointer'
          }"
          data-json='${JSON.stringify(p)}'
        >
          <span>${p.codigo} – ${p.descripcion}</span>
          <span>${p.precio.toFixed(2)}</span>
        </div>
      `).join('');
      suggestEl.classList.remove('hidden');
    }, 200);
  });

  // click sobre sugerencia o libre
tbody.addEventListener('click', e => {
  // ————— Producto libre —————
  const freeDiv = e.target.closest('.item-suggestions > div[data-free]');
  if (freeDiv) {
    const row = freeDiv.closest('tr');
    const q   = row.querySelector('.item-busqueda').value.trim();

    // limpia hidden y pone descripción
    row.querySelector('.item-producto-id').value    = '';
    row.querySelector('.item-unidad-codigo').value  = '';
    row.querySelector('.item-descripcion').value    = q;
    row.querySelector('.precio-input').value        = '';
    // limpia el campo de código
    row.querySelector('.item-busqueda').value       = '';
    // opcional: reset cantidad a 1
    row.querySelector('.cantidad-input').value       = 1;

    freeDiv.parentElement.classList.add('hidden');
    calcTotals();    // recalcula totales
    return;
  }

  // ——— Producto existente ———
  const div = e.target.closest('.item-suggestions > div[data-json]');
  if (!div) return;

  const p   = JSON.parse(div.dataset.json);
  if (p.disabled) return;

  const row         = div.closest('tr');
  const busc        = row.querySelector('.item-busqueda');
  const prodIdIn    = row.querySelector('.item-producto-id');
  const uniCodIn    = row.querySelector('.item-unidad-codigo');
  const descIn      = row.querySelector('.item-descripcion');
  const precioIn    = row.querySelector('.precio-input');
  const cantidadIn  = row.querySelector('.cantidad-input');

  // limpia el buscador y llena los campos
  busc.value         = '';
  prodIdIn.value     = p.id;
  uniCodIn.value     = p.unidad_codigo;
  descIn.value       = p.descripcion;
  precioIn.value     = p.precio.toFixed(2);

  // oculta el dropdown
  div.parentElement.classList.add('hidden');

  // fuerza el evento input para que tu listener de totales lo capte
  precioIn.dispatchEvent(new Event('input', { bubbles: true }));
  cantidadIn.dispatchEvent(new Event('input', { bubbles: true }));
});

  // clic fuera cierra todos
  document.addEventListener('click', e => {
    if (!e.target.closest('.item-busqueda')) {
      tbody.querySelectorAll('.item-suggestions')
           .forEach(el => el.classList.add('hidden'));
    }
  });
});
</script>


  @endpush

</x-app-layout>