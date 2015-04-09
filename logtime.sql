-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: 10.246.16.97:3306
-- Generation Time: Apr 09, 2015 at 06:23 PM
-- Server version: 5.5.42-MariaDB-1~wheezy
-- PHP Version: 5.3.3-7+squeeze15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mrydesign_nl`
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`adress_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `adresses`
--

INSERT INTO `adresses` (`adress_id`, `street`, `housenumber`, `city`, `zipcode`, `updated_at`, `active`) VALUES
(1, 'Schokker', '10', 'Zeewolde', '3891DN', '2015-03-23 19:54:44', 1),
(6, 'Streetnam', '10 A', 'woonplaats', '3894 ''OP', '2015-04-07 12:44:19', 1),
(7, 'Westeinde', '33', 'Harderwijk', '3810 OP', '2015-04-07 13:50:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `categorie_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categorie_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`categorie_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorie_id`, `categorie_name`, `category`, `updated_at`) VALUES
(1, 'students', '', '2015-03-23 20:13:26');

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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `customers_project_group_id_foreign` (`projectgroup_id`),
  KEY `customers_project_id_foreign` (`project_id`),
  KEY `customers_adress_id_foreign` (`adress_id`)
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`estimated_time_id`),
  KEY `estimated_time_project_group_id_foreign` (`projectgroup_id`),
  KEY `estimated_time_task_id_foreign` (`task_id`),
  KEY `estimated_time_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forgotten_passwordtokens`
--

CREATE TABLE IF NOT EXISTS `forgotten_passwordtokens` (
  `forgotten_passwordtoken_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `forgotten_passwordtoken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`forgotten_passwordtoken_id`),
  KEY `forgotten_password_tokens_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE IF NOT EXISTS `holidays` (
  `holiday_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `holiday_startdate` date NOT NULL,
  `holiday_stopdate` date NOT NULL,
  `periode_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`holiday_id`),
  KEY `holidays_periode_id_foreign` (`periode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leveltypes`
--

CREATE TABLE IF NOT EXISTS `leveltypes` (
  `leveltype_id` int(11) NOT NULL AUTO_INCREMENT,
  `leveltype_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`leveltype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `leveltypes`
--

INSERT INTO `leveltypes` (`leveltype_id`, `leveltype_name`, `updated_at`, `active`) VALUES
(1, 'Student', '2015-03-18 21:55:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `location_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location`, `updated_at`) VALUES
(1, 'Harderwijk', '2015-03-23 19:50:15');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `login_attempt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `login_failed` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_attempt_id`),
  KEY `login_attempts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notification_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `menubar` int(11) DEFAULT '1',
  `is_docent` tinyint(1) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actief` int(11) DEFAULT '1',
  PRIMARY KEY (`onderdeel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `onderdelen`
--

