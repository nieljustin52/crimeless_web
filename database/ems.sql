-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2024 at 01:01 AM
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
-- Database: `ems`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(20) NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `state` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `agency_id` varchar(50) NOT NULL,
  `photo` varchar(700) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `phone`, `state`, `username`, `password`, `address`, `agency_id`, `photo`) VALUES
(22, 'Niel Paulin', 'niel@gmail.com', '09512398789', 'Cebu City', 'niel', '123', '', '5506', ''),
(23, 'Nichole Ann Montante Dinauanao', 'nichole@gmail.com', '09123234123', 'Cebu City', 'nini', '123', '', '9162', '');

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `id` int(11) NOT NULL,
  `agency_id` varchar(50) NOT NULL,
  `agency_name` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `personincharge` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`id`, `agency_id`, `agency_name`, `phone_number`, `email`, `personincharge`, `username`, `password`, `state`, `address`, `photo`) VALUES
(10, '9284', 'Parian Police Station', ' (032) 255 8404', 'parianstation@gmail.com', '', 'parian', '123', '', '7WX3+P7G, Sikatuna St, Cebu City, 6000 Cebu', 'agencyf03e0fd420fb98f0308f29a24cd60170.jfif'),
(11, '1799', 'Cebu City Police Station', '0917 305 7336', 'cebucitystation@gmail.com', '', 'cebucity', '123', '', '8V2W+V6H, Cebu City, 6000 Cebu', 'agency1ff7700b818e7808bede2220e9977bb8.jfif'),
(13, '6507', 'Waterfront Police Station', '0998 967 3781', 'waterfrontstation@gmail.com', '', 'waterfront', '123', '', '7WV4+7RC, Legaspi Ext., Cebu City, 6000 Cebu', 'agencye8c2526917454412168db6b800934ae1.jfif'),
(14, '9101', 'Mabolo Police Station', '0932 592 4464', 'mabolostation@gmail.com', '', 'mabolo', '123', '', '8W68+X8M, Cebu City, 6000 Cebu', 'agencya6ff825971eb855d508afa416dd819ae.jfif'),
(15, '9557', 'Carbon Police Station', ' 0923 644 6496', 'carbonstation@gmail.com', '', 'carbon', '123', '', '7VRX+H3J, M. C. Briones St, Cebu City, 6000 Cebu', 'agency47e101f40b101debddbe859d30e50775.jfif'),
(16, '3178', 'Pasil Police Station', '0917 305 7348', 'pasilstation@gmail.com', '', 'pasil', '123', '', '6000, Spolarium St, Cebu City, 6000 Cebu', 'agency8f30353e21be58ff45b921c161eef736.jfif'),
(17, '5309', 'Pardo Police Station', '0932 484 5255', 'pardostation@gmail.com', '', 'pardo', '123', '', 'J 6000, I Tabura St, Cebu City, 6000 Cebu', 'agency8418ee5cd07a72216d1c1a4f27eff937.jfif'),
(18, '1850', 'Talamban Police Station', '0922 219 4959', 'talambanstation@gmail.com', '', 'talamban', '123', '', '9W98+WPC, Talamban Rd, Cebu City, 6000 Cebu', 'agencye0ab4f78ae3e421a3b6c4c6e264a8f08.jfif'),
(19, '7717', 'Guadalupe Police Station', '0949 379 4350', 'guadalupestation@gmail.com', '', 'guadalupe', '123', '', '1112 V Rama Ave, Cebu City, 6000 Cebu', 'agencyc42ab881fadd3ce3380390f5e5b61bc4.jfif'),
(20, '5005', 'Punta Princesa Police Station', '0905 331 9514', 'puntaprincesastation@gmail.com', '', 'puntaprincesa', '123', '', '7VWC+4P5, GF, Punta Princesa Multi-Purpose Bldg.,, Tres de Abril St, Lungsod ng Cebu, 6000 Lalawigan ng Cebu', 'agencye6168e818b40d264abf5d32d16e733da.jfif'),
(21, '4521', 'Mambaling Police Station', '0917 327 5188', 'mambalingstation@gmail.com', '', 'mambaling', '123', '', '7VRG+WJG, Maria Gochan St, Cebu City, 6000 Cebu', 'agency89d86e13fc6e47abe616758ccfb971b4.jfif');

-- --------------------------------------------------------

--
-- Table structure for table `emergency`
--

