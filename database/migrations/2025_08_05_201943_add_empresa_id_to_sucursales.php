<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // 1) Añadir la columna empresa_id (nullable para el llenado inicial)
        Schema::table('sucursales', function (Blueprint $table) {
            $table->unsignedBigInteger('empresa_id')->nullable()->after('id');
        });

        // 2) Rellenar empresa_id para las filas existentes
        //    Si sólo tienes una empresa y su id es 1, puedes usar:
      //  DB::table('sucursales')->update(['empresa_id' => 1]);

        // 3) Hacer la columna no nullable y crear la FK
        Schema::table('sucursales', function (Blueprint $table) {
            $table->unsignedBigInteger('empresa_id')->nullable(false)->change();
            $table->foreign('empresa_id')
                  ->references('id')
                  ->on('empresas')
                  ->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::table('sucursales', function (Blueprint $table) {
            $table->dropForeign(['empresa_id']);
            $table->dropColumn('empresa_id');
        });
    }
};
