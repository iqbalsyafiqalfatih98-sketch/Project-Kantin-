<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kantin Sekolah</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>
<body>
<div id="area-login" class="area-login">
    <form class="kotak-login" id="form-masuk">
        <h1>Kantin FKI</h1>
        <p class="abu">Masuk untuk memesan makanan.</p>
        <div class="pesan-error hidden" id="error-masuk"></div>
        <label>Username
            <input name="username" autocomplete="username" required autofocus>
        </label>
        <label>Kata sandi
            <input name="password" type="password" autocomplete="current-password" required>
        </label>
        <button class="tombol" type="submit">Masuk</button>
        <button class="tautan" type="button" id="ke-daftar">Pembeli baru? Daftar akun</button>
    </form>

    <form class="kotak-login hidden" id="form-daftar">
        <h1>Daftar akun pembeli</h1>
        <p class="abu">Buat akun untuk memesan di kantin.</p>
        <div class="pesan-error hidden" id="error-daftar"></div>
        <label>Nama lengkap
            <input name="nama" autocomplete="name" required>
        </label>
        <label>Username
            <input name="username" autocomplete="username" required>
        </label>
        <label>No. telepon
            <input name="no_telepon" type="tel" placeholder="081234567890" required>
        </label>
        <label>Kelas
            <select name="kelas" required>
                <option value="" disabled selected>Pilih kelas</option>
                <option>X</option><option>XI</option><option>XII</option>
            </select>
        </label>
        <label>Jurusan
            <select name="jurusan" required>
                <option value="" disabled selected>Pilih jurusan</option>
                <option>TSM</option><option>TJKT</option><option>PPLG</option>
                <option>MPLB</option><option>DKV</option><option>PERHOTELAN</option><option>TM</option>
            </select>
        </label>
        <label>Kata sandi (minimal 6 karakter)
            <input name="password" type="password" autocomplete="new-password" minlength="6" required>
        </label>
        <button class="tombol" type="submit">Daftar</button>
        <button class="tautan" type="button" id="ke-masuk">Sudah punya akun? Masuk</button>
    </form>
</div>
<div class="app hidden" id="area-aplikasi">
    <aside class="sidebar">
        <div class="profile">
        <img src="{{ asset('img/fadli.jpeg') }}" alt="Profil Siswa"
                onerror="this.style.display='none'">
        </div>
        <nav>
            <a href="#" class="active" data-page="Beranda">Beranda</a>
            <a href="#" data-page="Riwayat">Riwayat</a>
            <a href="#" data-page="Menu">Menu</a>
            <a href="#" data-page="Keranjang">Keranjang <span id="cart-count">0</span></a>
        </nav>
        <div class="akun-samping">
            <span id="nama-pengguna"></span>
            <button type="button" id="tombol-keluar">Keluar</button>
        </div>
    </aside>

    <main class="content">
        <h1 id="page-title">KANTIN</h1>

        <div class="search-box" id="search-area">
            <span class="search-icon">&#8981;</span>
            <input type="text" id="search" placeholder="Cari makanan...">
        </div>

        <section class="banners" id="banner-area">
            <div class="banner banner-one"><img src=""></div>
            <div class="banner banner-two"></div>
        </section>

        <h2 id="section-title">Rekomendasi</h2>

        <section class="food-grid" id="food-grid">
            <article class="food-card" data-name="Risol Mayo" data-price="10000">
                <div class="food-image food-1"><img src="{{ asset('img/pngtree-risol-mayo-or-risoles-mayonaise-image_16125401.jpg') }}"></div>
                <h3>Risol Mayo</h3><p>Rp10.000</p>
                <button class="add-btn">Pesan</button>
            </article>
            <article class="food-card" data-name="Cilok Goang" data-price="7000">
                <div class="food-image food-2"><img src="{{ asset('img/992563625.webp') }}"></div>
                <h3>Cilok Goang</h3><p>Rp7.000</p>
                <button class="add-btn">Pesan</button>
            </article>
            <article class="food-card" data-name="Pempek" data-price="15000">
                <div class="food-image food-3"><img src="{{ asset('img/istockphoto-1361196001-612x612.jpg') }}"></div>
                <h3>Pempek</h3><p>Rp15.000</p>
                <button class="add-btn">Pesan</button>
            </article>
            <article class="food-card" data-name="Batagor" data-price="5000">
                <div class="food-image food-4"><img src="{{ asset('img/Batagor-Enak-di-Bandung.webp') }}"></div>
                <h3>Batagor</h3><p>Rp5.000</p>
                <button class="add-btn">Pesan</button>
            </article>
            <article class="food-card" data-name="Makaroni" data-price="5000">
                <div class="food-image food-5"><img src="{{ asset('img/images.jpg') }}"></div>
                <h3>Makaroni</h3><p>Rp5.000</p>
                <button class="add-btn">Pesan</button>
            </article>
            <article class="food-card" data-name="Es Cekek" data-price="5000">
                <div class="food-image food-6"><img src="{{ asset('img/IMG_20231024_221253_copy_720x540.jpg') }}"></div>
                <h3>ES Cekek</h3><p>Rp5.000</p>
                <button class="add-btn">Pesan</button>
            </article>
            <article class="food-card" data-name="Batagor" data-price="5000">
                <div class="food-image food-7"><img src="{{ asset('img/3116974945.webp') }}"></div>
                <h3>Batagor</h3><p>Rp5.000</p>
                <button class="add-btn">Pesan</button>
            </article>
            <article class="food-card" data-name="Gorengan" data-price="5000">
                <div class="food-image food-8"><img src="{{ asset('img/depositphotos_906387244-stock-photo-person-hand-holding-crispy-deep.jpg') }}"></div>
                <h3>Gorengan</h3><p>Rp5.000</p>
                <button class="add-btn">Pesan</button>
            </article>
            <article class="food-card" data-name="Jamur Krispi" data-price="5000">
                <div class="food-image food-9"><img src="{{ asset('img/028698200_1708959920-Resep_Jamur_Krispy_Kekinian__Renyah__Enak__dan_Keriting_-_TOPWISATA.webp') }}"></div>
                <h3>Jamur Krispi</h3><p>Rp5.000</p>
                <button class="add-btn">Pesan</button>
            </article>
            <article class="food-card" data-name="Kebab" data-price="7000">
                <div class="food-image food-10"><img src="{{ asset('img/87cbb7027d37f18150761483ad341e92.jpg') }}"></div>
                <h3>Kebab</h3><p>Rp7.000</p>
                <button class="add-btn">Pesan</button>
            </article>
             <article class="food-card" data-name="Tahu Walik" data-price="7000">
                <div class="food-image food-11"><img src="{{ asset('img/3116974945.webp') }}"></div>
                <h3>Tahu Walik</h3><p>Rp7.000</p>
                <button class="add-btn">Pesan</button>
            </article>
        </section>

        <div id="message" role="status"></div>
        <section id="dynamic-area"></section>
    </main>
</div>
<script src="{{ asset('js/script.js') }}"></script>
</body>
</html>
