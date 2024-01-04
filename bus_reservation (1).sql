-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 04, 2024 at 12:35 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus_details`
--

DROP TABLE IF EXISTS `bus_details`;
CREATE TABLE IF NOT EXISTS `bus_details` (
  `Bus_Id` int NOT NULL AUTO_INCREMENT,
  `Bus_Number` varchar(100) NOT NULL,
  PRIMARY KEY (`Bus_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bus_details`
--

INSERT INTO `bus_details` (`Bus_Id`, `Bus_Number`) VALUES
(1, 'HP64B7634'),
(2, 'PB05CE4512'),
(3, 'HP54C7609'),
(4, 'HP04CA3412'),
(5, 'HP34QR3453'),
(6, 'HP08RE4598'),
(9, 'CH01GJ9966');

-- --------------------------------------------------------

--
-- Table structure for table `bus_seatstable`
--

DROP TABLE IF EXISTS `bus_seatstable`;
CREATE TABLE IF NOT EXISTS `bus_seatstable` (
  `Seats_id` int NOT NULL AUTO_INCREMENT,
  `Seats_Name` varchar(255) NOT NULL,
  `Bus_Id` int NOT NULL,
  PRIMARY KEY (`Seats_id`),
  KEY `Bus_IdFK` (`Bus_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bus_seatstable`
--

INSERT INTO `bus_seatstable` (`Seats_id`, `Seats_Name`, `Bus_Id`) VALUES
(1, 'A1', 1),
(2, 'A2', 1),
(3, 'A3', 1),
(4, 'A4', 1),
(5, 'A5', 1),
(6, 'A6', 1),
(7, 'A7', 1),
(8, 'A8', 1),
(9, 'A9', 1),
(10, 'A10', 1),
(11, 'A11', 1),
(12, 'A12', 1),
(13, 'B1', 2),
(14, 'B2', 2),
(15, 'B3', 2),
(16, 'B4', 2),
(17, 'B5', 2),
(18, 'B6', 2),
(19, 'B7', 2),
(20, 'B8', 2),
(21, 'B9', 2),
(22, 'B10', 2),
(23, 'B11', 2),
(24, 'B12', 2),
(25, 'C1', 3),
(26, 'C2', 3),
(27, 'C3', 3),
(28, 'C4', 3),
(29, 'C5', 3),
(30, 'C6', 3),
(31, 'C7', 3),
(32, 'C8', 3),
(33, 'C9', 3),
(34, 'C10', 3),
(35, 'C11', 3),
(36, 'C12', 3),
(37, 'D1', 4),
(38, 'D2', 4),
(39, 'D3', 4),
(40, 'D4', 4),
(41, 'D5', 4),
(42, 'D6', 4),
(43, 'D7', 4),
(44, 'D8', 4),
(45, 'D9', 4),
(46, 'D10', 4),
(47, 'D11', 4),
(48, 'D12', 4),
(49, 'E1', 5),
(50, 'E2', 5),
(51, 'E3', 5),
(52, 'E4', 5),
(53, 'E5', 5),
(54, 'E6', 5),
(55, 'E7', 5),
(56, 'E8', 5),
(57, 'E9', 5),
(58, 'E10', 5),
(59, 'E11', 5),
(60, 'E12', 5),
(61, 'F1', 6),
(62, 'F2', 6),
(63, 'F3', 6),
(64, 'F4', 6),
(65, 'F5', 6),
(66, 'F6', 6),
(67, 'F7', 6),
(68, 'F8', 6),
(69, 'F9', 6),
(70, 'F10', 6),
(71, 'F11', 6),
(72, 'F12', 6),
(73, 'G1', 9),
(74, 'G2', 9),
(75, 'G3', 9),
(76, 'G4', 9),
(77, 'G5', 9),
(78, 'G6', 9),
(79, 'G7', 9),
(80, 'G8', 9),
(81, 'G9', 9),
(82, 'G10', 9),
(83, 'G11', 9),
(84, 'G12', 9);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE IF NOT EXISTS `route` (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `Route_Id` int NOT NULL,
  `Bus_Id` int NOT NULL,
  `Price` int NOT NULL,
  `TotalSeats` int NOT NULL,
  PRIMARY KEY (`r_id`),
  KEY `Test` (`Bus_Id`),
  KEY `Route_Id` (`Route_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`r_id`, `Route_Id`, `Bus_Id`, `Price`, `TotalSeats`) VALUES
