const search = document.getElementById("search"); //mengambil elemen html
const foodCards = document.querySelectorAll(".food-card");
const navLinks = document.querySelectorAll(".sidebar nav a");
const pageTitle = document.getElementById("page-title");
const sectionTitle = document.getElementById("section-title");
const message = document.getElementById("message");
const dynamicArea = document.getElementById("dynamic-area");
const searchArea = document.getElementById("search-area");
const bannerArea = document.getElementById("banner-area");
const cartCount = document.getElementById("cart-count"); // menampilkan

let cart = []; // membuat varivel keranjang dan riwayat
let orderHistory = [];

function rupiah(number) { // format rupiah
    return "Rp" + Number(number).toLocaleString("id-ID");
}

function updateCartCount() { // hitung jumlah makanan keranjang
    cartCount.textContent = cart.reduce((sum, item) => sum + item.qty, 0);
}

function searchFood() { //pencarian
    const keyword = search.value.toLowerCase().trim();
    foodCards.forEach(card => {
        card.style.display = card.dataset.name.toLowerCase().includes(keyword) ? "" : "none";
    });
}

search.addEventListener("input", searchFood); // ketika penguna fungsi dijalankan

document.querySelectorAll(".add-btn").forEach(button => { //menambahkan makanan ke keranjang
    button.addEventListener("click", () => {
        const card = button.closest(".food-card");
        const name = card.dataset.name;
        const price = Number(card.dataset.price);
        const existing = cart.find(item => item.name === name);

        if (existing) {
            existing.qty++;
        } else {
            cart.push({ name, price, qty: 1 });
        }

        updateCartCount();
        message.textContent = name + " berhasil ditambahkan ke keranjang.";
    });
});

function showFoodCards() { //menampilkan kartu makanan
    foodCards.forEach(card => card.style.display = "");
    dynamicArea.innerHTML = "";
    searchArea.style.display = "flex";
    bannerArea.style.display = "grid";
}

