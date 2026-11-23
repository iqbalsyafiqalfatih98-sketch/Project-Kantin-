<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PesananController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->session()->has('pengguna')) {
            return response()->json([
                'success' => false,
                'message' => 'Silakan masuk terlebih dahulu.',
            ], 401);
        }

        $orders = DB::table('pesanan')
            ->select('id', 'nama', 'kelas', 'jurusan', 'makanan', 'total', 'tanggal_pesanan')
            ->orderByDesc('id')
            ->get();

        return response()->json([
            'success' => true,
            'orders' => $orders,
        ]);
    }

    public function store(Request $request)
    {
        if (!$request->session()->has('pengguna')) {
            return response()->json([
                'success' => false,
                'message' => 'Silakan masuk terlebih dahulu.',
            ], 401);
        }

        $data = $request->json()->all();
        $nama = trim($data['nama'] ?? '');
        $kelas = trim($data['kelas'] ?? '');
        $jurusan = trim($data['jurusan'] ?? '');
        $items = $data['items'] ?? [];

        if ($nama === '' || $kelas === '' || $jurusan === '' || !is_array($items) || count($items) === 0) {
            return response()->json([
                'success' => false,
                'message' => 'Lengkapi biodata dan pilih makanan terlebih dahulu.',
            ], 422);
        }

        $ringkasan = [];
        $total = 0;

        foreach ($items as $item) {
            $namaMakanan = trim($item['name'] ?? '');
            $harga = (int) ($item['price'] ?? 0);
            $jumlah = (int) ($item['qty'] ?? 0);

            if ($namaMakanan !== '' && $harga >= 0 && $jumlah > 0) {
                $ringkasan[] = $namaMakanan . ' x' . $jumlah;
                $total += $harga * $jumlah;
            }
        }

        if (count($ringkasan) === 0) {
            return response()->json([
                'success' => false,
                'message' => 'Daftar makanan tidak valid.',
            ], 422);
        }

        DB::table('pesanan')->insert([
            'nama' => $nama,
            'kelas' => $kelas,
            'jurusan' => $jurusan,
            'makanan' => implode(', ', $ringkasan),
            'total' => $total,
            'tanggal_pesanan' => now(),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Pesanan berhasil disimpan ke database.',
        ]);
    }
}
