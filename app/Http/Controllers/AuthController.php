<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function index(Request $request)
    {
        $pengguna = $request->session()->get('pengguna');

        return response()->json([
            'loggedIn' => (bool) $pengguna,
            'pengguna' => $pengguna,
        ]);
    }

    public function store(Request $request)
    {
        $data = $request->json()->all();
        $aksi = $data['aksi'] ?? '';

        if ($aksi === 'logout') {
            $request->session()->forget('pengguna');
            $request->session()->regenerateToken();

            return response()->json([
                'success' => true,
                'message' => 'Berhasil keluar.',
            ]);
        }

        if ($aksi === 'daftar') {
            $validator = validator($data, [
                'nama' => ['required', 'string', 'max:255'],
                'username' => ['required', 'string', 'max:100'],
                'no_telepon' => ['required', 'string', 'max:30'],
                'kelas' => ['required', 'string', 'max:30'],
                'jurusan' => ['required', 'string', 'max:100'],
                'password' => ['required', 'string', 'min:6'],
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => $validator->errors()->first(),
                ], 422);
            }

            if (DB::table('pengguna')->where('username', $data['username'])->exists()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Username sudah digunakan. Silakan pilih username lain.',
                ], 409);
            }

            DB::table('pengguna')->insert([
                'nama' => trim($data['nama']),
                'username' => trim($data['username']),
                'no_telepon' => trim($data['no_telepon']),
                'kelas' => trim($data['kelas']),
                'jurusan' => trim($data['jurusan']),
                'password' => Hash::make($data['password']),
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Akun berhasil dibuat.',
            ]);
        }

        if ($aksi === 'login') {
            $username = trim($data['username'] ?? '');
            $password = $data['password'] ?? '';

            if ($username === '' || $password === '') {
                return response()->json([
                    'success' => false,
                    'message' => 'Masukkan username dan kata sandi.',
                ], 422);
            }

            $akun = DB::table('pengguna')->where('username', $username)->first();

            if (!$akun || !Hash::check($password, $akun->password)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Username atau kata sandi salah.',
                ], 401);
            }

            $request->session()->regenerate();
            $pengguna = [
                'id' => (int) $akun->id,
                'nama' => $akun->nama,
                'username' => $akun->username,
                'kelas' => $akun->kelas,
                'jurusan' => $akun->jurusan,
            ];
            $request->session()->put('pengguna', $pengguna);

            return response()->json([
                'success' => true,
                'message' => 'Berhasil masuk.',
                'pengguna' => $pengguna,
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Permintaan tidak dikenal.',
        ], 400);
    }
}
