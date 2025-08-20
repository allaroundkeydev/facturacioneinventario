<?php
// app/Http/Controllers/DTE/EnviarDteController.php
namespace App\Http\Controllers\DTE;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use App\Models\Dte;
use App\Services\DTEService;
use Exception;
use Illuminate\Support\Facades\Log;

class EnviarDteController extends Controller
{
    protected DTEService $dteService;

    public function __construct(DTEService $dteService)
    {
        $this->dteService = $dteService;
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

            $result = $this->dteService->emitir($dte);

            return redirect()->route('dte.index')
                ->with('success', 'DTE enviado correctamente. Estado: ' . ($result['estado'] ?? 'N/A'));
        } catch (Exception $e) {
            Log::error("Error al enviar DTE id={$dte->id}: " . $e->getMessage());
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
                $this->dteService->emitir($dte);
                $enviados++;
            } catch (Exception $e) {
                $errores++;
                Log::error("Error al enviar DTE id={$dte->id}: " . $e->getMessage());
            }
        }

        return redirect()->route('dte.index')
            ->with('success', "Proceso completado. Enviados: {$enviados}. Errores: {$errores}.");
    }
}
