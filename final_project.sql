-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jul 2023 pada 14.09
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project`
--

DELIMITER $$
--
-- Fungsi
--
CREATE DEFINER=`root`@`localhost` FUNCTION `f_KategoriPinjam` (`rent_date` DATE) RETURNS VARCHAR(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
	DECLARE late_status VARCHAR(20);
	IF DATEDIFF(CURRENT_DATE(), rent_date) > 3 THEN
		SET late_status = 'Terlambat';
	ELSE
    	SET late_status = 'Tidak Terlambat';
    END IF;
RETURN late_status;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'in stock',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `book_code`, `title`, `cover`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A001-01', 'Laravel For Newbie', NULL, 'laravel-for-newbie', 'in stock', NULL, '2023-06-22 08:38:54', '2023-06-22 08:38:54'),
(13, 'A001-07', 'Indonesia', 'Indonesia-1687511752.jpg', 'indonesia', 'in stock', '2023-06-21 22:07:40', '2023-07-10 04:20:53', '2023-07-10 04:20:53'),
(15, 'A001-88', 'English', 'English-1687411635.png', 'english', 'in stock', '2023-06-21 22:26:55', '2023-06-22 08:41:18', '2023-06-22 08:41:18'),
(19, 'ST 0102', 'Mengenal Tata Surya', 'Mengenal Tata Surya-1687439640.jpg', 'mengenal-tata-surya', 'in stock', '2023-06-22 06:14:00', '2023-06-22 08:55:11', '2023-06-22 08:55:11'),
(20, 'RK 1.11.1.1', 'conan', 'conan-1687449113.jpg', 'conan', 'in stock', '2023-06-22 08:51:33', '2023-07-11 05:15:24', '2023-07-11 05:15:24'),
(21, '111', 'conanto', 'conan2-1687511693.jpg', 'conan2', 'in stock', '2023-06-22 08:57:17', '2023-07-11 07:36:27', '2023-07-11 07:36:27'),
(22, 'st1010', 'Memasak with mia', 'Memasak with mia-1687507389.jpg', 'memasak-with-mia', 'in stock', '2023-06-23 01:03:09', '2023-07-10 10:05:58', '2023-07-10 10:05:58'),
(23, 'st1112', 'WW 3', 'WW3-1687507623.jpg', 'ww3', 'in stock', '2023-06-23 01:07:03', '2023-07-11 07:32:58', NULL),
(24, 'st 1212', 'fauget', 'fauget-1687596548.jfif', 'fauget', 'in stock', '2023-06-24 01:49:09', '2023-06-27 22:28:20', NULL),
(25, 'FC 0001', 'sikancil', 'sikancil-1687596642.jpg', 'sikancil', 'in stock', '2023-06-24 01:50:42', '2023-06-27 22:04:15', NULL),
(26, 'ST 0111', 'Sejarah Tuhan', 'Sejarah Tuhan-1687934113.jfif', 'sejarah-tuhan', 'in stock', '2023-06-27 23:35:14', '2023-07-05 08:06:32', '2023-07-05 08:06:32'),
(27, 'ST-0122', 'Amazing Spiderman', 'Amazing Spiderman-1688375836.jpg', 'amazing-spiderman', 'in stock', '2023-07-03 02:17:17', '2023-07-03 02:17:17', NULL),
(28, 'ST-10110', 'Marvel', 'Marvel-1688562171.jpg', 'marvel', 'not available', '2023-07-05 06:02:51', '2023-07-11 05:28:13', NULL),
(29, '1109', 'Sang Singa', '', 'sang-singa', 'in stock', '2023-07-09 10:08:13', '2023-07-09 10:28:37', '2023-07-09 10:28:37'),
(30, '8888', 'The Night', 'The Night-1688923297.jpg', 'the-night', 'in stock', '2023-07-09 10:16:57', '2023-07-09 10:28:33', '2023-07-09 10:28:33'),
(31, 'ST-12-3121', 'Sembilu', 'Sembilu-1688958726.jpg', 'sembilu', 'not available', '2023-07-09 10:18:51', '2023-07-09 20:30:41', NULL),
(32, 'ST-1231233', 'sembilu', 'sembilu-1688923863.jpg', 'sembilu', 'in stock', '2023-07-09 10:31:03', '2023-07-09 10:34:00', '2023-07-09 10:34:00'),
(33, 'ST-1209', 'The King', 'The King-1688942515.png', 'the-king', 'in stock', '2023-07-09 15:41:55', '2023-07-09 15:43:48', '2023-07-09 15:43:48'),
(34, 'NV-001', 'Love in the Fast Lane', 'Love in the Fast Lane-1688959502.jpeg', 'love-in-the-fast-lane', 'in stock', '2023-07-09 20:25:02', '2023-07-09 20:25:02', NULL),
(35, 'NV-002', 'Ruang Sunyi', 'Ruang Sunyi-1688959782.jpeg', 'ruang-sunyi', 'in stock', '2023-07-09 20:29:42', '2023-07-11 07:26:48', NULL),
(36, 'AC-001', 'Fallen Angel', 'Fallen Angel-1688960026.jpeg', 'fallen-angel', 'in stock', '2023-07-09 20:33:46', '2023-07-09 20:33:46', NULL),
(37, 'FG-001', 'Digital Fotografi', 'Digital Fotografi-1688960365.jpeg', 'digital-fotografi', 'in stock', '2023-07-09 20:39:25', '2023-07-09 20:39:25', NULL),
(38, 'CG-001', 'Cerita Rakyat Yogyakarta', 'Cerita Rakyat Yogyakarta-1688960607.jpeg', 'cerita-rakyat-yogyakarta', 'in stock', '2023-07-09 20:43:27', '2023-07-09 20:43:27', NULL),
(39, 'MY-2201', 'Don\'t Go There', 'Don\'t Go There-1688963637.jpeg', 'don-t-go-there', 'in stock', '2023-07-09 21:33:57', '2023-07-09 21:36:12', NULL),
(40, 'Rakdyu', 'Judul', 'Judul-1688980467.jpg', 'judul', 'in stock', '2023-07-10 02:14:27', '2023-07-10 02:14:27', NULL),
(41, 'BB12441', 'Sembilu2', 'Sembilu2-1689232776.jpg', 'sembilu2', 'in stock', '2023-07-13 00:19:36', '2023-07-13 00:19:36', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `book_category`
--

CREATE TABLE `book_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `book_category`
--

