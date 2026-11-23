<?php

// use Illuminate\Database\Migrations\Migration;
// use Illuminate\Database\Schema\Blueprint;
// use Illuminate\Support\Facades\Schema;

// return new class extends Migration
// {
//     public function up(): void
//     {
//         // kalau tabel pesanan sudah ada dari project lama, lewati
//         if (Schema::hasTable('pesanan')) {
//             return;
//         }

//         Schema::create('pesanan', function (Blueprint $table) {
//             $table->id();
//             $table->string('nama', 100);
//             $table->string('kelas', 50);
//             $table->string('jurusan', 100);
//             $table->text('makanan');
//             $table->unsignedInteger('total');
//             $table->dateTime('tanggal_pesanan');
//         });
//     }

//     public function down(): void
//     {
//         Schema::dropIfExists('pesanan');
//     }
// };

