<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Registrar Pago para DTE') }}
        </h2>
    </x-slot>

    <div class="py-6">
        <div class="max-w-4xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white p-6 rounded-2xl shadow">

                @if(session('error'))
                    <div class="mb-4 p-3 bg-red-50 text-red-700 rounded">{{ session('error') }}</div>
                @endif

                <div class="mb-4 p-4 bg-blue-50 border border-blue-200 rounded-lg">
                    <h3 class="font-bold text-lg text-blue-800">Total a Pagar: ${{ number_format($totalPagar, 2) }}</h3>
                    <p class="text-sm text-blue-600">DTE Interno ID: {{ $dte->id }}</p>
                </div>

                <form action="{{ route('dte.payment.store', ['dte' => $dte->id]) }}" method="POST" id="paymentForm">
                    @csrf

                    <h3 class="font-semibold mb-2">Formas de Pago</h3>
                    <div id="pagos-container" class="space-y-4"></div>

                    <div class="mt-3 flex justify-between items-center">
                        <button id="add-pago" type="button" class="px-4 py-2 bg-gray-200 rounded">Agregar Forma de Pago</button>
                        <div>
                            <span class="font-medium">Monto Restante:</span>
                            <span id="monto-restante" class="font-bold text-lg">${{ number_format($totalPagar, 2) }}</span>
                        </div>
                    </div>

                    <hr class="my-6">

                    <div id="cash-section" class="hidden p-4 border rounded-md bg-gray-50">
                        <label class="block text-sm font-medium text-gray-700">Monto Recibido (Efectivo)</label>
                        <input type="number" id="monto-recibido" class="mt-1 block w-40 border-gray-300 rounded-md shadow-sm" step="0.01">
                        <div class="mt-2">
                            <span class="font-medium">Cambio a dar:</span>
                            <span id="cambio-a-dar" class="font-bold text-lg">$0.00</span>
                        </div>
                    </div>

                    <div class="mt-6 flex justify-end">
                        <button type="submit" id="submit-button" class="px-6 py-2 bg-blue-600 text-white rounded-xl shadow hover:bg-blue-700 disabled:opacity-50">
                            Finalizar y Generar DTE
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    @push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const totalPagar = {{ $totalPagar }};
            const formasPago = @json($formasPago);
            const container = document.getElementById('pagos-container');
            const addBtn = document.getElementById('add-pago');
            const montoRestanteEl = document.getElementById('monto-restante');
            const submitButton = document.getElementById('submit-button');
            const cashSection = document.getElementById('cash-section');
            const montoRecibidoInput = document.getElementById('monto-recibido');
            const cambioADarEl = document.getElementById('cambio-a-dar');

            let pagoCounter = 0;

            function createPagoRow() {
                const idx = pagoCounter++;
                const row = document.createElement('div');
                row.classList.add('pago-row', 'p-3', 'border', 'rounded-md', 'grid', 'grid-cols-1', 'md:grid-cols-4', 'gap-3');

                let options = formasPago.map(fp => `<option value="${fp.codigo}">${fp.descripcion}</option>`).join('');

                row.innerHTML = `
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Forma de Pago</label>
                        <select name="pagos[${idx}][codigo]" class="pago-codigo mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                            ${options}
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Monto</label>
                        <input type="number" name="pagos[${idx}][montoPago]" class="pago-monto mt-1 block w-full border-gray-300 rounded-md shadow-sm" step="0.01" required>
                    </div>
                    <div class="referencia-plazo-container"></div>
                    <div>
                        <button type="button" class="remove-pago mt-6 px-3 py-2 text-red-600">Eliminar</button>
                    </div>
                `;

                container.appendChild(row);
                updateDynamicFields(row.querySelector('.pago-codigo'));
            }

            function updateDynamicFields(selectElement) {
                const selectedCodigo = selectElement.value;
                const container = selectElement.closest('.pago-row').querySelector('.referencia-plazo-container');
                const idx = selectElement.name.match(/\d+/)[0];

                let content = '';
                if (['02', '03', '04', '05', '08', '09'].includes(selectedCodigo)) { // Tarjetas, cheque, transferencia, etc.
                    content = `
                        <label class="block text-sm font-medium text-gray-700">Referencia</label>
                        <input type="text" name="pagos[${idx}][referencia]" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                    `;
                } else if (selectedCodigo === '13') { // Crédito
                    content = `
                        <div class="grid grid-cols-2 gap-2">
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Plazo</label>
                                <input type="text" name="pagos[${idx}][plazo]" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Periodo</label>
                                <input type="number" name="pagos[${idx}][periodo]" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                            </div>
                        </div>
                    `;
                }
                container.innerHTML = content;
            }

            function updateTotals() {
                let totalPagado = 0;
                document.querySelectorAll('.pago-monto').forEach(input => {
                    totalPagado += parseFloat(input.value) || 0;
                });

                const restante = totalPagar - totalPagado;
                montoRestanteEl.textContent = `$${restante.toFixed(2)}`;

                if (restante <= 0.009) { // Allow for small floating point inaccuracies
                    montoRestanteEl.classList.add('text-green-600');
                    montoRestanteEl.classList.remove('text-red-600');
                    submitButton.disabled = false;
                } else {
                    montoRestanteEl.classList.add('text-red-600');
                    montoRestanteEl.classList.remove('text-green-600');
                    submitButton.disabled = true;
                }

                // Handle cash payment section
                const hasCashPayment = !!document.querySelector('select.pago-codigo option[value="01"]:checked');
                if(hasCashPayment) {
                    cashSection.classList.remove('hidden');
                } else {
                    cashSection.classList.add('hidden');
                    montoRecibidoInput.value = '';
                    cambioADarEl.textContent = '$0.00';
                }
            }

            function updateChange() {
                const montoEfectivo = parseFloat(document.querySelector('select.pago-codigo option[value="01"]:checked')?.closest('.pago-row').querySelector('.pago-monto').value) || 0;
                const recibido = parseFloat(montoRecibidoInput.value) || 0;
                if (recibido > 0 && montoEfectivo > 0 && recibido >= montoEfectivo) {
                    const cambio = recibido - montoEfectivo;
                    cambioADarEl.textContent = `$${cambio.toFixed(2)}`;
                } else {
                    cambioADarEl.textContent = '$0.00';
                }
            }

            addBtn.addEventListener('click', createPagoRow);

            container.addEventListener('change', e => {
                if (e.target.classList.contains('pago-codigo')) {
                    updateDynamicFields(e.target);
                    updateTotals();
                }
            });

            container.addEventListener('input', e => {
                if (e.target.classList.contains('pago-monto')) {
                    updateTotals();
                }
            });

            container.addEventListener('click', e => {
                if (e.target.classList.contains('remove-pago')) {
                    e.target.closest('.pago-row').remove();
                    updateTotals();
                }
            });

            montoRecibidoInput.addEventListener('input', updateChange);

            // Initial state
            createPagoRow();
            updateTotals();
        });
    </script>
    @endpush
</x-app-layout>