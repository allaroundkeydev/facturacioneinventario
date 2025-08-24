<?php
// app/Http/Controllers/DTE/EnviarDteController.php
namespace App\Http\Controllers\DTE;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use App\Models\Dte;
use App\Services\DTEService;
use App\Services\CcfDteService;
use Exception;
use Illuminate\Support\Facades\Log;

class EnviarDteController extends Controller
{
    protected DTEService $dteService;
    protected CcfDteService $ccfService;

    public function __construct(DTEService $dteService, CcfDteService $ccfService)
    {
        $this->dteService = $dteService;
        $this->ccfService  = $ccfService;
    }

    /**
     * Envía un DTE específico a Hacienda
     *
     * @param  Dte  $dte
     * @return RedirectResponse
     */
    public function enviar(Dte $dte): RedirectResponse
    {
        try {
            if ($dte->estado !== 'PENDIENTE') {
                return redirect()->route('dte.index')
                    ->with('error', 'El DTE no está en estado pendiente de envío.');
            }

            // Determinar tipo: preferir $dte->tipo (si lo guardaste), sino leer del json
            $tipo = $dte->tipo ?? ($dte->dte_json['identificacion']['tipoDte'] ?? null);
            $tipo = is_string($tipo) ? ltrim($tipo, '0') : $tipo; // por si viene '03' o '3'

            // Elegir servicio según tipo
            if ((string)$tipo === '3' || (string)$tipo === '03') {
                // CCF -> usar servicio específico
                $result = $this->ccfService->emitir($dte);
            } else {
                // Default: usar servicio general (factura u otros)
                $result = $this->dteService->emitir($dte);
            }

            return redirect()->route('dte.index')
                ->with('success', 'DTE enviado correctamente. Estado: ' . ($result['estado'] ?? 'N/A'));
        } catch (Exception $e) {
            Log::error("Error al enviar DTE id={$dte->id}: " . $e->getMessage(), [
                'trace' => $e->getTraceAsString()
            ]);
            return redirect()->route('dte.index')
                ->with('error', 'Error al enviar el DTE: ' . $e->getMessage());
        }
    }

    /**
     * Envía todos los DTEs pendientes a Hacienda
     *
     * @return RedirectResponse
     */
    public function enviarPendientes(): RedirectResponse
    {
        $enviados = 0;
        $errores = 0;

        $dtesPendientes = Dte::where('estado', 'PENDIENTE')->get();

        foreach ($dtesPendientes as $dte) {
            try {
                $tipo = $dte->tipo ?? ($dte->dte_json['identificacion']['tipoDte'] ?? null);
                $tipo = is_string($tipo) ? ltrim($tipo, '0') : $tipo;

                if ((string)$tipo === '3' || (string)$tipo === '03') {
                    $this->ccfService->emitir($dte);
                } else {
                    $this->dteService->emitir($dte);
                }
                $enviados++;
            } catch (Exception $e) {
                $errores++;
                Log::error("Error al enviar DTE id={$dte->id}: " . $e->getMessage(), [
                    'trace' => $e->getTraceAsString()
                ]);
            }
        }

        return redirect()->route('dte.index')
            ->with('success', "Proceso completado. Enviados: {$enviados}. Errores: {$errores}.");
    }
}
