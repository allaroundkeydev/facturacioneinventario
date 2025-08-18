<?php
namespace App\Helpers;

use NumberFormatter;

class DteHelper
{
    public static function uuidV4(): string
    {
        $data = random_bytes(16);
        $data[6] = chr((ord($data[6]) & 0x0f) | 0x40);
        $data[8] = chr((ord($data[8]) & 0x3f) | 0x80);
        $hex = bin2hex($data);

        return strtoupper(
            substr($hex,  0,  8) . '-' .
            substr($hex,  8,  4) . '-' .
            substr($hex, 12,  4) . '-' .
            substr($hex, 16,  4) . '-' .
            substr($hex, 20, 12)
        );
    }

    public static function numeroALetras(float $numero): string
    {
        $formatter = new NumberFormatter("es", NumberFormatter::SPELLOUT);
        $partes = explode('.', number_format($numero, 2, '.', ''));
        $entero = $formatter->format($partes[0]);
        $centavos = str_pad($partes[1], 2, '0', STR_PAD_RIGHT);

        if ($centavos === '00') {
            return strtoupper("$entero DÓLARES");
        }
        return strtoupper("$entero DÓLARES CON $centavos CENTAVOS");
    }
}
