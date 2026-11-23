<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('pengguna', function (Blueprint $table) {
            $table->id();
            $table->string('nama');
            $table->string('username', 100)->unique();
            $table->string('no_telepon', 30);
            $table->string('kelas', 30);
            $table->string('jurusan', 100);
            $table->string('password');
            $table->timestamps();
        });

        Schema::create('pesanan', function (Blueprint $table) {
            $table->id();
            $table->string('nama');
            $table->string('kelas', 30);
            $table->string('jurusan', 100);
            $table->text('makanan');
            $table->unsignedBigInteger('total');
            $table->timestamp('tanggal_pesanan')->useCurrent();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pesanan');
        Schema::dropIfExists('pengguna');
    }
};