INSERT INTO `onderdelen` (`onderdeel_id`, `onderdeel`, `onderdeel_url`, `updated_at`, `menubar`, `is_docent`, `icon`, `actief`) VALUES
(1, 'Dashboard', '', '2015-04-08 10:27:11', 0, 1, 'dashboard.png', 1),
(2, 'Project beheer', 'project-beheer', '2015-04-08 10:26:46', 1, 1, 'map.png', 1),
(3, 'Persoonlijke instellingen', 'persoonlijke-instellingen', '2015-03-15 22:46:33', 0, 0, '', 1),
(4, 'Logboek', 'logboek', '2015-04-08 18:50:50', 1, 0, 'logboek.png', 1),
(5, 'Groeps instellingen', 'groepsinstellingen', '2015-04-08 10:28:18', 1, 1, 'instellingen.png', 1),
(6, 'Login', 'login', '2015-04-08 10:26:58', 0, 0, 'instellingen.png', 1),
(7, 'Student Instellingen', 'studentsettings', '2015-04-08 19:09:28', 1, 1, 'instellingen.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paginas`
--

CREATE TABLE IF NOT EXISTS `paginas` (
  `pagina_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `onderdeel_id` int(11) NOT NULL,
  `naam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kop` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tekst` longtext COLLATE utf8_unicode_ci NOT NULL,
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `actief` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pagina_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `paginas`
--

INSERT INTO `paginas` (`pagina_id`, `onderdeel_id`, `naam`, `titel`, `body`, `kop`, `tekst`, `element`, `updated_at`, `actief`) VALUES
(1, 1, 'Dashboard', 'Dashboard', '', 'Dashboard', 'Je bevind je nu op het dashboard. Hier vind je een overzicht van de gemaakte en lopende projecten van jouw. Je kunt de projecten inzien en bekijken hoe ver iedereen is met zijn of haar taken.', '', '2015-03-15 23:35:35', 1),
(2, 2, 'Projectbeheer', 'Projectbeheer', 'project-beheer', 'Projectbeheer', 'Hier vind je het projectenoverzicht van jouw groep. Klik een project aan en bekijk de statistieken van dit project.', '', '2015-03-15 23:05:42', 1),
(3, 3, 'Persoonlijke instellingen', 'Persoonlijke instellingen', 'persoonlijke-instellingen', 'Persoonlijke instellingen', 'Hier vind je je persoonlijke instellingen. Wijzig je instellingen en sla ze daarna op.', '', '2015-03-15 23:45:39', 1),
(4, 4, 'Logboek', 'Logboek', '', 'Logboek', 'Hier vind je een overzicht van je gelogte uren. Voeg nieuwe uren toe of wijzig de bestaande.', '', '2015-03-15 22:33:51', 1),
(5, 5, 'Groepsinstellingen', 'Groepsinstellingen', 'groepsinstellingen', 'Groepsinstellingen', 'Hier vind je de groepsinstellingen van jouw groep. Pas de instellingen aan en sla deze daarna op.', '', '2015-03-15 22:49:06', 1),
(6, 6, 'Login', 'Login', 'login', 'Login', 'Hier kun je inloggen', '', '2015-03-23 18:32:22', 1),
(7, 7, 'studentsettings', 'studentsettings', 'studentsettings', 'Student Instellingen', 'Hier vind je de groepsinstellingen van jouw groep. Pas de instellingen aan en sla deze daarna op.', '', '2015-04-08 19:08:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `periodes`
--

CREATE TABLE IF NOT EXISTS `periodes` (
  `periode_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `startdate` date NOT NULL,
  `stopdate` date NOT NULL,
  `periode_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`periode_id`),
  KEY `periodes_location_id_foreign` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `periodes`
--

INSERT INTO `periodes` (`periode_id`, `startdate`, `stopdate`, `periode_name`, `location_id`, `updated_at`) VALUES
(1, '0000-00-00', '0000-00-00', 'periode', 1, '2015-03-23 20:12:48');

-- --------------------------------------------------------

--
-- Table structure for table `projectcategories`
--

CREATE TABLE IF NOT EXISTS `projectcategories` (
  `projectcategories_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categorie_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectcategories_id`),
  KEY `categories_projects_categorie_id_foreign` (`categorie_id`),
  KEY `categories_projects_project_id_foreign` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `projectcategories`
--

INSERT INTO `projectcategories` (`projectcategories_id`, `categorie_id`, `project_id`, `updated_at`) VALUES
(1, 1, 3, '2015-03-23 20:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `projectgroup`
--

CREATE TABLE IF NOT EXISTS `projectgroup` (
  `projectgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `leveltype_id` int(10) DEFAULT NULL,
  `year_id` int(10) unsigned NOT NULL,
  `adress_id` int(10) unsigned DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `coach_id` int(10) unsigned DEFAULT NULL,
  `leader_id` int(10) unsigned DEFAULT NULL,
  `task_id` int(10) DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `projectgroup_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'placeholder.png',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`projectgroup_id`),
  KEY `project_groups_year_id_foreign` (`year_id`),
  KEY `project_groups_adress_id_foreign` (`adress_id`),
  KEY `project_groups_location_id_foreign` (`location_id`),
  KEY `project_groups_coach_id_foreign` (`coach_id`),
  KEY `project_groups_leader_id_foreign` (`leader_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `projectgroup`
--

INSERT INTO `projectgroup` (`projectgroup_id`, `leveltype_id`, `year_id`, `adress_id`, `location_id`, `coach_id`, `leader_id`, `task_id`, `code`, `projectgroup_name`, `image_path`, `updated_at`, `active`) VALUES
(1, 1, 1, 1, 1, NULL, 5, NULL, '5646545', 'Lions', '10406878_808864912480100_214431081879684123_n.jpg', '2015-04-07 19:11:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `projectgroup_categories`
--

CREATE TABLE IF NOT EXISTS `projectgroup_categories` (
  `projectgroup_categorie_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectgroup_periode_id` int(10) unsigned NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectgroup_categorie_id`),
  KEY `group_project_categories_group_project_periode_id_foreign` (`projectgroup_periode_id`),
  KEY `group_project_categories_categorie_id_foreign` (`categorie_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `projectgroup_categories`
--

INSERT INTO `projectgroup_categories` (`projectgroup_categorie_id`, `projectgroup_periode_id`, `categorie_id`, `is_done`, `updated_at`) VALUES
(1, 1, 1, 0, '2015-03-23 20:13:45');

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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectgroup_periode_id`),
  KEY `group_project_periode_project_group_id_foreign` (`projectgroup_id`),
  KEY `group_project_periode_project_id_foreign` (`project_id`),
  KEY `group_project_periode_periode_id_foreign` (`periode_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `projectgroup_periode`
--

INSERT INTO `projectgroup_periode` (`projectgroup_periode_id`, `is_done`, `projectgroup_id`, `project_id`, `periode_id`, `updated_at`) VALUES
(1, 0, 1, 3, NULL, '2015-03-23 20:12:24');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `leveltype_id` int(10) unsigned DEFAULT NULL,
  `done` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`project_id`),
  KEY `projects_location_id_foreign` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `project_name`, `project`, `task_id`, `location_id`, `leveltype_id`, `done`, `updated_at`, `active`) VALUES
(3, 'Logtime', 'Logtime', 1, 1, 1, 0, '2015-04-08 11:17:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `studentwage`
--

CREATE TABLE IF NOT EXISTS `studentwage` (
  `studentwage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wage` double(10,2) NOT NULL,
  `project_group_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`studentwage_id`),
  KEY `student_wage_project_group_id_foreign` (`project_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `studentwage`
--

INSERT INTO `studentwage` (`studentwage_id`, `wage`, `project_group_id`, `updated_at`) VALUES
(1, 11.00, 1, '2015-04-08 19:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `subgroups`
--

CREATE TABLE IF NOT EXISTS `subgroups` (
  `subgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subgroup_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`subgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`),
  KEY `tasks_categorie_id_foreign` (`categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `userlogs`
--

CREATE TABLE IF NOT EXISTS `userlogs` (
  `userlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `starttime` time NOT NULL,
  `stoptime` time NOT NULL,
  `totaltime_in_hours` time NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned NOT NULL,
  `totaltime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userlog_id`),
  KEY `user_logs_user_id_foreign` (`user_id`),
  KEY `user_logs_task_id_foreign` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usernotifications`
--

CREATE TABLE IF NOT EXISTS `usernotifications` (
  `usernotification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usernotification_id`),
  KEY `user_notifications_user_id_foreign` (`user_id`),
  KEY `user_notifications_notification_id_foreign` (`notification_id`)
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
  `lasttime_online` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usertype_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `projectgroup_id` int(10) unsigned DEFAULT NULL,
  `adress_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `users_user_type_id_foreign` (`usertype_id`),
  KEY `users_location_id_foreign` (`location_id`),
  KEY `users_project_group_id_foreign` (`projectgroup_id`),
  KEY `users_adress_id_foreign` (`adress_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `usercode`, `password`, `firstname`, `lastname`, `email`, `user_image_path`, `phone_number`, `lasttime_online`, `remember_token`, `usertype_id`, `location_id`, `projectgroup_id`, `adress_id`, `updated_at`, `active`) VALUES
(5, '1337', '26c669cd0814ac40e5328752b21c4aa6450d16295e4eec30356a06a911c23983aaebe12d5da38eeebfc1b213be650498df8419194d5a26c7e0a50af156853c79', 'Yannick', 'Berendsen', 'mryannickz@live.nl', 'avatar1.png', '', '2015-04-08 12:59:57', NULL, 2, 1, 1, 1, '2015-04-08 18:50:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE IF NOT EXISTS `usertypes` (
  `usertype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usertype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usertype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`usertype_id`, `usertype`, `updated_at`) VALUES
(1, 'Student', '2015-04-08 10:59:49'),
(2, 'Docent', '2015-03-23 19:47:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_subgroups`
--

CREATE TABLE IF NOT EXISTS `user_subgroups` (
  `user_subgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `subgroup_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_subgroup_id`),
  KEY `user_sub_groups_user_id_foreign` (`user_id`),
  KEY `user_sub_groups_project_group_id_foreign` (`projectgroup_id`),
  KEY `user_sub_groups_sub_group_id_foreign` (`subgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE IF NOT EXISTS `years` (
  `year_id` int(10) unsigned NOT NULL,
  `year` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`year_id`),
  KEY `years_location_id_foreign` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`year_id`, `year`, `nickname`, `location_id`, `updated_at`) VALUES
(1, '1', 'lions', 1, '2015-03-23 19:53:54');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_adress_id_foreign` FOREIGN KEY (`adress_id`) REFERENCES `adresses` (`adress_id`),
  ADD CONSTRAINT `customers_project_group_id_foreign` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`),
  ADD CONSTRAINT `customers_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Constraints for table `estimated_time`
--
ALTER TABLE `estimated_time`
  ADD CONSTRAINT `estimated_time_project_group_id_foreign` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`),
  ADD CONSTRAINT `estimated_time_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  ADD CONSTRAINT `estimated_time_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `forgotten_passwordtokens`
--
ALTER TABLE `forgotten_passwordtokens`
  ADD CONSTRAINT `forgotten_password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_periode_id_foreign` FOREIGN KEY (`periode_id`) REFERENCES `periodes` (`periode_id`);

--
-- Constraints for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD CONSTRAINT `login_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `periodes`
--
ALTER TABLE `periodes`
  ADD CONSTRAINT `periodes_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `projectcategories`
--
ALTER TABLE `projectcategories`
  ADD CONSTRAINT `categories_projects_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`categorie_id`),
  ADD CONSTRAINT `categories_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Constraints for table `projectgroup`
--
ALTER TABLE `projectgroup`
  ADD CONSTRAINT `project_groups_adress_id_foreign` FOREIGN KEY (`adress_id`) REFERENCES `adresses` (`adress_id`),
  ADD CONSTRAINT `project_groups_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `project_groups_leader_id_foreign` FOREIGN KEY (`leader_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `project_groups_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `project_groups_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`);

--
-- Constraints for table `projectgroup_categories`
--
ALTER TABLE `projectgroup_categories`
  ADD CONSTRAINT `group_project_categories_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`categorie_id`),
  ADD CONSTRAINT `group_project_categories_group_project_periode_id_foreign` FOREIGN KEY (`projectgroup_periode_id`) REFERENCES `projectgroup_periode` (`projectgroup_periode_id`);

--
-- Constraints for table `projectgroup_periode`
--
ALTER TABLE `projectgroup_periode`
  ADD CONSTRAINT `group_project_periode_periode_id_foreign` FOREIGN KEY (`periode_id`) REFERENCES `periodes` (`periode_id`),
  ADD CONSTRAINT `group_project_periode_project_group_id_foreign` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`),
  ADD CONSTRAINT `group_project_periode_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `studentwage`
--
ALTER TABLE `studentwage`
  ADD CONSTRAINT `student_wage_project_group_id_foreign` FOREIGN KEY (`project_group_id`) REFERENCES `projectgroup` (`projectgroup_id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`categorie_id`);

--
-- Constraints for table `userlogs`
--
ALTER TABLE `userlogs`
  ADD CONSTRAINT `user_logs_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  ADD CONSTRAINT `user_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `usernotifications`
--
ALTER TABLE `usernotifications`
  ADD CONSTRAINT `user_notifications_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `user_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_adress_id_foreign` FOREIGN KEY (`adress_id`) REFERENCES `adresses` (`adress_id`),
  ADD CONSTRAINT `users_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `users_project_group_id_foreign` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`),
  ADD CONSTRAINT `users_user_type_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertypes` (`usertype_id`);

--
-- Constraints for table `user_subgroups`
--
ALTER TABLE `user_subgroups`
  ADD CONSTRAINT `user_sub_groups_project_group_id_foreign` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`),
  ADD CONSTRAINT `user_sub_groups_sub_group_id_foreign` FOREIGN KEY (`subgroup_id`) REFERENCES `categories` (`categorie_id`),
  ADD CONSTRAINT `user_sub_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `years`
--
ALTER TABLE `years`
  ADD CONSTRAINT `years_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
