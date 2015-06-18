-- phpMyAdmin SQL Dump
-- version 4.4.1.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jun 18, 2015 at 06:28 PM
-- Server version: 5.5.42
-- PHP Version: 5.5.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `logtime`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresses`
--

CREATE TABLE `adresses` (
  `adress_id` int(10) unsigned NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `housenumber` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adresses`
--

INSERT INTO `adresses` (`adress_id`, `street`, `housenumber`, `city`, `zipcode`, `created_at`, `updated_at`, `active`) VALUES
(1, 'straat', '33', 'harderwijk', '8077 SZ', '2015-03-18 22:59:14', '2015-04-23 19:23:51', 1),
(2, 'Schokker', '10', 'Zeewolde', '3891DN', '2015-03-23 17:54:44', '2015-03-23 17:54:44', 1),
(6, 'Streetnam', '10 A', 'woonplaats', '3894 ''OP', '2015-04-07 10:44:19', '2015-04-07 10:44:19', 1),
(7, 'Westeinde', '33', 'Harderwijk', '3810 OP', '2015-04-07 11:50:51', '2015-04-07 11:50:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(10) unsigned NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category`, `created_at`, `updated_at`) VALUES
(1, 'Fase 4', '2015-03-18 22:56:33', '2015-03-18 22:56:33'),
(2, 'Fase 5', '2015-03-18 22:56:40', '2015-03-18 22:56:40'),
(3, 'Fase 6', '2015-03-18 22:56:33', '2015-03-19 19:31:12'),
(4, 'Fase 7', '2015-03-18 22:56:40', '2015-03-19 19:31:16');

-- --------------------------------------------------------

--
-- Table structure for table `categorie_tasks`
--

CREATE TABLE `categorie_tasks` (
  `category_task_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `is_done` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorie_tasks`
--

INSERT INTO `categorie_tasks` (`category_task_id`, `category_id`, `task_id`, `is_done`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2015-04-07 21:58:28', '2015-04-07 21:58:28'),
(2, 2, 2, 0, '2015-04-07 21:58:28', '2015-04-07 21:58:28'),
(3, 2, 3, 0, '2015-04-07 21:58:28', '2015-04-07 21:58:28'),
(4, 3, 4, 0, '2015-04-07 21:58:28', '2015-04-07 21:58:28'),
(5, 4, 5, 0, '2015-04-07 21:58:28', '2015-04-07 21:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) unsigned NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `adress_id` int(10) unsigned DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimated_time`
--

CREATE TABLE `estimated_time` (
  `estimated_time_id` int(10) unsigned NOT NULL,
  `time_needed` time NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forgotten_passwordtokens`
--

CREATE TABLE `forgotten_passwordtokens` (
  `forgotten_passwordtoken_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `forgotten_passwordtoken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `grade_id` int(10) unsigned NOT NULL,
  `grade` int(10) NOT NULL,
  `grade_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`grade_id`, `grade`, `grade_name`, `location_id`, `created_at`, `updated_at`) VALUES
(1, 4, '4D0W', 1, '2015-03-19 19:32:42', '2015-04-10 16:50:32'),
(2, 3, '3D0W', 1, '2015-03-19 19:32:42', '2015-04-10 16:50:32'),
(3, 2, '2D0W', 1, '2015-03-19 19:32:42', '2015-04-10 16:50:32'),
(4, 1, '1D0W', 1, '2015-03-19 19:32:42', '2015-04-10 16:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `holiday_id` int(10) unsigned NOT NULL,
  `holiday_startdate` date NOT NULL,
  `holiday_stopdate` date NOT NULL,
  `periode_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leveltypes`
--

CREATE TABLE `leveltypes` (
  `leveltype_id` int(11) NOT NULL,
  `leveltype_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leveltypes`
--

INSERT INTO `leveltypes` (`leveltype_id`, `leveltype_name`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Student', '2015-03-18 22:55:57', '2015-03-18 22:55:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Harderwijk', '2015-03-18 22:55:34', '2015-03-18 22:55:34');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `login_attempt_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `login_failed` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(10) unsigned NOT NULL,
  `notification_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `onderdelen`
--

CREATE TABLE `onderdelen` (
  `onderdeel_id` int(11) NOT NULL,
  `onderdeel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `onderdeel_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `menubar` int(11) DEFAULT '1',
  `is_docent` tinyint(1) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actief` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `onderdelen`
--

INSERT INTO `onderdelen` (`onderdeel_id`, `onderdeel`, `onderdeel_url`, `created_at`, `updated_at`, `menubar`, `is_docent`, `icon`, `actief`) VALUES
(1, 'Dashboard', '', '2015-03-15 20:06:52', '2015-03-15 22:46:08', 0, 0, 'dashboard.png', 1),
(2, 'Project beheer', 'project-beheer', '2015-03-15 20:06:52', '2015-03-15 22:49:49', 1, 0, 'map.png', 1),
(3, 'Persoonlijke instellingen', 'persoonlijke-instellingen', '2015-03-15 20:06:52', '2015-03-15 22:46:33', 0, 0, '', 1),
(4, 'Logboek', 'logboek', '2015-03-15 20:06:52', '2015-05-06 18:42:21', 1, 1, 'logboek.png', 1),
(5, 'Groeps instellingen', 'groepsinstellingen', '2015-03-15 22:47:05', '2015-03-15 22:47:05', 1, 0, 'instellingen.png', 1),
(6, 'Login', 'login', '2015-03-15 21:47:05', '2015-03-26 19:18:09', 0, 0, '', 1),
(7, 'Student Instellingen', 'studentsettings', '2015-04-22 21:27:04', '2015-04-08 17:09:28', 1, 1, 'instellingen.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paginas`
--

CREATE TABLE `paginas` (
  `pagina_id` int(11) NOT NULL,
  `onderdeel_id` int(11) NOT NULL,
  `naam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kop` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tekst` longtext COLLATE utf8_unicode_ci NOT NULL,
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `actief` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `paginas`
--

INSERT INTO `paginas` (`pagina_id`, `onderdeel_id`, `naam`, `titel`, `body`, `kop`, `tekst`, `element`, `created_at`, `updated_at`, `actief`) VALUES
(1, 1, 'Dashboard', 'Dashboard', '', 'Dashboard', 'Je bevind je nu op het dashboard. Hier vind je een overzicht van de gemaakte en lopende projecten van jouw. Je kunt de projecten inzien en bekijken hoe ver iedereen is met zijn of haar taken.', '', '2015-03-15 20:05:39', '2015-03-15 23:35:35', 1),
(2, 2, 'Projectbeheer', 'Projectbeheer', 'project-beheer', 'Projectbeheer', 'Hier vind je het projectenoverzicht van jouw groep. Klik een project aan en bekijk de statistieken van dit project.', '', '2015-03-15 20:05:39', '2015-03-15 23:05:42', 1),
(3, 3, 'Persoonlijke instellingen', 'Persoonlijke instellingen', 'persoonlijke-instellingen', 'Persoonlijke instellingen', 'Hier vind je je persoonlijke instellingen. Wijzig je instellingen en sla ze daarna op.', '', '2015-03-15 20:05:39', '2015-03-15 23:45:39', 1),
(4, 4, 'Logboek', 'Logboek', 'logboek', 'Logboek', 'Hier vind je een overzicht van je gelogte uren. Voeg nieuwe uren toe of wijzig de bestaande.', '', '2015-03-15 22:33:51', '2015-03-18 20:07:34', 1),
(5, 5, 'Groepsinstellingen', 'Groepsinstellingen', 'groepsinstellingen', 'Groepsinstellingen', 'Hier vind je de groepsinstellingen van jouw groep. Pas de instellingen aan en sla deze daarna op.', '', '2015-03-15 22:48:42', '2015-03-15 22:49:06', 1),
(6, 6, 'Login', 'Login', 'login', 'Login', 'Hier kun je inloggen', '', '2015-03-23 19:05:39', '2015-03-23 17:32:22', 1),
(7, 7, 'studentsettings', 'studentsettings', 'studentsettings', 'Student Instellingen', 'Hier vind je de groepsinstellingen van jouw groep. Pas de instellingen aan en sla deze daarna op.', '', '2015-04-22 21:27:44', '2015-04-08 17:08:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `periodes`
--

CREATE TABLE `periodes` (
  `periode_id` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `stopdate` date NOT NULL,
  `periode` int(10) NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `periodes`
--

INSERT INTO `periodes` (`periode_id`, `startdate`, `stopdate`, `periode`, `location_id`, `created_at`, `updated_at`) VALUES
(1, '2015-01-01', '2015-03-12', 1, 1, '2015-03-18 22:59:59', '2015-04-10 17:13:25'),
(2, '2015-03-16', '2015-05-19', 2, 1, '2015-03-18 22:59:59', '2015-04-10 17:16:33'),
(3, '2015-05-20', '2014-07-29', 3, 1, '2015-03-18 22:59:59', '2015-04-10 17:17:11'),
(4, '2015-07-30', '2014-10-01', 4, 1, '2015-03-18 22:59:59', '2015-04-10 17:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `projectcategories`
--

CREATE TABLE `projectcategories` (
  `projectcategory_id` int(10) NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectcategories`
--

INSERT INTO `projectcategories` (`projectcategory_id`, `category_id`, `task_id`, `project_id`, `created_at`, `updated_at`) VALUES
(5, 3, 2, 1, '2015-04-07 19:00:45', '2015-04-22 19:45:50'),
(6, 1, 4, 2, '2015-04-07 19:00:45', '2015-04-07 19:48:03'),
(7, 1, 1, 1, '2015-04-22 19:42:25', '2015-04-22 19:42:25'),
(8, 1, 2, 1, '2015-04-22 19:42:25', '2015-04-22 19:42:25');

-- --------------------------------------------------------

--
-- Table structure for table `projectgroup`
--

CREATE TABLE `projectgroup` (
  `projectgroup_id` int(10) unsigned NOT NULL,
  `leveltype_id` int(10) DEFAULT NULL,
  `grade_id` int(10) unsigned NOT NULL,
  `adress_id` int(10) unsigned DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `coach_id` int(10) unsigned DEFAULT NULL,
  `leader_id` int(10) unsigned DEFAULT NULL,
  `task_id` int(10) DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `projectgroup_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'placeholder.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectgroup`
--

INSERT INTO `projectgroup` (`projectgroup_id`, `leveltype_id`, `grade_id`, `adress_id`, `location_id`, `coach_id`, `leader_id`, `task_id`, `code`, `projectgroup_name`, `image_path`, `created_at`, `updated_at`, `active`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, '', 'orangesource', 'placeholder.png', '2015-03-19 19:37:53', '2015-03-19 19:37:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `projectgroup_categories`
--

CREATE TABLE `projectgroup_categories` (
  `projectgroup_categorie_id` int(10) unsigned NOT NULL,
  `projectgroup_periode_id` int(10) unsigned NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectgroup_periode`
--

CREATE TABLE `projectgroup_periode` (
  `projectgroup_periode_id` int(10) unsigned NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `grade_id` int(11) NOT NULL,
  `periode_id` int(10) unsigned DEFAULT NULL,
  `is_done` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectgroup_periode`
--

INSERT INTO `projectgroup_periode` (`projectgroup_periode_id`, `projectgroup_id`, `project_id`, `grade_id`, `periode_id`, `is_done`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 0, '2015-04-07 20:12:09', '2015-04-10 16:57:29'),
(2, 1, 2, 2, 4, 0, '2015-04-07 20:12:09', '2015-04-10 17:56:43'),
(3, 1, 3, 3, 2, 0, '2015-04-07 20:12:09', '2015-04-10 17:56:43');

-- --------------------------------------------------------

--
-- Table structure for table `projectgroup_projects`
--

CREATE TABLE `projectgroup_projects` (
  `projectgroup_id` int(10) unsigned NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectgroup_projects`
--

INSERT INTO `projectgroup_projects` (`projectgroup_id`, `project_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `projectslug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `projectcategory_id` int(11) DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `leveltype_id` int(10) unsigned DEFAULT NULL,
  `done` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `project`, `projectslug`, `projectcategory_id`, `location_id`, `leveltype_id`, `done`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Logtime', 'logtime', NULL, 0, 1, 0, '2015-03-18 22:57:37', '2015-04-22 19:40:12', 1),
(2, 'Pizzatoday', 'pizzatoday', NULL, 0, 1, 0, '2015-03-18 22:57:37', '2015-04-22 19:40:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `studentwage`
--

CREATE TABLE `studentwage` (
  `studentwage_id` int(10) unsigned NOT NULL,
  `wage` double(10,2) NOT NULL,
  `project_group_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=632 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `studentwage`
--

INSERT INTO `studentwage` (`studentwage_id`, `wage`, `project_group_id`, `created_at`, `updated_at`) VALUES
(1, 0.00, 0, '2015-03-24 20:48:39', '2015-03-24 20:48:39'),
(2, 0.00, 0, '2015-03-24 20:48:50', '2015-03-24 20:48:50'),
(3, 0.00, 0, '2015-03-24 20:50:47', '2015-03-24 20:50:47'),
(4, 0.00, 0, '2015-03-24 20:50:48', '2015-03-24 20:50:48'),
(5, 0.00, 0, '2015-03-24 20:50:49', '2015-03-24 20:50:49'),
(6, 0.00, 0, '2015-03-24 20:52:40', '2015-03-24 20:52:40'),
(7, 0.00, 0, '2015-03-24 20:52:42', '2015-03-24 20:52:42'),
(8, 0.00, 0, '2015-03-24 20:52:44', '2015-03-24 20:52:44'),
(9, 0.00, 0, '2015-03-24 20:55:25', '2015-03-24 20:55:25'),
(10, 0.00, 0, '2015-03-24 20:55:28', '2015-03-24 20:55:28'),
(11, 0.00, 0, '2015-03-24 20:58:02', '2015-03-24 20:58:02'),
(12, 0.00, 0, '2015-03-24 20:58:38', '2015-03-24 20:58:38'),
(13, 0.00, 0, '2015-03-24 21:01:04', '2015-03-24 21:01:04'),
(14, 0.00, 0, '2015-03-24 21:01:23', '2015-03-24 21:01:23'),
(15, 0.00, 0, '2015-03-24 21:04:32', '2015-03-24 21:04:32'),
(16, 0.00, 0, '2015-03-24 21:04:35', '2015-03-24 21:04:35'),
(17, 0.00, 0, '2015-03-24 21:04:37', '2015-03-24 21:04:37'),
(18, 0.00, 0, '2015-03-24 21:06:56', '2015-03-24 21:06:56'),
(19, 0.00, 0, '2015-03-24 21:06:58', '2015-03-24 21:06:58'),
(20, 0.00, 0, '2015-03-24 21:08:59', '2015-03-24 21:08:59'),
(21, 0.00, 0, '2015-03-24 21:09:19', '2015-03-24 21:09:19'),
(22, 0.00, 0, '2015-03-24 21:09:39', '2015-03-24 21:09:39'),
(23, 0.00, 0, '2015-03-24 21:11:04', '2015-03-24 21:11:04'),
(24, 0.00, 0, '2015-03-24 21:11:08', '2015-03-24 21:11:08'),
(25, 0.00, 0, '2015-03-24 21:11:19', '2015-03-24 21:11:19'),
(26, 0.00, 0, '2015-03-24 22:07:45', '2015-03-24 22:07:45'),
(27, 0.00, 0, '2015-03-24 22:08:26', '2015-03-24 22:08:26'),
(28, 0.00, 0, '2015-03-24 22:08:41', '2015-03-24 22:08:41'),
(29, 0.00, 0, '2015-03-24 22:08:54', '2015-03-24 22:08:54'),
(30, 0.00, 0, '2015-03-24 22:09:24', '2015-03-24 22:09:24'),
(31, 0.00, 0, '2015-03-24 22:09:34', '2015-03-24 22:09:34'),
(32, 0.00, 0, '2015-03-24 22:10:45', '2015-03-24 22:10:45'),
(33, 0.00, 0, '2015-03-24 22:10:59', '2015-03-24 22:10:59'),
(34, 0.00, 0, '2015-03-24 22:11:08', '2015-03-24 22:11:08'),
(35, 0.00, 0, '2015-03-24 22:11:10', '2015-03-24 22:11:10'),
(36, 0.00, 0, '2015-03-24 22:12:55', '2015-03-24 22:12:55'),
(37, 0.00, 0, '2015-03-24 22:12:56', '2015-03-24 22:12:56'),
(38, 0.00, 0, '2015-03-24 22:13:28', '2015-03-24 22:13:28'),
(39, 0.00, 0, '2015-03-24 22:13:31', '2015-03-24 22:13:31'),
(40, 0.00, 0, '2015-03-24 22:13:33', '2015-03-24 22:13:33'),
(41, 0.00, 0, '2015-03-24 22:13:35', '2015-03-24 22:13:35'),
(42, 0.00, 0, '2015-03-24 22:14:06', '2015-03-24 22:14:06'),
(43, 0.00, 0, '2015-03-24 22:14:08', '2015-03-24 22:14:08'),
(44, 0.00, 0, '2015-03-24 22:14:09', '2015-03-24 22:14:09'),
(45, 0.00, 0, '2015-03-24 22:14:10', '2015-03-24 22:14:10'),
(46, 0.00, 0, '2015-03-24 22:16:11', '2015-03-24 22:16:11'),
(47, 0.00, 0, '2015-03-24 22:16:13', '2015-03-24 22:16:13'),
(48, 0.00, 0, '2015-03-24 22:16:19', '2015-03-24 22:16:19'),
(49, 0.00, 0, '2015-03-24 22:16:33', '2015-03-24 22:16:33'),
(50, 0.00, 0, '2015-03-24 22:16:36', '2015-03-24 22:16:36'),
(51, 0.00, 0, '2015-03-24 22:16:48', '2015-03-24 22:16:48'),
(52, 0.00, 0, '2015-03-24 22:16:50', '2015-03-24 22:16:50'),
(53, 0.00, 0, '2015-03-24 22:17:05', '2015-03-24 22:17:05'),
(54, 0.00, 0, '2015-03-24 22:17:07', '2015-03-24 22:17:07'),
(55, 0.00, 0, '2015-03-24 22:17:16', '2015-03-24 22:17:16'),
(56, 0.00, 0, '2015-03-24 22:17:19', '2015-03-24 22:17:19'),
(57, 0.00, 0, '2015-03-24 22:17:31', '2015-03-24 22:17:31'),
(58, 0.00, 0, '2015-03-24 22:17:32', '2015-03-24 22:17:32'),
(59, 0.00, 0, '2015-03-24 22:17:57', '2015-03-24 22:17:57'),
(60, 0.00, 0, '2015-03-24 22:17:58', '2015-03-24 22:17:58'),
(61, 0.00, 0, '2015-03-24 22:18:34', '2015-03-24 22:18:34'),
(62, 0.00, 0, '2015-03-24 22:18:52', '2015-03-24 22:18:52'),
(63, 0.00, 0, '2015-03-24 22:23:45', '2015-03-24 22:23:45'),
(64, 0.00, 0, '2015-03-24 22:24:59', '2015-03-24 22:24:59'),
(65, 0.00, 0, '2015-03-24 22:25:12', '2015-03-24 22:25:12'),
(66, 0.00, 0, '2015-03-24 22:25:51', '2015-03-24 22:25:51'),
(67, 0.00, 0, '2015-03-24 22:34:41', '2015-03-24 22:34:41'),
(68, 0.00, 0, '2015-03-24 22:37:59', '2015-03-24 22:37:59'),
(69, 0.00, 0, '2015-03-24 22:38:10', '2015-03-24 22:38:10'),
(70, 0.00, 0, '2015-03-24 22:39:18', '2015-03-24 22:39:18'),
(71, 0.00, 0, '2015-03-24 22:39:25', '2015-03-24 22:39:25'),
(72, 0.00, 0, '2015-03-24 22:39:28', '2015-03-24 22:39:28'),
(73, 0.00, 0, '2015-03-24 22:40:50', '2015-03-24 22:40:50'),
(74, 0.00, 0, '2015-03-24 22:41:03', '2015-03-24 22:41:03'),
(75, 0.00, 0, '2015-03-24 22:41:32', '2015-03-24 22:41:32'),
(76, 0.00, 0, '2015-03-24 22:42:34', '2015-03-24 22:42:34'),
(77, 0.00, 0, '2015-03-24 22:42:44', '2015-03-24 22:42:44'),
(78, 0.00, 0, '2015-03-24 22:43:16', '2015-03-24 22:43:16'),
(79, 0.00, 0, '2015-03-24 22:43:34', '2015-03-24 22:43:34'),
(80, 0.00, 0, '2015-03-24 22:43:34', '2015-03-24 22:43:34'),
(81, 0.00, 0, '2015-03-24 22:43:35', '2015-03-24 22:43:35'),
(82, 0.00, 0, '2015-03-24 22:43:37', '2015-03-24 22:43:37'),
(83, 0.00, 0, '2015-03-24 22:47:45', '2015-03-24 22:47:45'),
(84, 0.00, 0, '2015-03-24 22:48:22', '2015-03-24 22:48:22'),
(85, 0.00, 0, '2015-03-24 22:48:42', '2015-03-24 22:48:42'),
(86, 0.00, 0, '2015-03-24 22:49:56', '2015-03-24 22:49:56'),
(87, 0.00, 0, '2015-03-24 22:50:29', '2015-03-24 22:50:29'),
(88, 0.00, 0, '2015-03-24 22:50:49', '2015-03-24 22:50:49'),
(89, 0.00, 0, '2015-03-24 22:51:10', '2015-03-24 22:51:10'),
(90, 0.00, 0, '2015-03-24 22:51:28', '2015-03-24 22:51:28'),
(91, 0.00, 0, '2015-03-24 22:51:41', '2015-03-24 22:51:41'),
(92, 0.00, 0, '2015-03-24 22:52:34', '2015-03-24 22:52:34'),
(93, 0.00, 0, '2015-03-24 22:52:58', '2015-03-24 22:52:58'),
(94, 0.00, 0, '2015-03-24 22:53:43', '2015-03-24 22:53:43'),
(95, 0.00, 0, '2015-03-24 22:53:55', '2015-03-24 22:53:55'),
(96, 0.00, 0, '2015-03-24 22:54:13', '2015-03-24 22:54:13'),
(97, 0.00, 0, '2015-03-24 22:54:31', '2015-03-24 22:54:31'),
(98, 0.00, 0, '2015-03-24 22:55:07', '2015-03-24 22:55:07'),
(99, 0.00, 0, '2015-03-24 22:55:11', '2015-03-24 22:55:11'),
(100, 0.00, 0, '2015-03-24 22:56:58', '2015-03-24 22:56:58'),
(101, 0.00, 0, '2015-03-24 22:57:01', '2015-03-24 22:57:01'),
(102, 0.00, 0, '2015-03-24 23:00:04', '2015-03-24 23:00:04'),
(103, 0.00, 0, '2015-03-24 23:00:35', '2015-03-24 23:00:35'),
(104, 0.00, 0, '2015-03-24 23:01:56', '2015-03-24 23:01:56'),
(105, 0.00, 0, '2015-03-24 23:02:32', '2015-03-24 23:02:32'),
(106, 0.00, 0, '2015-03-24 23:03:08', '2015-03-24 23:03:08'),
(107, 0.00, 0, '2015-03-24 23:06:08', '2015-03-24 23:06:08'),
(108, 0.00, 0, '2015-03-24 23:06:52', '2015-03-24 23:06:52'),
(109, 0.00, 0, '2015-03-24 23:07:49', '2015-03-24 23:07:49'),
(110, 0.00, 0, '2015-03-24 23:11:37', '2015-03-24 23:11:37'),
(111, 0.00, 0, '2015-03-24 23:12:36', '2015-03-24 23:12:36'),
(112, 0.00, 0, '2015-03-24 23:12:55', '2015-03-24 23:12:55'),
(113, 0.00, 0, '2015-03-24 23:13:17', '2015-03-24 23:13:17'),
(114, 0.00, 0, '2015-03-24 23:14:19', '2015-03-24 23:14:19'),
(115, 0.00, 0, '2015-03-24 23:15:43', '2015-03-24 23:15:43'),
(116, 0.00, 0, '2015-03-24 23:20:07', '2015-03-24 23:20:07'),
(117, 0.00, 0, '2015-03-24 23:23:13', '2015-03-24 23:23:13'),
(118, 0.00, 0, '2015-03-24 23:25:05', '2015-03-24 23:25:05'),
(119, 0.00, 0, '2015-03-24 23:29:06', '2015-03-24 23:29:06'),
(120, 0.00, 0, '2015-03-24 23:33:56', '2015-03-24 23:33:56'),
(121, 0.00, 0, '2015-03-24 23:35:52', '2015-03-24 23:35:52'),
(122, 0.00, 0, '2015-03-24 23:37:48', '2015-03-24 23:37:48'),
(123, 0.00, 0, '2015-03-24 23:38:00', '2015-03-24 23:38:00'),
(124, 0.00, 0, '2015-03-24 23:38:25', '2015-03-24 23:38:25'),
(125, 0.00, 0, '2015-03-24 23:38:27', '2015-03-24 23:38:27'),
(126, 0.00, 0, '2015-03-24 23:38:45', '2015-03-24 23:38:45'),
(127, 0.00, 0, '2015-03-24 23:38:48', '2015-03-24 23:38:48'),
(128, 0.00, 0, '2015-03-24 23:39:24', '2015-03-24 23:39:24'),
(129, 0.00, 0, '2015-03-24 23:40:08', '2015-03-24 23:40:08'),
(130, 0.00, 0, '2015-03-25 17:44:40', '2015-03-25 17:44:40'),
(131, 0.00, 0, '2015-03-25 17:49:12', '2015-03-25 17:49:12'),
(132, 0.00, 0, '2015-03-25 17:49:21', '2015-03-25 17:49:21'),
(133, 0.00, 0, '2015-03-25 17:50:09', '2015-03-25 17:50:09'),
(134, 0.00, 0, '2015-03-25 17:50:47', '2015-03-25 17:50:47'),
(135, 0.00, 0, '2015-03-25 17:51:00', '2015-03-25 17:51:00'),
(136, 0.00, 0, '2015-03-25 17:51:02', '2015-03-25 17:51:02'),
(137, 0.00, 0, '2015-03-25 17:54:45', '2015-03-25 17:54:45'),
(138, 0.00, 0, '2015-03-25 17:54:48', '2015-03-25 17:54:48'),
(139, 0.00, 0, '2015-03-25 17:55:39', '2015-03-25 17:55:39'),
(140, 0.00, 0, '2015-03-25 17:56:41', '2015-03-25 17:56:41'),
(141, 0.00, 0, '2015-03-25 17:56:46', '2015-03-25 17:56:46'),
(142, 0.00, 0, '2015-03-25 17:57:57', '2015-03-25 17:57:57'),
(143, 0.00, 0, '2015-03-25 17:57:58', '2015-03-25 17:57:58'),
(144, 0.00, 0, '2015-03-25 18:01:24', '2015-03-25 18:01:24'),
(145, 0.00, 0, '2015-03-25 18:03:31', '2015-03-25 18:03:31'),
(146, 0.00, 0, '2015-03-25 18:12:33', '2015-03-25 18:12:33'),
(147, 0.00, 0, '2015-03-25 18:13:01', '2015-03-25 18:13:01'),
(148, 0.00, 0, '2015-03-25 18:13:53', '2015-03-25 18:13:53'),
(149, 0.00, 0, '2015-03-25 18:14:49', '2015-03-25 18:14:49'),
(150, 0.00, 0, '2015-03-25 18:14:51', '2015-03-25 18:14:51'),
(151, 0.00, 0, '2015-03-25 18:14:53', '2015-03-25 18:14:53'),
(152, 0.00, 0, '2015-03-25 18:14:57', '2015-03-25 18:14:57'),
(153, 0.00, 0, '2015-03-25 18:15:39', '2015-03-25 18:15:39'),
(154, 0.00, 0, '2015-03-25 18:19:36', '2015-03-25 18:19:36'),
(155, 0.00, 0, '2015-03-25 18:25:37', '2015-03-25 18:25:37'),
(156, 0.00, 0, '2015-03-25 18:26:28', '2015-03-25 18:26:28'),
(157, 0.00, 0, '2015-03-25 18:31:26', '2015-03-25 18:31:26'),
(158, 0.00, 0, '2015-03-25 18:31:31', '2015-03-25 18:31:31'),
(159, 0.00, 0, '2015-03-25 18:31:38', '2015-03-25 18:31:38'),
(160, 0.00, 0, '2015-03-25 18:33:02', '2015-03-25 18:33:02'),
(161, 0.00, 0, '2015-03-25 18:36:55', '2015-03-25 18:36:55'),
(162, 0.00, 0, '2015-03-25 18:47:53', '2015-03-25 18:47:53'),
(163, 0.00, 0, '2015-03-25 18:48:00', '2015-03-25 18:48:00'),
(164, 0.00, 0, '2015-03-25 18:48:02', '2015-03-25 18:48:02'),
(165, 0.00, 0, '2015-03-25 18:55:59', '2015-03-25 18:55:59'),
(166, 0.00, 0, '2015-03-25 18:56:02', '2015-03-25 18:56:02'),
(167, 0.00, 0, '2015-03-25 19:04:20', '2015-03-25 19:04:20'),
(168, 0.00, 0, '2015-03-25 19:04:28', '2015-03-25 19:04:28'),
(169, 0.00, 0, '2015-03-25 19:05:21', '2015-03-25 19:05:21'),
(170, 0.00, 0, '2015-03-25 19:17:57', '2015-03-25 19:17:57'),
(171, 0.00, 0, '2015-03-25 19:18:01', '2015-03-25 19:18:01'),
(172, 0.00, 0, '2015-03-25 19:18:35', '2015-03-25 19:18:35'),
(173, 0.00, 0, '2015-03-25 19:18:37', '2015-03-25 19:18:37'),
(174, 0.00, 0, '2015-03-25 19:25:12', '2015-03-25 19:25:12'),
(175, 0.00, 0, '2015-03-25 19:25:13', '2015-03-25 19:25:13'),
(176, 0.00, 0, '2015-03-25 19:25:15', '2015-03-25 19:25:15'),
(177, 0.00, 0, '2015-03-25 19:28:02', '2015-03-25 19:28:02'),
(178, 0.00, 0, '2015-03-25 19:28:05', '2015-03-25 19:28:05'),
(179, 0.00, 0, '2015-03-25 19:28:09', '2015-03-25 19:28:09'),
(180, 0.00, 0, '2015-03-25 19:28:50', '2015-03-25 19:28:50'),
(181, 0.00, 0, '2015-03-25 19:28:52', '2015-03-25 19:28:52'),
(182, 0.00, 0, '2015-03-25 19:29:15', '2015-03-25 19:29:15'),
(183, 0.00, 0, '2015-03-25 19:30:38', '2015-03-25 19:30:38'),
(184, 0.00, 0, '2015-03-25 19:30:39', '2015-03-25 19:30:39'),
(185, 0.00, 0, '2015-03-25 19:32:08', '2015-03-25 19:32:08'),
(186, 0.00, 0, '2015-03-25 19:32:09', '2015-03-25 19:32:09'),
(187, 0.00, 0, '2015-03-25 19:33:20', '2015-03-25 19:33:20'),
(188, 0.00, 0, '2015-03-25 19:33:22', '2015-03-25 19:33:22'),
(189, 0.00, 0, '2015-03-25 19:33:40', '2015-03-25 19:33:40'),
(190, 0.00, 0, '2015-03-25 19:33:41', '2015-03-25 19:33:41'),
(191, 0.00, 0, '2015-03-25 19:33:49', '2015-03-25 19:33:49'),
(192, 0.00, 0, '2015-03-25 19:33:51', '2015-03-25 19:33:51'),
(193, 0.00, 0, '2015-03-25 19:34:23', '2015-03-25 19:34:23'),
(194, 0.00, 0, '2015-03-25 19:34:25', '2015-03-25 19:34:25'),
(195, 0.00, 0, '2015-03-25 19:34:36', '2015-03-25 19:34:36'),
(196, 0.00, 0, '2015-03-25 19:34:38', '2015-03-25 19:34:38'),
(197, 0.00, 0, '2015-03-25 19:35:16', '2015-03-25 19:35:16'),
(198, 0.00, 0, '2015-03-25 19:35:18', '2015-03-25 19:35:18'),
(199, 0.00, 0, '2015-03-25 19:35:21', '2015-03-25 19:35:21'),
(200, 0.00, 0, '2015-03-25 19:35:24', '2015-03-25 19:35:24'),
(201, 0.00, 0, '2015-03-25 19:36:33', '2015-03-25 19:36:33'),
(202, 0.00, 0, '2015-03-25 19:36:33', '2015-03-25 19:36:33'),
(203, 0.00, 0, '2015-03-25 19:36:35', '2015-03-25 19:36:35'),
(204, 0.00, 0, '2015-03-25 19:36:37', '2015-03-25 19:36:37'),
(205, 0.00, 0, '2015-03-25 19:36:39', '2015-03-25 19:36:39'),
(206, 0.00, 0, '2015-03-25 19:38:25', '2015-03-25 19:38:25'),
(207, 0.00, 0, '2015-03-25 19:38:27', '2015-03-25 19:38:27'),
(208, 0.00, 0, '2015-03-25 19:38:41', '2015-03-25 19:38:41'),
(209, 0.00, 0, '2015-03-25 19:38:43', '2015-03-25 19:38:43'),
(210, 0.00, 0, '2015-03-25 19:38:58', '2015-03-25 19:38:58'),
(211, 0.00, 0, '2015-03-25 19:39:00', '2015-03-25 19:39:00'),
(212, 0.00, 0, '2015-03-25 19:40:20', '2015-03-25 19:40:20'),
(213, 0.00, 0, '2015-03-25 19:40:26', '2015-03-25 19:40:26'),
(214, 0.00, 0, '2015-03-25 19:40:34', '2015-03-25 19:40:34'),
(215, 0.00, 0, '2015-03-25 19:40:37', '2015-03-25 19:40:37'),
(216, 0.00, 0, '2015-03-25 19:41:16', '2015-03-25 19:41:16'),
(217, 0.00, 0, '2015-03-25 19:41:18', '2015-03-25 19:41:18'),
(218, 0.00, 0, '2015-03-25 19:41:54', '2015-03-25 19:41:54'),
(219, 0.00, 0, '2015-03-25 19:41:55', '2015-03-25 19:41:55'),
(220, 0.00, 0, '2015-03-25 19:42:17', '2015-03-25 19:42:17'),
(221, 0.00, 0, '2015-03-25 19:42:19', '2015-03-25 19:42:19'),
(222, 0.00, 0, '2015-03-25 19:43:56', '2015-03-25 19:43:56'),
(223, 0.00, 0, '2015-03-25 19:43:58', '2015-03-25 19:43:58'),
(224, 0.00, 0, '2015-03-25 19:46:10', '2015-03-25 19:46:10'),
(225, 0.00, 0, '2015-03-25 19:46:12', '2015-03-25 19:46:12'),
(226, 0.00, 0, '2015-03-25 19:46:19', '2015-03-25 19:46:19'),
(227, 0.00, 0, '2015-03-25 19:47:36', '2015-03-25 19:47:36'),
(228, 0.00, 0, '2015-03-25 19:47:46', '2015-03-25 19:47:46'),
(229, 0.00, 0, '2015-03-25 19:47:49', '2015-03-25 19:47:49'),
(230, 0.00, 0, '2015-03-25 19:48:50', '2015-03-25 19:48:50'),
(231, 0.00, 0, '2015-03-25 19:48:52', '2015-03-25 19:48:52'),
(232, 0.00, 0, '2015-03-25 19:49:08', '2015-03-25 19:49:08'),
(233, 0.00, 0, '2015-03-25 19:49:09', '2015-03-25 19:49:09'),
(234, 0.00, 0, '2015-03-25 19:49:17', '2015-03-25 19:49:17'),
(235, 0.00, 0, '2015-03-25 19:49:19', '2015-03-25 19:49:19'),
(236, 0.00, 0, '2015-03-25 19:49:34', '2015-03-25 19:49:34'),
(237, 0.00, 0, '2015-03-25 19:49:36', '2015-03-25 19:49:36'),
(238, 0.00, 0, '2015-03-25 19:51:54', '2015-03-25 19:51:54'),
(239, 0.00, 0, '2015-03-25 19:51:55', '2015-03-25 19:51:55'),
(240, 0.00, 0, '2015-03-25 19:53:38', '2015-03-25 19:53:38'),
(241, 0.00, 0, '2015-03-25 19:53:40', '2015-03-25 19:53:40'),
(242, 0.00, 0, '2015-03-25 19:54:35', '2015-03-25 19:54:35'),
(243, 0.00, 0, '2015-03-25 19:54:37', '2015-03-25 19:54:37'),
(244, 0.00, 0, '2015-03-25 19:54:53', '2015-03-25 19:54:53'),
(245, 0.00, 0, '2015-03-25 19:54:54', '2015-03-25 19:54:54'),
(246, 0.00, 0, '2015-03-25 19:55:34', '2015-03-25 19:55:34'),
(247, 0.00, 0, '2015-03-25 19:55:35', '2015-03-25 19:55:35'),
(248, 0.00, 0, '2015-03-25 19:56:01', '2015-03-25 19:56:01'),
(249, 0.00, 0, '2015-03-25 19:56:28', '2015-03-25 19:56:28'),
(250, 0.00, 0, '2015-03-25 19:56:29', '2015-03-25 19:56:29'),
(251, 0.00, 0, '2015-03-25 19:56:29', '2015-03-25 19:56:29'),
(252, 0.00, 0, '2015-03-25 19:56:29', '2015-03-25 19:56:29'),
(253, 0.00, 0, '2015-03-25 19:56:38', '2015-03-25 19:56:38'),
(254, 0.00, 0, '2015-03-25 19:56:39', '2015-03-25 19:56:39'),
(255, 0.00, 0, '2015-03-25 19:56:40', '2015-03-25 19:56:40'),
(256, 0.00, 0, '2015-03-25 19:56:46', '2015-03-25 19:56:46'),
(257, 0.00, 0, '2015-03-25 19:56:48', '2015-03-25 19:56:48'),
(258, 0.00, 0, '2015-03-25 19:56:50', '2015-03-25 19:56:50'),
(259, 0.00, 0, '2015-03-25 19:57:17', '2015-03-25 19:57:17'),
(260, 0.00, 0, '2015-03-25 19:57:19', '2015-03-25 19:57:19'),
(261, 0.00, 0, '2015-03-25 19:57:21', '2015-03-25 19:57:21'),
(262, 0.00, 0, '2015-03-25 19:57:24', '2015-03-25 19:57:24'),
(263, 0.00, 0, '2015-03-25 19:57:26', '2015-03-25 19:57:26'),
(264, 0.00, 0, '2015-03-25 19:57:29', '2015-03-25 19:57:29'),
(265, 0.00, 0, '2015-03-25 19:57:34', '2015-03-25 19:57:34'),
(266, 0.00, 0, '2015-03-25 19:57:37', '2015-03-25 19:57:37'),
(267, 0.00, 0, '2015-03-25 19:57:40', '2015-03-25 19:57:40'),
(268, 0.00, 0, '2015-03-25 19:58:41', '2015-03-25 19:58:41'),
(269, 0.00, 0, '2015-03-25 19:58:43', '2015-03-25 19:58:43'),
(270, 0.00, 0, '2015-03-25 20:00:44', '2015-03-25 20:00:44'),
(271, 0.00, 0, '2015-03-25 20:00:49', '2015-03-25 20:00:49'),
(272, 0.00, 0, '2015-03-25 20:01:16', '2015-03-25 20:01:16'),
(273, 0.00, 0, '2015-03-25 20:01:17', '2015-03-25 20:01:17'),
(274, 0.00, 0, '2015-03-25 20:01:27', '2015-03-25 20:01:27'),
(275, 0.00, 0, '2015-03-25 20:01:41', '2015-03-25 20:01:41'),
(276, 0.00, 0, '2015-03-25 20:01:45', '2015-03-25 20:01:45'),
(277, 0.00, 0, '2015-03-25 20:02:48', '2015-03-25 20:02:48'),
(278, 0.00, 0, '2015-03-25 20:03:14', '2015-03-25 20:03:14'),
(279, 0.00, 0, '2015-03-25 20:03:55', '2015-03-25 20:03:55'),
(280, 0.00, 0, '2015-03-25 20:03:58', '2015-03-25 20:03:58'),
(281, 0.00, 0, '2015-03-25 20:12:20', '2015-03-25 20:12:20'),
(282, 0.00, 0, '2015-03-25 20:12:29', '2015-03-25 20:12:29'),
(283, 0.00, 0, '2015-03-25 20:13:47', '2015-03-25 20:13:47'),
(284, 0.00, 0, '2015-03-25 20:13:56', '2015-03-25 20:13:56'),
(285, 0.00, 0, '2015-03-25 20:15:18', '2015-03-25 20:15:18'),
(286, 0.00, 0, '2015-03-25 20:15:24', '2015-03-25 20:15:24'),
(287, 0.00, 0, '2015-03-25 20:17:03', '2015-03-25 20:17:03'),
(288, 0.00, 0, '2015-03-25 20:17:06', '2015-03-25 20:17:06'),
(289, 0.00, 0, '2015-03-25 20:17:39', '2015-03-25 20:17:39'),
(290, 0.00, 0, '2015-03-25 20:17:40', '2015-03-25 20:17:40'),
(291, 0.00, 0, '2015-03-25 20:17:43', '2015-03-25 20:17:43'),
(292, 0.00, 0, '2015-03-25 20:18:25', '2015-03-25 20:18:25'),
(293, 0.00, 0, '2015-03-25 20:18:28', '2015-03-25 20:18:28'),
(294, 0.00, 0, '2015-03-25 20:19:33', '2015-03-25 20:19:33'),
(295, 0.00, 0, '2015-03-25 20:19:35', '2015-03-25 20:19:35'),
(296, 0.00, 0, '2015-03-25 20:19:50', '2015-03-25 20:19:50'),
(297, 0.00, 0, '2015-03-25 20:19:53', '2015-03-25 20:19:53'),
(298, 0.00, 0, '2015-03-25 20:21:54', '2015-03-25 20:21:54'),
(299, 0.00, 0, '2015-03-25 20:21:57', '2015-03-25 20:21:57'),
(300, 0.00, 0, '2015-03-25 20:22:30', '2015-03-25 20:22:30'),
(301, 0.00, 0, '2015-03-25 20:22:33', '2015-03-25 20:22:33'),
(302, 0.00, 0, '2015-03-25 20:22:49', '2015-03-25 20:22:49'),
(303, 0.00, 0, '2015-03-25 20:23:38', '2015-03-25 20:23:38'),
(304, 0.00, 0, '2015-03-25 20:23:40', '2015-03-25 20:23:40'),
(305, 0.00, 0, '2015-03-25 20:27:56', '2015-03-25 20:27:56'),
(306, 0.00, 0, '2015-03-25 20:28:10', '2015-03-25 20:28:10'),
(307, 0.00, 0, '2015-03-25 20:29:53', '2015-03-25 20:29:53'),
(308, 0.00, 0, '2015-03-25 20:30:30', '2015-03-25 20:30:30'),
(309, 0.00, 0, '2015-03-25 20:30:35', '2015-03-25 20:30:35'),
(310, 0.00, 0, '2015-03-25 20:35:09', '2015-03-25 20:35:09'),
(311, 0.00, 0, '2015-03-25 20:35:18', '2015-03-25 20:35:18'),
(312, 0.00, 0, '2015-03-25 20:35:26', '2015-03-25 20:35:26'),
(313, 0.00, 0, '2015-03-25 20:35:59', '2015-03-25 20:35:59'),
(314, 0.00, 0, '2015-03-25 20:36:29', '2015-03-25 20:36:29'),
(315, 0.00, 0, '2015-03-25 20:36:33', '2015-03-25 20:36:33'),
(316, 0.00, 0, '2015-03-25 20:37:26', '2015-03-25 20:37:26'),
(317, 0.00, 0, '2015-03-25 20:37:28', '2015-03-25 20:37:28'),
(318, 0.00, 0, '2015-03-25 20:38:03', '2015-03-25 20:38:03'),
(319, 0.00, 0, '2015-03-25 20:38:04', '2015-03-25 20:38:04'),
(320, 0.00, 0, '2015-03-25 20:38:10', '2015-03-25 20:38:10'),
(321, 0.00, 0, '2015-03-25 20:39:08', '2015-03-25 20:39:08'),
(322, 0.00, 0, '2015-03-25 20:39:10', '2015-03-25 20:39:10'),
(323, 0.00, 0, '2015-03-25 20:40:32', '2015-03-25 20:40:32'),
(324, 0.00, 0, '2015-03-25 20:41:03', '2015-03-25 20:41:03'),
(325, 0.00, 0, '2015-03-25 20:42:06', '2015-03-25 20:42:06'),
(326, 0.00, 0, '2015-03-25 20:42:08', '2015-03-25 20:42:08'),
(327, 0.00, 0, '2015-03-25 20:44:18', '2015-03-25 20:44:18'),
(328, 0.00, 0, '2015-03-25 20:44:20', '2015-03-25 20:44:20'),
(329, 0.00, 0, '2015-03-25 20:44:29', '2015-03-25 20:44:29'),
(330, 0.00, 0, '2015-03-25 20:44:41', '2015-03-25 20:44:41'),
(331, 0.00, 0, '2015-03-25 20:45:03', '2015-03-25 20:45:03'),
(332, 0.00, 0, '2015-03-25 20:45:05', '2015-03-25 20:45:05'),
(333, 0.00, 0, '2015-03-25 20:45:46', '2015-03-25 20:45:46'),
(334, 0.00, 0, '2015-03-25 20:45:47', '2015-03-25 20:45:47'),
(335, 0.00, 0, '2015-03-26 17:57:51', '2015-03-26 17:57:51'),
(336, 0.00, 0, '2015-03-26 17:57:53', '2015-03-26 17:57:53'),
(337, 0.00, 0, '2015-03-26 18:02:15', '2015-03-26 18:02:15'),
(338, 0.00, 0, '2015-03-26 18:02:27', '2015-03-26 18:02:27'),
(339, 0.00, 0, '2015-03-26 18:02:48', '2015-03-26 18:02:48'),
(340, 0.00, 0, '2015-03-26 18:03:45', '2015-03-26 18:03:45'),
(341, 0.00, 0, '2015-03-26 18:03:48', '2015-03-26 18:03:48'),
(342, 0.00, 0, '2015-03-26 18:06:03', '2015-03-26 18:06:03'),
(343, 0.00, 0, '2015-03-26 18:06:45', '2015-03-26 18:06:45'),
(344, 0.00, 0, '2015-03-26 18:07:51', '2015-03-26 18:07:51'),
(345, 0.00, 0, '2015-03-26 18:08:10', '2015-03-26 18:08:10'),
(346, 0.00, 0, '2015-03-26 18:08:22', '2015-03-26 18:08:22'),
(347, 0.00, 0, '2015-03-26 18:17:05', '2015-03-26 18:17:05'),
(348, 0.00, 0, '2015-03-26 18:22:05', '2015-03-26 18:22:05'),
(349, 0.00, 0, '2015-03-26 18:24:54', '2015-03-26 18:24:54'),
(350, 0.00, 0, '2015-03-26 18:24:59', '2015-03-26 18:24:59'),
(351, 0.00, 0, '2015-03-26 18:25:02', '2015-03-26 18:25:02'),
(352, 0.00, 0, '2015-03-26 18:26:12', '2015-03-26 18:26:12'),
(353, 0.00, 0, '2015-03-26 18:26:13', '2015-03-26 18:26:13'),
(354, 0.00, 0, '2015-03-26 18:26:18', '2015-03-26 18:26:18'),
(355, 0.00, 0, '2015-03-26 18:27:02', '2015-03-26 18:27:02'),
(356, 0.00, 0, '2015-03-26 18:27:08', '2015-03-26 18:27:08'),
(357, 0.00, 0, '2015-03-26 18:27:15', '2015-03-26 18:27:15'),
(358, 0.00, 0, '2015-03-26 18:29:59', '2015-03-26 18:29:59'),
(359, 0.00, 0, '2015-03-26 18:30:28', '2015-03-26 18:30:28'),
(360, 0.00, 0, '2015-03-26 18:30:49', '2015-03-26 18:30:49'),
(361, 0.00, 0, '2015-03-26 18:30:58', '2015-03-26 18:30:58'),
(362, 0.00, 0, '2015-03-26 18:31:08', '2015-03-26 18:31:08'),
(363, 0.00, 0, '2015-03-26 18:31:15', '2015-03-26 18:31:15'),
(364, 0.00, 0, '2015-03-26 18:31:38', '2015-03-26 18:31:38'),
(365, 0.00, 0, '2015-03-26 18:31:49', '2015-03-26 18:31:49'),
(366, 0.00, 0, '2015-03-26 18:32:11', '2015-03-26 18:32:11'),
(367, 0.00, 0, '2015-03-26 18:32:17', '2015-03-26 18:32:17'),
(368, 0.00, 0, '2015-03-26 18:32:26', '2015-03-26 18:32:26'),
(369, 0.00, 0, '2015-03-26 18:34:24', '2015-03-26 18:34:24'),
(370, 0.00, 0, '2015-03-26 18:34:27', '2015-03-26 18:34:27'),
(371, 0.00, 0, '2015-03-26 18:37:00', '2015-03-26 18:37:00'),
(372, 0.00, 0, '2015-03-26 18:37:01', '2015-03-26 18:37:01'),
(373, 0.00, 0, '2015-03-26 18:37:03', '2015-03-26 18:37:03'),
(374, 0.00, 0, '2015-03-26 18:37:22', '2015-03-26 18:37:22'),
(375, 0.00, 0, '2015-03-26 18:37:24', '2015-03-26 18:37:24'),
(376, 0.00, 0, '2015-03-26 18:37:59', '2015-03-26 18:37:59'),
(377, 0.00, 0, '2015-03-26 18:38:32', '2015-03-26 18:38:32'),
(378, 0.00, 0, '2015-03-26 18:38:36', '2015-03-26 18:38:36'),
(379, 0.00, 0, '2015-03-26 18:38:56', '2015-03-26 18:38:56'),
(380, 0.00, 0, '2015-03-26 18:39:00', '2015-03-26 18:39:00'),
(381, 0.00, 0, '2015-03-26 18:53:18', '2015-03-26 18:53:18'),
(382, 0.00, 0, '2015-03-26 18:53:25', '2015-03-26 18:53:25'),
(383, 0.00, 0, '2015-03-26 18:53:37', '2015-03-26 18:53:37'),
(384, 0.00, 0, '2015-03-26 18:53:49', '2015-03-26 18:53:49'),
(385, 0.00, 0, '2015-03-26 18:53:56', '2015-03-26 18:53:56'),
(386, 0.00, 0, '2015-03-26 18:54:18', '2015-03-26 18:54:18'),
(387, 0.00, 0, '2015-03-26 18:54:21', '2015-03-26 18:54:21'),
(388, 0.00, 0, '2015-03-26 18:54:50', '2015-03-26 18:54:50'),
(389, 0.00, 0, '2015-03-26 18:54:52', '2015-03-26 18:54:52'),
(390, 0.00, 0, '2015-03-26 18:55:28', '2015-03-26 18:55:28'),
(391, 0.00, 0, '2015-03-26 18:55:31', '2015-03-26 18:55:31'),
(392, 0.00, 0, '2015-03-26 18:56:27', '2015-03-26 18:56:27'),
(393, 0.00, 0, '2015-03-26 18:56:37', '2015-03-26 18:56:37'),
(394, 0.00, 0, '2015-03-26 18:57:37', '2015-03-26 18:57:37'),
(395, 0.00, 0, '2015-03-26 18:57:41', '2015-03-26 18:57:41'),
(396, 0.00, 0, '2015-03-26 18:59:05', '2015-03-26 18:59:05'),
(397, 0.00, 0, '2015-03-26 18:59:08', '2015-03-26 18:59:08'),
(398, 0.00, 0, '2015-03-26 18:59:42', '2015-03-26 18:59:42'),
(399, 0.00, 0, '2015-03-26 18:59:57', '2015-03-26 18:59:57'),
(400, 0.00, 0, '2015-03-26 19:00:48', '2015-03-26 19:00:48'),
(401, 0.00, 0, '2015-03-26 19:00:56', '2015-03-26 19:00:56'),
(402, 0.00, 0, '2015-03-26 19:01:05', '2015-03-26 19:01:05'),
(403, 0.00, 0, '2015-03-26 19:01:16', '2015-03-26 19:01:16'),
(404, 0.00, 0, '2015-03-26 19:01:24', '2015-03-26 19:01:24'),
(405, 0.00, 0, '2015-03-26 19:01:30', '2015-03-26 19:01:30'),
(406, 0.00, 0, '2015-03-26 19:01:36', '2015-03-26 19:01:36'),
(407, 0.00, 0, '2015-03-26 19:04:48', '2015-03-26 19:04:48'),
(408, 0.00, 0, '2015-03-26 19:07:02', '2015-03-26 19:07:02'),
(409, 0.00, 0, '2015-03-26 19:07:25', '2015-03-26 19:07:25'),
(410, 0.00, 0, '2015-03-26 19:07:40', '2015-03-26 19:07:40'),
(411, 0.00, 0, '2015-03-26 19:07:45', '2015-03-26 19:07:45'),
(412, 0.00, 0, '2015-03-26 19:07:49', '2015-03-26 19:07:49'),
(413, 0.00, 0, '2015-03-26 19:08:09', '2015-03-26 19:08:09'),
(414, 0.00, 0, '2015-03-26 19:18:11', '2015-03-26 19:18:11'),
(415, 0.00, 0, '2015-03-26 19:18:15', '2015-03-26 19:18:15'),
(416, 0.00, 0, '2015-03-26 19:18:17', '2015-03-26 19:18:17'),
(417, 0.00, 0, '2015-03-26 19:18:34', '2015-03-26 19:18:34'),
(418, 0.00, 0, '2015-03-26 19:19:07', '2015-03-26 19:19:07'),
(419, 0.00, 0, '2015-03-26 19:25:09', '2015-03-26 19:25:09'),
(420, 0.00, 0, '2015-03-26 19:48:00', '2015-03-26 19:48:00'),
(421, 0.00, 0, '2015-03-26 19:48:04', '2015-03-26 19:48:04'),
(422, 0.00, 0, '2015-03-26 19:48:31', '2015-03-26 19:48:31'),
(423, 0.00, 0, '2015-03-26 19:48:39', '2015-03-26 19:48:39'),
(424, 0.00, 0, '2015-03-26 19:49:22', '2015-03-26 19:49:22'),
(425, 0.00, 0, '2015-03-26 19:49:24', '2015-03-26 19:49:24'),
(426, 0.00, 0, '2015-03-26 19:56:46', '2015-03-26 19:56:46'),
(427, 0.00, 0, '2015-03-26 19:57:27', '2015-03-26 19:57:27'),
(428, 0.00, 0, '2015-03-26 19:58:10', '2015-03-26 19:58:10'),
(429, 0.00, 0, '2015-03-26 19:58:38', '2015-03-26 19:58:38'),
(430, 0.00, 0, '2015-03-26 19:58:43', '2015-03-26 19:58:43'),
(431, 0.00, 0, '2015-03-26 19:58:51', '2015-03-26 19:58:51'),
(432, 0.00, 0, '2015-03-26 19:59:01', '2015-03-26 19:59:01'),
(433, 0.00, 0, '2015-03-26 19:59:03', '2015-03-26 19:59:03'),
(434, 0.00, 0, '2015-03-26 20:00:26', '2015-03-26 20:00:26'),
(435, 0.00, 0, '2015-03-26 20:00:31', '2015-03-26 20:00:31'),
(436, 0.00, 0, '2015-03-26 20:00:33', '2015-03-26 20:00:33'),
(437, 0.00, 0, '2015-03-26 20:00:51', '2015-03-26 20:00:51'),
(438, 0.00, 0, '2015-03-26 20:00:56', '2015-03-26 20:00:56'),
(439, 0.00, 0, '2015-03-26 20:00:57', '2015-03-26 20:00:57'),
(440, 0.00, 0, '2015-03-26 20:03:33', '2015-03-26 20:03:33'),
(441, 0.00, 0, '2015-03-26 20:03:40', '2015-03-26 20:03:40'),
(442, 0.00, 0, '2015-03-26 20:04:22', '2015-03-26 20:04:22'),
(443, 0.00, 0, '2015-03-26 20:04:51', '2015-03-26 20:04:51'),
(444, 0.00, 0, '2015-03-26 20:04:53', '2015-03-26 20:04:53'),
(445, 0.00, 0, '2015-03-26 20:05:13', '2015-03-26 20:05:13'),
(446, 0.00, 0, '2015-03-26 20:05:40', '2015-03-26 20:05:40'),
(447, 0.00, 0, '2015-03-26 20:05:45', '2015-03-26 20:05:45'),
(448, 0.00, 0, '2015-03-26 20:06:17', '2015-03-26 20:06:17'),
(449, 0.00, 0, '2015-03-26 20:06:53', '2015-03-26 20:06:53'),
(450, 0.00, 0, '2015-03-26 20:14:52', '2015-03-26 20:14:52'),
(451, 0.00, 0, '2015-03-26 20:15:11', '2015-03-26 20:15:11'),
(452, 0.00, 0, '2015-03-26 20:15:19', '2015-03-26 20:15:19'),
(453, 0.00, 0, '2015-03-26 20:15:22', '2015-03-26 20:15:22'),
(454, 0.00, 0, '2015-03-26 20:15:34', '2015-03-26 20:15:34'),
(455, 0.00, 0, '2015-03-26 20:15:41', '2015-03-26 20:15:41'),
(456, 0.00, 0, '2015-03-26 20:15:43', '2015-03-26 20:15:43'),
(457, 0.00, 0, '2015-03-26 20:23:06', '2015-03-26 20:23:06'),
(458, 0.00, 0, '2015-03-26 20:23:09', '2015-03-26 20:23:09'),
(459, 0.00, 0, '2015-03-26 20:23:14', '2015-03-26 20:23:14'),
(460, 0.00, 0, '2015-03-26 20:23:16', '2015-03-26 20:23:16'),
(461, 0.00, 0, '2015-03-26 20:23:22', '2015-03-26 20:23:22'),
(462, 0.00, 0, '2015-03-26 20:23:50', '2015-03-26 20:23:50'),
(463, 0.00, 0, '2015-03-26 20:23:58', '2015-03-26 20:23:58'),
(464, 0.00, 0, '2015-03-26 20:24:02', '2015-03-26 20:24:02'),
(465, 0.00, 0, '2015-03-26 20:26:37', '2015-03-26 20:26:37'),
(466, 0.00, 0, '2015-03-26 20:26:51', '2015-03-26 20:26:51'),
(467, 0.00, 0, '2015-03-26 20:26:59', '2015-03-26 20:26:59'),
(468, 0.00, 0, '2015-03-26 20:27:52', '2015-03-26 20:27:52'),
(469, 0.00, 0, '2015-03-26 20:27:55', '2015-03-26 20:27:55'),
(470, 0.00, 0, '2015-03-26 20:28:36', '2015-03-26 20:28:36'),
(471, 0.00, 0, '2015-03-26 20:28:39', '2015-03-26 20:28:39'),
(472, 0.00, 0, '2015-03-26 20:30:04', '2015-03-26 20:30:04'),
(473, 0.00, 0, '2015-03-26 20:30:11', '2015-03-26 20:30:11'),
(474, 0.00, 0, '2015-03-26 20:30:19', '2015-03-26 20:30:19'),
(475, 0.00, 0, '2015-03-26 20:31:35', '2015-03-26 20:31:35'),
(476, 0.00, 0, '2015-03-26 20:31:42', '2015-03-26 20:31:42'),
(477, 0.00, 0, '2015-03-26 20:31:59', '2015-03-26 20:31:59'),
(478, 0.00, 0, '2015-03-26 20:32:05', '2015-03-26 20:32:05'),
(479, 0.00, 0, '2015-03-26 20:32:11', '2015-03-26 20:32:11'),
(480, 0.00, 0, '2015-03-26 20:33:16', '2015-03-26 20:33:16'),
(481, 0.00, 0, '2015-03-26 20:38:45', '2015-03-26 20:38:45'),
(482, 0.00, 0, '2015-03-26 20:38:54', '2015-03-26 20:38:54'),
(483, 0.00, 0, '2015-03-26 20:39:34', '2015-03-26 20:39:34'),
(484, 0.00, 0, '2015-03-26 20:39:46', '2015-03-26 20:39:46'),
(485, 0.00, 0, '2015-03-26 20:40:01', '2015-03-26 20:40:01'),
(486, 0.00, 0, '2015-03-26 20:40:17', '2015-03-26 20:40:17'),
(487, 0.00, 0, '2015-03-26 20:40:34', '2015-03-26 20:40:34'),
(488, 0.00, 0, '2015-03-26 20:40:40', '2015-03-26 20:40:40'),
(489, 0.00, 0, '2015-03-26 20:40:56', '2015-03-26 20:40:56'),
(490, 0.00, 0, '2015-03-26 20:41:52', '2015-03-26 20:41:52'),
(491, 0.00, 0, '2015-03-26 20:42:01', '2015-03-26 20:42:01'),
(492, 0.00, 0, '2015-03-26 20:42:49', '2015-03-26 20:42:49'),
(493, 0.00, 0, '2015-03-26 20:46:34', '2015-03-26 20:46:34'),
(494, 0.00, 0, '2015-03-26 20:49:57', '2015-03-26 20:49:57'),
(495, 0.00, 0, '2015-03-26 20:53:11', '2015-03-26 20:53:11'),
(496, 0.00, 0, '2015-03-26 20:53:52', '2015-03-26 20:53:52'),
(497, 0.00, 0, '2015-03-26 20:54:39', '2015-03-26 20:54:39'),
(498, 0.00, 0, '2015-03-26 20:54:59', '2015-03-26 20:54:59'),
(499, 0.00, 0, '2015-03-26 20:55:09', '2015-03-26 20:55:09'),
(500, 0.00, 0, '2015-03-26 20:56:52', '2015-03-26 20:56:52'),
(501, 0.00, 0, '2015-03-26 20:59:09', '2015-03-26 20:59:09'),
(502, 0.00, 0, '2015-03-26 21:03:32', '2015-03-26 21:03:32'),
(503, 0.00, 0, '2015-03-26 21:03:57', '2015-03-26 21:03:57'),
(504, 0.00, 0, '2015-03-26 21:04:28', '2015-03-26 21:04:28'),
(505, 0.00, 0, '2015-03-26 21:10:55', '2015-03-26 21:10:55'),
(506, 0.00, 0, '2015-03-26 21:10:57', '2015-03-26 21:10:57'),
(507, 0.00, 0, '2015-03-26 21:11:35', '2015-03-26 21:11:35'),
(508, 0.00, 0, '2015-03-26 21:12:11', '2015-03-26 21:12:11'),
(509, 0.00, 0, '2015-03-26 21:13:18', '2015-03-26 21:13:18'),
(510, 0.00, 0, '2015-03-26 21:13:30', '2015-03-26 21:13:30'),
(511, 0.00, 0, '2015-03-26 21:13:56', '2015-03-26 21:13:56'),
(512, 0.00, 0, '2015-03-26 21:18:25', '2015-03-26 21:18:25'),
(513, 0.00, 0, '2015-03-26 21:18:57', '2015-03-26 21:18:57'),
(514, 0.00, 0, '2015-03-26 21:19:15', '2015-03-26 21:19:15'),
(515, 0.00, 0, '2015-03-26 21:19:17', '2015-03-26 21:19:17'),
(516, 0.00, 0, '2015-03-26 21:20:10', '2015-03-26 21:20:10'),
(517, 0.00, 0, '2015-03-26 21:20:38', '2015-03-26 21:20:38'),
(518, 0.00, 0, '2015-03-26 21:21:24', '2015-03-26 21:21:24'),
(519, 0.00, 0, '2015-03-26 21:21:52', '2015-03-26 21:21:52'),
(520, 0.00, 0, '2015-03-26 21:22:50', '2015-03-26 21:22:50'),
(521, 0.00, 0, '2015-03-26 21:24:50', '2015-03-26 21:24:50'),
(522, 0.00, 0, '2015-03-26 21:27:56', '2015-03-26 21:27:56'),
(523, 0.00, 0, '2015-03-26 21:29:22', '2015-03-26 21:29:22'),
(524, 0.00, 0, '2015-03-26 21:29:33', '2015-03-26 21:29:33'),
(525, 0.00, 0, '2015-03-26 21:29:50', '2015-03-26 21:29:50'),
(526, 0.00, 0, '2015-03-26 21:29:56', '2015-03-26 21:29:56'),
(527, 0.00, 0, '2015-03-26 21:30:41', '2015-03-26 21:30:41'),
(528, 0.00, 0, '2015-03-26 21:30:47', '2015-03-26 21:30:47'),
(529, 0.00, 0, '2015-03-26 21:31:00', '2015-03-26 21:31:00'),
(530, 0.00, 0, '2015-03-26 21:34:08', '2015-03-26 21:34:08'),
(531, 0.00, 0, '2015-03-26 21:34:14', '2015-03-26 21:34:14'),
(532, 0.00, 0, '2015-03-26 21:34:19', '2015-03-26 21:34:19'),
(533, 0.00, 0, '2015-03-26 21:34:41', '2015-03-26 21:34:41'),
(534, 0.00, 0, '2015-03-26 21:34:45', '2015-03-26 21:34:45'),
(535, 0.00, 0, '2015-03-26 21:34:55', '2015-03-26 21:34:55'),
(536, 0.00, 0, '2015-03-26 21:35:02', '2015-03-26 21:35:02'),
(537, 0.00, 0, '2015-03-26 21:35:24', '2015-03-26 21:35:24'),
(538, 0.00, 0, '2015-03-26 21:35:32', '2015-03-26 21:35:32'),
(539, 0.00, 0, '2015-03-26 21:36:21', '2015-03-26 21:36:21'),
(540, 0.00, 0, '2015-03-26 21:36:26', '2015-03-26 21:36:26'),
(541, 0.00, 0, '2015-03-26 21:36:36', '2015-03-26 21:36:36'),
(542, 0.00, 0, '2015-03-26 21:36:40', '2015-03-26 21:36:40'),
(543, 0.00, 0, '2015-03-26 21:37:00', '2015-03-26 21:37:00'),
(544, 0.00, 0, '2015-03-26 21:37:03', '2015-03-26 21:37:03'),
(545, 0.00, 0, '2015-03-26 21:38:23', '2015-03-26 21:38:23'),
(546, 0.00, 0, '2015-03-26 21:38:27', '2015-03-26 21:38:27'),
(547, 0.00, 0, '2015-03-26 21:40:55', '2015-03-26 21:40:55'),
(548, 0.00, 0, '2015-03-26 21:41:02', '2015-03-26 21:41:02'),
(549, 0.00, 0, '2015-03-26 21:41:38', '2015-03-26 21:41:38'),
(550, 0.00, 0, '2015-03-26 21:41:43', '2015-03-26 21:41:43'),
(551, 0.00, 0, '2015-03-26 21:41:48', '2015-03-26 21:41:48'),
(552, 0.00, 0, '2015-03-26 21:42:07', '2015-03-26 21:42:07'),
(553, 0.00, 0, '2015-03-26 21:42:44', '2015-03-26 21:42:44'),
(554, 0.00, 0, '2015-03-26 21:43:21', '2015-03-26 21:43:21'),
(555, 0.00, 0, '2015-03-26 21:44:43', '2015-03-26 21:44:43'),
(556, 0.00, 0, '2015-03-26 21:44:56', '2015-03-26 21:44:56'),
(557, 0.00, 0, '2015-03-26 21:44:58', '2015-03-26 21:44:58'),
(558, 0.00, 0, '2015-03-26 21:45:00', '2015-03-26 21:45:00'),
(559, 0.00, 0, '2015-03-26 21:45:02', '2015-03-26 21:45:02'),
(560, 0.00, 0, '2015-03-26 21:45:18', '2015-03-26 21:45:18'),
(561, 0.00, 0, '2015-03-26 21:46:10', '2015-03-26 21:46:10'),
(562, 0.00, 0, '2015-03-26 21:46:14', '2015-03-26 21:46:14'),
(563, 0.00, 0, '2015-03-26 21:46:17', '2015-03-26 21:46:17'),
(564, 0.00, 0, '2015-03-26 21:46:24', '2015-03-26 21:46:24'),
(565, 0.00, 0, '2015-03-26 21:46:27', '2015-03-26 21:46:27'),
(566, 0.00, 0, '2015-03-26 21:47:06', '2015-03-26 21:47:06'),
(567, 0.00, 0, '2015-03-26 21:47:23', '2015-03-26 21:47:23'),
(568, 0.00, 0, '2015-03-26 21:47:42', '2015-03-26 21:47:42'),
(569, 0.00, 0, '2015-03-26 21:47:59', '2015-03-26 21:47:59'),
(570, 0.00, 0, '2015-03-26 21:48:02', '2015-03-26 21:48:02'),
(571, 0.00, 0, '2015-03-26 21:48:03', '2015-03-26 21:48:03'),
(572, 0.00, 0, '2015-03-26 22:42:13', '2015-03-26 22:42:13'),
(573, 0.00, 0, '2015-03-26 22:43:52', '2015-03-26 22:43:52'),
(574, 0.00, 0, '2015-03-26 22:43:56', '2015-03-26 22:43:56'),
(575, 0.00, 0, '2015-03-26 22:43:58', '2015-03-26 22:43:58'),
(576, 0.00, 0, '2015-03-26 22:44:02', '2015-03-26 22:44:02'),
(577, 0.00, 0, '2015-03-26 22:44:13', '2015-03-26 22:44:13'),
(578, 0.00, 0, '2015-03-30 20:31:42', '2015-03-30 20:31:42'),
(579, 0.00, 0, '2015-04-02 20:39:52', '2015-04-02 20:39:52'),
(580, 0.00, 0, '2015-04-02 20:39:59', '2015-04-02 20:39:59'),
(581, 0.00, 0, '2015-04-02 20:40:00', '2015-04-02 20:40:00'),
(582, 0.00, 0, '2015-04-02 20:40:11', '2015-04-02 20:40:11'),
(583, 0.00, 0, '2015-04-02 20:40:26', '2015-04-02 20:40:26'),
(584, 0.00, 0, '2015-04-02 20:40:27', '2015-04-02 20:40:27'),
(585, 0.00, 0, '2015-04-02 20:40:27', '2015-04-02 20:40:27'),
(586, 0.00, 0, '2015-04-02 20:40:31', '2015-04-02 20:40:31'),
(587, 0.00, 0, '2015-04-07 18:31:02', '2015-04-07 18:31:02'),
(588, 0.00, 0, '2015-04-07 18:31:07', '2015-04-07 18:31:07'),
(589, 0.00, 0, '2015-04-07 18:33:46', '2015-04-07 18:33:46'),
(590, 0.00, 0, '2015-04-07 18:51:25', '2015-04-07 18:51:25'),
(591, 0.00, 0, '2015-04-07 19:09:21', '2015-04-07 19:09:21'),
(592, 0.00, 0, '2015-04-07 19:31:03', '2015-04-07 19:31:03'),
(593, 0.00, 0, '2015-04-07 19:32:59', '2015-04-07 19:32:59'),
(594, 0.00, 0, '2015-04-07 19:37:53', '2015-04-07 19:37:53'),
(595, 0.00, 0, '2015-04-07 19:40:30', '2015-04-07 19:40:30'),
(596, 0.00, 0, '2015-04-07 19:41:19', '2015-04-07 19:41:19'),
(597, 0.00, 0, '2015-04-07 19:41:21', '2015-04-07 19:41:21'),
(598, 0.00, 0, '2015-04-07 19:42:32', '2015-04-07 19:42:32'),
(599, 0.00, 0, '2015-04-07 19:42:49', '2015-04-07 19:42:49'),
(600, 0.00, 0, '2015-04-07 19:43:08', '2015-04-07 19:43:08'),
(601, 0.00, 0, '2015-04-07 19:44:14', '2015-04-07 19:44:14'),
(602, 0.00, 0, '2015-04-07 19:44:26', '2015-04-07 19:44:26'),
(603, 0.00, 0, '2015-04-07 19:48:56', '2015-04-07 19:48:56'),
(604, 0.00, 0, '2015-04-07 19:53:19', '2015-04-07 19:53:19'),
(605, 0.00, 0, '2015-04-07 19:53:34', '2015-04-07 19:53:34'),
(606, 0.00, 0, '2015-04-07 19:53:35', '2015-04-07 19:53:35'),
(607, 0.00, 0, '2015-04-07 19:55:54', '2015-04-07 19:55:54'),
(608, 0.00, 0, '2015-04-07 19:56:23', '2015-04-07 19:56:23'),
(609, 0.00, 0, '2015-04-07 19:56:34', '2015-04-07 19:56:34'),
(610, 0.00, 0, '2015-04-07 19:58:04', '2015-04-07 19:58:04'),
(611, 0.00, 0, '2015-04-07 19:58:14', '2015-04-07 19:58:14'),
(612, 0.00, 0, '2015-04-07 19:58:37', '2015-04-07 19:58:37'),
(613, 0.00, 0, '2015-04-07 19:59:01', '2015-04-07 19:59:01'),
(614, 0.00, 0, '2015-04-07 19:59:42', '2015-04-07 19:59:42'),
(615, 0.00, 0, '2015-04-07 20:00:26', '2015-04-07 20:00:26'),
(616, 0.00, 0, '2015-04-07 20:03:14', '2015-04-07 20:03:14'),
(617, 0.00, 0, '2015-04-07 20:05:40', '2015-04-07 20:05:40'),
(618, 0.00, 0, '2015-04-07 20:08:28', '2015-04-07 20:08:28'),
(619, 0.00, 0, '2015-04-07 20:09:04', '2015-04-07 20:09:04'),
(620, 0.00, 0, '2015-04-07 20:10:43', '2015-04-07 20:10:43'),
(621, 0.00, 0, '2015-04-07 20:17:34', '2015-04-07 20:17:34'),
(622, 0.00, 0, '2015-04-07 20:18:11', '2015-04-07 20:18:11'),
(623, 0.00, 0, '2015-04-07 20:18:22', '2015-04-07 20:18:22'),
(624, 0.00, 0, '2015-04-07 20:19:01', '2015-04-07 20:19:01'),
(625, 0.00, 0, '2015-04-07 20:20:13', '2015-04-07 20:20:13'),
(626, 0.00, 0, '2015-04-07 20:20:46', '2015-04-07 20:20:46'),
(627, 0.00, 0, '2015-04-07 20:20:48', '2015-04-07 20:20:48'),
(628, 0.00, 0, '2015-04-07 20:20:59', '2015-04-07 20:20:59'),
(629, 0.00, 0, '2015-04-07 20:21:29', '2015-04-07 20:21:29'),
(630, 0.00, 0, '2015-04-07 20:21:38', '2015-04-07 20:21:38'),
(631, 0.00, 1, '2015-04-07 20:23:17', '2015-04-07 20:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `subgroups`
--

CREATE TABLE `subgroups` (
  `subgroup_id` int(10) unsigned NOT NULL,
  `subgroup_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `task` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `task`, `created_at`, `updated_at`) VALUES
(1, 'Fase 4a', '2015-03-18 22:57:15', '2015-03-18 22:57:15'),
(2, 'Fase 5a', '2015-03-18 22:57:15', '2015-03-18 22:57:15'),
(3, 'Fase 5B', '2015-03-18 22:57:15', '2015-03-18 22:57:15'),
(4, 'Fase 6A', '2015-03-18 22:57:15', '2015-03-18 22:57:15'),
(5, 'Fase 7C', '2015-03-18 22:57:15', '2015-03-18 22:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `userlogs`
--

CREATE TABLE `userlogs` (
  `userlog_id` int(10) unsigned NOT NULL,
  `starttime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stoptime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `totaltime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userlogs`
--

INSERT INTO `userlogs` (`userlog_id`, `starttime`, `stoptime`, `totaltime`, `description`, `date`, `user_id`, `project_id`, `project`, `category`, `task`, `created_at`, `updated_at`) VALUES
(61, '09:00', '09:30', '00:30:00', 'opstarten', '2015-03-24', 1, 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-24 22:48:22', '2015-04-16 21:21:39'),
(62, '09:30', '10:15', '00:45:00', 'Onderhoud web', '2015-03-24', 1, 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-24 22:48:42', '2015-04-16 21:21:39'),
(63, '10:15', '11:35', '1:20:00', 'CMS bespreking', '2015-03-24', 1, 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-24 22:50:29', '2015-04-16 21:21:39'),
(64, '11:35', '12:34', '00:59:00', 'Onderhoud web', '2015-03-24', 1, 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-24 22:50:49', '2015-04-16 21:21:39'),
(65, '12:34', '13:15', '00:41:00', 'pauze', '2015-03-24', 1, 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-24 22:51:10', '2015-04-16 21:21:39'),
(66, '13:15', '16:23', '3:08:00', 'Overleg over CMS', '2015-03-24', 1, 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-24 22:51:28', '2015-04-16 21:21:39'),
(67, '16:23', '17:00', '00:37:00', 'Uren invullen', '2015-03-24', 2, 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-24 22:51:41', '2015-04-16 21:21:39'),
(69, '23:00', '06:30', '7:30:00', '7,5 uur', '2015-03-25', 1, 1, 'Logtime', 'Fase 4', 'Fase 5a', '2015-03-24 23:40:08', '2015-04-16 21:21:39'),
(70, '12:34', '13:26', '00:52:00', 'lunch halen/ pauze', '2015-03-25', 1, 1, 'Logtime', 'Fase 5', 'Fase 5a', '2015-03-25 17:50:09', '2015-04-16 21:21:39'),
(71, '18:45', '20:20', '1:35:', 'bxcvbfghf', '2015-04-08', 2, 1, '', 'Fase 6', 'Fase 6A', '2015-04-08 16:52:22', '2015-04-20 18:52:32'),
(72, '18:15', '18:45', '00:30:', 'adsfgf', '2015-04-08', 2, 1, '', 'Fase 6', 'Fase 6A', '2015-04-08 16:53:06', '2015-05-06 17:40:32'),
(73, '12:00', '13:00', '1:00:', 'asdfahfsdsad', '2015-04-08', 2, 1, '', 'Fase 4', 'Fase 4a', '2015-04-08 18:15:24', '2015-04-22 20:40:02'),
(86, '10:00', '23:00', '13:00:', 'logtime', '2015-04-22', 1, NULL, '', 'Fase 4', 'Fase 4a', '2015-04-22 20:46:21', '2015-04-22 20:47:10'),
(89, '12:45', '12:45', '00:00:00', 'dfghjk', '2015-04-22', 1, NULL, 'Logtime', 'Fase 4', 'Fase 4a', '2015-04-22 20:51:41', '2015-04-22 20:51:41'),
(90, '12:45', '12:45', '00:00:00', 'dfghjk', '2015-04-22', 1, NULL, 'Logtime', 'Fase 4', 'Fase 4a', '2015-04-22 20:52:08', '2015-04-22 20:52:08'),
(92, '14:25', '12:48', '22:23:00', 'jaja', '2015-04-21', 1, NULL, 'Logtime', 'Fase 6', 'Fase 6A', '2015-04-22 21:22:40', '2015-04-22 21:22:40'),
(94, '00:19', '15:48', '15:29:', 'test mobiel', '2015-05-04', 1, NULL, 'Pizzatoday', 'Fase 5', 'Fase 5B', '2015-04-23 16:36:46', '2015-05-04 21:17:08'),
(105, '12:45', '04:27', '15:42:', 'fghdfghdfgh', '2015-04-23', 1, NULL, '', 'Fase 4', 'Fase 4a', '2015-04-23 18:37:00', '2015-04-23 19:03:42'),
(111, '23:45', '12:34', '12:49:00', 'testjes', '2015-04-23', 1, NULL, 'Logtime', 'Fase 4', 'Fase 4a', '2015-04-23 18:53:08', '2015-04-23 18:53:08'),
(112, '17:00', '23:30', '6:30:00', 'Excel export gemaakt', '2015-05-04', 1, NULL, 'Logtime', 'Fase 6', 'Fase 6A', '2015-05-04 21:32:10', '2015-05-04 21:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `usernotifications`
--

CREATE TABLE `usernotifications` (
  `usernotification_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `usercode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_image_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'placeholder.png',
  `phone_number` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `lasttime_online` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usertype_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `projectgroup_id` int(10) unsigned DEFAULT NULL,
  `leader` int(10) unsigned NOT NULL DEFAULT '0',
  `adress_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `usercode`, `password`, `firstname`, `lastname`, `email`, `user_image_path`, `phone_number`, `lasttime_online`, `remember_token`, `usertype_id`, `location_id`, `projectgroup_id`, `leader`, `adress_id`, `created_at`, `updated_at`, `active`) VALUES
(1, '262503', '26c669cd0814ac40e5328752b21c4aa6450d16295e4eec30356a06a911c23983aaebe12d5da38eeebfc1b213be650498df8419194d5a26c7e0a50af156853c79', 'Dennis', 'Eilander', 'eilander.dennis@gmail.com', '2d4df_photo-1414490929659-9a12b7e31907.jpg', '0639586172', '2015-05-06 19:17:51', NULL, 1, 1, 1, 0, 1, '2015-03-19 18:40:00', '2015-05-06 19:17:51', 1),
(2, '1337', '26c669cd0814ac40e5328752b21c4aa6450d16295e4eec30356a06a911c23983aaebe12d5da38eeebfc1b213be650498df8419194d5a26c7e0a50af156853c79', 'Yannick', 'Berendsen', 'mryannickz@live.nl', 'placeholder.png', '', '2015-04-10 11:43:11', NULL, 1, 1, 1, 0, 1, '2015-03-23 18:16:16', '2015-04-10 11:43:11', 1),
(3, '1234', '26c669cd0814ac40e5328752b21c4aa6450d16295e4eec30356a06a911c23983aaebe12d5da38eeebfc1b213be650498df8419194d5a26c7e0a50af156853c79', 'Test', 'Account', 'test@live.nl', 'placeholder.png', '', '2015-04-10 11:59:46', NULL, 1, 1, 1, 0, 1, '2015-03-23 18:16:16', '2015-04-10 11:59:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE `usertypes` (
  `usertype_id` int(10) unsigned NOT NULL,
  `usertype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`usertype_id`, `usertype`, `created_at`, `updated_at`) VALUES
(1, 'student', '2015-03-19 19:41:19', '2015-03-19 19:41:19'),
(2, 'docent', '2015-03-19 19:41:19', '2015-03-19 19:41:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_projects`
--

CREATE TABLE `user_projects` (
  `user_project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_done` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_projects`
--

INSERT INTO `user_projects` (`user_project_id`, `user_id`, `project_id`, `is_done`, `active`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, 1, '2015-04-22 20:45:32', '2015-04-22 20:45:32'),
(4, 2, 2, 0, 1, '2015-04-16 20:16:50', '2015-04-16 20:16:50'),
(6, 1, 2, 0, 1, '2015-04-16 20:16:50', '2015-04-16 20:16:50'),
(7, 3, 1, 0, 1, '2015-05-06 19:17:27', '2015-05-06 19:17:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_subgroups`
--

CREATE TABLE `user_subgroups` (
  `user_subgroup_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `subgroup_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_tasks`
--

CREATE TABLE `user_tasks` (
  `user_task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `projectcategory_id` int(11) NOT NULL,
  `is_done` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_tasks`
--

INSERT INTO `user_tasks` (`user_task_id`, `user_id`, `project_id`, `projectcategory_id`, `is_done`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 5, 1, '2015-04-22 21:24:08', '2015-04-22 21:24:08'),
(3, 1, 1, 5, 1, '2015-04-16 21:34:16', '2015-04-16 21:34:16'),
(4, 2, 1, 5, 0, '2015-04-16 20:24:22', '2015-04-16 20:24:22'),
(5, 2, 1, 5, 1, '2015-04-16 20:24:24', '2015-04-16 20:24:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`adress_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `categorie_tasks`
--
ALTER TABLE `categorie_tasks`
  ADD PRIMARY KEY (`category_task_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `estimated_time`
--
ALTER TABLE `estimated_time`
  ADD PRIMARY KEY (`estimated_time_id`);

--
-- Indexes for table `forgotten_passwordtokens`
--
ALTER TABLE `forgotten_passwordtokens`
  ADD PRIMARY KEY (`forgotten_passwordtoken_id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`grade_id`),
  ADD UNIQUE KEY `grade_name` (`grade_name`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`holiday_id`);

--
-- Indexes for table `leveltypes`
--
ALTER TABLE `leveltypes`
  ADD PRIMARY KEY (`leveltype_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`login_attempt_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `onderdelen`
--
ALTER TABLE `onderdelen`
  ADD PRIMARY KEY (`onderdeel_id`);

--
-- Indexes for table `paginas`
--
ALTER TABLE `paginas`
  ADD PRIMARY KEY (`pagina_id`);

--
-- Indexes for table `periodes`
--
ALTER TABLE `periodes`
  ADD PRIMARY KEY (`periode_id`),
  ADD UNIQUE KEY `periode` (`periode`);

--
-- Indexes for table `projectcategories`
--
ALTER TABLE `projectcategories`
  ADD PRIMARY KEY (`projectcategory_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `project_id_2` (`project_id`);

--
-- Indexes for table `projectgroup`
--
ALTER TABLE `projectgroup`
  ADD PRIMARY KEY (`projectgroup_id`);

--
-- Indexes for table `projectgroup_categories`
--
ALTER TABLE `projectgroup_categories`
  ADD PRIMARY KEY (`projectgroup_categorie_id`);

--
-- Indexes for table `projectgroup_periode`
--
ALTER TABLE `projectgroup_periode`
  ADD PRIMARY KEY (`projectgroup_periode_id`),
  ADD KEY `grade_id` (`grade_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `projectgroup_projects`
--
ALTER TABLE `projectgroup_projects`
  ADD PRIMARY KEY (`projectgroup_id`,`project_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `projectcategory_id` (`projectcategory_id`);

--
-- Indexes for table `studentwage`
--
ALTER TABLE `studentwage`
  ADD PRIMARY KEY (`studentwage_id`);

--
-- Indexes for table `subgroups`
--
ALTER TABLE `subgroups`
  ADD PRIMARY KEY (`subgroup_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `userlogs`
--
ALTER TABLE `userlogs`
  ADD PRIMARY KEY (`userlog_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `usernotifications`
--
ALTER TABLE `usernotifications`
  ADD PRIMARY KEY (`usernotification_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `usertypes`
--
ALTER TABLE `usertypes`
  ADD PRIMARY KEY (`usertype_id`);

--
-- Indexes for table `user_projects`
--
ALTER TABLE `user_projects`
  ADD PRIMARY KEY (`user_project_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`),
  ADD KEY `user_id_3` (`user_id`),
  ADD KEY `user_id_4` (`user_id`),
  ADD KEY `user_id_5` (`user_id`),
  ADD KEY `user_id_6` (`user_id`),
  ADD KEY `user_id_7` (`user_id`),
  ADD KEY `user_id_8` (`user_id`),
  ADD KEY `user_id_9` (`user_id`),
  ADD KEY `user_id_10` (`user_id`),
  ADD KEY `user_id_11` (`user_id`),
  ADD KEY `user_id_12` (`user_id`),
  ADD KEY `user_id_13` (`user_id`),
  ADD KEY `user_id_14` (`user_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `user_subgroups`
--
ALTER TABLE `user_subgroups`
  ADD PRIMARY KEY (`user_subgroup_id`);

--
-- Indexes for table `user_tasks`
--
ALTER TABLE `user_tasks`
  ADD PRIMARY KEY (`user_task_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `projectcategory_id` (`projectcategory_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresses`
--
ALTER TABLE `adresses`
  MODIFY `adress_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `categorie_tasks`
--
ALTER TABLE `categorie_tasks`
  MODIFY `category_task_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `estimated_time`
--
ALTER TABLE `estimated_time`
  MODIFY `estimated_time_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `grade_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `holiday_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `leveltypes`
--
ALTER TABLE `leveltypes`
  MODIFY `leveltype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `login_attempt_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `onderdelen`
--
ALTER TABLE `onderdelen`
  MODIFY `onderdeel_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `paginas`
--
ALTER TABLE `paginas`
  MODIFY `pagina_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `periodes`
--
ALTER TABLE `periodes`
  MODIFY `periode_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `projectcategories`
--
ALTER TABLE `projectcategories`
  MODIFY `projectcategory_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `projectgroup`
--
ALTER TABLE `projectgroup`
  MODIFY `projectgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `projectgroup_categories`
--
ALTER TABLE `projectgroup_categories`
  MODIFY `projectgroup_categorie_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projectgroup_periode`
--
ALTER TABLE `projectgroup_periode`
  MODIFY `projectgroup_periode_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `studentwage`
--
ALTER TABLE `studentwage`
  MODIFY `studentwage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=632;
--
-- AUTO_INCREMENT for table `subgroups`
--
ALTER TABLE `subgroups`
  MODIFY `subgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `userlogs`
--
ALTER TABLE `userlogs`
  MODIFY `userlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `usernotifications`
--
ALTER TABLE `usernotifications`
  MODIFY `usernotification_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usertypes`
--
ALTER TABLE `usertypes`
  MODIFY `usertype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_projects`
--
ALTER TABLE `user_projects`
  MODIFY `user_project_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_subgroups`
--
ALTER TABLE `user_subgroups`
  MODIFY `user_subgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_tasks`
--
ALTER TABLE `user_tasks`
  MODIFY `user_task_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `projectcategories`
--
ALTER TABLE `projectcategories`
  ADD CONSTRAINT `projectcategories_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projectcategories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `projectcategories_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `projectgroup_projects`
--
ALTER TABLE `projectgroup_projects`
  ADD CONSTRAINT `projectgroup_projects_ibfk_1` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `projectgroup_projects_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`projectcategory_id`) REFERENCES `projectcategories` (`projectcategory_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userlogs`
--
ALTER TABLE `userlogs`
  ADD CONSTRAINT `userlogs_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userlogs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user_projects`
--
ALTER TABLE `user_projects`
  ADD CONSTRAINT `user_projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_projects_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_tasks`
--
ALTER TABLE `user_tasks`
  ADD CONSTRAINT `user_tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_tasks_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_tasks_ibfk_3` FOREIGN KEY (`projectcategory_id`) REFERENCES `projectcategories` (`projectcategory_id`) ON DELETE CASCADE ON UPDATE CASCADE;