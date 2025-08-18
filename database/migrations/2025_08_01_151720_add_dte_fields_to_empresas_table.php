<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    // database/migrations/xxxx_add_dte_fields_to_empresas_table.php

public function up()
{
    Schema::table('empresas', function (Blueprint $table) {
        // Ruta al XML/.crt
        $table->string('crt_path')->nullable()->after('cod_punto_venta_int');

        // Ruta al mismo archivo que contiene la clave privada
        $table->string('key_path')->nullable()->after('crt_path');

        // Contraseña interna de la clave privada
        $table->string('key_password')->nullable()->after('key_path');

        // API credentials
        $table->string('api_user')->nullable()->after('key_password');
        $table->string('api_password')->nullable()->after('api_user');
    });
}


    /**
     * Reverse the migrations.
     */
public function down(): void
{
    Schema::table('empresas', function (Blueprint $table) {
        $table->dropColumn([
            'crt_path', 'key_path',
            'key_password', 'api_user', 'api_password',
        ]);
    });
}
};
