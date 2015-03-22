-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2015 at 05:53 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `logtime`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresses`
--

CREATE TABLE IF NOT EXISTS `adresses` (
  `adress_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `housenumber` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`adress_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `adresses`
--

INSERT INTO `adresses` (`adress_id`, `street`, `housenumber`, `city`, `zipcode`, `created_at`, `updated_at`, `active`) VALUES
(1, 'straat', '3', 'harderwijk', '8077SG', '2015-03-18 22:59:14', '2015-03-18 22:59:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

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
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `adress_id` int(10) unsigned DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `estimated_time`
--

CREATE TABLE IF NOT EXISTS `estimated_time` (
  `estimated_time_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_needed` time NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`estimated_time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forgotten_passwordtokens`
--

CREATE TABLE IF NOT EXISTS `forgotten_passwordtokens` (
  `forgotten_passwordtoken_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `forgotten_passwordtoken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`forgotten_passwordtoken_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `grade_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grade` int(10) NOT NULL,
  `grade_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`grade_id`, `grade`, `grade_name`, `location_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'lions', 1, '2015-03-19 19:32:42', '2015-03-19 19:32:42');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE IF NOT EXISTS `holidays` (
  `holiday_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `holiday_startdate` date NOT NULL,
  `holiday_stopdate` date NOT NULL,
  `periode_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leveltypes`
--

CREATE TABLE IF NOT EXISTS `leveltypes` (
  `leveltype_id` int(11) NOT NULL AUTO_INCREMENT,
  `leveltype_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`leveltype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `leveltypes`
--

INSERT INTO `leveltypes` (`leveltype_id`, `leveltype_name`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Student', '2015-03-18 22:55:57', '2015-03-18 22:55:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Harderwijk', '2015-03-18 22:55:34', '2015-03-18 22:55:34');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `login_attempt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `login_failed` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_attempt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notification_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `onderdelen`
--

CREATE TABLE IF NOT EXISTS `onderdelen` (
  `onderdeel_id` int(11) NOT NULL AUTO_INCREMENT,
  `onderdeel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `onderdeel_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `menubar` int(11) DEFAULT '1',
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actief` int(11) DEFAULT '1',
  PRIMARY KEY (`onderdeel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `onderdelen`
--

INSERT INTO `onderdelen` (`onderdeel_id`, `onderdeel`, `onderdeel_url`, `created_at`, `updated_at`, `menubar`, `icon`, `actief`) VALUES
(1, 'Dashboard', '', '2015-03-15 20:06:52', '2015-03-15 22:46:08', 0, 'dashboard.png', 1),
(2, 'Project beheer', 'project-beheer', '2015-03-15 20:06:52', '2015-03-15 22:49:49', 1, 'map.png', 1),
(3, 'Persoonlijke instellingen', 'persoonlijke-instellingen', '2015-03-15 20:06:52', '2015-03-15 22:46:33', 0, '', 1),
(4, 'Logboek', 'logboek', '2015-03-15 20:06:52', '2015-03-15 22:47:24', 1, 'logboek.png', 1),
(5, 'Groeps instellingen', 'groepsinstellingen', '2015-03-15 22:47:05', '2015-03-15 22:47:05', 1, 'instellingen.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paginas`
--

CREATE TABLE IF NOT EXISTS `paginas` (
  `pagina_id` int(11) NOT NULL AUTO_INCREMENT,
  `onderdeel_id` int(11) NOT NULL,
  `naam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kop` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tekst` longtext COLLATE utf8_unicode_ci NOT NULL,
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `actief` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pagina_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `paginas`
--

INSERT INTO `paginas` (`pagina_id`, `onderdeel_id`, `naam`, `titel`, `body`, `kop`, `tekst`, `element`, `created_at`, `updated_at`, `actief`) VALUES
(1, 1, 'Dashboard', 'Dashboard', '', 'Dashboard', 'Je bevind je nu op het dashboard. Hier vind je een overzicht van de gemaakte en lopende projecten van jouw. Je kunt de projecten inzien en bekijken hoe ver iedereen is met zijn of haar taken.', '', '2015-03-15 20:05:39', '2015-03-15 23:35:35', 1),
(2, 2, 'Projectbeheer', 'Projectbeheer', 'project-beheer', 'Projectbeheer', 'Hier vind je het projectenoverzicht van jouw groep. Klik een project aan en bekijk de statistieken van dit project.', '', '2015-03-15 20:05:39', '2015-03-15 23:05:42', 1),
(3, 3, 'Persoonlijke instellingen', 'Persoonlijke instellingen', 'persoonlijke-instellingen', 'Persoonlijke instellingen', 'Hier vind je je persoonlijke instellingen. Wijzig je instellingen en sla ze daarna op.', '', '2015-03-15 20:05:39', '2015-03-15 23:45:39', 1),
(4, 4, 'Logboek', 'Logboek', 'logboek', 'Logboek', 'Hier vind je een overzicht van je gelogte uren. Voeg nieuwe uren toe of wijzig de bestaande.', '', '2015-03-15 22:33:51', '2015-03-18 20:07:34', 1),
(5, 5, 'Groepsinstellingen', 'Groepsinstellingen', 'groepsinstellingen', 'Groepsinstellingen', 'Hier vind je de groepsinstellingen van jouw groep. Pas de instellingen aan en sla deze daarna op.', '', '2015-03-15 22:48:42', '2015-03-15 22:49:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `periodes`
--

CREATE TABLE IF NOT EXISTS `periodes` (
  `periode_id` int(11) NOT NULL AUTO_INCREMENT,
  `startdate` date NOT NULL,
  `stopdate` date NOT NULL,
  `periode` int(10) NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`periode_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `periodes`
--

INSERT INTO `periodes` (`periode_id`, `startdate`, `stopdate`, `periode`, `location_id`, `created_at`, `updated_at`) VALUES
(1, '2014-06-16', '2015-07-03', 1, 1, '2015-03-18 22:59:59', '2015-03-19 18:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `projectcategories`
--

CREATE TABLE IF NOT EXISTS `projectcategories` (
  `projectcategories_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categorie_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `projectgroup`
--

CREATE TABLE IF NOT EXISTS `projectgroup` (
  `projectgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`projectgroup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `projectgroup`
--

INSERT INTO `projectgroup` (`projectgroup_id`, `leveltype_id`, `grade_id`, `adress_id`, `location_id`, `coach_id`, `leader_id`, `task_id`, `code`, `projectgroup_name`, `image_path`, `created_at`, `updated_at`, `active`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, '', 'orangesource', 'placeholder.png', '2015-03-19 19:37:53', '2015-03-19 19:37:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `projectgroup_categories`
--

CREATE TABLE IF NOT EXISTS `projectgroup_categories` (
  `projectgroup_categorie_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectgroup_periode_id` int(10) unsigned NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectgroup_categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `projectgroup_periode`
--

CREATE TABLE IF NOT EXISTS `projectgroup_periode` (
  `projectgroup_periode_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_done` tinyint(1) NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `periode_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectgroup_periode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `leveltype_id` int(10) unsigned DEFAULT NULL,
  `done` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `project`, `task_id`, `location_id`, `leveltype_id`, `done`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Logtime', 1, 1, 1, 0, '2015-03-18 22:57:37', '2015-03-18 22:58:16', 1),
(2, 'Pizzatoday', 1, 1, 1, 0, '2015-03-18 22:57:37', '2015-03-18 22:58:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `studentwage`
--

CREATE TABLE IF NOT EXISTS `studentwage` (
  `studentwage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wage` double(10,2) NOT NULL,
  `project_group_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`studentwage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subgroups`
--

CREATE TABLE IF NOT EXISTS `subgroups` (
  `subgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subgroup_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`subgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `task`, `categorie_id`, `created_at`, `updated_at`) VALUES
(1, 'Fase 4a', 1, '2015-03-18 22:57:15', '2015-03-18 22:57:15'),
(2, 'Fase 5a', 2, '2015-03-18 22:57:15', '2015-03-18 22:57:15'),
(3, 'Fase 5B', 2, '2015-03-18 22:57:15', '2015-03-18 22:57:15'),
(4, 'Fase 6A', 3, '2015-03-18 22:57:15', '2015-03-18 22:57:15'),
(5, 'Fase 7C', 4, '2015-03-18 22:57:15', '2015-03-18 22:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `userlogs`
--

CREATE TABLE IF NOT EXISTS `userlogs` (
  `userlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `starttime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stoptime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `totaltime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userlog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `userlogs`
--

INSERT INTO `userlogs` (`userlog_id`, `starttime`, `stoptime`, `totaltime`, `description`, `date`, `user_id`, `project`, `category`, `task`, `created_at`, `updated_at`) VALUES
(11, '', '02:42', '2.00', '', '2015-03-09', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-20 01:42:45', '2015-03-20 01:42:45'),
(12, '', '02:42', '2.00', '', '2015-03-09', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-20 01:42:46', '2015-03-20 01:42:46'),
(15, '', '02:42', '2.00', '', '2015-03-05', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-20 01:42:53', '2015-03-20 01:42:53'),
(16, '', '02:42', '2.00', '', '2015-03-20', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-20 01:42:56', '2015-03-20 01:42:56'),
(20, '', '02:43', '2.00', '', '2015-03-20', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-20 01:43:02', '2015-03-20 01:43:02'),
(26, '12:34', '23:45', '11.00', 'asdfasdf', '', 1, 'Logtime', 'Fase 4', 'Fase 5B', '2015-03-22 15:32:28', '2015-03-22 15:32:28'),
(28, '', '16:34', '16.00', '', '', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-22 15:34:09', '2015-03-22 15:34:09'),
(29, '', '16:34', '16.00', 'jfghjfghjfghjfgh', '2015-03-22', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-22 15:34:17', '2015-03-22 15:34:17'),
(30, '12:34', '17::1', '5.00', 'Test, aangemaakt in uren modal', '2015-03-17', 1, 'Pizzatoday', 'Fase 5', 'Fase 5a', '2015-03-22 16:20:12', '2015-03-22 16:20:12'),
(31, '12:34', '17::1', '5.00', 'Test, aangemaakt in uren modal', '2015-03-17', 1, 'Pizzatoday', 'Fase 5', 'Fase 5a', '2015-03-22 16:20:12', '2015-03-22 16:20:12'),
(32, '12:34', '12:45', '0.00', 'jghkghjk', '2015-03-22', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-22 16:20:56', '2015-03-22 16:20:56'),
(34, '12:34', '13:15', '1.00', 'testest', '2015-03-22', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-22 16:22:02', '2015-03-22 16:22:02'),
(35, 'start', '17:22', '17.00', 'description', '2015-03-22', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-22 16:23:24', '2015-03-22 16:23:24'),
(36, 'st:ar', '17:23', '17.00', 'description', '2015-03-22', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-22 16:23:44', '2015-03-22 16:23:44'),
(37, '14:58', '15:48', '1.00', 'testingg', '2015-03-22', 1, 'Logtime', 'Fase 4', 'Fase 4a', '2015-03-22 16:24:46', '2015-03-22 16:24:46'),
(38, '', '17:51', '17.00', 'testttttt', '2015-03-22', 1, 'Logtime', 'Fase 4', 'Fase 5a', '2015-03-22 16:51:39', '2015-03-22 16:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `usernotifications`
--

CREATE TABLE IF NOT EXISTS `usernotifications` (
  `usernotification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usernotification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usercode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_image_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'placeholder.png',
  `phone_number` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `lasttime_online` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usertype_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `projectgroup_id` int(10) unsigned DEFAULT NULL,
  `leader` int(10) unsigned NOT NULL DEFAULT '0',
  `adress_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `usercode`, `password`, `firstname`, `lastname`, `email`, `user_image_path`, `phone_number`, `lasttime_online`, `remember_token`, `usertype_id`, `location_id`, `projectgroup_id`, `leader`, `adress_id`, `created_at`, `updated_at`, `active`) VALUES
(1, '262503', '', 'Dennis', 'Eilander', 'eilander.dennis@gmail.com', 'placeholder.png', '0612345678', '2015-03-19 19:40:00', NULL, 1, 1, 1, 0, 1, '2015-03-19 19:40:00', '2015-03-19 19:40:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE IF NOT EXISTS `usertypes` (
  `usertype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usertype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usertype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`usertype_id`, `usertype`, `created_at`, `updated_at`) VALUES
(1, 'student', '2015-03-19 19:41:19', '2015-03-19 19:41:19'),
(2, 'docent', '2015-03-19 19:41:19', '2015-03-19 19:41:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_subgroups`
--

CREATE TABLE IF NOT EXISTS `user_subgroups` (
  `user_subgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `subgroup_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_subgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
