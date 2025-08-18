<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Corregir los JSONs que tienen barras invertidas dobles
        DB::table('dtes')->where('dte_json', 'LIKE', '"%')
            ->update(['dte_json' => DB::raw("REPLACE(dte_json, '\\\\\\\\', '\\\\')")]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // No es necesario revertir este cambio
    }
};
