-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2026 at 05:58 AM
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
-- Database: `lumbera_lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `author_firstname` varchar(255) NOT NULL,
  `author_lastname` varchar(255) NOT NULL,
  `author_birth_year` smallint(6) NOT NULL,
  `author_nationality` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `author_birth_year`, `author_nationality`) VALUES
(1, 'Jose', 'Rizal', 1861, 'Filipino'),
(2, 'Amado', 'Hernandez', 1903, 'Filipino'),
(3, 'F. H.', 'Batacan', 1967, 'Filipino'),
(4, 'Lualhati', 'Bautista', 1946, 'Filipino'),
(5, 'Nick', 'Joaquin', 1917, 'Filipino'),
(6, 'Bob', 'Ong', 1979, 'Filipino');

-- --------------------------------------------------------

--
-- Table structure for table `bookauthor`
--

CREATE TABLE `bookauthor` (
  `bau_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookauthor`
--

INSERT INTO `bookauthor` (`bau_id`, `book_id`, `author_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 3),
(5, 5, 4),
(6, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bookcopy`
--

CREATE TABLE `bookcopy` (
  `copy_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `status` enum('AVAILABLE','ON_LOAN','LOST','DAMAGED','REPAIR') DEFAULT 'AVAILABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookcopy`
--

INSERT INTO `bookcopy` (`copy_id`, `book_id`, `status`) VALUES
(101, 1, 'AVAILABLE'),
(102, 1, 'ON_LOAN'),
(103, 1, 'AVAILABLE'),
(201, 2, 'AVAILABLE'),
(202, 2, 'AVAILABLE'),
(301, 3, 'AVAILABLE'),
(302, 3, 'REPAIR'),
(401, 4, 'ON_LOAN'),
(402, 4, 'AVAILABLE'),
(501, 5, 'AVAILABLE'),
(502, 5, 'LOST');

-- --------------------------------------------------------

--
-- Table structure for table `bookgenre`
--

CREATE TABLE `bookgenre` (
  `gb_id` int(11) NOT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookgenre`
--

INSERT INTO `bookgenre` (`gb_id`, `genre_id`, `book_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 5, 1),
(4, 1, 2),
(5, 4, 2),
(6, 5, 2),
(7, 4, 3),
(8, 5, 3),
(9, 3, 4),
(10, 5, 4),
(11, 2, 5),
(12, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `book_title` varchar(255) DEFAULT NULL,
  `book_isbn` varchar(255) DEFAULT NULL,
  `book_publication` smallint(5) DEFAULT NULL,
  `book_edition` varchar(255) DEFAULT NULL,
  `book_publisher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `book_title`, `book_isbn`, `book_publication`, `book_edition`, `book_publisher`) VALUES
(1, 'Noli Me Tangere', '9789710810736', 1887, 'Reprint Edition', 'National Book Store'),
(2, 'El Filibusterismo', '9789710810743', 1891, 'Reprint Edition', 'National Book Store'),
(3, 'Mga Ibong Mandaragit', '9789711000000', 1969, '1st Edition', 'Adarna House'),
(4, 'Smaller and Smaller Circles', '9789712721768', 2002, '1st Edition', 'Ateneo de Manila University Press'),
(5, 'Dekada ’70', '9789712712346', 1983, '2nd Edition', 'Ateneo de Manila University Press');

-- --------------------------------------------------------

--
-- Table structure for table `borroweraddress`
--

CREATE TABLE `borroweraddress` (
  `ba_id` int(11) NOT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `ba_house_number` smallint(5) NOT NULL,
  `ba_street` varchar(255) NOT NULL,
  `ba_barangay` varchar(255) NOT NULL,
  `ba_city` varchar(255) NOT NULL,
  `ba_province` varchar(255) NOT NULL,
  `ba_postal_code` smallint(5) NOT NULL,
  `ba_country` varchar(255) NOT NULL,
  `is_primary` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borroweraddress`
--

INSERT INTO `borroweraddress` (`ba_id`, `borrower_id`, `ba_house_number`, `ba_street`, `ba_barangay`, `ba_city`, `ba_province`, `ba_postal_code`, `ba_country`, `is_primary`) VALUES
(1, 1, 32, 'Maharlika St.', 'Brgy. Sabang', 'Lipa City', 'Batangas', 4217, 'Philippines', 1),
(2, 2, 145, 'Rizal Ave.', 'Brgy. Balintawak', 'Quezon City', 'Metro Manila', 1100, 'Philippines', 1),
(3, 3, 8, 'Mabini St.', 'Brgy. San Roque', 'Antipolo City', 'Rizal', 1870, 'Philippines', 1),
(4, 4, 21, 'Del Pilar St.', 'Brgy. Poblacion', 'Calamba City', 'Laguna', 4027, 'Philippines', 1),
(5, 5, 77, 'Bonifacio St.', 'Brgy. Talomo', 'Davao City', 'Davao del Sur', 8000, 'Philippines', 1),
(6, 6, 19, 'JP Laurel St.', 'Brgy. Lahug', 'Cebu City', 'Cebu', 6000, 'Philippines', 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `borrower_id` int(11) NOT NULL,
  `borrower_firstname` varchar(255) NOT NULL,
  `borrower_lastname` varchar(255) NOT NULL,
  `borrower_email` varchar(255) NOT NULL,
  `borrower_phone_number` varchar(255) NOT NULL,
  `borrower_member_since` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`borrower_id`, `borrower_firstname`, `borrower_lastname`, `borrower_email`, `borrower_phone_number`, `borrower_member_since`, `is_active`) VALUES
(1, 'Juan', 'Dela Cruz', 'juan.delacruz@samplemail.com', '09171234567', '2024-06-09 16:00:00', 1),
(2, 'Maria', 'Santos', 'maria.santos@samplemail.com', '09281234567', '2023-09-21 16:00:00', 1),
(3, 'Mark', 'Reyes', 'mark.reyes@samplemail.com', '09061234567', '2025-01-14 16:00:00', 1),
(4, 'Ana', 'Bautista', 'ana.bautista@samplemail.com', '09991234567', '2024-11-04 16:00:00', 1),
(5, 'Paolo', 'Garcia', 'paolo.garcia@samplemail.com', '09351234567', '2022-07-18 16:00:00', 0),
(6, 'Grace', 'Mendoza', 'grace.mendoza@samplemail.com', '09181234567', '2025-07-01 16:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `borroweruser`
--

CREATE TABLE `borroweruser` (
  `bu_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borroweruser`
--

INSERT INTO `borroweruser` (`bu_id`, `user_id`, `borrower_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 5, 4),
(5, 6, 5),
(6, 7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(1, 'Classic'),
(2, 'Historical Fiction'),
(3, 'Mystery/Crime'),
(5, 'Philippine Literature'),
(4, 'Political Fiction');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `processed_by_user_id` int(11) DEFAULT NULL,
  `loan_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `loan_status` enum('OPEN','CLOSED','CANCELLED') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_id`, `borrower_id`, `processed_by_user_id`, `loan_date`, `loan_status`) VALUES
(1001, 1, 1, '2025-10-02 16:00:00', 'CLOSED'),
(1002, 2, 1, '2025-12-11 16:00:00', 'CLOSED'),
(1003, 3, 1, '2026-01-09 16:00:00', 'OPEN'),
(1004, 4, 1, '2026-02-14 16:00:00', 'OPEN'),
(1005, 6, 1, '2025-08-19 16:00:00', 'CLOSED'),
(1006, 2, 1, '2025-03-04 16:00:00', 'CLOSED');

-- --------------------------------------------------------

--
-- Table structure for table `loanitem`
--

CREATE TABLE `loanitem` (
  `loan_item_id` int(11) NOT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `copy_id` int(11) DEFAULT NULL,
  `li_duedate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `li_returned_at` timestamp NULL DEFAULT NULL,
  `condition_out` enum('GOOD','DAMAGED') NOT NULL,
  `condition_in` enum('GOOD','DAMAGED') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loanitem`
--

INSERT INTO `loanitem` (`loan_item_id`, `loan_id`, `copy_id`, `li_duedate`, `li_returned_at`, `condition_out`, `condition_in`) VALUES
(5001, 1001, 101, '2025-10-09 16:00:00', '2025-10-08 16:00:00', 'GOOD', 'GOOD'),
(5002, 1001, 201, '2025-10-09 16:00:00', '2025-10-11 16:00:00', 'GOOD', 'DAMAGED'),
(5003, 1002, 402, '2025-12-18 16:00:00', '2025-12-17 16:00:00', 'GOOD', 'GOOD'),
(5004, 1003, 102, '2026-01-16 16:00:00', NULL, 'GOOD', NULL),
(5005, 1004, 401, '2026-02-21 16:00:00', NULL, 'GOOD', NULL),
(5006, 1004, 301, '2026-02-21 16:00:00', '2026-02-19 16:00:00', 'GOOD', 'GOOD'),
(5007, 1005, 202, '2025-08-26 16:00:00', '2025-08-26 16:00:00', 'GOOD', 'GOOD'),
(5008, 1006, 103, '2025-03-11 16:00:00', '2025-03-10 16:00:00', 'GOOD', 'GOOD'),
(5009, 1006, 501, '2025-03-11 16:00:00', '2025-03-15 16:00:00', 'GOOD', 'GOOD');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` enum('ADMIN','BORROWER') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'ADMIN'),
(2, 'BORROWER');

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `ur_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`ur_id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password_hash` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password_hash`, `is_active`, `created_at`) VALUES
(1, 'admin.library@samplemail.com', '$2y$10$adminDummyHashReplaceInPHP', 1, '2025-01-01 00:00:00'),
(2, 'juan.delacruz@samplemail.com', '$2y$10$juanDummyHashReplaceInPHP', 1, '2024-06-10 01:00:00'),
(3, 'maria.santos@samplemail.com', '$2y$10$mariaDummyHashReplaceInPHP', 1, '2023-09-22 01:00:00'),
(4, 'mark.reyes@samplemail.com', '$2y$10$markDummyHashReplaceInPHP', 1, '2025-01-15 01:00:00'),
(5, 'ana.bautista@samplemail.com', '$2y$10$anaDummyHashReplaceInPHP', 1, '2024-11-05 01:00:00'),
(6, 'paolo.garcia@samplemail.com', '$2y$10$paoloDummyHashReplaceInPHP', 0, '2022-07-19 01:00:00'),
(7, 'grace.mendoza@samplemail.com', '$2y$10$graceDummyHashReplaceInPHP', 1, '2025-07-02 01:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD PRIMARY KEY (`bau_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `bookcopy`
--
ALTER TABLE `bookcopy`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `bookgenre`
--
ALTER TABLE `bookgenre`
  ADD PRIMARY KEY (`gb_id`),
  ADD KEY `genre_id` (`genre_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `borroweraddress`
--
ALTER TABLE `borroweraddress`
  ADD PRIMARY KEY (`ba_id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`borrower_id`);

--
-- Indexes for table `borroweruser`
--
ALTER TABLE `borroweruser`
  ADD PRIMARY KEY (`bu_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `genre_name` (`genre_name`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `borrower_id` (`borrower_id`),
  ADD KEY `processed_by_user_id` (`processed_by_user_id`);

--
-- Indexes for table `loanitem`
--
ALTER TABLE `loanitem`
  ADD PRIMARY KEY (`loan_item_id`),
  ADD KEY `loan_id` (`loan_id`),
  ADD KEY `copy_id` (`copy_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`ur_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookauthor`
--
ALTER TABLE `bookauthor`
  MODIFY `bau_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookcopy`
--
ALTER TABLE `bookcopy`
  MODIFY `copy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- AUTO_INCREMENT for table `bookgenre`
--
ALTER TABLE `bookgenre`
  MODIFY `gb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `borroweraddress`
--
ALTER TABLE `borroweraddress`
  MODIFY `ba_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `borrower_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `borroweruser`
--
ALTER TABLE `borroweruser`
  MODIFY `bu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;

--
-- AUTO_INCREMENT for table `loanitem`
--
ALTER TABLE `loanitem`
  MODIFY `loan_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5010;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userroles`
--
ALTER TABLE `userroles`
  MODIFY `ur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD CONSTRAINT `bookauthor_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `bookauthor_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`);

--
-- Constraints for table `bookcopy`
--
ALTER TABLE `bookcopy`
  ADD CONSTRAINT `bookcopy_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `bookgenre`
--
ALTER TABLE `bookgenre`
  ADD CONSTRAINT `bookgenre_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`),
  ADD CONSTRAINT `bookgenre_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

--
-- Constraints for table `borroweraddress`
--
ALTER TABLE `borroweraddress`
  ADD CONSTRAINT `borroweraddress_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`borrower_id`);

--
-- Constraints for table `borroweruser`
--
ALTER TABLE `borroweruser`
  ADD CONSTRAINT `borroweruser_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `borroweruser_ibfk_2` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`borrower_id`);

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`borrower_id`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`processed_by_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `loanitem`
--
ALTER TABLE `loanitem`
  ADD CONSTRAINT `loanitem_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`),
  ADD CONSTRAINT `loanitem_ibfk_2` FOREIGN KEY (`copy_id`) REFERENCES `bookcopy` (`copy_id`);

--
-- Constraints for table `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `userroles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
