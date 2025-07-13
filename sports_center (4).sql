-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2025 at 11:59 PM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sports_center`
--

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `id_facility` int(4) NOT NULL,
  `type_fac` varchar(60) NOT NULL,
  `hourly_price_fac` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`id_facility`, `type_fac`, `hourly_price_fac`) VALUES
(1, 'football fields', '1000.000'),
(2, 'tennis courts', '2000.999'),
(3, 'swimming pools', '3990.100'),
(4, 'Karate dojo', '1000.000');

-- --------------------------------------------------------

--
-- Table structure for table `facility_available_time`
--

CREATE TABLE `facility_available_time` (
  `id_available_fac` int(4) NOT NULL,
  `id_fac` int(4) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `date_avaible` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facility_available_time`
--

INSERT INTO `facility_available_time` (`id_available_fac`, `id_fac`, `start_time`, `end_time`, `date_avaible`) VALUES
(1, 1, '12:00:00', '13:00:00', '2025-05-12'),
(2, 2, '14:00:00', '16:00:00', '2025-05-12'),
(3, 3, '20:00:00', '21:30:00', '2025-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `amount_pay` decimal(10,3) NOT NULL DEFAULT '0.000',
  `method_pay` enum('cash','card','online') DEFAULT NULL,
  `pay_date` date NOT NULL,
  `payment_type` enum('reservation','subscription') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id_payment`, `id_user`, `amount_pay`, `method_pay`, `pay_date`, `payment_type`) VALUES
(1, 1, '3000.000', 'card', '2025-05-10', 'reservation'),
(2, 3, '500.000', 'cash', '2025-05-11', 'subscription'),
(3, 1, '1000.000', 'online', '2025-05-12', 'reservation');

-- --------------------------------------------------------

--
-- Table structure for table `payment_reservation`
--

CREATE TABLE `payment_reservation` (
  `id_payment` int(4) NOT NULL,
  `id_res` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_reservation`
--

INSERT INTO `payment_reservation` (`id_payment`, `id_res`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment_subscription`
--

CREATE TABLE `payment_subscription` (
  `id_payment` int(4) NOT NULL,
  `id_sub` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_subscription`
--

INSERT INTO `payment_subscription` (`id_payment`, `id_sub`) VALUES
(1, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id_res` int(4) NOT NULL,
  `start_res` time NOT NULL,
  `end_res` time NOT NULL,
  `date_res` date NOT NULL,
  `status` enum('confirmed','cancelled','pending') DEFAULT 'pending',
  `id_user` int(4) NOT NULL,
  `id_facility` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id_res`, `start_res`, `end_res`, `date_res`, `status`, `id_user`, `id_facility`) VALUES
(1, '10:00:00', '11:00:00', '2025-05-10', 'confirmed', 1, 1),
(2, '14:00:00', '15:00:00', '2025-05-11', 'pending', 3, 2),
(3, '09:00:00', '10:00:00', '2025-05-12', 'cancelled', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id_sub` int(4) NOT NULL,
  `type_sub` enum('monthly','yearly') DEFAULT 'monthly',
  `start_sub` date NOT NULL,
  `end_sub` date NOT NULL,
  `amount_sub` decimal(10,2) DEFAULT NULL,
  `activity_sub` varchar(200) NOT NULL,
  `status_sub` enum('active','expired','cancelled') DEFAULT 'expired',
  `id_user` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`id_sub`, `type_sub`, `start_sub`, `end_sub`, `amount_sub`, `activity_sub`, `status_sub`, `id_user`) VALUES
(16, 'monthly', '2025-05-01', '2025-05-31', '1999.99', 'fitness', 'active', 1),
(17, 'yearly', '2025-01-01', '2025-12-31', '2000.10', 'yoga', 'active', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(4) NOT NULL,
  `name_user` varchar(60) NOT NULL,
  `surname_user` varchar(60) NOT NULL,
  `email_user` varchar(60) NOT NULL,
  `password_user` varchar(150) NOT NULL,
  `phone_nmbr_user` varchar(150) NOT NULL,
  `role` enum('client','admin') DEFAULT 'client'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `surname_user`, `email_user`, `password_user`, `phone_nmbr_user`, `role`) VALUES
(1, 'soundous', 'cherifi', 'sondos23cv@gmail.com', 'sdd23', '0654321180', 'client'),
(2, 'aya', 'elbir', 'ayahh@gmail.com', 'sggg', '0654326780', 'client'),
(3, 'ahmed', 'cherifi', 'ahmed123@gmail.com', '12344', '0654399980', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`id_facility`);

--
-- Indexes for table `facility_available_time`
--
ALTER TABLE `facility_available_time`
  ADD PRIMARY KEY (`id_available_fac`),
  ADD KEY `id_fac` (`id_fac`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `fk_pay_user` (`id_user`);

--
-- Indexes for table `payment_reservation`
--
ALTER TABLE `payment_reservation`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `fk_payres_reservation` (`id_res`);

--
-- Indexes for table `payment_subscription`
--
ALTER TABLE `payment_subscription`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `fk_paysub_subscription` (`id_sub`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_res`),
  ADD KEY `fk_res_user` (`id_user`),
  ADD KEY `fk_res_fac` (`id_facility`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id_sub`),
  ADD KEY `fk_sub_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `id_facility` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `facility_available_time`
--
ALTER TABLE `facility_available_time`
  MODIFY `id_available_fac` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_res` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id_sub` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `facility_available_time`
--
ALTER TABLE `facility_available_time`
  ADD CONSTRAINT `facility_available_time_ibfk_1` FOREIGN KEY (`id_fac`) REFERENCES `facility` (`id_facility`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_pay_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `payment_reservation`
--
ALTER TABLE `payment_reservation`
  ADD CONSTRAINT `fk_payres_payment` FOREIGN KEY (`id_payment`) REFERENCES `payment` (`id_payment`),
  ADD CONSTRAINT `fk_payres_reservation` FOREIGN KEY (`id_res`) REFERENCES `reservation` (`id_res`);

--
-- Constraints for table `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `fk_sub_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
