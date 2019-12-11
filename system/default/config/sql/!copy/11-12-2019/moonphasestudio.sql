-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Czas generowania: 11 Gru 2019, 14:01
-- Wersja serwera: 5.7.26
-- Wersja PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `moonphasestudio`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_category`
--

DROP TABLE IF EXISTS `im_category`;
CREATE TABLE IF NOT EXISTS `im_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_category`
--
DROP TRIGGER IF EXISTS `im_category_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_category_insert_date_create` BEFORE INSERT ON `im_category` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_category_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_category_insert_date_modify` BEFORE INSERT ON `im_category` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_category_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_category_update_date_modify` BEFORE UPDATE ON `im_category` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_file`
--

DROP TABLE IF EXISTS `im_file`;
CREATE TABLE IF NOT EXISTS `im_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_file`
--
DROP TRIGGER IF EXISTS `im_file_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_file_insert_date_create` BEFORE INSERT ON `im_file` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_file_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_file_insert_date_modify` BEFORE INSERT ON `im_file` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_file_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_file_update_date_modify` BEFORE UPDATE ON `im_file` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_form`
--

DROP TABLE IF EXISTS `im_form`;
CREATE TABLE IF NOT EXISTS `im_form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(1024) COLLATE utf8_polish_ci DEFAULT '',
  `email_source` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `email_destination` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_form`
--
DROP TRIGGER IF EXISTS `im_form_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_form_insert_date_create` BEFORE INSERT ON `im_form` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_image`
--

DROP TABLE IF EXISTS `im_image`;
CREATE TABLE IF NOT EXISTS `im_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` int(11) DEFAULT '0',
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_image`
--

INSERT INTO `im_image` (`image_id`, `section`, `name`, `content`, `url`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 0, 'Jakaś zajawka', '<p>...i co taka zajawka może oznaczać...</p>', 'dsc_9479-553351831e1535b59e410701eff888c9.jpg', 'on', 'Noc przy ognisku', '2019-11-16 09:34:01', '2019-11-16 10:06:02'),
(2, 0, 'Tytuł drugiego slide\'u', '<p>tu też zajawka</p>', 'slide4-ec8c0836e4f3deadd07d30f8c0000e49.jpg', 'on', 'Kobieta patrzy na wprost, zielone oczy', '2019-11-16 10:06:33', '2019-11-16 10:34:34'),
(3, 0, 'Slide 3', '<p>...i zajawka...</p>', 'slide3-5fc6d850a2dcedfb07537fdfc083be30.jpg', 'on', 'Kobieta patrzy w dół, czarne oczy', '2019-11-16 10:07:26', '2019-11-16 10:34:16'),
(4, 1, 'Logo', '', 'logo-c554cc95b2cfb29325743f2600f0efc1.png', 'on', 'Logo 16-11-2019', '2019-11-16 10:37:10', '2019-11-16 10:44:14'),
(5, 0, 'scroll down', '', 'scroll-a325cddac15192bbdd699761d6568d54.gif', 'on', 'Animowana ikona gif', '2019-11-17 21:18:25', '2019-11-17 21:29:40'),
(6, 1, 'Logo min', '', 'logo-min-f99b085b37c17c85369453e12fe1ce38.png', 'on', 'Logo dla mniejszych ekranów (od \"-xl\")', '2019-11-18 19:20:13', '2019-11-30 20:41:03'),
(7, 0, 'Hauraton', '', 'hauraton-e9976b2e028d77cf51444c809f1f0dce.png', 'on', NULL, '2019-11-23 21:08:12', '2019-11-23 21:08:12'),
(8, 0, 'Homepark', '', 'homepark-5f89dec38d8f1dc16ed7f4730a2973d2.png', 'on', NULL, '2019-11-23 21:21:02', '2019-11-23 21:21:02'),
(9, 0, 'Edukacja Inwestowania w Nieruchomości', '', 'hryn-532cd8c82ee595734a6e6da456de2006.png', 'on', '', '2019-11-23 21:21:15', '2019-11-23 21:22:16'),
(10, 0, 'Nivona', '', 'nivona-1-969e35281bbab8b2573009e2dfc7105a.png', 'on', NULL, '2019-11-23 21:21:33', '2019-11-23 21:21:33'),
(11, 0, 'Medicover', '', 'senior-1-365d6d735b06725ce7afa8c902f4d6ab.png', 'on', NULL, '2019-11-23 21:22:58', '2019-11-23 21:22:58'),
(12, 0, 'Transkap', '', 'transkap-d1c857155e92dbdf45d4a0dbb23e4a3f.png', 'on', NULL, '2019-11-23 21:23:18', '2019-11-23 21:23:18'),
(13, 0, 'RehaSport', '', 'reha-1-80179caaa1d905ccb20db9ace92277f3.png', 'on', NULL, '2019-11-23 21:35:36', '2019-11-23 21:35:36'),
(14, 0, 'Mieszkanie', '', 'img_9678-1024x683-eaf1ca03c19161345ec20e8fa09a76fd.jpg', 'on', 'Stolik, szafa i krzesła', '2019-11-24 18:14:14', '2019-11-24 18:15:03'),
(15, 0, 'RehaSport', '', 'img_0797-1024x629-df66c5aa268bc71a483b1822bbd444bf.jpg', 'on', 'trwa zabieg', '2019-11-24 18:32:51', '2019-11-24 18:33:10'),
(16, 0, 'Kobieta, wysunięte ręce', '', '1-0518fe4073445192564f4ff6831828ee.jpg', 'on', NULL, '2019-12-03 12:10:47', '2019-12-03 12:10:47'),
(17, 0, 'Kuchnia, front', '', '2-10fa484c80e4708015f0d7004ab4e923.jpg', 'on', NULL, '2019-12-03 12:11:07', '2019-12-03 12:11:07'),
(18, 0, 'Zabieg', '', '3-979b3082b5dc2444b82df49a70d8b4c9.jpg', 'on', NULL, '2019-12-03 12:11:24', '2019-12-03 12:11:24'),
(19, 0, 'Święta, kobieta trzyma woreczek', '', '4-3d4df17561fd6759a521048e5ecd2ba4.jpg', 'on', NULL, '2019-12-03 12:11:47', '2019-12-03 12:11:47'),
(20, 0, 'Kobieta, laptop, patrzy w prawo', '', '5-85b3379e9f90cd355811fc523e0d64ce.jpg', 'on', NULL, '2019-12-03 12:12:13', '2019-12-03 12:12:13'),
(21, 0, 'Galeria, ruchome schody', '', '6-577a7e2009b718ddc2b69490c6629c62.jpg', 'on', NULL, '2019-12-03 12:13:39', '2019-12-03 12:13:39'),
(22, 8, 'Jakość i perfekcja', '', '1-ee3d7c8aea41d1717484b6886aa368f2.jpg', 'on', 'Foodsoft (zdjęcie główne 1)', '2019-12-07 10:14:40', '2019-12-11 12:40:45'),
(23, 8, 'Jakaś nazwa', '', '2-2e8e456a3c5eca2f34c79a5c87967599.jpg', 'on', 'Foodsoft (zdjęcie główne 2)', '2019-12-07 10:14:53', '2019-12-11 12:40:30'),
(24, 0, 'Makeup', '', '1-5df93949a09851cfb840b2f1a1bf768e.jpg', 'on', 'Foodsoft (zdjęcie w szczegółach)', '2019-12-11 12:38:28', '2019-12-11 12:49:51'),
(25, 0, 'Ustalenia', '', '2-8d2fc858282bc2f45bee7eea3de14c8b.jpg', 'on', 'Foodsoft (zdjęcie w szczegółach)', '2019-12-11 12:41:39', '2019-12-11 12:41:45'),
(26, 0, 'Na co masz ochotę do jedzenia?', '', '3-4b609855f1f371095f3443b14af626f2.jpg', 'on', 'Foodsoft (zdjęcie w szczegółach)', '2019-12-11 12:42:40', '2019-12-11 12:44:02'),
(27, 0, 'Z planu', '<p><span style=\"font-size: 8pt;\">i tu może być nawet jakiś opis zdjęcia...</span></p>', '4-11acde0bef28cf2435afe7d0770fb5c0.jpg', 'on', 'Foodsoft (zdjęcie w szczegółach)', '2019-12-11 12:43:05', '2019-12-11 13:45:05'),
(28, 0, 'Makeup 2', '', '5-371e23530302500e052291b632c9ce30.jpg', 'on', 'Foodsoft (zdjęcie w szczegółach)', '2019-12-11 12:43:26', '2019-12-11 12:43:42');

--
-- Wyzwalacze `im_image`
--
DROP TRIGGER IF EXISTS `im_image_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_image_insert_date_create` BEFORE INSERT ON `im_image` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_image_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_image_insert_date_modify` BEFORE INSERT ON `im_image` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_image_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_image_update_date_modify` BEFORE UPDATE ON `im_image` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_label`
--

