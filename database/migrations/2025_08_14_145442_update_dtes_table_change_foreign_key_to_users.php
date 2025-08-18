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
        Schema::table('dtes', function (Blueprint $table) {
            // Eliminar la clave foránea existente
            $table->dropForeign(['usuario_id']);
            
            // Cambiar la clave foránea a la tabla users
            $table->foreign('usuario_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('dtes', function (Blueprint $table) {
            // Eliminar la clave foránea a users
            $table->dropForeign(['usuario_id']);
            
            // Restaurar la clave foránea a la tabla usuarios
            $table->foreign('usuario_id')->references('id')->on('usuarios')->onDelete('cascade');
        });
    }
};
