-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2022 at 05:15 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loadtest`
--

-- --------------------------------------------------------

--
-- Table structure for table `equip`
--

CREATE TABLE `equip` (
  `id_equip` varchar(5) NOT NULL,
  `name_equip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `equip`
--

INSERT INTO `equip` (`id_equip`, `name_equip`) VALUES
('C22', 'C22'),
('C23', 'C23'),
('RF22', 'RF 22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_load`
--

CREATE TABLE `tb_load` (
  `id_load` varchar(3) NOT NULL,
  `name_load` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_load`
--

INSERT INTO `tb_load` (`id_load`, `name_load`) VALUES
('LO', 'Loaded'),
('NL', 'No Load');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id_test` int(11) NOT NULL,
  `tgl` date DEFAULT NULL,
  `no_wo` varchar(20) DEFAULT NULL,
  `id_equip` varchar(5) DEFAULT NULL,
  `id_tipeq` varchar(5) DEFAULT NULL,
  `nli1` decimal(10,0) DEFAULT NULL,
  `nli2` decimal(10,0) DEFAULT NULL,
  `nli3` decimal(10,0) DEFAULT NULL,
  `loi1` decimal(10,0) DEFAULT NULL,
  `loi2` decimal(10,0) DEFAULT NULL,
  `loi3` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id_test`, `tgl`, `no_wo`, `id_equip`, `id_tipeq`, `nli1`, `nli2`, `nli3`, `loi1`, `loi2`, `loi3`) VALUES
(66, NULL, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, '2022-10-16', '05', 'C22', 'EMD', '10', '20', '30', '40', '50', '60'),
(96, '2022-10-17', '05', 'C22', 'EMD', '20', '30', '40', '50', '60', '70'),
(97, '2022-10-19', '05', 'C22', 'EMD', '5', '5', '5', '5', '5', '5'),
(98, '2022-01-17', '21123870', 'C22', 'EMD', '38', '39', '40', '111', '114', '114'),
(99, '2022-02-09', '22101593', 'C22', 'EMD', '37', '37', '37', '111', '110', '110'),
(100, '2022-11-01', '1234567', 'C23', 'EMD', '40', '40', '40', '100', '100', '100'),
(101, '2022-11-18', '99', 'C22', 'EMD', '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_equip`
--

CREATE TABLE `tipe_equip` (
  `id_tipeq` varchar(5) NOT NULL,
  `nama_tipe` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipe_equip`
--

INSERT INTO `tipe_equip` (`id_tipeq`, `nama_tipe`) VALUES
('EMD', 'Electric Motor-Drive'),
('EMF', 'Electric Motor-Fan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equip`
--
ALTER TABLE `equip`
  ADD PRIMARY KEY (`id_equip`);

--
-- Indexes for table `tb_load`
--
ALTER TABLE `tb_load`
  ADD PRIMARY KEY (`id_load`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id_test`),
  ADD KEY `id_wo` (`no_wo`),
  ADD KEY `id_equip` (`id_equip`),
  ADD KEY `id_tipeq` (`id_tipeq`);

--
-- Indexes for table `tipe_equip`
--
ALTER TABLE `tipe_equip`
  ADD PRIMARY KEY (`id_tipeq`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
