<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PesananController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/auth', [AuthController::class, 'index']);
Route::post('/auth', [AuthController::class, 'store']);

Route::get('/api/pesanan', [PesananController::class, 'index']);
Route::post('/api/pesanan', [PesananController::class, 'store']);
