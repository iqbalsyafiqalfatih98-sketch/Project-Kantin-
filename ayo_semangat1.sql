-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2026 at 05:12 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ayo_semangat1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dibuat_pada` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `username`, `no_telepon`, `kelas`, `jurusan`, `password`, `dibuat_pada`, `created_at`, `updated_at`) VALUES
(1, 'iqbal syafiq al fatih', 'iqbalss', '0895387436789', 'XI', 'PPLG', '$2y$12$EL/5o3gQKHAR/mYRCrYoWOfF1ttEYlJg/2S3m6G8yoMWEsZZiiAlu', '2026-11-18 07:25:54', NULL, NULL),
(2, 'fady', 'fady', '08989898', 'XI', 'PPLG', '$2y$12$fSO42uNEWTMatoP9dfk09e3/N3vkp6rvW63U.Ky/5Ooy7MPyXxu9O', '2026-11-21 05:21:02', '2026-11-20 22:21:02', '2026-11-20 22:21:02'),
(3, 'kenzi', 'kenzi', '098897789', 'XI', 'TSM', '$2y$12$05C6l4RXxR1aqHNLHL5zReU6y7pnT1eIVcLZlGW0d07siojBZV2L6', '2026-11-21 05:25:04', '2026-11-20 22:25:04', '2026-11-20 22:25:04'),
(4, 'bal', 'bal', '09089898', 'XI', 'PPLG', '$2y$12$ZtmiZNI8SHk1h8DduYQ9UulXUvDRmsNdE/NRv63Tr8uzRZUgxMXXC', '2026-11-23 01:35:25', '2026-11-22 18:35:25', '2026-11-22 18:35:25'),
(5, 'iqbal syah', 'iqbalss27', '0895387436789', 'XI', 'PPLG', '$2y$12$7AgA8K3br2IKoGwmauhuO.QOvwzAghe2YaHojYFN27yEfgw4ZFY.S', '2026-11-23 03:00:29', '2026-11-22 20:00:29', '2026-11-22 20:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `makanan` text NOT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `tanggal_pesanan` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `nama`, `kelas`, `jurusan`, `makanan`, `total`, `tanggal_pesanan`) VALUES
(11, 'iqbal', 'XI', 'pplg', 'Cilok Goang x1', 7000, '2026-11-15 21:23:57'),
(12, 'iq', '11', 'pplg', 'Risol Mayo x1', 10000, '2026-11-15 21:28:30'),
(13, 'Tes', '12', 'PPLG', 'Batagor x1', 5000, '2026-11-15 21:31:21'),
(14, '999', 'ixx', 'dkv', 'Risol Mayo x1', 10000, '2026-11-15 21:53:51'),
(15, 'rama', 'ix', 'pplg', 'Risol Mayo x1', 10000, '2026-11-15 22:27:51'),
(16, 'bagas', '11', 'penambangan', 'Tahu Walik x4', 28000, '2026-11-16 05:59:53'),
(17, 'kenzi', 'ix', 'pplg', 'Gorengan x1', 5000, '2026-11-20 22:29:24'),
(18, 'iqbal', 'xi', 'pplg', 'Risol Mayo x1', 10000, '2026-11-22 20:01:31');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('df2kmLx9QBrZUjR2nb8cRu4BEHAXPBipWDkAK2bm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.147.0 Chrome/150.0.7871.250 Electron/43.8.9 Safari/537.36', 'eyJfdG9rZW4iOiI1SVM3YUtvSktwd3FVbVNXbVlqenFHMkJnR1lxRVM0Z1hwQ0hqWnBIIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hdXRoIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1795238462),
('EiRO7mviARlHoDzpHIycKpHQklj70MtZ4c35ZIYD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.147.0 Chrome/150.0.7871.250 Electron/43.8.9 Safari/537.36', 'eyJfdG9rZW4iOiJkZWRRNFhKOHA3V0RrUFRKaEtEa3AyYzlyTXc0d1ZQdmJ2eFZrc0VBIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hcGlcL3Blc2FuYW4iLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwicGVuZ2d1bmEiOnsiaWQiOjMsIm5hbWEiOiJrZW56aSIsInVzZXJuYW1lIjoia2VuemkiLCJrZWxhcyI6IlhJIiwianVydXNhbiI6IlRTTSJ9fQ==', 1795238964),
('f8Uic91xZkOSZapH4kykWHwIAJFHO0boAyRawftA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.147.0 Chrome/150.0.7871.250 Electron/43.8.9 Safari/537.36', 'eyJfdG9rZW4iOiJPWHdnODRXU1JmZTlqVENtVnlNYjh0U0FKY0xvY0lLMEh5aGxwNm90IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hdXRoIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1795397725),
('HI5wV2ppXNaE7thmVbFCRoaj2CZrlqVwvtgPjM1c', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIwakRsR2JoMFFDQU1RbUJ3ZXdpZVA5V0l6R2ZtSzFFT2o5OGdFTzlpIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hcGlcL3Blc2FuYW4iLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwicGVuZ2d1bmEiOnsiaWQiOjQsIm5hbWEiOiJiYWwiLCJ1c2VybmFtZSI6ImJhbCIsImtlbGFzIjoiWEkiLCJqdXJ1c2FuIjoiUFBMRyJ9fQ==', 1795398092),
('kk7Odn8YzVqm2oBHwL5nMyamMnrs6sX86ybxegQk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJpdW05U1AzZnV3Nm5nbzdJRk5USGlyWUVJRUVvYzR3dmJ6WHZFNWhBIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hdXRoIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1795397790),
('rJU7ZgjSRYrTc5znFb4vEmGSnGw7e0IlS9U9uRDy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.147.0 Chrome/150.0.7871.250 Electron/43.8.9 Safari/537.36', 'eyJfdG9rZW4iOiJrUE4wcG9WWGhkTTU1NGVxWk4zUXpSMzdUOFNHUlRtUXRHeVNTbGY1IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hcGlcL3Blc2FuYW4iLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwicGVuZ2d1bmEiOnsiaWQiOjQsIm5hbWEiOiJiYWwiLCJ1c2VybmFtZSI6ImJhbCIsImtlbGFzIjoiWEkiLCJqdXJ1c2FuIjoiUFBMRyJ9fQ==', 1795403510),
('THllkX8uQptLXhGl8vMbb3mNwsWp7QRsSvvlzZzj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.147.0 Chrome/150.0.7871.250 Electron/43.8.9 Safari/537.36', 'eyJfdG9rZW4iOiJQYXRtak9qUDN3VkVYckNhaWgwZTJrTlBPTDlPUjB5cGRRN29BOWNMIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hdXRoIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1795400988),
('tQEig2CReE7Bpdg0FiMCCNO1Vf7PiXlPYC7LjDJG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.147.0 Chrome/150.0.7871.250 Electron/43.8.9 Safari/537.36', 'eyJfdG9rZW4iOiI0eHdncFI4TGFibWlpZkJHUTNwMWNwMG84dnpXNFdEbzgwQlZydU9TIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hcGlcL3Blc2FuYW4iLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1795238704),
('xkNesX6olymt43zMosD8mrky532a6Xuj3HVUMZV6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJVMHZpdUliU3lsOExpWE56bnFXdnRSM2JBNE5zRDFKUHFSZld1OWlWIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hcGlcL3Blc2FuYW4iLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwicGVuZ2d1bmEiOnsiaWQiOjUsIm5hbWEiOiJpcWJhbCBzeWFoIiwidXNlcm5hbWUiOiJpcWJhbHNzMjciLCJrZWxhcyI6IlhJIiwianVydXNhbiI6IlBQTEcifX0=', 1795405447),
('XXpzpmRSe6e3BjwUZJlFcfp3POCaN7Rt6Ghqadba', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJzY0lRVzA1RDZhbFp6ZkdDZExvNlJodHluN1BEVXdodEk3UFlTUUV0IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hdXRoIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1795402829),
('Z98SeWDyHrnOZCYcUAlH3HGzzGZ0z5Rw3Xuhzeyb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.147.0 Chrome/150.0.7871.250 Electron/43.8.9 Safari/537.36', 'eyJfdG9rZW4iOiJmRjdlSDhPUVdrR0Z6d010NW0xdUxjNDZETExrVHJ4Z1V6eWpoaDlDIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hcGlcL3Blc2FuYW4iLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1795398137);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
