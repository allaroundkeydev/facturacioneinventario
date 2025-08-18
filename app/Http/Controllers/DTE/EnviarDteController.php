<?php
//app\Http\Controllers\DTE\EnviarDteController.php
namespace App\Http\Controllers\DTE;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use App\Models\Dte;
use App\Services\DTEService;
use Exception;

class EnviarDteController extends Controller
{
    protected $dteService;

    public function __construct(DTEService $dteService)
    {
        $this->dteService = $dteService;
    }

    /**
     * Envía un DTE específico a Hacienda
     *
     * @param Dte $dte
     * @return RedirectResponse
     */
    public function enviar(Dte $dte): RedirectResponse
    {
        try {
            // Verificar que el DTE esté en estado PENDIENTE
            if ($dte->estado !== 'PENDIENTE') {
                return redirect()->back()->with('error', 'El DTE no está en estado pendiente de envío.');
            }

            // Enviar el DTE usando el servicio
            $response = $this->dteService->emitirFactura($dte);

            return redirect()->back()->with('success', 'DTE enviado correctamente a Hacienda. Estado: ' . $response['estado']);
        } catch (Exception $e) {
            return redirect()->back()->with('error', 'Error al enviar el DTE: ' . $e->getMessage());
        }
    }

    /**
     * Envía todos los DTEs pendientes a Hacienda
     *
     * @return RedirectResponse
     */
    public function enviarPendientes(): RedirectResponse
    {
        try {
            // Obtener todos los DTEs pendientes
            $dtesPendientes = Dte::where('estado', 'PENDIENTE')->get();

            $enviados = 0;
            $errores = 0;

            foreach ($dtesPendientes as $dte) {
                try {
                    // Enviar el DTE usando el servicio
                    $this->dteService->emitirFactura($dte);
                    $enviados++;
                } catch (Exception $e) {
                    $errores++;
                    \Log::error('Error al enviar DTE ID ' . $dte->id . ': ' . $e->getMessage());
                }
            }

            return redirect()->back()->with('success', "Proceso completado. Enviados: $enviados. Errores: $errores.");
        } catch (Exception $e) {
            return redirect()->back()->with('error', 'Error al procesar los DTEs pendientes: ' . $e->getMessage());
        }
    }
}