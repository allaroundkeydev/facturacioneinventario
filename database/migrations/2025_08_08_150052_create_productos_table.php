<?php

// database/migrations/2025_08_07_000001_create_productos_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('empresa_id');
            $table->string('codigo',50);
            $table->string('descripcion',255);
            $table->string('unidad_medida',10);
            $table->decimal('precio_unitario',12,2);
            $table->integer('stock');
            $table->timestamps();

            $table->foreign('empresa_id')
                  ->references('id')->on('empresas')
                  ->onDelete('cascade');
            $table->unique(['empresa_id','codigo']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('productos');
    }
};
