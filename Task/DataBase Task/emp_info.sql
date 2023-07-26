-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2023 at 01:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee`
--

-- --------------------------------------------------------

--
-- Table structure for table `Information`
--

CREATE TABLE `information` (
  `id` int(11) NOT NULL,
  `Emp_no` int(11) DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Designation` varchar(50) DEFAULT NULL,
  `Hire_Date` date DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Comm` int(11) DEFAULT NULL,
  `Dept_No` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Information`
--

INSERT INTO `Information` (`id`, `Emp_no`, `First_Name`, `Last_Name`, `Designation`, `Hire_Date`, `Salary`, `Comm`, `Dept_No`) VALUES
(1, 1001, 'Stephen', 'Salvatore', 'Business Analyst', '1997-11-17', 50000, 0, 40),
(2, 1002, 'Diana', 'Lorrence', 'Technical Architect', '2000-05-01', 70000, 0, 10),
(3, 1003, 'James', 'Madisoan', 'Manager', '1988-06-19', 80400, 0, 40),
(4, 1004, 'Jones', 'Nick', 'Hr Analyst', '2003-01-02', 47000, 0, 30),
(5, 1005, 'Lucky', 'Gelller', 'HR Associate', '2008-07-13', 35000, 200, 30),
(6, 1006, 'Isaac', 'Stefan', 'Trainee', '2015-12-13', 20000, 0, 40),
(7, 1007, 'John', 'Smith', 'Clerk', '2005-12-17', 12000, 0, 10),
(8, 1008, 'Nancy', 'Gillbert', 'SalesMan', '1981-02-28', 18000, 300, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Information`
--
ALTER TABLE `Information`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Information`
--
ALTER TABLE `Information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
