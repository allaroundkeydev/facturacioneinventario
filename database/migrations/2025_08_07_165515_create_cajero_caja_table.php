<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cajero_caja', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('cajero_id');
            $table->unsignedBigInteger('caja_id');
            $table->dateTime('asignado_desde');
            $table->dateTime('asignado_hasta')->nullable();
            $table->timestamps();

            $table->foreign('cajero_id')
                  ->references('id')
                  ->on('cajeros')
                  ->onDelete('cascade');

            $table->foreign('caja_id')
                  ->references('id')
                  ->on('cajas')
                  ->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('cajero_caja');
    }
};
