<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Cambia respuesta_json a LONGTEXT NULL y codigo_generacion a VARCHAR NULL
        DB::statement("ALTER TABLE `dtes` MODIFY `respuesta_json` LONGTEXT NULL");
        DB::statement("ALTER TABLE `dtes` MODIFY `codigo_generacion` VARCHAR(255) NULL");
    }

    public function down(): void
    {
        // Revertir: volver a NOT NULL (cuidado: si hay filas con NULL fallará el revert)
        DB::statement("ALTER TABLE `dtes` MODIFY `respuesta_json` LONGTEXT NOT NULL");
        DB::statement("ALTER TABLE `dtes` MODIFY `codigo_generacion` VARCHAR(255) NOT NULL");
    }
};
