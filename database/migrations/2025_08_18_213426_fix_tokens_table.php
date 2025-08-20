<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up()
    {
        // Backup manual: te recomiendo hacer backup DB antes de ejecutar
        // Intentamos renombrar columna usuario_id -> empresa_id si existe
        if (Schema::hasTable('tokens')) {
            // Si existe columna usuario_id y no existe empresa_id, renombramos
            if (Schema::hasColumn('tokens', 'usuario_id') && ! Schema::hasColumn('tokens', 'empresa_id')) {
                // renameColumn puede necesitar doctrine/dbal; fallback a raw SQL si no está disponible
                try {
                    Schema::table('tokens', function (Blueprint $table) {
                        $table->renameColumn('usuario_id', 'empresa_id');
                    });
                } catch (\Throwable $e) {
                    // Fallback SQL (MySQL)
                    DB::statement('ALTER TABLE tokens CHANGE usuario_id empresa_id BIGINT UNSIGNED');
                }
            }

            // Asegurar campo empresa_id es unsigned big int
            Schema::table('tokens', function (Blueprint $table) {
                $table->unsignedBigInteger('empresa_id')->change();
            });

            // Eliminar FK antigua si existe (nombre común tokens_usuario_id_foreign)
            try {
                DB::statement('ALTER TABLE tokens DROP FOREIGN KEY tokens_usuario_id_foreign');
            } catch (\Throwable $e) {
                // ignore - posiblemente no existía
            }

            // Añadir FK hacia empresas(id)
            Schema::table('tokens', function (Blueprint $table) {
                $table->foreign('empresa_id')->references('id')->on('empresas')->onDelete('cascade');
            });
        }
    }

    public function down()
    {
        if (Schema::hasTable('tokens')) {
            // eliminar FK nueva
            try {
                Schema::table('tokens', function (Blueprint $table) {
                    $table->dropForeign(['empresa_id']);
                });
            } catch (\Throwable $e) {
                // ignore
            }

            // renombrar de vuelta a usuario_id (si existe)
            if (Schema::hasColumn('tokens', 'empresa_id') && ! Schema::hasColumn('tokens', 'usuario_id')) {
                try {
                    Schema::table('tokens', function (Blueprint $table) {
                        $table->renameColumn('empresa_id', 'usuario_id');
                    });
                } catch (\Throwable $e) {
                    DB::statement('ALTER TABLE tokens CHANGE empresa_id usuario_id BIGINT UNSIGNED');
                }
            }
        }
    }
};