(1, 1, 1, 450, 46),
(2, 1, 3, 865, 36),
(3, 3, 2, 355, 46),
(5, 4, 4, 385, 43),
(6, 5, 5, 453, 56),
(7, 6, 6, 645, 56),
(14, 2, 9, 454, 42);

-- --------------------------------------------------------

--
-- Table structure for table `route_table`
--

DROP TABLE IF EXISTS `route_table`;
CREATE TABLE IF NOT EXISTS `route_table` (
  `Route_Id` int NOT NULL AUTO_INCREMENT,
  `Arrival` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Route_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `route_table`
--

INSERT INTO `route_table` (`Route_Id`, `Arrival`, `Destination`) VALUES
(1, 'Chandigarh ', 'Hamirpur'),
(2, 'Shimla', 'Una'),
(3, 'Sujanpur', 'Baiznath'),
(4, 'Amritsar', 'Sujanpur'),
(5, 'Dehradun', 'Dharmshala'),
(6, 'Noida', 'Manali');

-- --------------------------------------------------------

--
-- Table structure for table `seats_booking`
--

DROP TABLE IF EXISTS `seats_booking`;
CREATE TABLE IF NOT EXISTS `seats_booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `Route_Id` int NOT NULL,
  `Bus_Id` int NOT NULL,
  `dates` date NOT NULL,
  `Seats_id` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `Route_Id` (`Route_Id`),
  KEY `Bus_Id` (`Bus_Id`),
  KEY `seats_IdFk` (`Seats_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seats_booking`
--

INSERT INTO `seats_booking` (`booking_id`, `Route_Id`, `Bus_Id`, `dates`, `Seats_id`) VALUES
(1, 2, 9, '2024-01-10', 73),
(2, 2, 9, '2024-01-10', 79),
(3, 1, 1, '2024-01-05', 7),
(4, 1, 1, '2024-01-05', 8),
(5, 1, 1, '2024-01-05', 9),
(6, 1, 1, '2024-01-11', 9),
(7, 1, 1, '2024-01-09', 4),
(8, 1, 1, '2024-01-09', 6),
(9, 1, 1, '2024-01-18', 5),
(10, 1, 1, '2024-01-18', 6),
(11, 1, 1, '2024-01-18', 2),
(12, 1, 1, '2024-01-11', 1),
(13, 1, 1, '2024-01-11', 2),
(14, 1, 1, '2024-01-11', 3),
(15, 1, 1, '2024-01-09', 6),
(16, 1, 1, '2024-01-09', 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `User_id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_id`, `Username`, `Phone`, `Email`, `Password`) VALUES
(1, 'Mycollege', '7986717009', 'kohliv9815@gmail.com', '$2y$10$uNfqoiRhiG5bB3SXTL5rRulmZq87mA2uJrwVu4ECLjiYljVyhmL4i'),
(2, 'Kuldeep', '7986717009', 'kuldeep123@gmail.com', '$2y$10$z9RYOy/cHGq6ppOeh6HOeePqh0cR7AIrLZ5gPB.yIxrTtvGv4b8au'),
(3, 'Raghav', '9867655423', 'Raghav123@gmail.com', '$2y$10$7c.qYrfRoxi14swxoTJpbubpyO/AVi7H8qxdSGL1B7FNSDhL5CMR2'),
(4, 'Tina', '9915828320', 'kohli45@gmail.com', '$2y$10$XNuFtvZC0SLCQ5UlR.EJROTPS/r7VV/ijkF/.oIJNA2PBgKuesUom'),
(5, 'Admin', '7986717009', 'admin123@gmail.com', '$2y$10$zaJKmt.WSrpHvaCEUkctQ.TnlhKVYFeggQBUtmWY8fRIA0bLSakEC'),
(6, 'Ranveer', '9856454545', 'admin124@gmail.com', '$2y$10$AHQm3y5KrHzL7pjKuvqmT.BONEFRtWL5AiJhbISWvalxNGCJ6NxQe'),
(7, 'Ravinder', '9876543212', 'Ravi123@gmail.com', '$2y$10$xsUENq2i49PsVkZS5G6aNuSqxxyTynMd6HLDk8uBC46/2JGEHdvPm'),
(8, 'Rohit', '9811547951', 'admin123@gmail.com', '$2y$10$m3WXeLtc41MdiJ.a.FP0H.BjIpULoaETLLiS1jD/sW3PzgzAR5zgm'),
(9, 'Ronit', '7986717009', 'kohliu123@gmail.com', '$2y$10$0Unk9LWyN1JkzpPB8Qg8NuqAcGHPAygZg0g4PXp5qFtjpfcnmsL1e'),
(10, 'vineet', '9815479511', 'kohliv56@gmail.com', '$2y$10$r/ecIlKLc1wR.pDIUraqtOtg18cYzexlWRJgF9eBupE8doAhKHP0a'),
(11, '', '', '', '$2y$10$eyWTmhLei.XMIklyx7ZNtu1m6dhfunMjqIM/zowAokBJrnYB3TFkq'),
(14, 'Nikki', '7986717009', 'kohliv9814@gmail.com', '$2y$10$RE1O/fheC5OKu6nCopGGC.adcT5zHZzT08IbwWWQCwpalmm.jbfiS'),
(17, 'Neera', '9815479511', 'neera123@gmail.com', '$2y$10$VLuYEHwEsOJHX865H0CQT.NNRcFUAuuuKQt0m04UZDqkDMHz4wDBO'),
(18, 'Rekha', '8978787878', 'kohliv981@gmail.com', '$2y$10$2F52I1vTTCpA8RMY9Sza3O29rhJrXbF0gnG5aaMbKb7.g11NBzneO'),
(19, 'Hoshiyaar', '4565454545', 'hoshiyaar@gmail.com', '$2y$10$94zGB6DEP691YpNbQfgIw.3tG3hktRKpduMXn/MDT5ciPtIkc4yjK'),
(21, 'Drishti', '1234567891', 'hyty123@gmail.com', '$2y$10$pJ2kupZRKIDvMNOjIoWmTeO1VmP.p4epzRFsktpHinbkikwV9angq'),
(22, 'Sanjeev', '1234567890', 'Sanjeev@gmail.com', '$2y$10$n1cnLzFEQ9EPx077ToeyxuN9DEiM/gSF6/N.lUrVsqNe.S5hEFEZy');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus_seatstable`
--
ALTER TABLE `bus_seatstable`
  ADD CONSTRAINT `Bus_IdFK` FOREIGN KEY (`Bus_Id`) REFERENCES `bus_details` (`Bus_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`Route_Id`) REFERENCES `route_table` (`Route_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Test` FOREIGN KEY (`Bus_Id`) REFERENCES `bus_details` (`Bus_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seats_booking`
--
ALTER TABLE `seats_booking`
  ADD CONSTRAINT `seats_booking_ibfk_2` FOREIGN KEY (`Route_Id`) REFERENCES `route_table` (`Route_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seats_booking_ibfk_3` FOREIGN KEY (`Bus_Id`) REFERENCES `bus_details` (`Bus_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seats_IdFk` FOREIGN KEY (`Seats_id`) REFERENCES `bus_seatstable` (`Seats_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
