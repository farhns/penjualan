-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2025 at 04:58 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `barang_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`barang_id`, `kategori_id`, `nama_barang`, `harga`) VALUES
(13, 15, 'Materai 10rb', 11000),
(14, 8, 'Paper Klip', 6000),
(15, 8, 'Double Tape', 4500),
(16, 16, 'Pulpen', 4000),
(17, 16, 'Pensil', 3000),
(18, 15, 'Amplop', 15000),
(19, 6, 'Kertas Binder', 18000),
(20, 6, 'Buku Tulis Matematika', 4500),
(21, 6, 'Kertas Origami', 14000),
(22, 16, 'Stabilo', 12500),
(24, 16, 'Pensil', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori_barang`
--

CREATE TABLE `tbl_kategori_barang` (
  `kategori_id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_kategori_barang`
--

INSERT INTO `tbl_kategori_barang` (`kategori_id`, `nama_kategori`) VALUES
(16, 'Alat Tulis'),
(6, 'Buku Tulis dan Kertas'),
(8, 'Perlengkapan Sekolah dan Kantor'),
(15, 'Surat Menyurat'),
(17, 'alat tulis');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `operator_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`transaksi_id`, `tanggal_transaksi`, `operator_id`) VALUES
(10, '2022-08-18', 7),
(9, '2022-08-18', 6),
(11, '2024-01-04', 6),
(12, '2024-01-04', 6),
(13, '2024-01-04', 6),
(14, '2024-01-04', 6),
(15, '2024-01-04', 7),
(16, '2024-01-04', 6),
(17, '2024-01-04', 6),
(18, '2024-01-04', 6),
(19, '2024-01-04', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi_detail`
--

CREATE TABLE `tbl_transaksi_detail` (
  `t_detail_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL COMMENT '1= sudah diproses , 0 belum diproses'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_transaksi_detail`
--

INSERT INTO `tbl_transaksi_detail` (`t_detail_id`, `barang_id`, `qty`, `transaksi_id`, `harga`, `status`) VALUES
(60, 14, 2, 19, 6000, '1'),
(61, 16, 3, 19, 4000, '1'),
(59, 22, 1, 19, 12500, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `operator_id` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `last_login` date NOT NULL,
  `akses` char(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`operator_id`, `nama_lengkap`, `username`, `password`, `last_login`, `akses`) VALUES
(7, 'kasir', 'kasir', 'c7911af3adbd12a035b289556d96470a', '2022-08-18', '2'),
(6, 'Admin Bos', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2023-12-10', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`barang_id`);

--
-- Indexes for table `tbl_kategori_barang`
--
ALTER TABLE `tbl_kategori_barang`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`transaksi_id`);

--
-- Indexes for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD PRIMARY KEY (`t_detail_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`operator_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_kategori_barang`
--
ALTER TABLE `tbl_kategori_barang`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  MODIFY `t_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `operator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
