<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('clientes', function (Blueprint $table) {
            // NRC del cliente (cuando es contribuyente)
            $table->string('nrc', 12)->nullable()->after('nombre');

            // Código y descripción de actividad económica (para el receptor)
            $table->string('cod_actividad', 10)->nullable()->after('nrc');
            $table->string('desc_actividad', 255)->nullable()->after('cod_actividad');

            // Si quieres, puedes añadir índices si se van a buscar por esos campos:
            $table->index('nrc');
            $table->index('cod_actividad');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('clientes', function (Blueprint $table) {
            // Primero quitar índices (si existen)
            $sm = Schema::getConnection()->getDoctrineSchemaManager();
            if ($table->hasColumn('nrc')) {
                $table->dropIndex([$table->getTable() . '_nrc_index']);
            }
            if ($table->hasColumn('cod_actividad')) {
                $table->dropIndex([$table->getTable() . '_cod_actividad_index']);
            }

            // Después las columnas
            $table->dropColumn(['nrc', 'cod_actividad', 'desc_actividad']);
        });
    }
};