DROP TABLE IF EXISTS `im_label`;
CREATE TABLE IF NOT EXISTS `im_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_label`
--

INSERT INTO `im_label` (`label_id`, `name`, `system_name`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Slider główny', 'slider', NULL, '2019-11-16 09:30:22', '2019-11-16 09:30:22'),
(2, 'Logo', 'logo', NULL, '2019-11-16 10:37:58', '2019-11-16 10:37:58'),
(3, 'Menu', 'menu', NULL, '2019-11-17 10:05:13', '2019-11-17 10:05:13'),
(5, 'Ikona \"scroll down\"', 'icon-scroll-down', NULL, '2019-11-17 21:15:21', '2019-11-17 21:15:21'),
(6, 'Zaufali nam', 'trust', NULL, '2019-11-23 10:26:44', '2019-11-23 10:26:44'),
(8, 'Treść sekcji', 'content', NULL, '2019-11-23 10:51:40', '2019-11-23 10:51:40'),
(9, 'Tytuł sekcji (po treści)', 'after-content-title', '', '2019-11-24 10:37:11', '2019-11-30 19:50:39'),
(18, 'Tytuł sekcji (przed treścią)', 'before-content-title', NULL, '2019-11-30 17:01:34', '2019-11-30 17:01:34'),
(19, 'Obok mapy (prawa)', 'next-map', 'col-6', '2019-11-30 20:00:07', '2019-11-30 20:00:27'),
(20, 'Stopka (lewa)', 'footer-left', '', '2019-11-30 20:01:14', '2019-11-30 20:01:44'),
(21, 'Stopka (prawa)', 'footer-right', NULL, '2019-11-30 20:02:00', '2019-11-30 20:02:00'),
(22, 'Stopka (spód)', 'footer-bottom', NULL, '2019-11-30 20:02:21', '2019-11-30 20:02:21'),
(24, 'Blog', 'blog', NULL, '2019-12-03 12:29:31', '2019-12-03 12:29:31'),
(25, 'Portfolio', 'portfolio', NULL, '2019-12-07 10:00:35', '2019-12-07 10:00:35'),
(26, 'Tytuł prawego menu', 'right-menu-title', NULL, '2019-12-07 11:40:41', '2019-12-07 11:40:41'),
(27, 'Link wewnętrzny', 'inner-link', NULL, '2019-12-07 12:15:06', '2019-12-07 12:15:06'),
(28, 'Szczegóły portfolio', 'portfolio-content', NULL, '2019-12-11 12:10:49', '2019-12-11 12:10:49');

--
-- Wyzwalacze `im_label`
--
DROP TRIGGER IF EXISTS `im_label_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_label_insert_date_create` BEFORE INSERT ON `im_label` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_insert_date_modify` BEFORE INSERT ON `im_label` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_update_date_modify` BEFORE UPDATE ON `im_label` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_label_section`
--

DROP TABLE IF EXISTS `im_label_section`;
CREATE TABLE IF NOT EXISTS `im_label_section` (
  `label_section_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `class` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`label_section_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_label_section`
--

INSERT INTO `im_label_section` (`label_section_id`, `label_id`, `section`, `class`, `description`, `date_create`, `date_modify`) VALUES
(1, 5, 0, 'd-none d-md-block w-100 text-center', '', '2019-11-17 21:32:09', '2019-11-18 19:36:15'),
(5, 20, 0, 'col-12 col-lg-6', NULL, '2019-11-30 20:09:06', '2019-11-30 20:09:06'),
(6, 21, 0, 'col-12 col-lg-6', NULL, '2019-11-30 20:09:22', '2019-11-30 20:09:22');

--
-- Wyzwalacze `im_label_section`
--
DROP TRIGGER IF EXISTS `im_label_section_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_label_section_insert_date_create` BEFORE INSERT ON `im_label_section` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_section_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_section_insert_date_modify` BEFORE INSERT ON `im_label_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_section_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_section_update_date_modify` BEFORE UPDATE ON `im_label_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_language`
--

DROP TABLE IF EXISTS `im_language`;
CREATE TABLE IF NOT EXISTS `im_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(4) COLLATE utf8_polish_ci DEFAULT '',
  `url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `status_default` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_language`
--

INSERT INTO `im_language` (`language_id`, `name`, `system_name`, `url`, `position`, `status_default`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Polish language', 'pl', 'pl.png', 1, 'on', 'on', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(2, 'English language', 'en', 'en.png', 2, 'off', 'on', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52');

--
-- Wyzwalacze `im_language`
--
DROP TRIGGER IF EXISTS `im_language_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_language_insert_date_create` BEFORE INSERT ON `im_language` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_language_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_language_insert_date_modify` BEFORE INSERT ON `im_language` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_language_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_language_update_date_modify` BEFORE UPDATE ON `im_language` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object`
--

DROP TABLE IF EXISTS `im_object`;
CREATE TABLE IF NOT EXISTS `im_object` (
  `object_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `section` int(11) DEFAULT '0',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `name` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `link` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `email` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `form` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `icon` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `status_copy` varchar(3) COLLATE utf8_polish_ci NOT NULL DEFAULT 'off',
  `description` text COLLATE utf8_polish_ci,
  `date` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  KEY `type_id` (`type_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_object`
--

INSERT INTO `im_object` (`object_id`, `type_id`, `label_id`, `section`, `system_name`, `name`, `content`, `link`, `email`, `form`, `icon`, `position`, `status`, `status_copy`, `description`, `date`, `date_create`, `date_modify`) VALUES
(1, 1, 1, 0, 'Slider główny', '', NULL, '', '', '', '', 1, 'on', 'off', '', '2019-11-16', '2019-11-16 09:32:24', '2019-12-11 09:21:47'),
(2, 2, 2, 0, 'Logo', '', NULL, '', '', '', '', 1, 'on', 'off', '', '2019-11-16', '2019-11-16 10:38:16', '2019-12-07 11:26:51'),
(3, 3, 3, 0, 'Menu', '', NULL, '', '', '', '', 1, 'on', 'off', '', '2019-11-17', '2019-11-17 10:05:53', '2019-12-07 11:26:40'),
(5, 5, 5, 0, 'Obraz gif', '', NULL, '', '', '', '', 1, 'on', 'off', '', '2019-11-17', '2019-11-17 21:17:32', '2019-11-17 21:19:43'),
(6, 6, 2, 0, 'Logo mobile', '', NULL, '', '', '', '', 1, 'on', 'off', '', '2019-11-18', '2019-11-18 19:24:55', '2019-12-07 11:26:25'),
(7, 9, 8, 0, 'Nasza wizja', '', '<div class=\"title\">Our vision</div>\r\n<div class=\"text\">This is an abstract of our key services Making films isn&rsquo;t just something we do. We aim to create perfect audio-visual symphonies, integrated in stories which evoke real emotions. Our entire team is one big family and maintaining a collaborative spirit is at the core of everything we do. MoonPhase Studio stands for authenticity, and this inevitably transfers to the results of our work. We are prepared to take a risk, and we&rsquo;re genuinely excited to bring stories, characters and brands to life. Because a good story will stay with you long after the credits roll.</div>', '', '', '', '', 1, 'on', 'off', '', '2019-11-23', '2019-11-23 10:54:01', '2019-11-23 11:04:50'),
(8, 7, 6, 0, 'Hauraton', '', NULL, '', '', '', '', 1, 'on', 'off', '', '2019-11-23', '2019-11-23 21:07:42', '2019-11-23 21:08:34'),
(9, 7, 6, 0, 'Homepark', '', NULL, '', '', '', '', 2, 'on', 'off', '', '2019-11-23', '2019-11-23 21:23:49', '2019-11-23 21:25:49'),
(10, 7, 6, 0, 'Edukacja Inwestowania w Nieruchomości', '', NULL, '', '', '', '', 3, 'on', 'off', '', '2019-11-23', '2019-11-23 21:24:10', '2019-11-23 21:27:19'),
(11, 7, 6, 0, 'Nivona', '', NULL, '', '', '', '', 4, 'on', 'off', '', '2019-11-23', '2019-11-23 21:24:29', '2019-11-23 21:27:32'),
(12, 7, 6, 0, 'Medicover', '', NULL, '', '', '', '', 5, 'on', 'off', '', '2019-11-23', '2019-11-23 21:25:09', '2019-11-23 21:27:44'),
(13, 7, 6, 0, 'Transkap', '', NULL, '', '', '', '', 6, 'on', 'off', '', '2019-11-23', '2019-11-23 21:25:32', '2019-11-23 21:27:57'),
(14, 7, 6, 0, 'RehaSport', '', NULL, '', '', '', '', 7, 'on', 'off', '', '2019-11-23', '2019-11-23 21:34:36', '2019-11-23 21:35:56'),
(15, 7, 6, 0, 'Nivona2', '', NULL, '', '', '', '', 8, 'on', 'off', '', '2019-11-24', '2019-11-24 10:36:10', '2019-11-24 10:43:59'),
(16, 10, 9, 0, 'Zaufali nam', 'Zaufali nam', NULL, '', '', '', '', 1, 'on', 'off', '', '2019-11-24', '2019-11-24 10:38:21', '2019-11-24 10:38:35'),
(17, 11, 19, 0, 'Formularz kontaktowy', 'Skontaktuj się z nami', NULL, '', '', 'damian.krawiec@gmail.com', '', 1, 'on', 'off', 'Sekcja \"Home\"', '2019-11-24', '2019-11-24 17:51:29', '2019-11-30 20:20:19'),
(20, 13, 20, 0, 'Dane firmy w stopce', 'Informacje kontaktowe', '<div><i class=\"fal fa-map-marked-alt\"></i> Adres:<br />Poděbradova 869<br />547 01 N&aacute;chod<br />Regon: 05793149<br />NIP: CZ684031060<br />Czech Republic<br /><strong>Poznań, Polska</strong></div>\r\n<div><i class=\"fal fa-phone\"></i> <a href=\"tel:+48794634882\">+48 794 634 882</a></div>\r\n<div><i class=\"fal fa-mailbox\"></i> office(at)moonphasestudio.com</div>', '', '', '', '', 1, 'on', 'off', 'Formatowanie HTML', '2019-11-30', '2019-11-30 09:44:36', '2019-12-07 11:24:25'),
(21, 14, 21, 0, 'Mapa strony w stopce', 'Mapa strony', NULL, '', '', '', '', 1, 'on', 'off', 'Tożsame z menu głównym', '2019-11-30', '2019-11-30 09:45:06', '2019-12-07 11:24:14'),
(22, 15, 22, 0, 'Treść stopki', '', '<div>Wszelkie prawa zastrzeżone &amp; 2019</div>\r\n<div><a href=\"https://moonphasestudio.com\">www.moonphasestudio.com</a></div>\r\n<p></p>\r\n<div>Projekt i realizacja: <a href=\"https://internet.media.pl\" title=\"Strony internetowe, e-sklepy, serwisy WWW, projekty i wykonanie\" target=\"_blank\" rel=\"noopener\">www.internet.media.pl</a></div>', '', '', '', '', 1, 'on', 'off', '', '2019-11-30', '2019-11-30 10:22:01', '2019-12-07 11:23:33'),
(29, 10, 18, 0, 'Tytuł sekcji', 'DANE FIRMOWE', NULL, '', '', '', '', 2, 'on', 'off', 'Kontakt', '2019-11-30', '2019-11-30 17:02:34', '2019-12-03 11:18:44'),
(30, 11, 20, 0, 'Formularz kontaktowy', 'Skontaktuj się z nami', NULL, '', '', 'damian.krawiec@gmail.com', '', 2, 'on', 'off', 'Sekcja \"Kontakt\"', '2019-11-30', '2019-11-30 20:20:48', '2019-11-30 20:21:39'),
(31, 13, 19, 0, 'Dane firmy w sekcji kontakt (prawa góra)', '', '<div><i class=\"fal fa-map-marked-alt\"></i> Adres:<br />Poděbradova 869<br />547 01 N&aacute;chod<br />Regon: 05793149<br />NIP: CZ684031060<br />Czech Republic<br /><strong>Poznań, Polska</strong></div>\r\n<div><i class=\"fal fa-phone\"></i> <a href=\"tel:+48794634882\">+48 794 634 882</a></div>\r\n<div><i class=\"fal fa-mailbox\"></i> office(at)moonphasestudio.com</div>', '', '', '', '', 2, 'on', 'off', 'Formatowanie HTML', '2019-11-30', '2019-11-30 20:32:11', '2019-12-05 20:44:04'),
(32, 16, 24, 0, 'Pierwszy wpis', 'Pierwszy wpis', '<p>Lorem ipsum &ndash; tekst składający się z łacińskich i quasi-łacińskich wyraz&oacute;w, mający korzenie w klasycznej łacinie, wzorowany na fragmencie traktatu Cycerona &bdquo;O granicach dobra i zła&rdquo; (De finibus bonorum et malorum) napisanego w 45 p.n.e. Tekst jest stosowany do demonstracji kroj&oacute;w pisma (czcionek, font&oacute;w), kompozycji kolumny itp.</p>', '', '', '', 'fal fa-tilde', 1, 'on', 'off', '', '2019-12-03', '2019-12-03 10:07:54', '2019-12-03 12:29:47'),
(33, 10, 18, 0, 'Tytuł sekcji', 'BLOG', NULL, '', '', '', '', 3, 'on', 'off', 'Blog', '2019-12-03', '2019-12-03 10:08:30', '2019-12-03 11:19:11'),
(34, 10, 18, 0, 'Tytuł sekcji', 'O NAS', NULL, '', '', '', '', 4, 'on', 'off', 'O nas', '2019-12-03', '2019-12-03 11:16:34', '2019-12-03 11:19:30'),
(35, 10, 18, 0, 'Tytuł sekcji', 'PORTFOLIO', NULL, '', '', '', '', 5, 'on', 'off', 'Portfolio', '2019-12-03', '2019-12-03 11:17:01', '2019-12-07 11:25:43'),
(36, 16, 24, 0, 'Jakiś drugi wpis', 'Jakiś drugi wpis', '<p>Lorem ipsum &ndash; tekst składający się z łacińskich i quasi-łacińskich wyraz&oacute;w, mający korzenie w klasycznej łacinie, wzorowany na fragmencie traktatu Cycerona &bdquo;O granicach dobra i zła&rdquo; (De finibus bonorum et malorum) napisanego w 45 p.n.e. Tekst jest stosowany do demonstracji kroj&oacute;w pisma (czcionek, font&oacute;w), kompozycji kolumny itp.</p>', '', '', '', 'fal fa-tilde', 2, 'on', 'off', '', '2019-12-03', '2019-12-03 12:39:44', '2019-12-03 12:41:21'),
(37, 16, 24, 0, 'Trzeci wpis', 'No i trzeci wpis', '<p>Lorem ipsum &ndash; tekst składający się z łacińskich i quasi-łacińskich wyraz&oacute;w, mający korzenie w klasycznej łacinie, wzorowany na fragmencie traktatu Cycerona &bdquo;O granicach dobra i zła&rdquo; (De finibus bonorum et malorum) napisanego w 45 p.n.e. Tekst jest stosowany do demonstracji kroj&oacute;w pisma (czcionek, font&oacute;w), kompozycji kolumny itp.</p>', '', '', '', 'fal fa-tilde', 3, 'on', 'off', '', '2019-12-03', '2019-12-03 12:43:08', '2019-12-03 12:46:05'),
(38, 16, 24, 0, 'Czwarty wpis', 'Czwarty wpis', '<p>Lorem ipsum &ndash; tekst składający się z łacińskich i quasi-łacińskich wyraz&oacute;w, mający korzenie w klasycznej łacinie, wzorowany na fragmencie traktatu Cycerona &bdquo;O granicach dobra i zła&rdquo; (De finibus bonorum et malorum) napisanego w 45 p.n.e. Tekst jest stosowany do demonstracji kroj&oacute;w pisma (czcionek, font&oacute;w), kompozycji kolumny itp.</p>', '', '', '', 'fal fa-tilde', 4, 'on', 'off', '', '2019-12-03', '2019-12-03 12:46:24', '2019-12-03 12:47:20'),
(39, 17, 25, 0, 'Foodsoft', 'Foodsoft', NULL, '', '', '', '', 1, 'on', 'off', '', '2019-12-07', '2019-12-07 10:12:57', '2019-12-07 11:27:17'),
(42, 10, 26, 0, 'Tytuł prawego menu', 'Ostatnie realizacje', NULL, '', '', '', '', 7, 'on', 'off', '', '2019-12-07', '2019-12-07 11:41:29', '2019-12-07 11:41:59'),
(43, 17, 25, 0, 'Foodsoft', '', NULL, '', '', '', '', 2, 'on', 'off', '', '2019-12-07', '2019-12-07 11:56:34', '2019-12-07 11:58:01'),
(44, 17, 25, 0, 'Foodsoft', '', NULL, '', '', '', '', 3, 'on', 'off', '', '2019-12-07', '2019-12-07 11:58:19', '2019-12-07 11:58:38'),
(45, 18, 27, 3, 'Link do portfolio', '', NULL, '', '', '', '', 1, 'on', 'off', '', '2019-12-07', '2019-12-07 12:16:07', '2019-12-07 12:16:30'),
(46, 19, 28, 3, 'Foodsoft', 'Tytuł', '<p><span style=\"font-size: 12pt;\">Jedną z najbardziej wymagających rodzaj&oacute;w produkcji są produkcje dla branży gastronomicznej. Tym razem sprostaliśmy wyzwaniu, kt&oacute;re postawiła przed nami firma Foodsoft. Podczas dw&oacute;ch dni zdjęciowych zrealizowaliśmy złożony scenariusz prezentujący flagowy produkt firmy &ndash; system do zarządzania biznesem gastronomicznym. Film powstał w pięciu wersjach językowych.</span></p>', '', '', '', '', 1, 'on', 'off', '', '2019-12-11', '2019-12-11 12:03:14', '2019-12-11 14:45:05'),
(47, 10, 18, 0, 'Foodsoft', 'FOODSOFT', NULL, '', '', '', '', 7, 'on', 'off', 'Foodsoft (Portfolio, szczegóły)', '2019-12-11', '2019-12-11 12:17:59', '2019-12-11 12:18:20'),
(49, 21, 18, 3, 'Foodsoft', '', NULL, '', '', '', '', 1, 'on', 'off', '', '2019-12-11', '2019-12-11 14:48:04', '2019-12-11 15:00:32');

--
-- Wyzwalacze `im_object`
--
DROP TRIGGER IF EXISTS `im_object_insert_date`;
DELIMITER $$
CREATE TRIGGER `im_object_insert_date` BEFORE INSERT ON `im_object` FOR EACH ROW set new.date = current_date()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_object_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_object_insert_date_create` BEFORE INSERT ON `im_object` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_object_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_object_insert_date_modify` BEFORE INSERT ON `im_object` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_object_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_object_update_date_modify` BEFORE UPDATE ON `im_object` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_category`
--

DROP TABLE IF EXISTS `im_object_category`;
CREATE TABLE IF NOT EXISTS `im_object_category` (
  `object_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`object_category_id`),
  KEY `object_id` (`object_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_file`
--

DROP TABLE IF EXISTS `im_object_file`;
CREATE TABLE IF NOT EXISTS `im_object_file` (
  `object_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`object_file_id`),
  KEY `object_id` (`object_id`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_image`
--

DROP TABLE IF EXISTS `im_object_image`;
CREATE TABLE IF NOT EXISTS `im_object_image` (
  `object_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`object_image_id`),
  KEY `object_id` (`object_id`),
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_object_image`
--

INSERT INTO `im_object_image` (`object_image_id`, `object_id`, `image_id`, `position`) VALUES
(21, 5, 5, 0),
(24, 8, 7, 0),
(25, 9, 8, 0),
(26, 10, 9, 0),
(27, 11, 10, 0),
(28, 12, 11, 0),
(29, 13, 12, 0),
(30, 14, 13, 0),
(32, 15, 10, 0),
(68, 32, 16, 1),
(71, 36, 18, 1),
(72, 36, 16, 2),
(74, 37, 19, 1),
(75, 37, 18, 2),
(76, 37, 21, 3),
(79, 38, 20, 1),
(84, 22, 6, 1),
(85, 6, 6, 1),
(86, 2, 4, 1),
(87, 39, 22, 1),
(88, 39, 23, 2),
(91, 43, 23, 1),
(92, 44, 23, 1),
(93, 44, 22, 2),
(97, 1, 1, 1),
(98, 1, 3, 2),
(99, 1, 2, 3),
(135, 46, 24, 1),
(136, 46, 25, 2),
(137, 46, 26, 3),
(138, 46, 27, 4),
(139, 46, 28, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_source`
--

DROP TABLE IF EXISTS `im_object_source`;
CREATE TABLE IF NOT EXISTS `im_object_source` (
  `object_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`object_source_id`),
  KEY `object_id` (`object_id`),
  KEY `source_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_object_source`
--

INSERT INTO `im_object_source` (`object_source_id`, `object_id`, `source_id`, `position`) VALUES
(2, 46, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_property`
--

DROP TABLE IF EXISTS `im_property`;
CREATE TABLE IF NOT EXISTS `im_property` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_property`
--

INSERT INTO `im_property` (`property_id`, `name`, `system_name`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Nazwa', 'name', '', '2019-11-14 21:07:50', '2019-11-14 21:07:50'),
(2, 'Tekst', 'content', '', '2019-11-14 21:07:51', '2019-11-14 21:07:51'),
(3, 'Data', 'date', '', '2019-11-14 21:07:51', '2019-11-14 21:07:51'),
(4, 'Zdjęcie', 'image', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(5, 'Link wewnętrzny', 'section', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(6, 'Plik', 'file', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(7, 'Menu', 'menu', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(8, 'Link zewnętrzny', 'link', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(9, 'Adres e-mail', 'email', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(10, 'Adres formularza kontaktowego', 'form', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(11, 'Źródło', 'source', '', '2019-11-14 21:07:52', '2019-12-11 13:50:31'),
(12, 'Ikona', 'icon', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52');

--
-- Wyzwalacze `im_property`
--
DROP TRIGGER IF EXISTS `im_property_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_property_insert_date_create` BEFORE INSERT ON `im_property` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_property_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_property_insert_date_modify` BEFORE INSERT ON `im_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_property_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_property_update_date_modify` BEFORE UPDATE ON `im_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_section`
--

DROP TABLE IF EXISTS `im_section`;
CREATE TABLE IF NOT EXISTS `im_section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT '0',
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `name_url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `meta` varchar(512) COLLATE utf8_polish_ci DEFAULT '',
  `icon` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `class` varchar(128) COLLATE utf8_polish_ci NOT NULL DEFAULT 'container',
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `status_copy` varchar(3) COLLATE utf8_polish_ci NOT NULL DEFAULT 'off',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_section`
--

INSERT INTO `im_section` (`section_id`, `parent`, `name`, `name_url`, `meta`, `icon`, `class`, `position`, `status`, `status_copy`, `description`, `date_create`, `date_modify`) VALUES
(1, 0, 'HOME', 'home', 'Opis strony głownej', '', 'container-fluid', 1, 'on', 'off', '', '2019-11-14 21:28:52', '2019-12-03 11:07:01'),
(2, 0, 'O NAS', 'o-nas', '', '', 'container-fluid', 2, 'on', 'off', '', '2019-11-17 10:07:28', '2019-12-03 11:15:59'),
(3, 0, 'PORTFOLIO', 'portfolio', '', '', 'container', 3, 'on', 'off', '', '2019-11-17 10:07:54', '2019-12-07 11:55:12'),
(4, 0, 'KONTAKT', 'kontakt', '', '', 'container-fluid', 4, 'on', 'off', '', '2019-11-17 15:10:28', '2019-12-03 11:07:41'),
(5, 0, 'Hamburger', 'hamburger', '', 'fal fa-bars', '', 6, 'on', 'off', 'Ikona do wysuwanego z prawej strony menu', '2019-11-17 15:20:51', '2019-12-07 11:00:11'),
(6, 0, 'BLOG', 'blog', '', '', 'container blog', 5, 'on', 'off', '', '2019-11-17 20:02:47', '2019-12-07 11:00:10'),
(7, 0, 'Portfolio - sekcje', 'portfolio-sekcje', '', '', 'container', 7, 'off', 'off', 'Sekcje ze szczegółami portfolio', '2019-12-07 11:19:27', '2019-12-07 11:21:24'),
(8, 7, 'Foodsoft', 'foodsoft', '', '', 'container', 1, 'on', 'off', 'Portfolio, szczegóły', '2019-12-07 11:19:57', '2019-12-07 11:21:51');

--
-- Wyzwalacze `im_section`
--
DROP TRIGGER IF EXISTS `im_section_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_section_insert_date_create` BEFORE INSERT ON `im_section` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_section_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_section_insert_date_modify` BEFORE INSERT ON `im_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_section_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_section_update_date_modify` BEFORE UPDATE ON `im_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_section_object`
--

DROP TABLE IF EXISTS `im_section_object`;
CREATE TABLE IF NOT EXISTS `im_section_object` (
  `section_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`section_object_id`),
  KEY `section_id` (`section_id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_section_object`
--

INSERT INTO `im_section_object` (`section_object_id`, `section_id`, `object_id`) VALUES
(83, 1, 5),
(96, 1, 7),
(107, 1, 8),
(108, 1, 9),
(109, 1, 10),
(110, 1, 11),
(111, 1, 12),
(112, 1, 13),
(114, 1, 14),
(116, 1, 16),
(117, 1, 15),
(187, 1, 17),
(189, 4, 30),
(205, 4, 29),
(206, 6, 33),
(207, 2, 34),
(248, 6, 32),
(250, 6, 36),
(252, 6, 37),
(254, 6, 38),
(269, 4, 31),
(281, 1, 22),
(282, 2, 22),
(283, 3, 22),
(284, 4, 22),
(285, 6, 22),
(286, 8, 22),
(287, 1, 21),
(288, 2, 21),
(289, 3, 21),
(290, 4, 21),
(291, 6, 21),
(292, 8, 21),
(293, 1, 20),
(294, 2, 20),
(295, 3, 20),
(296, 6, 20),
(297, 8, 20),
(298, 3, 35),
(300, 1, 6),
(301, 2, 6),
(302, 3, 6),
(303, 4, 6),
(304, 6, 6),
(305, 8, 6),
(306, 1, 3),
(307, 2, 3),
(308, 3, 3),
(309, 4, 3),
(310, 6, 3),
(311, 8, 3),
(312, 1, 2),
(313, 2, 2),
(314, 3, 2),
(315, 4, 2),
(316, 6, 2),
(317, 8, 2),
(318, 1, 39),
(319, 2, 39),
(320, 3, 39),
(321, 4, 39),
(322, 6, 39),
(323, 8, 39),
(330, 1, 42),
(331, 2, 42),
(332, 4, 42),
(333, 6, 42),
(339, 1, 43),
(340, 2, 43),
(341, 3, 43),
(342, 4, 43),
(343, 6, 43),
(344, 1, 44),
(345, 2, 44),
(346, 4, 44),
(347, 6, 44),
(348, 1, 45),
(349, 2, 45),
(350, 3, 45),
(351, 4, 45),
(352, 6, 45),
(355, 1, 1),
(360, 8, 47),
(368, 8, 46),
(370, 8, 49);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_setting`
--

DROP TABLE IF EXISTS `im_setting`;
CREATE TABLE IF NOT EXISTS `im_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_setting`
--

INSERT INTO `im_setting` (`setting_id`, `name`, `system_name`, `content`, `description`, `date_create`, `date_modify`) VALUES
(1, 'System name', 'name', 'MoonPhaseStudio | Film and TV Production', '', '2019-11-14 21:28:52', '2019-12-05 20:43:26');

--
-- Wyzwalacze `im_setting`
--
DROP TRIGGER IF EXISTS `im_setting_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_setting_insert_date_create` BEFORE INSERT ON `im_setting` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_setting_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_setting_insert_date_modify` BEFORE INSERT ON `im_setting` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_setting_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_setting_update_date_modify` BEFORE UPDATE ON `im_setting` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_source`
--

DROP TABLE IF EXISTS `im_source`;
CREATE TABLE IF NOT EXISTS `im_source` (
  `source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `link` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_source`
--

INSERT INTO `im_source` (`source_id`, `name`, `content`, `link`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Foodsoft', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/377316855?title=0&byline=0&portrait=0\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '', 'on', '', '2019-12-11 13:53:17', '2019-12-11 14:13:58');

--
-- Wyzwalacze `im_source`
--
DROP TRIGGER IF EXISTS `im_source_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_source_insert_date_create` BEFORE INSERT ON `im_source` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_source_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_source_insert_date_modify` BEFORE INSERT ON `im_source` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_source_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_source_update_date_modify` BEFORE UPDATE ON `im_source` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_translation`
--

DROP TABLE IF EXISTS `im_translation`;
CREATE TABLE IF NOT EXISTS `im_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `target_table` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `target_column` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `target_record` int(11) NOT NULL,
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`translation_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_translation`
--
DROP TRIGGER IF EXISTS `im_translation_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_translation_insert_date_create` BEFORE INSERT ON `im_translation` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_insert_date_modify` BEFORE INSERT ON `im_translation` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_update_date_modify` BEFORE UPDATE ON `im_translation` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_translation_system`
--

DROP TABLE IF EXISTS `im_translation_system`;
CREATE TABLE IF NOT EXISTS `im_translation_system` (
  `translation_system_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`translation_system_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_translation_system`
--

INSERT INTO `im_translation_system` (`translation_system_id`, `language_id`, `name`, `system_name`, `content`, `description`, `date_create`, `date_modify`) VALUES
(1, 1, 'All', 'show-all', 'Pokaż wszystko', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(2, 2, 'All', 'show-all', 'Show all', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(3, 1, 'More', 'more', 'Więcej...', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(4, 2, 'More', 'more', 'More...', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(5, 1, 'No data', 'no-data', 'Brak danych', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(6, 2, 'No data', 'no-data', 'No data', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(7, 1, 'Przycisk wyślij', 'send', 'Wyślij', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(8, 1, 'Nazwa', 'name', 'Nazwa', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(9, 1, 'Nadawca', 'source', 'Nadawca', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(10, 2, 'Send button', 'send', 'Send now', '', '2019-11-14 21:07:52', '2019-11-14 21:07:52'),
(11, 2, 'Name', 'name', 'name', '', '2019-11-14 21:07:53', '2019-11-14 21:07:53'),
(12, 2, 'From', 'source', 'from', '', '2019-11-14 21:07:53', '2019-11-14 21:07:53'),
(13, 1, 'Formularz błąd', 'form-error', 'Błąd wysyłania wiadomości', '', '2019-11-14 21:07:53', '2019-11-14 21:07:53'),
(14, 1, 'Formularz poprawny', 'form-ok', 'Wiadomość wysłana', '', '2019-11-14 21:07:53', '2019-11-14 21:07:53'),
(15, 2, 'Form error', 'form-error', 'Error sending form', '', '2019-11-14 21:07:53', '2019-11-14 21:07:53'),
(16, 2, 'Form ok', 'form-ok', 'Form send', '', '2019-11-14 21:07:53', '2019-11-14 21:07:53'),
(17, 1, 'Błąd captcha', 'captcha-error', 'Błąd obrazka', '', '2019-11-14 21:07:54', '2019-11-14 21:07:54'),
(18, 2, 'Captcha error', 'captcha-error', 'Captcha error', '', '2019-11-14 21:07:54', '2019-11-14 21:07:54'),
(19, 1, 'Captcha', 'captcha-text', 'Wpisz znaki', '', '2019-11-14 21:07:54', '2019-11-14 21:07:54'),
(20, 2, 'Captcha', 'captcha-text', 'Insert captcha', '', '2019-11-14 21:07:54', '2019-11-14 21:07:54');

--
-- Wyzwalacze `im_translation_system`
--
DROP TRIGGER IF EXISTS `im_translation_system_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_translation_system_insert_date_create` BEFORE INSERT ON `im_translation_system` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_system_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_system_insert_date_modify` BEFORE INSERT ON `im_translation_system` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_system_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_system_update_date_modify` BEFORE UPDATE ON `im_translation_system` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_type`
--

DROP TABLE IF EXISTS `im_type`;
CREATE TABLE IF NOT EXISTS `im_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `class` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_type`
--

INSERT INTO `im_type` (`type_id`, `name`, `class`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Slider główny', '', NULL, '2019-11-16 09:30:44', '2019-11-16 09:30:44'),
(2, 'Logo', '', NULL, '2019-11-16 10:37:46', '2019-11-16 10:37:46'),
(3, 'Menu', '', NULL, '2019-11-17 10:05:27', '2019-11-17 10:05:27'),
(5, 'Ikona \"scroll down\"', '', '', '2019-11-17 21:16:43', '2019-11-18 09:45:29'),
(6, 'Logo mobile', ' logo-min', '', '2019-11-18 19:23:42', '2019-11-23 10:13:52'),
(7, 'Zaufali nam', 'col-12 col-lg-6 col-xl-3 text-center', '', '2019-11-23 10:26:57', '2019-11-24 10:35:55'),
(9, 'Treść sekcji', 'col-12', '', '2019-11-23 10:51:52', '2019-11-30 16:45:07'),
(10, 'Nazwa', 'col-12 text-center', '', '2019-11-24 10:37:42', '2019-11-24 10:39:10'),
(11, 'Formularz kontaktowy', 'col-12', '', '2019-11-24 17:51:01', '2019-11-24 17:55:03'),
(13, 'Dane firmy', 'company-data', '', '2019-11-30 09:38:59', '2019-11-30 20:23:48'),
(14, 'Mapa strony', '', NULL, '2019-11-30 09:39:12', '2019-11-30 09:39:12'),
(15, 'Treść stopki', 'col-12 text-center', '', '2019-11-30 10:21:29', '2019-12-05 20:50:18'),
(16, 'Blog', 'col-12 col-lg-6 col-xl-4', '', '2019-12-03 10:02:29', '2019-12-05 21:27:53'),
(17, 'Portfolio', 'col-12 col-lg-6 col-xl-4', 'Poza sekcją portfolio w prawym menu (hamburger)', '2019-12-07 10:01:54', '2019-12-07 10:18:49'),
(18, 'Link wewnętrzny', 'col-12', '', '2019-12-07 12:15:20', '2019-12-07 12:15:43'),
(19, 'Szczegóły portfolio', 'col-12', '', '2019-12-09 19:22:31', '2019-12-09 19:22:43'),
(21, 'Powrót do portfolio', 'col-12', '', '2019-12-11 14:46:02', '2019-12-11 14:46:11');

--
-- Wyzwalacze `im_type`
--
DROP TRIGGER IF EXISTS `im_type_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_type_insert_date_create` BEFORE INSERT ON `im_type` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_insert_date_modify` BEFORE INSERT ON `im_type` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_update_date_modify` BEFORE UPDATE ON `im_type` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_type_property`
--

DROP TABLE IF EXISTS `im_type_property`;
CREATE TABLE IF NOT EXISTS `im_type_property` (
  `type_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `class` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `class_field` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`type_property_id`),
  KEY `type_id` (`type_id`),
  KEY `property_id` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_type_property`
--

INSERT INTO `im_type_property` (`type_property_id`, `type_id`, `property_id`, `class`, `class_field`, `position`, `description`, `date_create`, `date_modify`) VALUES
(1, 1, 4, 'col-12', '', 1, '', '2019-11-16 09:30:52', '2019-11-16 09:31:10'),
(2, 2, 4, 'animated rotateIn d-none d-xl-block', '', 1, '', '2019-11-16 10:38:06', '2019-11-18 19:23:05'),
(3, 3, 7, '', 'navbar navbar-expand-lg navbar-dark', 1, '', '2019-11-17 10:05:38', '2019-11-18 19:08:52'),
(6, 5, 4, '', '', 1, '', '2019-11-17 21:16:59', '2019-11-17 21:21:06'),
(7, 6, 4, 'animated rotateIn d-xl-none', '', 1, '', '2019-11-18 19:24:12', '2019-11-23 10:13:44'),
(9, 7, 4, 'w-100', '', 1, '', '2019-11-23 10:52:35', '2019-11-24 09:17:00'),
(10, 9, 2, 'col-12', '', 1, '', '2019-11-23 10:53:35', '2019-11-30 16:41:43'),
(12, 10, 1, 'w-100 text-dark', '', 1, '', '2019-11-24 10:38:04', '2019-11-24 10:40:18'),
(13, 11, 10, 'col-12 p-5 contact-form', '', 2, '', '2019-11-24 17:51:09', '2019-11-30 17:29:52'),
(16, 11, 1, 'col-12 text-center form-title', '', 1, '', '2019-11-24 20:21:09', '2019-11-24 20:23:54'),
(17, 13, 2, 'col-12', '', 2, '', '2019-11-30 09:39:34', '2019-11-30 20:24:36'),
(18, 14, 7, 'col-12', '', 2, '', '2019-11-30 09:39:43', '2019-11-30 10:19:21'),
(19, 14, 1, 'col-12 site-map-title', '', 1, '', '2019-11-30 09:48:46', '2019-11-30 11:05:57'),
(22, 15, 2, 'col-12', '', 2, '', '2019-11-30 10:21:42', '2019-12-05 20:50:53'),
(23, 16, 3, 'col-12 text-right blog-date', '', 1, '', '2019-12-03 10:02:58', '2019-12-05 21:26:02'),
(24, 16, 4, '', '', 4, NULL, '2019-12-03 10:05:02', '2019-12-03 10:07:02'),
(25, 16, 1, 'col-12 h3 text-center', '', 2, '', '2019-12-03 10:05:21', '2019-12-03 12:31:57'),
(26, 16, 12, 'col-12 text-center p-3 h4', '', 3, '', '2019-12-03 10:05:39', '2019-12-03 12:32:28'),
(27, 16, 2, '', '', 5, NULL, '2019-12-03 10:06:21', '2019-12-03 10:07:02'),
(28, 15, 4, 'col-12', '', 1, '', '2019-12-05 20:49:06', '2019-12-05 20:50:45'),
(29, 17, 4, '', '', 1, NULL, '2019-12-07 10:04:37', '2019-12-07 10:05:06'),
(32, 18, 5, '', 'btn btn-dark', 1, '', '2019-12-07 12:15:51', '2019-12-07 12:41:17'),
(33, 19, 4, 'col-12 col-lg-6', '', 3, '', '2019-12-09 19:23:07', '2019-12-11 14:44:27'),
(34, 19, 2, 'col-12 col-lg-6 portfolio-text', '', 4, '', '2019-12-09 19:23:19', '2019-12-11 14:44:27'),
(39, 19, 1, 'col-12 portfolio-title', '', 2, '', '2019-12-11 13:16:42', '2019-12-11 14:44:27'),
(40, 19, 11, 'col-12 portfolio-source', 'col-12 portfolio-player', 5, '', '2019-12-11 13:47:19', '2019-12-11 14:44:27'),
(43, 21, 5, 'col-12 text-left portfolio-back', '', 1, '', '2019-12-11 14:46:35', '2019-12-11 14:51:01');

--
-- Wyzwalacze `im_type_property`
--
DROP TRIGGER IF EXISTS `im_type_property_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_type_property_insert_date_create` BEFORE INSERT ON `im_type_property` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_property_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_property_insert_date_modify` BEFORE INSERT ON `im_type_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_property_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_property_update_date_modify` BEFORE UPDATE ON `im_type_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `im_category`
--
ALTER TABLE `im_category`
  ADD CONSTRAINT `im_category_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `im_label` (`label_id`);

--
-- Ograniczenia dla tabeli `im_label_section`
--
ALTER TABLE `im_label_section`
  ADD CONSTRAINT `im_label_section_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `im_label` (`label_id`);

--
-- Ograniczenia dla tabeli `im_object`
--
ALTER TABLE `im_object`
  ADD CONSTRAINT `im_object_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `im_type` (`type_id`),
  ADD CONSTRAINT `im_object_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `im_label` (`label_id`);

--
-- Ograniczenia dla tabeli `im_object_category`
--
ALTER TABLE `im_object_category`
  ADD CONSTRAINT `im_object_category_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `im_category` (`category_id`);

--
-- Ograniczenia dla tabeli `im_object_file`
--
ALTER TABLE `im_object_file`
  ADD CONSTRAINT `im_object_file_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_file_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `im_file` (`file_id`);

--
-- Ograniczenia dla tabeli `im_object_image`
--
ALTER TABLE `im_object_image`
  ADD CONSTRAINT `im_object_image_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `im_image` (`image_id`);

--
-- Ograniczenia dla tabeli `im_object_source`
--
ALTER TABLE `im_object_source`
  ADD CONSTRAINT `im_object_source_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_source_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `im_source` (`source_id`);

--
-- Ograniczenia dla tabeli `im_section_object`
--
ALTER TABLE `im_section_object`
  ADD CONSTRAINT `im_section_object_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `im_section` (`section_id`),
  ADD CONSTRAINT `im_section_object_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`);

--
-- Ograniczenia dla tabeli `im_translation`
--
ALTER TABLE `im_translation`
  ADD CONSTRAINT `im_translation_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `im_language` (`language_id`);

--
-- Ograniczenia dla tabeli `im_translation_system`
--
ALTER TABLE `im_translation_system`
  ADD CONSTRAINT `im_translation_system_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `im_language` (`language_id`);

--
-- Ograniczenia dla tabeli `im_type_property`
--
ALTER TABLE `im_type_property`
  ADD CONSTRAINT `im_type_property_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `im_type` (`type_id`),
  ADD CONSTRAINT `im_type_property_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `im_property` (`property_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
