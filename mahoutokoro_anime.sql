-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2022 at 08:20 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mahoutokoro_anime`
--

-- --------------------------------------------------------

--
-- Table structure for table `anime`
--

CREATE TABLE `anime` (
  `anime_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studio_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `country` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_allowed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anime`
--

INSERT INTO `anime` (`anime_id`, `name`, `studio_id`, `author_id`, `year`, `country`, `is_allowed`) VALUES
(1, 'Yu-Gi-Oh!', 7, 3, 1998, 'JPN', 1),
(2, 'Spirited Away', 2, 8, 2001, 'JPN', 1),
(3, 'Castle in the Sky', 2, 8, 1986, 'JPN', 1),
(4, 'Avatar: The Last Airbender', 4, 7, 2005, 'USA', 1),
(5, 'The Legend of Korra', 4, 7, 2012, 'USA', 1),
(6, 'Your Name', 6, 4, 2016, 'JPN', 1),
(7, 'Weathering with You', 6, 4, 2019, 'JPN', 1),
(8, 'Assassination Classroom', 5, 9, 2015, 'JPN', 0),
(9, 'Dragon Ball', 7, 10, 1986, 'JPN', 1),
(10, 'Black Butler', 8, 11, 2006, 'JPN', 0),
(11, 'Demon Slayer: Kimetsu no Yaiba', 9, 12, 2020, 'JPN', 0),
(12, 'Death Note', 10, 13, 2006, 'JPN', 0),
(13, 'My Neighbor Totoro', 2, 8, 1988, 'JPN', 1),
(15, 'Sailor Moon', 7, 14, 1992, 'JPN', 1),
(16, 'Pokémon', 11, 15, 1997, 'JPN', 1),
(17, 'Highschool of the Dead', 10, 16, 2010, 'JPN', 0),
(18, 'Digimon Adventure', 7, 17, 1999, 'JPN', 1),
(19, 'Detective Conan', 12, 18, 1996, 'JPN', 1),
(20, 'Elfen Lied', 13, 19, 2004, 'JPN', 0),
(21, 'The Teaching of Kyoto', 6, 5, 2020, 'JPN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nationality` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`, `date_of_birth`, `nationality`) VALUES
(1, 'Masashi', 'Kishimoto', '1974-11-08', 'JPN'),
(2, 'Eiichiro', 'Oda', '1975-01-01', 'JPN'),
(3, 'Kazuki', 'Takahashi', '1961-10-04', 'JPN'),
(4, 'Makoto', 'Shinkai', '1973-02-09', 'JPN'),
(5, 'Sakura', 'Yamamura', '2003-01-01', 'JPN'),
(6, 'Michael Dante', 'DiMartino', '1974-07-08', 'USA'),
(7, 'Bryan', 'Konietzko', '1975-06-01', 'USA'),
(8, 'Hayao', 'Miyazaki', '1941-01-05', 'JPN'),
(9, 'Yusei', 'Matsui', '1979-01-31', 'JPN'),
(10, 'Akira', 'Toriyama', '1955-04-05', 'JPN'),
(11, 'Yana', 'Toboso', '1984-01-24', 'JPN'),
(12, 'Koyoharu', 'Gotōge', '1989-05-05', 'JPN'),
(13, 'Tsugumi', 'Ōba', NULL, 'JPN'),
(14, 'Sukehiro', 'Tomita', '1948-04-14', 'JPN'),
(15, 'Takeshi', 'Shudo', '1949-08-18', 'JPN'),
(16, 'Yōsuke', 'Kuroda', '1968-03-29', 'JPN'),
(17, 'Satoru', 'Nishizono', '1962-04-28', 'JPN'),
(18, 'Gosho', 'Aoyama', '1961-06-21', 'JPN'),
(19, 'Lynn', 'Okamoto', '1970-01-06', 'JPN');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `area_code` int(8) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `area_code`, `name`) VALUES
(1, 11111, 'Tokyo'),
(2, 10001, 'New York City');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_flag` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country`, `country_flag`) VALUES
('DEU', 'Germany', '🇩🇪'),
('FRA', 'France', '🇫🇷'),
('ITA', 'Italy', '🇮🇹'),
('JPN', 'Japan', '🇯🇵'),
('UK', 'United Kingdom', '🇬🇧'),
('USA', 'United States of America', '🇺🇸');

-- --------------------------------------------------------

--
-- Table structure for table `studio`
--

CREATE TABLE `studio` (
  `studio_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `house_number` int(4) NOT NULL,
  `city_id` int(6) NOT NULL,
  `country` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `studio`
--

INSERT INTO `studio` (`studio_id`, `name`, `street`, `house_number`, `city_id`, `country`) VALUES
(1, 'Studio Gallop Ltd.', 'Nerimastreet', 1, 1, 'JPN'),
(2, 'Studio Ghibli Inc.', 'Koganeistreet', 1, 1, 'JPN'),
(3, 'Pierrot Co., Ltd.', 'Mitikastreet', 1, 1, 'JPN'),
(4, 'Nickelodeon', 'One Astor Plaza', 41, 2, 'USA'),
(5, 'Studio Hibari Inc. ', 'Nerimastreet', 2, 1, 'JPN'),
(6, 'CoMix Wave Films Inc.', 'Chiyodastreet', 1, 1, 'JPN'),
(7, 'Toei Animation Co. Ltd.', 'Oizumistreet', 1, 1, 'JPN'),
(8, 'A-1 Pictures', 'Suginamistreet', 1, 1, 'JPN'),
(9, 'ufotable, Inc.', 'Nakanostreet', 1, 1, 'JPN'),
(10, 'K.K. Madhouse', 'Nakonostreet', 2, 1, 'JPN'),
(11, 'OLM, Inc.', 'Setegayastreet', 3, 1, 'JPN'),
(12, 'TMS Entertainment Co., Ltd.', 'Nakanostreet', 4, 1, 'JPN'),
(13, 'Arms Co., Ltd.', 'Suginamistreet', 3, 1, 'JPN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`anime_id`),
  ADD KEY `fk_anime_to_author` (`author_id`),
  ADD KEY `fk_anime_to_studio` (`studio_id`),
  ADD KEY `fk_anime_to_country` (`country`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `fk_author_to_country` (`nationality`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `studio`
--
ALTER TABLE `studio`
  ADD PRIMARY KEY (`studio_id`),
  ADD KEY `fk_studio_to_country` (`country`),
  ADD KEY `fk_studio_to_city` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anime`
--
ALTER TABLE `anime`
  MODIFY `anime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `studio`
--
ALTER TABLE `studio`
  MODIFY `studio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anime`
--
ALTER TABLE `anime`
  ADD CONSTRAINT `fk_anime_to_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_anime_to_country` FOREIGN KEY (`country`) REFERENCES `country` (`country_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_anime_to_studio` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`) ON UPDATE CASCADE;

--
-- Constraints for table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `fk_author_to_country` FOREIGN KEY (`nationality`) REFERENCES `country` (`country_id`) ON UPDATE CASCADE;

--
-- Constraints for table `studio`
--
ALTER TABLE `studio`
  ADD CONSTRAINT `fk_studio_to_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_studio_to_country` FOREIGN KEY (`country`) REFERENCES `country` (`country_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
