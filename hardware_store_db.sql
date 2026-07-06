-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2026 at 11:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hardware_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `apparaat_exemplaar`
--

CREATE TABLE `apparaat_exemplaar` (
  `exemplaar_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `serienummer` varchar(100) NOT NULL,
  `aankoopdatum` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('In magazijn','In gebruik','In reparatie','Afgeschreven') DEFAULT 'In magazijn'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apparaat_exemplaar`
--

INSERT INTO `apparaat_exemplaar` (`exemplaar_id`, `model_id`, `serienummer`, `aankoopdatum`, `status`) VALUES
(1, 1, 'SN-DELL-001', '2026-01-09 23:00:00', 'In gebruik'),
(2, 1, 'SN-DELL-002', '2026-01-09 23:00:00', 'In gebruik'),
(3, 1, 'SN-DELL-003', '2026-04-30 22:00:00', 'In magazijn'),
(4, 2, 'SN-LENO-999', '2026-02-13 23:00:00', 'In gebruik'),
(5, 3, 'SN-APPLE-X1', '2026-03-19 23:00:00', 'In gebruik'),
(6, 3, 'SN-APPLE-X2', '2026-03-19 23:00:00', 'In reparatie'),
(7, 4, 'SN-HP-99281', '2026-01-14 23:00:00', 'In gebruik'),
(8, 5, 'SN-BR-00192', '2026-03-09 23:00:00', 'In gebruik'),
(9, 6, 'SN-AS-55411', '2026-05-25 22:00:00', 'In gebruik'),
(10, 7, 'SN-IPHONE-991', '2026-05-09 22:00:00', 'In gebruik'),
(11, 7, 'SN-IPHONE-992', '2026-05-09 22:00:00', 'In gebruik'),
(12, 7, 'SN-IPHONE-993', '2026-05-25 22:00:00', 'In magazijn');

-- --------------------------------------------------------

--
-- Table structure for table `groep_kenmerk`
--

CREATE TABLE `groep_kenmerk` (
  `id` int(10) NOT NULL,
  `hardware_groep_id` int(10) NOT NULL,
  `kenmerk_id` int(10) NOT NULL,
  `is_verplicht` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groep_kenmerk`
--

INSERT INTO `groep_kenmerk` (`id`, `hardware_groep_id`, `kenmerk_id`, `is_verplicht`) VALUES
(1, 2, 1, 1),
(2, 2, 2, 1),
(3, 2, 3, 0),
(4, 5, 4, 0),
(5, 5, 5, 1),
(6, 5, 6, 1),
(7, 7, 7, 1),
(8, 7, 8, 1),
(9, 7, 9, 0),
(10, 10, 10, 1),
(11, 9, 11, 1),
(12, 12, 12, 1),
(13, 13, 13, 1),
(14, 13, 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `groep_tree`
--

CREATE TABLE `groep_tree` (
  `ancestor_id` int(11) NOT NULL,
  `descendant_id` int(11) NOT NULL,
  `depth` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groep_tree`
--

INSERT INTO `groep_tree` (`ancestor_id`, `descendant_id`, `depth`) VALUES
(1, 1, 0),
(1, 2, 1),
(1, 3, 1),
(1, 9, 2),
(1, 10, 2),
(1, 13, 1),
(2, 2, 0),
(2, 9, 1),
(2, 10, 1),
(3, 3, 0),
(4, 4, 0),
(4, 5, 1),
(5, 5, 0),
(6, 6, 0),
(6, 7, 1),
(6, 8, 1),
(6, 11, 2),
(6, 12, 2),
(6, 13, 1),
(7, 7, 0),
(7, 11, 1),
(7, 12, 1),
(8, 8, 0),
(9, 9, 0),
(10, 10, 0),
(11, 11, 0),
(12, 12, 0),
(13, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hardware_groep`
--

CREATE TABLE `hardware_groep` (
  `groep_id` int(11) NOT NULL,
  `naam` varchar(100) NOT NULL,
  `beschrijving` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hardware_groep`
--

INSERT INTO `hardware_groep` (`groep_id`, `naam`, `beschrijving`) VALUES
(1, 'Computers', 'Alle computergestuurde werkplekhardware'),
(2, 'Laptops', 'Draagbare computers'),
(3, 'Desktops', 'Vaste computerkasten'),
(4, 'Printers', 'Afdrukapparatuur'),
(5, 'Laserprinters', 'Printers werkend op toner'),
(6, 'Netwerk', 'Netwerkcomponenten'),
(7, 'Routers', 'Apparaten voor netwerkverkeer'),
(8, 'Modems', 'Modulators/Demodulators voor internet'),
(9, 'Ultrabooks', 'Lichte, dunne laptops voor onderweg'),
(10, 'Mobile Workstations', 'Krachtige laptops voor CAD en development'),
(11, 'Wired Routers', 'Core routers zonder ingebouwde Wi-Fi'),
(12, 'Wireless Access Points', 'Apparaten voor draadloos netwerkbereik'),
(13, 'Smartphones', 'Mobiele telefoons met computerfunctionaliteit');

-- --------------------------------------------------------

--
-- Table structure for table `kenmerk`
--

CREATE TABLE `kenmerk` (
  `kenmerk_id` int(11) NOT NULL,
  `naam` varchar(100) NOT NULL,
  `datatype` enum('tekst','numeriek','datum','boolean','keuzelijst') NOT NULL,
  `eenheid` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kenmerk`
--

INSERT INTO `kenmerk` (`kenmerk_id`, `naam`, `datatype`, `eenheid`) VALUES
(1, 'RAM Geheugen', 'numeriek', 'GB'),
(2, 'Opslagcapaciteit', 'numeriek', 'GB'),
(3, 'Processor', 'tekst', NULL),
(4, 'Afdruksnelheid', 'numeriek', 'PPM'),
(5, 'Kleur/Zwart-Wit', 'keuzelijst', NULL),
(6, 'Toner Type', 'tekst', NULL),
(7, 'Aantal LAN-poorten', 'numeriek', 'Stuks'),
(8, 'Wi-Fi Standaard', 'keuzelijst', NULL),
(9, 'Max Snelheid', 'numeriek', 'Mbps'),
(10, 'Dedicated GPU', 'boolean', NULL),
(11, 'Gewicht', 'numeriek', 'kg'),
(12, 'PoE Ondersteuning', 'boolean', NULL),
(13, 'Besturingssysteem', 'keuzelijst', NULL),
(14, 'Schermgrootte', 'numeriek', 'Inch');

-- --------------------------------------------------------

--
-- Table structure for table `product_model`
--

CREATE TABLE `product_model` (
  `model_id` int(11) NOT NULL,
  `groep_id` int(11) NOT NULL,
  `merk` varchar(100) NOT NULL,
  `model_naam` varchar(100) NOT NULL,
  `omschrijving` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_model`
--

INSERT INTO `product_model` (`model_id`, `groep_id`, `merk`, `model_naam`, `omschrijving`) VALUES
(1, 9, 'Dell', 'XPS 13 9320', 'Standaard ultrabook voor consultancy'),
(2, 10, 'Lenovo', 'ThinkPad P16 G2', 'Zware workstation voor developers'),
(3, 13, 'Apple', 'iPhone 15 Pro', 'Standaard mobiel voor bereikbaarheidsdienst'),
(4, 2, 'HP', 'EliteBook 840 G9', 'Standaard zakelijke laptop'),
(5, 5, 'Brother', 'HL-L8260CDW', 'Professionele kleurenlaserprinter voor afdelingen'),
(6, 7, 'ASUS', 'RT-AX88U', 'High-performance dual-band wifi-router'),
(7, 13, 'Apple', 'iPhone 15 ', 'Smartphones voor de buitendienst en bereikbaarheidsdienst');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apparaat_exemplaar`
--
ALTER TABLE `apparaat_exemplaar`
  ADD PRIMARY KEY (`exemplaar_id`),
  ADD UNIQUE KEY `serienummer` (`serienummer`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `groep_kenmerk`
--
ALTER TABLE `groep_kenmerk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hardware_groep_id` (`hardware_groep_id`,`kenmerk_id`),
  ADD KEY `kenmerk_id` (`kenmerk_id`);

--
-- Indexes for table `groep_tree`
--
ALTER TABLE `groep_tree`
  ADD PRIMARY KEY (`ancestor_id`,`descendant_id`),
  ADD KEY `descendant_id` (`descendant_id`);

--
-- Indexes for table `hardware_groep`
--
ALTER TABLE `hardware_groep`
  ADD PRIMARY KEY (`groep_id`);

--
-- Indexes for table `kenmerk`
--
ALTER TABLE `kenmerk`
  ADD PRIMARY KEY (`kenmerk_id`);

--
-- Indexes for table `product_model`
--
ALTER TABLE `product_model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `groep_id` (`groep_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apparaat_exemplaar`
--
ALTER TABLE `apparaat_exemplaar`
  MODIFY `exemplaar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `groep_kenmerk`
--
ALTER TABLE `groep_kenmerk`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hardware_groep`
--
ALTER TABLE `hardware_groep`
  MODIFY `groep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kenmerk`
--
ALTER TABLE `kenmerk`
  MODIFY `kenmerk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_model`
--
ALTER TABLE `product_model`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apparaat_exemplaar`
--
ALTER TABLE `apparaat_exemplaar`
  ADD CONSTRAINT `apparaat_exemplaar_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `product_model` (`model_id`);

--
-- Constraints for table `groep_kenmerk`
--
ALTER TABLE `groep_kenmerk`
  ADD CONSTRAINT `groep_kenmerk_ibfk_1` FOREIGN KEY (`hardware_groep_id`) REFERENCES `hardware_groep` (`groep_id`),
  ADD CONSTRAINT `groep_kenmerk_ibfk_2` FOREIGN KEY (`kenmerk_id`) REFERENCES `kenmerk` (`kenmerk_id`);

--
-- Constraints for table `groep_tree`
--
ALTER TABLE `groep_tree`
  ADD CONSTRAINT `groep_tree_ibfk_1` FOREIGN KEY (`ancestor_id`) REFERENCES `hardware_groep` (`groep_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groep_tree_ibfk_2` FOREIGN KEY (`descendant_id`) REFERENCES `hardware_groep` (`groep_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_model`
--
ALTER TABLE `product_model`
  ADD CONSTRAINT `product_model_ibfk_1` FOREIGN KEY (`groep_id`) REFERENCES `hardware_groep` (`groep_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
