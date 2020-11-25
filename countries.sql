-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2020 at 07:34 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `countries`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `region_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES
(1, 'Italy', 'MIDDLE-EAST-3'),
(2, 'Palastine ', 'MIDDLE-EAST-4'),
(3, 'India', 'MIDDLE-EAST-2');

-- --------------------------------------------------------

--
-- Table structure for table `countries2`
--

CREATE TABLE `countries2` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `region_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dep_id` decimal(4,0) NOT NULL,
  `dep_name` varchar(30) DEFAULT NULL,
  `manger_id` decimal(6,0) NOT NULL,
  `location_id` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dup_countries`
--

CREATE TABLE `dup_countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `region_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dup_countries2`
--

CREATE TABLE `dup_countries2` (
  `country_id` int(11) NOT NULL DEFAULT 0,
  `country_name` varchar(255) NOT NULL,
  `region_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dup_countries2`
--

INSERT INTO `dup_countries2` (`country_id`, `country_name`, `region_id`) VALUES
(1, 'Jordan', 'MIDDLE-EAST-3'),
(2, 'Palastine ', 'MIDDLE-EAST-4'),
(3, 'Egypt', 'MIDDLE-EAST-2');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employ_id` decimal(6,0) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_num` varchar(20) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `job_id` varchar(10) NOT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `commission_pct` decimal(2,2) DEFAULT NULL,
  `manger_id` decimal(6,0) DEFAULT NULL,
  `dep_id` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` varchar(10) NOT NULL,
  `job_title` varchar(35) DEFAULT NULL,
  `min_salary` decimal(6,0) DEFAULT NULL,
  `max_salary` decimal(6,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES
('1', 'CEO', '200', '15000'),
('2', NULL, NULL, NULL),
('3', NULL, NULL, NULL),
('4', 'manger', NULL, NULL),
('5', ' KOKO', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_history`
--

CREATE TABLE `job_history` (
  `employee_id` decimal(6,0) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL CHECK (`end_date` like '--/--/----'),
  `job_id` varchar(10) NOT NULL,
  `depa_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `job_history2`
--

CREATE TABLE `job_history2` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`),
  ADD UNIQUE KEY `region_id` (`region_id`),
  ADD UNIQUE KEY `country_id` (`country_id`);

--
-- Indexes for table `countries2`
--
ALTER TABLE `countries2`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dep_id`,`manger_id`);

--
-- Indexes for table `dup_countries`
--
ALTER TABLE `dup_countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employ_id`),
  ADD KEY `dep_id` (`dep_id`,`manger_id`),
  ADD KEY `empjob` (`job_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `job_history`
--
ALTER TABLE `job_history`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `job_history2`
--
ALTER TABLE `job_history2`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD KEY `JOB_ID` (`JOB_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries2`
--
ALTER TABLE `countries2`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dup_countries`
--
ALTER TABLE `dup_countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `empjob` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`dep_id`,`manger_id`) REFERENCES `departments` (`dep_id`, `manger_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`);

--
-- Constraints for table `job_history2`
--
ALTER TABLE `job_history2`
  ADD CONSTRAINT `job_history2_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`job_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
