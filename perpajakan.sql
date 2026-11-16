-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 16, 2026 at 05:28 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpajakan`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pajak`
--

CREATE TABLE `jenis_pajak` (
  `id_pajak` varchar(10) NOT NULL,
  `id_kategori` varchar(10) NOT NULL,
  `nama_pajak` varchar(100) NOT NULL,
  `tarif_pajak` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_pajak`
--

CREATE TABLE `kategori_pajak` (
  `id_kategori` varchar(10) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_pajak`
--

CREATE TABLE `pembayaran_pajak` (
  `id_pembayaran` varchar(15) NOT NULL,
  `tanggal_bayar` datetime NOT NULL,
  `id_pengguna` varchar(10) NOT NULL,
  `id_pajak` varchar(10) NOT NULL,
  `id_petugas` varchar(10) NOT NULL,
  `jumlah_bayar` int NOT NULL,
  `status_pembayaran` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` varchar(10) NOT NULL,
  `nama_pengguna` varchar(100) NOT NULL,
  `tipe_pengguna` varchar(30) NOT NULL,
  `npwp` varchar(25) DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_pajak`
--
ALTER TABLE `jenis_pajak`
  ADD PRIMARY KEY (`id_pajak`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori_pajak`
--
ALTER TABLE `kategori_pajak`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pembayaran_pajak`
--
ALTER TABLE `pembayaran_pajak`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `id_pajak` (`id_pajak`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `npwp` (`npwp`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jenis_pajak`
--
ALTER TABLE `jenis_pajak`
  ADD CONSTRAINT `jenis_pajak_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_pajak` (`id_kategori`);

--
-- Constraints for table `pembayaran_pajak`
--
ALTER TABLE `pembayaran_pajak`
  ADD CONSTRAINT `pembayaran_pajak_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`),
  ADD CONSTRAINT `pembayaran_pajak_ibfk_2` FOREIGN KEY (`id_pajak`) REFERENCES `jenis_pajak` (`id_pajak`),
  ADD CONSTRAINT `pembayaran_pajak_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `pengguna` (`id_pengguna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
