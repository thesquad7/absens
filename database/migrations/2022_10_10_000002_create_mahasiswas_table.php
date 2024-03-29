<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMahasiswasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mahasiswas', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('nim');
            $table->string('name');
            $table->uuid('kelas_id')->nullable();
            $table->uuid('user_id')->nullable();
            $table->uuid('tahun_id')->nullable();
            $table->uuid('semester')->nullable();
            $table->foreign('semester')->references('id')->on('semesters')
            ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('tahun_id')->references('id')->on('tahunajars')
              ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')
                  ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('kelas_id')->references('id')->on('kelas')
              ->onUpdate('cascade')->onDelete('cascade');
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
        Schema::dropIfExists('mahasiswas');
    }
}