function showCart() { // menampilkan keranjang belanja
    foodCards.forEach(card => card.style.display = "none");
    searchArea.style.display = "none";
    bannerArea.style.display = "none";
    dynamicArea.innerHTML = "";

    if (cart.length === 0) { // memeriksa keranjang kosong
        dynamicArea.innerHTML = '<div class="empty-state">Keranjang masih kosong. Silakan pilih makanan dari Menu.</div>';
        return;
    }

    const total = cart.reduce((sum, item) => sum + item.price * item.qty, 0); // menhitung total pembayaran
    const rows = cart.map((item, index) => ` //membuat data pesanan
        <div class="cart-item">
            <div>
                <strong>${item.name}</strong>
                <small>${rupiah(item.price)} × ${item.qty}</small>
            </div>
            <div class="cart-actions">
                <button class="qty-btn" data-action="minus" data-index="${index}">−</button>
                <b>${item.qty}</b>
                <button class="qty-btn" data-action="plus" data-index="${index}">+</button>
                <button class="remove-btn" data-action="remove" data-index="${index}">Hapus</button>
            </div>
        </div>
    `).join("");

    dynamicArea.innerHTML = `
        <div class="cart-box">
            <h2>Daftar Pesanan</h2>
            ${rows}
            <div class="total-row"><strong>Total Pembayaran</strong><strong>${rupiah(total)}</strong></div>
        </div>
        <div class="form-box">
            <h2>Isi Biodata Pemesan</h2>
            <form id="form-pesanan">
                <label for="nama">Nama</label>
                <input type="text" id="nama" name="nama" placeholder="Masukkan nama" required>
                <label for="kelas">Kelas</label>
                <input type="text" id="kelas" name="kelas" placeholder="Masukkan kelas" required>
                <label for="jurusan">Jurusan</label>
                <input type="text" id="jurusan" name="jurusan" placeholder="Masukkan jurusan" required>
                <button type="submit" class="order-btn">Kirim Pesanan</button>
            </form>
        </div>
    `;

    dynamicArea.querySelectorAll("[data-action]").forEach(button => { //tombol tambah kurang dan hapus
        button.addEventListener("click", () => {
            const index = Number(button.dataset.index);
            const action = button.dataset.action;

            if (action === "plus") cart[index].qty++;
            if (action === "minus") cart[index].qty--;
            if (action === "remove" || cart[index].qty <= 0) cart.splice(index, 1);

            updateCartCount();
            showCart();
        });
    });

    document.getElementById("form-pesanan").addEventListener("submit", async event => { //mengirim pesanan ke ralavel
        event.preventDefault();

        const form = event.currentTarget; //mengambil biodata
        const submitButton = form.querySelector("button[type='submit']");
        const payload = {
            nama: form.nama.value.trim(),
            kelas: form.kelas.value.trim(),
            jurusan: form.jurusan.value.trim(),
            items: cart
        };

        submitButton.disabled = true;
        submitButton.textContent = "Mengirim...";

        try {
            const response = await fetch("/api/pesanan", { //mengirm data ke ralavel
                method: "POST",
                headers: { "Content-Type": "application/json", "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content, "Accept": "application/json" },
                body: JSON.stringify(payload)
            });
            const result = await response.json(); //jawaban server

            if (!response.ok || !result.success) {
                throw new Error(result.message || "Pesanan gagal dikirim.");
            }

            cart = []; 
            updateCartCount();
            message.textContent = "Pesanan berhasil dikirim dan disimpan ke database!";
            message.className = "success-message";
            await loadHistory();
            openPage("Riwayat");
        } catch (error) {
            message.textContent = error.message + " Pastikan Apache, MySQL, dan database sudah aktif.";
            message.className = "error-message";
            submitButton.disabled = false;
            submitButton.textContent = "Kirim Pesanan";
        }
    });
}

async function loadHistory() { //mengmbil riwayat pesanan
    try {
        const response = await fetch("/api/pesanan", { headers: { "Accept": "application/json" } });
        const result = await response.json();
        if (result.success) orderHistory = result.orders;
    } catch (error) {
        orderHistory = [];
    }
}

function showHistory() { //menampilkan riwayat pesanan
    foodCards.forEach(card => card.style.display = "none");
    searchArea.style.display = "none";
    bannerArea.style.display = "none";
    dynamicArea.innerHTML = "";

    if (orderHistory.length === 0) {
        dynamicArea.innerHTML = '<div class="empty-state">Belum ada riwayat pesanan.</div>';
        return;
    }

    dynamicArea.innerHTML = `
        <div class="history-box">
            ${orderHistory.map(order => `
                <article class="history-item">
                    <div class="history-top">
                        <strong>Pesanan #${order.id}</strong>
                        <span>${new Date(order.tanggal_pesanan.replace(" ", "T")).toLocaleString("id-ID")}</span>
                    </div>
                    <p><b>Nama:</b> ${escapeHTML(order.nama)}</p>
                    <p><b>Kelas:</b> ${escapeHTML(order.kelas)}</p>
                    <p><b>Jurusan:</b> ${escapeHTML(order.jurusan)}</p>
                    <p><b>Makanan:</b> ${escapeHTML(order.makanan)}</p>
                    <p class="history-total"><b>Total: ${rupiah(order.total)}</b></p>
                </article>
            `).join("")}
        </div>
    `;
}

function escapeHTML(value) { //keamanan html
    return String(value).replace(/[&<>"']/g, char => ({
        "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#039;"
    }[char]));
}

async function openPage(page) { //perpindahan
    navLinks.forEach(link => link.classList.toggle("active", link.dataset.page === page));
    message.textContent = "";
    message.className = "";

    if (page === "Beranda" || page === "Menu") {
        pageTitle.textContent = page === "Beranda" ? "KANTIN" : "MENU";
        sectionTitle.textContent = page === "Beranda" ? "Rekomendasi" : "Daftar Makanan";
        search.value = "";
        showFoodCards();
        searchFood();
        bannerArea.style.display = page === "Beranda" ? "grid" : "none";
        sectionTitle.style.display = "block";
        return;
    }

    sectionTitle.style.display = "none";

    if (page === "Keranjang") {
        pageTitle.textContent = "KERANJANG";
        showCart();
    }

    if (page === "Riwayat") {
        pageTitle.textContent = "RIWAYAT";
        await loadHistory();
        showHistory();
    }
}

navLinks.forEach(link => {
    link.addEventListener("click", event => {
        event.preventDefault();
        openPage(link.dataset.page);
    });
});

