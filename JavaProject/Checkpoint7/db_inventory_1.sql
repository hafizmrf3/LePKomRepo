-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Nov 2020 pada 08.31
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventory_1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `Harga` int(11) NOT NULL,
  `Kualitas` float(13,2) NOT NULL,
  `stok_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `Harga`, `Kualitas`, `stok_barang`) VALUES
('123', 'tas belanja', 3000, 1.00, 1),
('1234', 'baju', 5000, 1.00, 90);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(20) NOT NULL,
  `nama_customer` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `Telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`, `Alamat`, `Telp`) VALUES
(1, 'putra cahya', '123', '123'),
(2, 'refa cahya', '1234', '1234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_order`
--

CREATE TABLE `detail_order` (
  `no_order` int(25) NOT NULL,
  `id_customer` int(20) NOT NULL,
  `tanggal_order` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kd_barang` varchar(20) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `detail_order`
--

INSERT INTO `detail_order` (`no_order`, `id_customer`, `tanggal_order`, `kd_barang`, `jumlah_barang`, `total_harga`) VALUES
(1, 2, '2020-11-30 07:20:21', '123', 0, 0),
(1, 2, '2020-11-30 07:20:21', '123', 0, 0),
(2, 2, '2020-11-30 07:21:22', '123', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `header_order`
--

CREATE TABLE `header_order` (
  `no_order` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_user_sales` int(11) NOT NULL,
  `id_user_gudang` int(11) NOT NULL,
  `total_penjualan` int(11) NOT NULL,
  `tanggal_bayar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_order` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `header_order`
--

INSERT INTO `header_order` (`no_order`, `id_customer`, `id_user_sales`, `id_user_gudang`, `total_penjualan`, `tanggal_bayar`, `status_order`) VALUES
(1, 2, 2, 0, 0, '2020-11-30 07:20:31', 'Invoice'),
(2, 2, 2, 0, 0, '2020-11-30 07:23:37', 'Invoice');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_users` int(10) NOT NULL,
  `nama_users` varchar(200) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_users`, `nama_users`, `Username`, `Password`, `Status`, `last_login`) VALUES
(1, 'admin', 'admin', 'admin', 'gudang', '2018-10-27 09:38:14'),
(2, 'sales', 'sales', 'sales', 'sales', '2018-10-27 09:39:06');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `header_order`
--
ALTER TABLE `header_order`
  ADD PRIMARY KEY (`no_order`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `header_order`
--
ALTER TABLE `header_order`
  MODIFY `no_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
