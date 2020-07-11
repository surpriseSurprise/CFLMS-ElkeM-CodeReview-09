-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 04:09 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_elkem_delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `name`, `address`) VALUES
(1, 'Delivery Dummies', '1110 Vienna');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`) VALUES
(1, 'Adam', 'Sender'),
(2, 'Bertram', 'Sender'),
(3, 'Christian', 'Sender');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `name`, `address`, `fk_package_id`, `fk_customer_id`, `fk_employee_id`) VALUES
(1, 'Anton Adam Gettner', 'Adamweg 1, 1100 Vienna', 1, 1, 1),
(2, 'Balthasar Bertram Gettner', 'Bertaweg 1, 1120 Vienna', 2, 2, 2),
(3, 'Christoph Christian Gettner', 'Christianweg 1, 1130 Vienna', 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `fk_company_id`) VALUES
(1, 'Anna', 'Postl', 1),
(2, 'Berta', 'Briefner', 1),
(3, 'Cesar', 'Cashier', 1);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `weight` text DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `size`, `weight`, `fk_customer_id`) VALUES
(1, 1, '500g', 1),
(2, 2, '1000g', 2),
(3, 3, '5000g', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pickup`
--

CREATE TABLE `pickup` (
  `pickup_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pickup`
--

INSERT INTO `pickup` (`pickup_id`, `name`, `address`, `fk_package_id`, `fk_customer_id`) VALUES
(1, 'Pickup A', 'Adamstr. 1, 1010 Vienna', 1, 1),
(2, 'Pickup B', 'Bertastr. 1, 1020 Vienna', 2, 2),
(3, 'Pickup C', 'Christianstr. 1, 1030 Vienna', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `processes`
--

CREATE TABLE `processes` (
  `processes_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `processes`
--

INSERT INTO `processes` (`processes_id`, `date`, `time`, `fk_package_id`, `fk_customer_id`, `fk_employee_id`) VALUES
(1, '2020-07-10', '2020-07-10 14:00:00', 1, 1, 1),
(2, '2020-07-11', '2020-07-11 15:00:00', 2, 2, 2),
(3, '2020-07-12', '2020-07-12 16:00:00', 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `receives`
--

CREATE TABLE `receives` (
  `receives_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receives`
--

INSERT INTO `receives` (`receives_id`, `date`, `time`, `fk_package_id`, `fk_customer_id`) VALUES
(1, '2020-07-10', '2020-07-10 10:00:00', 1, 1),
(2, '2020-07-11', '2020-07-11 11:00:00', 2, 2),
(3, '2020-07-12', '2020-07-12 12:00:00', 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_company_id` (`fk_company_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `pickup`
--
ALTER TABLE `pickup`
  ADD PRIMARY KEY (`pickup_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `processes`
--
ALTER TABLE `processes`
  ADD PRIMARY KEY (`processes_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `receives`
--
ALTER TABLE `receives`
  ADD PRIMARY KEY (`receives_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `pickup`
--
ALTER TABLE `pickup`
  ADD CONSTRAINT `pickup_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `pickup_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `processes`
--
ALTER TABLE `processes`
  ADD CONSTRAINT `processes_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `processes_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `processes_ibfk_3` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `receives`
--
ALTER TABLE `receives`
  ADD CONSTRAINT `receives_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `receives_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
