<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('absensis', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('mahasiswa_id');
            $table->uuid('dosen_id');
            $table->uuid('matkul_id');
            $table->uuid('tahun_id');
            $table->foreign('dosen_id')->references('id')->on('users')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('mahasiswa_id')->references('id')->on('mahasiswas')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->integer('status')->nullable();
            $table->foreign('matkul_id')->references('id')->on('matakuliahs')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('tahun_id')->references('id')->on('Tahunajars')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->softDeletes();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('absensis');
    }
};
