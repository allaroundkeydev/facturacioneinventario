<?php
// database/migrations/2025_08_07_XXXX_add_gestiona_stock_to_empresas_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('empresas', function (Blueprint $table) {
            // indicador de si maneja o no inventario
            $table->boolean('gestiona_stock')
                  ->default(false)
                  ->after('api_password');
        });
    }

    public function down(): void
    {
        Schema::table('empresas', function (Blueprint $table) {
            $table->dropColumn('gestiona_stock');
        });
    }
};
