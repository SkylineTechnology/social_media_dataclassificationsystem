-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2024 at 03:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dataclassificationsys_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chatid` varchar(30) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `receiver` varchar(100) NOT NULL,
  `msg` varchar(5000) NOT NULL,
  `status` varchar(10) NOT NULL,
  `sentiment` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comid` varchar(100) NOT NULL,
  `postid` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `sentiment` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comid`, `postid`, `username`, `msg`, `sentiment`, `date`) VALUES
('POST-20240903341408', 'POST-20240943071407', 'skylinesnow07@gmail.com', 'thank you', 'neutral', '2024-09-14 20:03:34'),
('POST-20240946411407', 'POST-20240943071407', 'skylinesnow07@gmail.com', 'you are bad person', 'negative', '2024-09-14 19:46:41'),
('POST-20240948091407', 'POST-20240943071407', 'skylinesnow07@gmail.com', 'you have a bad behaviour', 'negative', '2024-09-14 19:48:09'),
('POST-20240948511407', 'POST-20240943071407', 'skylinesnow07@gmail.com', 'i like the way you have amend you ways good work', 'positive', '2024-09-14 19:48:51');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `fullname` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `title` varchar(500) NOT NULL,
  `message` varchar(10000) NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` varchar(30) NOT NULL,
  `dept_name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
('com123', 'Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `lec_id` int(11) NOT NULL,
  `lec_name` varchar(60) NOT NULL,
  `title` varchar(60) NOT NULL,
  `lec_email` varchar(60) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(25) NOT NULL DEFAULT '',
  `password` varchar(500) NOT NULL DEFAULT '',
  `role` varchar(8) NOT NULL DEFAULT '',
  `status` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `role`, `status`) VALUES
('admin@admin.com', 'a', 'admin', 'yes'),
('skylinesnow07@gmail.com', 'a', 'user', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `memberid` varchar(20) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberid`, `fullname`, `gender`, `email`, `nationality`, `reg_date`) VALUES
('TUHM-QP61', 'shosanya razaq oluwaseyi', 'male', 'skylinesnow07@gmail.com', 'nigerian', '2024-09-14 19:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE `timeline` (
  `id` varchar(30) NOT NULL,
  `username` varchar(100) NOT NULL,
  `dept_id` varchar(60) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `sentiment` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`id`, `username`, `dept_id`, `msg`, `sentiment`, `date`) VALUES
('POST-20240931221410', 'skylinesnow07@gmail.com', '', 'This government is so bad', 'negative', '2024-09-14 22:31:22'),
('POST-20240943071407', 'skylinesnow07@gmail.com', '', 'hello', 'neutral', '2024-09-14 19:43:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chatid`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comid`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`lec_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`memberid`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `lec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
