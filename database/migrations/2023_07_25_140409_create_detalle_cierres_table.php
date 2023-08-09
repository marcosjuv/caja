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
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('detalle_cierres');
        Schema::create('detalle_cierres', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('cierre_id');
            $table->foreign('cierre_id')->references('id')->on('cierres');
            $table->string('caja');
            $table->string('supervisor');
            $table->string('cajero');
            $table->double('tasa', 8, 2);
            $table->double('efectivo', 8, 2)->nullable();
            $table->double('punto', 8, 2)->nullable();
            $table->double('transferencia', 8, 2)->nullable();
            $table->double('pendiente', 8, 2)->nullable();
            $table->double('cash', 8, 2)->nullable();
            $table->double('zelle', 8, 2)->nullable();
            $table->double('premium', 8, 2)->nullable();
            $table->double('monto_total', 11, 2)->nullable();
            $table->double('diferencia', 11, 2)->nullable();
            $table->timestamps();
        });
        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('detalle_cierres');
    }
};