INSERT INTO `book_category` (`id`, `book_id`, `category_id`, `created_at`, `updated_at`) VALUES
(9, 15, 1, NULL, NULL),
(16, 19, 6, NULL, NULL),
(19, 22, 19, NULL, NULL),
(20, 23, 20, NULL, NULL),
(22, 13, 20, NULL, NULL),
(23, 24, 22, NULL, NULL),
(24, 25, 5, NULL, NULL),
(25, 26, 20, NULL, NULL),
(26, 27, 1, NULL, NULL),
(27, 28, 1, NULL, NULL),
(28, 21, 17, NULL, NULL),
(29, 29, 1, NULL, NULL),
(30, 29, 5, NULL, NULL),
(31, 30, 24, NULL, NULL),
(32, 31, 1, NULL, NULL),
(34, 32, 1, NULL, NULL),
(35, 33, 1, NULL, NULL),
(36, 33, 17, NULL, NULL),
(37, 34, 25, NULL, NULL),
(38, 34, 26, NULL, NULL),
(39, 35, 25, NULL, NULL),
(40, 36, 1, NULL, NULL),
(41, 36, 6, NULL, NULL),
(42, 36, 27, NULL, NULL),
(43, 37, 31, NULL, NULL),
(44, 38, 20, NULL, NULL),
(45, 38, 28, NULL, NULL),
(46, 38, 29, NULL, NULL),
(47, 39, 6, NULL, NULL),
(48, 39, 24, NULL, NULL),
(49, 40, 5, NULL, NULL),
(50, 40, 6, NULL, NULL),
(51, 40, 17, NULL, NULL),
(52, 20, 1, NULL, NULL),
(53, 41, 32, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `created_at`, `updated_at`, `slug`, `deleted_at`) VALUES
(1, 'comic', '2023-06-05 15:27:09', '2023-07-10 15:45:36', 'comic', NULL),
(5, 'fiction', NULL, '2023-06-23 12:20:30', 'fiction', NULL),
(6, 'mystery', NULL, '2023-06-23 12:20:37', 'mystery', NULL),
(17, 'religi', '2023-06-22 08:24:20', '2023-07-09 10:19:35', 'religi', NULL),
(18, 'comic santuy', '2023-06-22 08:48:20', '2023-06-22 08:54:53', 'comic-santuy', '2023-06-22 08:54:53'),
(19, 'conan', '2023-06-22 08:56:53', '2023-06-22 08:56:53', 'conan', NULL),
(20, 'sejarah', '2023-06-23 01:06:41', '2023-06-24 01:51:03', 'sejarah', NULL),
(21, 'proto', '2023-06-23 12:08:47', '2023-06-23 12:08:51', 'proto', '2023-06-23 12:08:51'),
(22, 'magazine', '2023-06-24 01:48:42', '2023-06-24 01:48:42', 'magazine', NULL),
(23, 'Recipe Book', '2023-07-07 05:37:53', '2023-07-07 05:37:53', 'recipe-book', NULL),
(24, 'horror', '2023-07-09 10:15:14', '2023-07-09 21:34:42', 'horror', NULL),
(25, 'Novel', '2023-07-09 20:22:53', '2023-07-09 20:22:53', 'novel', NULL),
(26, 'Romance', '2023-07-09 20:25:13', '2023-07-09 20:25:13', 'romance', NULL),
(27, 'Action', '2023-07-09 20:30:48', '2023-07-09 20:30:48', 'action', NULL),
(28, 'Dongeng', '2023-07-09 20:35:30', '2023-07-09 20:35:30', 'dongeng', NULL),
(29, 'Cergam', '2023-07-09 20:35:36', '2023-07-09 20:35:36', 'cergam', NULL),
(30, 'Catatan Harian', '2023-07-09 20:36:14', '2023-07-09 20:36:14', 'catatan-harian', NULL),
(31, 'Fotografi', '2023-07-09 20:36:57', '2023-07-09 20:36:57', 'fotografi', NULL),
(32, 'romantic novel', '2023-07-09 23:01:27', '2023-07-09 23:01:27', 'romantic-novel', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_updates`
--

CREATE TABLE `log_updates` (
  `id` bigint(20) NOT NULL,
  `book_id` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_column` varchar(255) DEFAULT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `update_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rent_logs`
--

CREATE TABLE `rent_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `rent_date` date NOT NULL,
  `return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rent_logs`
--

INSERT INTO `rent_logs` (`id`, `user_id`, `book_id`, `rent_date`, `return_date`, `actual_return_date`, `created_at`, `updated_at`) VALUES
(24, 3, 21, '2023-06-28', '2023-07-01', '2023-07-09', '2023-06-27 22:30:29', '2023-07-09 10:02:31'),
(25, 2, 21, '2023-06-28', '2023-07-01', '2023-06-28', '2023-06-27 22:31:28', '2023-06-27 22:31:34'),
(26, 4, 23, '2023-06-29', '2023-07-02', '2023-07-05', '2023-06-28 20:43:58', '2023-07-05 08:31:41'),
(27, 7, 21, '2023-06-29', '2023-07-02', '2023-06-29', '2023-06-28 20:45:33', '2023-06-28 20:45:38'),
(28, 10, 23, '2023-07-09', '2023-07-12', '2023-07-09', '2023-07-09 10:03:05', '2023-07-09 10:47:51'),
(29, 10, 31, '2023-07-10', '2023-07-13', NULL, '2023-07-09 20:30:41', '2023-07-09 20:30:41'),
(30, 16, 35, '2023-07-10', '2023-07-13', '2023-07-11', '2023-07-09 20:40:55', '2023-07-10 20:56:35'),
(31, 2, 23, '2023-07-10', '2023-07-13', '2023-07-10', '2023-07-10 02:16:23', '2023-07-10 02:17:50'),
(32, 19, 28, '2023-07-11', '2023-07-14', NULL, '2023-07-11 05:28:13', '2023-07-11 05:28:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'client', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addres` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `username`, `slug`, `password`, `phone`, `addres`, `status`, `created_at`, `updated_at`, `deleted_at`, `role_id`) VALUES
(1, 'admin', 'admin', '$2y$10$w7SakjRZSfLCR0DAntx21.I28f0NY1sqf88aUaJD1NgtfEUG7ToxG', NULL, '', 'active', NULL, NULL, NULL, 1),
(2, 'hasan', 'hasan', '$2y$10$w7SakjRZSfLCR0DAntx21.I28f0NY1sqf88aUaJD1NgtfEUG7ToxG', NULL, '', 'active', NULL, '2023-07-11 23:39:13', NULL, 2),
(3, 'jeni', 'jeni', '$2y$10$w7SakjRZSfLCR0DAntx21.I28f0NY1sqf88aUaJD1NgtfEUG7ToxG', '085701285359', '', 'active', NULL, '2023-06-22 04:54:25', NULL, 2),
(4, 'lisa', 'lisa', '$2y$10$w7SakjRZSfLCR0DAntx21.I28f0NY1sqf88aUaJD1NgtfEUG7ToxG', '081392007969', '', 'active', NULL, '2023-06-22 07:01:09', NULL, 2),
(7, 'far', 'far', '$2y$10$7S5vDhsBpM7.yqc3042Euum1j04pqcIXw/Av6WySEMKrfn4hb1Jki', '086521', 'concat', 'active', '2023-06-23 03:35:29', '2023-07-09 10:20:15', NULL, 2),
(8, 'farhan', 'farhan', '$2y$10$sy0pUBKgtf5V5fv5AgvUOOS2vf5BKJ2xxOviUqB6VBtMbBOeGEVA.', '6281228137590', 'concat', 'active', '2023-06-24 06:31:42', '2023-06-24 06:32:18', NULL, 2),
(9, 'safa', 'safa', '$2y$10$00MyHPZ23qJEdFjZCAeiMO0hoVhv67zaBDDIH8I6HrigeSoPT5jyS', '6289345352324', 'concat', 'active', '2023-06-24 20:03:12', '2023-06-24 20:03:46', NULL, 2),
(10, 'fitria', 'fitria', '$2y$10$wqU88cLsX0xYspy5123EveGHDcbHFJicoyvKSnYz1szxoitBIc5kO', '6278483828283', 'concat', 'active', '2023-06-25 07:54:28', '2023-06-25 07:55:09', NULL, 2),
(11, 'ridwan', 'ridwan', '$2y$10$wdd6sjK5rQM8AskA5s/rR.X.GMAmcBamuOlUtyFQvPj5KWwBltcFm', '622432442424', 'Depok Yogyakarta', 'active', '2023-07-07 05:26:52', '2023-07-07 05:31:45', NULL, 2),
(12, 'agus', 'agus', '$2y$10$sTN1TX9vzkz5V.JEzClfqe5aD5cUS455/14gfSXpgybSCccBZJfMC', '1241442112313', 'concat', 'active', '2023-07-07 05:28:35', '2023-07-07 05:37:13', NULL, 2),
(13, 'susanti', 'susanti', '$2y$10$K456VUMbbbJUiY4coB6aAuf7EADrq630Bz0VLf/Wls31Sireon4h2', '243535353535553', 'concat', 'inactive', '2023-07-07 05:29:29', '2023-07-07 05:29:29', NULL, 2),
(14, 'adi', 'adi', '$2y$10$JAuqTlCgK7s5ymPHbe/U3O/qSW4XgyKc5uIttbT2ggZeRy.ILy7ZC', '12412441', 'concat', 'inactive', '2023-07-07 05:30:11', '2023-07-07 05:30:11', NULL, 2),
(15, 'sushi', 'sushi', '$2y$10$0A0sAXNqG2aqe.GGxCN3eOLQ0E7hk2VFMbVQl34eEWSqu8mF9gfP2', '12314144', 'concat', 'inactive', '2023-07-07 05:39:24', '2023-07-07 05:39:24', NULL, 2),
(16, 'fauzan', 'fauzan', '$2y$10$m2z.WXbheymJpmUMBeJKjekOfWWaSZVyzC6gXhlr9bzX2zq3HYMnu', '085701285359', 'Klaten', 'active', '2023-07-09 09:57:50', '2023-07-11 07:30:43', '2023-07-11 07:30:43', 2),
(17, 'ridwan kamil', 'ridwan-kamil', '$2y$10$FXaD5u.WQdDRLxmQHIDh0O7yBPa.SxttB1eBijaelJxD3lW07EgJu', '89739749324', 'concat', 'active', '2023-07-09 10:00:48', '2023-07-09 19:43:24', NULL, 2),
(18, 'dapa', 'dapa', '$2y$10$41l8BLQIdRfzqWMVtZX1a.CTznOqAuBA2IrTbVW8YpCSsfIdtj58q', '089', 'Mars', 'active', '2023-07-10 02:13:28', '2023-07-10 02:16:09', NULL, 2),
(19, 'Sak sak e', 'sak-sak-e', '$2y$10$LVV1PYxr1z20p1JsWoEmfejNspU8OLJrkj.Oc8ZKWAOg28.FuHwgm', '088325678765', 'Sleman', 'active', '2023-07-11 05:18:30', '2023-07-11 05:20:31', NULL, 2),
(20, 'jennie', 'jennie', '$2y$10$nTnY1yw15N8cPid2XEkiuOXsV/tdQkxAUTbpD8B0pbt83o1MaORHC', '081386328680', 'jogja', 'inactive', '2023-07-11 06:19:12', '2023-07-11 06:19:12', NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_book_id_foreign` (`book_id`),
  ADD KEY `book_category_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `log_updates`
--
ALTER TABLE `log_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indeks untuk tabel `rent_logs`
--
ALTER TABLE `rent_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rent_logs_user_id_foreign` (`user_id`),
  ADD KEY `rent_logs_book_id_foreign` (`book_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `log_updates`
--
ALTER TABLE `log_updates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rent_logs`
--
ALTER TABLE `rent_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Ketidakleluasaan untuk tabel `log_updates`
--
ALTER TABLE `log_updates`
  ADD CONSTRAINT `log_updates_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

--
-- Ketidakleluasaan untuk tabel `rent_logs`
--
ALTER TABLE `rent_logs`
  ADD CONSTRAINT `rent_logs_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `rent_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