CREATE TABLE `emergency` (
  `id` int(11) NOT NULL,
  `emergency_id` int(11) NOT NULL,
  `agency_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `agency_name` varchar(50) NOT NULL,
  `case_severity` varchar(50) NOT NULL,
  `emergency_category` varchar(50) NOT NULL,
  `date` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `state` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dates` varchar(500) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `victim_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `photo` varchar(500) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergency`
--

INSERT INTO `emergency` (`id`, `emergency_id`, `agency_id`, `agency_name`, `case_severity`, `emergency_category`, `date`, `state`, `phone_number`, `address`, `name`, `status`, `email`, `dates`, `victim_id`, `description`, `photo`) VALUES
(78, 6001, '1337', '', 'Normal', 'Accident', '', 'Abuja', '09063633140', 'nn', 'Jonathan Odoh', 'Pending', 'jonathan@gmail.com', '17-05-2023', '3253', 'nn', 'emergency0283bcfb67710bf2957fe23b3a061590.jpeg'),
(79, 3642, '9496', '', 'Normal', 'Accident', '', 'Abuja', '090637889', 'tgfhg', 'Police', 'Resolved', 'police@gmail.com', '18-05-2023', '1337', 'hjhgf', 'emergency38642db2c33f41d4f4a5157c0fcbb2b0.jpeg'),
(80, 5637, '9496', '', 'Normal', 'Accident', '', 'Kogi', '09063633140', 'gtbf', 'EFCC', 'Resolved', 'efcc@gmail.com', '18-05-2023', '9496', 'ggb', 'emergencye153c9b4edaf52253f997e9a7c9923ad.jpeg'),
(81, 8287, '1337', '', 'Normal', 'Accident', '', 'Abuja', '09063633140', 'hh', 'Jonathan Odoh', 'Resolved', 'jonathan@gmail.com', '29-05-2023', '3253', 'sgzf', 'emergency34e2e5968dfd4122bcb598c4b63bb9eb.jpeg'),
(82, 6329, '1337', '', 'Critical', 'Accident', '', 'cebu city', '09234123141', '', 'Kerr Cananua', 'Resolved', 'kerr@gmail.com', '28-09-2024', '9705', '', ''),
(83, 4183, '9434', '', 'Danger', 'Select', '', 'cebu city', '09512398789', '', 'Niel Paulin', 'Resolved', 'niel@gmail.com', '28-09-2024', '5506', '', ''),
(84, 3139, '1337', '', 'Critical', 'Accident', '', 'cebu city', '09512398789', '', 'Niel Paulin', 'Resolved', 'niel@gmail.com', '30-09-2024', '5506', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_type`
--

CREATE TABLE `emergency_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergency_type`
--

INSERT INTO `emergency_type` (`id`, `name`, `description`) VALUES
(1, 'Accident', ''),
(2, 'Fire out break', ''),
(3, 'Covid-19', ''),
(4, 'Insurgency', ''),
(5, 'Armed Robbery', '');

-- --------------------------------------------------------

--
-- Table structure for table `game_challenges`
--

CREATE TABLE `game_challenges` (
  `id` int(11) NOT NULL,
  `challenge_text` varchar(255) NOT NULL,
  `reward` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game_challenges`
--

INSERT INTO `game_challenges` (`id`, `challenge_text`, `reward`, `created_at`) VALUES
(1, 'what if', '2 points', '2024-10-22 16:04:40'),
(2, 'what if', '2 points', '2024-10-22 16:09:06'),
(3, 'what if', '2 points', '2024-10-22 16:09:20'),
(4, 'what if', '2 points', '2024-10-22 16:10:07'),
(5, 'what if', '2 points', '2024-10-22 16:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

CREATE TABLE `leaderboard` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_feed`
--

CREATE TABLE `news_feed` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_announcements`
--

CREATE TABLE `reward_announcements` (
  `id` int(11) NOT NULL,
  `announcement_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `joined` varchar(30) NOT NULL,
  `state` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `joined`, `state`, `phone`, `user_id`, `address`, `photo`) VALUES
(23, 'Jonathan Odoh', 'jonathan@gmail.com', 'jona', 'jona', '', 'Abuja', '09063633140', '3253', '', ''),
(24, 'Kerr Cananua', 'kerr@gmail.com', 'kerr', '123', '', 'Cebu City', '09234123141', '9705', '', ''),
(25, 'Nichole Ann Montante Dinauanao', 'nichole@gmail.com', 'nini', '123', '', 'Cebu City', '09123234123', '2395', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_scores`
--

CREATE TABLE `user_scores` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency`
--
ALTER TABLE `emergency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_type`
--
ALTER TABLE `emergency_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_challenges`
--
ALTER TABLE `game_challenges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `news_feed`
--
ALTER TABLE `news_feed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_announcements`
--
ALTER TABLE `reward_announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_scores`
--
ALTER TABLE `user_scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `emergency`
--
ALTER TABLE `emergency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `emergency_type`
--
ALTER TABLE `emergency_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `game_challenges`
--
ALTER TABLE `game_challenges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leaderboard`
--
ALTER TABLE `leaderboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_feed`
--
ALTER TABLE `news_feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_announcements`
--
ALTER TABLE `reward_announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_scores`
--
ALTER TABLE `user_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD CONSTRAINT `leaderboard_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_scores`
--
ALTER TABLE `user_scores`
  ADD CONSTRAINT `user_scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