updateCartCount();
loadHistory();

// Fitur login dan daftar akun
const areaLogin = document.getElementById("area-login");
const areaAplikasi = document.getElementById("area-aplikasi");
const formMasuk = document.getElementById("form-masuk");
const formDaftar = document.getElementById("form-daftar");
const namaPengguna = document.getElementById("nama-pengguna");

async function kirimAuth(data) { //mengirim data login
    const response = await fetch("/auth", {
        method: "POST",
        headers: { "Content-Type": "application/json", "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content, "Accept": "application/json" },
        body: JSON.stringify(data)
    });

    const hasil = await response.json();
    if (!response.ok || !hasil.success) {
        throw new Error(hasil.message || "Permintaan tidak berhasil.");
    }
    return hasil;
}

function tampilkanAplikasi(pengguna) { //setelah login
    areaLogin.classList.add("hidden");
    areaAplikasi.classList.remove("hidden");
    namaPengguna.textContent = pengguna.nama || pengguna.username || "Pengguna";
    loadHistory();
}

function tampilkanLogin() {//menmpilkan halaman login
    areaAplikasi.classList.add("hidden");
    areaLogin.classList.remove("hidden");
    formMasuk.classList.remove("hidden");
    formDaftar.classList.add("hidden");
}

document.getElementById("ke-daftar").addEventListener("click", () => { //berpindah ke daftar
    document.getElementById("error-daftar").classList.add("hidden");
    formMasuk.classList.add("hidden");
    formDaftar.classList.remove("hidden");
});

document.getElementById("ke-masuk").addEventListener("click", () => { //proses login
    document.getElementById("error-masuk").classList.add("hidden");
    formDaftar.classList.add("hidden");
    formMasuk.classList.remove("hidden");
});

formMasuk.addEventListener("submit", async (event) => {
    event.preventDefault();
    const kotakError = document.getElementById("error-masuk");
    const tombol = formMasuk.querySelector("button[type='submit']");
    kotakError.classList.add("hidden");
    tombol.disabled = true;
    tombol.textContent = "Memeriksa...";

    try {
        const data = Object.fromEntries(new FormData(formMasuk));
        const hasil = await kirimAuth({ aksi: "login", ...data });
        tampilkanAplikasi(hasil.pengguna);
        formMasuk.reset();
    } catch (error) {
        kotakError.textContent = error.message;
        kotakError.classList.remove("hidden");
    } finally {
        tombol.disabled = false;
        tombol.textContent = "Masuk";
    }
});

formDaftar.addEventListener("submit", async (event) => { //proses daftar akun
    event.preventDefault();
    const kotakError = document.getElementById("error-daftar");
    const tombol = formDaftar.querySelector("button[type='submit']");
    kotakError.classList.add("hidden");
    tombol.disabled = true;
    tombol.textContent = "Mendaftarkan...";

    try {
        const data = Object.fromEntries(new FormData(formDaftar));
        await kirimAuth({ aksi: "daftar", ...data });
        alert("Akun berhasil dibuat. Silakan masuk menggunakan username dan kata sandi.");
        formDaftar.reset();
        formDaftar.classList.add("hidden");
        formMasuk.classList.remove("hidden");
    } catch (error) {
        kotakError.textContent = error.message;
        kotakError.classList.remove("hidden");
    } finally {
        tombol.disabled = false;
        tombol.textContent = "Daftar";
    }
});

document.getElementById("tombol-keluar").addEventListener("click", async () => { //logout
    try {
        await kirimAuth({ aksi: "logout" });
        tampilkanLogin();
    } catch (error) {
        alert(error.message);
    }
});

// Periksa status penguna
async function periksaLogin() {
    try {
        const response = await fetch("/auth", { headers: { "Accept": "application/json" } });
        const hasil = await response.json();
        if (hasil.loggedIn) {
            tampilkanAplikasi(hasil.pengguna);
        } else {
            tampilkanLogin();
        }
    } catch (error) {
        tampilkanLogin();
        const kotakError = document.getElementById("error-masuk");
        kotakError.textContent = "Tidak dapat terhubung ke server. Pastikan Apache dan MySQL aktif.";
        kotakError.classList.remove("hidden");
    }
}

periksaLogin();