<x-app-layout>
  <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">Forma de pago</h2>
  </x-slot>

  <div class="py-6">
    <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
      <div class="bg-white p-6 rounded-2xl shadow">
        <p class="text-sm text-gray-600 mb-4">Total a pagar: <strong>${{ number_format($total, 2) }}</strong></p>

        <form action="{{ $isCcf ? route('dte.ccf.confirmar') : route('dte.confirmar') }}" method="POST" id="pagoForm">
          @csrf

          <div class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">Seleccione una opción</label>

              <div class="grid grid-cols-1 md:grid-cols-3 gap-3">
                <label class="border rounded p-3 flex items-center gap-2">
                  <input type="radio" name="pago_tipo" value="efectivo" required>
                  <span>Billetes y monedas</span>
                </label>
                <label class="border rounded p-3 flex items-center gap-2">
                  <input type="radio" name="pago_tipo" value="tarjeta">
                  <span>Tarjeta Débito/Crédito</span>
                </label>
                <label class="border rounded p-3 flex items-center gap-2">
                  <input type="radio" name="pago_tipo" value="otras">
                  <span>Otras formas de pago</span>
                </label>
              </div>
            </div>

            <!-- EFECTIVO -->
            <div id="box-efectivo" class="hidden border rounded p-3">
              <div class="grid grid-cols-1 md:grid-cols-3 gap-3 items-end">
                <div>
                  <label class="block text-sm">Monto entregado</label>
                  <input type="number" step="0.01" class="mt-1 w-full border rounded" name="efectivo_monto" />
                </div>
                <div>
                  <label class="block text-sm">Cambio</label>
                  <input type="text" class="mt-1 w-full border rounded bg-gray-50" id="efectivo_cambio" readonly />
                </div>
              </div>
              <p class="text-xs text-gray-500 mt-2">En el JSON solo se enviará el código 01 y el monto cobrado. El cambio no se incluye.</p>
            </div>

            <!-- TARJETA -->
            <div id="box-tarjeta" class="hidden border rounded p-3">
              <div class="grid grid-cols-1 md:grid-cols-3 gap-3">
                <div>
                  <label class="block text-sm">Tipo de tarjeta</label>
                  <select class="mt-1 w-full border rounded" name="tarjeta_codigo">
                    <option value="02">Débito</option>
                    <option value="03">Crédito</option>
                  </select>
                </div>
                <div>
                  <label class="block text-sm">Monto</label>
                  <input type="number" step="0.01" class="mt-1 w-full border rounded" name="tarjeta_monto" />
                </div>
                <div>
                  <label class="block text-sm">Referencia (opcional)</label>
                  <input type="text" maxlength="50" class="mt-1 w-full border rounded" name="tarjeta_referencia" />
                </div>
              </div>
            </div>

            <!-- OTRAS -->
            <div id="box-otras" class="hidden border rounded p-3">
              <p class="text-sm text-gray-700 mb-2">Selecciona una o más formas</p>
              <div class="space-y-2">
                @foreach($formasPago as $fp)
                  @if(!in_array($fp->codigo, ['01','02','03']))
                    <div class="grid grid-cols-1 md:grid-cols-5 gap-2 items-end">
                      <div class="md:col-span-2">
                        <label class="block text-xs text-gray-500">{{ $fp->descripcion }} ({{ $fp->codigo }})</label>
                        <input type="hidden" name="otras[{{ $fp->codigo }}][codigo]" value="{{ $fp->codigo }}">
                      </div>
                      <div>
                        <label class="block text-xs text-gray-500">Monto</label>
                        <input type="number" step="0.01" name="otras[{{ $fp->codigo }}][monto]" class="w-full border rounded" />
                      </div>
                      <div>
                        <label class="block text-xs text-gray-500">Referencia</label>
                        <input type="text" maxlength="50" name="otras[{{ $fp->codigo }}][referencia]" class="w-full border rounded" />
                      </div>
                      <div>
                        <label class="block text-xs text-gray-500">Plazo/Periodo</label>
                        <div class="flex gap-2">
                          <select name="otras[{{ $fp->codigo }}][plazo]" class="border rounded">
                            <option value="">—</option>
                            @foreach($plazos as $pz)
                              <option value="{{ $pz->codigo }}">{{ $pz->descripcion }}</option>
                            @endforeach
                          </select>
                          <input type="number" step="1" min="1" name="otras[{{ $fp->codigo }}][periodo]" class="w-20 border rounded" />
                        </div>
                      </div>
                    </div>
                  @endif
                @endforeach
              </div>
              <p class="text-xs text-gray-500 mt-2">Incluiremos plazo y periodo solo si los especificas.</p>
            </div>
          </div>

          <div class="mt-6 flex justify-end">
            <button type="submit" class="px-6 py-2 bg-blue-600 text-white rounded-xl">Confirmar y generar DTE</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  @push('scripts')
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const total = {{ json_encode($total) }};
      const radios = document.querySelectorAll('input[name="pago_tipo"]');

      const boxEf = document.getElementById('box-efectivo');
      const boxTar = document.getElementById('box-tarjeta');
      const boxOtr = document.getElementById('box-otras');

      function showBox(val) {
        boxEf.classList.toggle('hidden', val !== 'efectivo');
        boxTar.classList.toggle('hidden', val !== 'tarjeta');
        boxOtr.classList.toggle('hidden', val !== 'otras');
      }
      radios.forEach(r => r.addEventListener('change', e => showBox(e.target.value)));

      // Cambio en efectivo
      const inEf = document.querySelector('input[name="efectivo_monto"]');
      const outCambio = document.getElementById('efectivo_cambio');
      inEf?.addEventListener('input', () => {
        const entregado = parseFloat(inEf.value || 0);
        const cambio = Math.max(0, entregado - total);
        outCambio.value = cambio.toFixed(2);
      });
    });
  </script>
  @endpush
</x-app-layout>