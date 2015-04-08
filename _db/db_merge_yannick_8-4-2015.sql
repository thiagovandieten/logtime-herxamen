-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Machine: 127.0.0.1
-- Gegenereerd op: 08 apr 2015 om 13:21
-- Serverversie: 5.6.21
-- PHP-versie: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `logtime`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `adresses`
--

CREATE TABLE IF NOT EXISTS `adresses` (
`adress_id` int(10) unsigned NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `housenumber` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `adresses`
--

INSERT INTO `adresses` (`adress_id`, `street`, `housenumber`, `city`, `zipcode`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Schokker', '10', 'Zeewolde', '3891DN', '2015-03-23 19:54:44', '2015-03-23 19:54:44', 1),
(6, 'Streetnam', '10 A', 'woonplaats', '3894 ''OP', '2015-04-07 12:44:19', '2015-04-07 12:44:19', 1),
(7, 'Westeinde', '33', 'Harderwijk', '3810 OP', '2015-04-07 13:50:51', '2015-04-07 13:50:51', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`categorie_id` int(10) unsigned NOT NULL,
  `categorie_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `categories`
--

INSERT INTO `categories` (`categorie_id`, `categorie_name`, `category`, `created_at`, `updated_at`) VALUES
(1, 'students', '', '2015-03-23 20:13:26', '2015-03-23 20:13:26');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
`customer_id` int(10) unsigned NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `adress_id` int(10) unsigned DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `estimated_time`
--

CREATE TABLE IF NOT EXISTS `estimated_time` (
`estimated_time_id` int(10) unsigned NOT NULL,
  `time_needed` time NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `forgotten_passwordtokens`
--

CREATE TABLE IF NOT EXISTS `forgotten_passwordtokens` (
  `forgotten_passwordtoken_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `forgotten_passwordtoken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `holidays`
--

CREATE TABLE IF NOT EXISTS `holidays` (
`holiday_id` int(10) unsigned NOT NULL,
  `holiday_startdate` date NOT NULL,
  `holiday_stopdate` date NOT NULL,
  `periode_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leveltypes`
--

CREATE TABLE IF NOT EXISTS `leveltypes` (
`leveltype_id` int(11) NOT NULL,
  `leveltype_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `leveltypes`
--

INSERT INTO `leveltypes` (`leveltype_id`, `leveltype_name`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Student', '2015-03-18 21:55:57', '2015-03-18 21:55:57', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
`location_id` int(10) unsigned NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `locations`
--

INSERT INTO `locations` (`location_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Harderwijk', '2015-03-23 19:50:11', '2015-03-23 19:50:15');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
`login_attempt_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `login_failed` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
`notification_id` int(10) unsigned NOT NULL,
  `notification_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderdelen`
--

CREATE TABLE IF NOT EXISTS `onderdelen` (
`onderdeel_id` int(11) NOT NULL,
  `onderdeel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `onderdeel_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `menubar` int(11) DEFAULT '1',
  `is_docent` tinyint(1) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actief` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `onderdelen`
--

INSERT INTO `onderdelen` (`onderdeel_id`, `onderdeel`, `onderdeel_url`, `created_at`, `updated_at`, `menubar`, `is_docent`, `icon`, `actief`) VALUES
(1, 'Dashboard', '', '2015-03-15 20:06:52', '2015-04-08 10:27:11', 0, 1, 'dashboard.png', 1),
(2, 'Project beheer', 'project-beheer', '2015-03-15 20:06:52', '2015-04-08 10:26:46', 1, 1, 'map.png', 1),
(3, 'Persoonlijke instellingen', 'persoonlijke-instellingen', '2015-03-15 20:06:52', '2015-03-15 22:46:33', 0, 0, '', 1),
(4, 'Logboek', 'logboek', '2015-03-15 20:06:52', '2015-04-08 10:26:53', 1, 1, 'logboek.png', 1),
(5, 'Groeps instellingen', 'groepsinstellingen', '2015-03-15 22:47:05', '2015-04-08 10:28:18', 1, 1, 'instellingen.png', 1),
(6, 'Login', 'login', '2015-03-15 22:47:05', '2015-04-08 10:26:58', 0, 0, 'instellingen.png', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `paginas`
--

CREATE TABLE IF NOT EXISTS `paginas` (
`pagina_id` int(10) unsigned NOT NULL,
  `onderdeel_id` int(11) NOT NULL,
  `naam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kop` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tekst` longtext COLLATE utf8_unicode_ci NOT NULL,
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `actief` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `paginas`
--

INSERT INTO `paginas` (`pagina_id`, `onderdeel_id`, `naam`, `titel`, `body`, `kop`, `tekst`, `element`, `created_at`, `updated_at`, `actief`) VALUES
(1, 1, 'Dashboard', 'Dashboard', '', 'Dashboard', 'Je bevind je nu op het dashboard. Hier vind je een overzicht van de gemaakte en lopende projecten van jouw. Je kunt de projecten inzien en bekijken hoe ver iedereen is met zijn of haar taken.', '', '2015-03-15 20:05:39', '2015-03-15 23:35:35', 1),
(2, 2, 'Projectbeheer', 'Projectbeheer', 'project-beheer', 'Projectbeheer', 'Hier vind je het projectenoverzicht van jouw groep. Klik een project aan en bekijk de statistieken van dit project.', '', '2015-03-15 20:05:39', '2015-03-15 23:05:42', 1),
(3, 3, 'Persoonlijke instellingen', 'Persoonlijke instellingen', 'persoonlijke-instellingen', 'Persoonlijke instellingen', 'Hier vind je je persoonlijke instellingen. Wijzig je instellingen en sla ze daarna op.', '', '2015-03-15 20:05:39', '2015-03-15 23:45:39', 1),
(4, 4, 'Logboek', 'Logboek', '', 'Logboek', 'Hier vind je een overzicht van je gelogte uren. Voeg nieuwe uren toe of wijzig de bestaande.', '', '2015-03-15 22:33:51', '2015-03-15 22:33:51', 1),
(5, 5, 'Groepsinstellingen', 'Groepsinstellingen', 'groepsinstellingen', 'Groepsinstellingen', 'Hier vind je de groepsinstellingen van jouw groep. Pas de instellingen aan en sla deze daarna op.', '', '2015-03-15 22:48:42', '2015-03-15 22:49:06', 1),
(6, 6, 'Login', 'Login', 'login', 'Login', 'Hier kun je inloggen', '', '2015-03-23 20:05:39', '2015-03-23 18:32:22', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `periodes`
--

CREATE TABLE IF NOT EXISTS `periodes` (
`periode_id` int(10) unsigned NOT NULL,
  `startdate` date NOT NULL,
  `stopdate` date NOT NULL,
  `periode_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `periodes`
--

INSERT INTO `periodes` (`periode_id`, `startdate`, `stopdate`, `periode_name`, `location_id`, `created_at`, `updated_at`) VALUES
(1, '0000-00-00', '0000-00-00', 'periode', 1, '2015-03-23 20:12:48', '2015-03-23 20:12:48');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projectcategories`
--

CREATE TABLE IF NOT EXISTS `projectcategories` (
`projectcategories_id` int(10) unsigned NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `projectcategories`
--

INSERT INTO `projectcategories` (`projectcategories_id`, `categorie_id`, `project_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2015-03-23 20:13:34', '2015-03-23 20:13:34');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projectgroup`
--

CREATE TABLE IF NOT EXISTS `projectgroup` (
`projectgroup_id` int(10) unsigned NOT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `projectgroup`
--

INSERT INTO `projectgroup` (`projectgroup_id`, `leveltype_id`, `year_id`, `adress_id`, `location_id`, `coach_id`, `leader_id`, `task_id`, `code`, `projectgroup_name`, `image_path`, `created_at`, `updated_at`, `active`) VALUES
(1, 1, 1, 1, 1, NULL, 5, NULL, '5646545', 'Lions', '10406878_808864912480100_214431081879684123_n.jpg', '2015-03-23 20:11:54', '2015-04-07 19:11:51', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projectgroup_categories`
--

CREATE TABLE IF NOT EXISTS `projectgroup_categories` (
`projectgroup_categorie_id` int(10) unsigned NOT NULL,
  `projectgroup_periode_id` int(10) unsigned NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `projectgroup_categories`
--

INSERT INTO `projectgroup_categories` (`projectgroup_categorie_id`, `projectgroup_periode_id`, `categorie_id`, `is_done`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2015-03-23 20:13:45', '2015-03-23 20:13:45');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projectgroup_periode`
--

CREATE TABLE IF NOT EXISTS `projectgroup_periode` (
`projectgroup_periode_id` int(10) unsigned NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `periode_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `projectgroup_periode`
--

INSERT INTO `projectgroup_periode` (`projectgroup_periode_id`, `is_done`, `projectgroup_id`, `project_id`, `periode_id`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 3, NULL, '2015-03-23 20:12:24', '2015-03-23 20:12:24');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
`project_id` int(10) unsigned NOT NULL,
  `project_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `leveltype_id` int(10) unsigned DEFAULT NULL,
  `done` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `projects`
--

INSERT INTO `projects` (`project_id`, `project_name`, `project`, `task_id`, `location_id`, `leveltype_id`, `done`, `created_at`, `updated_at`, `active`) VALUES
(3, 'Logtime', 'Logtime', 1, 1, 1, 0, '2015-03-23 19:56:03', '2015-04-08 11:17:28', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `studentwage`
--

CREATE TABLE IF NOT EXISTS `studentwage` (
`studentwage_id` int(10) unsigned NOT NULL,
  `wage` double(10,2) NOT NULL,
  `project_group_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `studentwage`
--

INSERT INTO `studentwage` (`studentwage_id`, `wage`, `project_group_id`, `created_at`, `updated_at`) VALUES
(1, 7.50, 1, '2015-03-24 16:10:28', '2015-04-07 19:11:50');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `subgroups`
--

CREATE TABLE IF NOT EXISTS `subgroups` (
`subgroup_id` int(10) unsigned NOT NULL,
  `subgroup_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
`task_id` int(10) unsigned NOT NULL,
  `taskname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userlogs`
--

CREATE TABLE IF NOT EXISTS `userlogs` (
`userlog_id` int(10) unsigned NOT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usernotifications`
--

CREATE TABLE IF NOT EXISTS `usernotifications` (
`usernotification_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(10) unsigned NOT NULL,
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
  `adress_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`user_id`, `usercode`, `password`, `firstname`, `lastname`, `email`, `user_image_path`, `phone_number`, `lasttime_online`, `remember_token`, `usertype_id`, `location_id`, `projectgroup_id`, `adress_id`, `created_at`, `updated_at`, `active`) VALUES
(5, '1337', '26c669cd0814ac40e5328752b21c4aa6450d16295e4eec30356a06a911c23983aaebe12d5da38eeebfc1b213be650498df8419194d5a26c7e0a50af156853c79', 'Yannick', 'Berendsen', 'mryannickz@live.nl', 'avatar1.png', '', '2015-04-08 10:59:57', NULL, 1, 1, 1, 1, '2015-03-23 20:16:16', '2015-04-08 10:59:57', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usertypes`
--

CREATE TABLE IF NOT EXISTS `usertypes` (
`usertype_id` int(10) unsigned NOT NULL,
  `usertype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `usertypes`
--

INSERT INTO `usertypes` (`usertype_id`, `usertype`, `created_at`, `updated_at`) VALUES
(1, 'Student', '2015-04-08 10:59:49', '2015-04-08 10:59:49'),
(2, 'Docent', '2015-03-23 19:47:26', '2015-03-23 19:47:47');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_subgroups`
--

CREATE TABLE IF NOT EXISTS `user_subgroups` (
`user_subgroup_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `projectgroup_id` int(10) unsigned NOT NULL,
  `subgroup_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `years`
--

CREATE TABLE IF NOT EXISTS `years` (
  `year_id` int(10) unsigned NOT NULL,
  `year` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `years`
--

INSERT INTO `years` (`year_id`, `year`, `nickname`, `location_id`, `created_at`, `updated_at`) VALUES
(1, '1', 'lions', 1, '2015-03-23 19:53:47', '2015-03-23 19:53:54');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `adresses`
--
ALTER TABLE `adresses`
 ADD PRIMARY KEY (`adress_id`);

--
-- Indexen voor tabel `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`categorie_id`);

--
-- Indexen voor tabel `customers`
--
ALTER TABLE `customers`
 ADD PRIMARY KEY (`customer_id`), ADD KEY `customers_project_group_id_foreign` (`projectgroup_id`), ADD KEY `customers_project_id_foreign` (`project_id`), ADD KEY `customers_adress_id_foreign` (`adress_id`);

--
-- Indexen voor tabel `estimated_time`
--
ALTER TABLE `estimated_time`
 ADD PRIMARY KEY (`estimated_time_id`), ADD KEY `estimated_time_project_group_id_foreign` (`projectgroup_id`), ADD KEY `estimated_time_task_id_foreign` (`task_id`), ADD KEY `estimated_time_user_id_foreign` (`user_id`);

--
-- Indexen voor tabel `forgotten_passwordtokens`
--
ALTER TABLE `forgotten_passwordtokens`
 ADD PRIMARY KEY (`forgotten_passwordtoken_id`), ADD KEY `forgotten_password_tokens_user_id_foreign` (`user_id`);

--
-- Indexen voor tabel `holidays`
--
ALTER TABLE `holidays`
 ADD PRIMARY KEY (`holiday_id`), ADD KEY `holidays_periode_id_foreign` (`periode_id`);

--
-- Indexen voor tabel `leveltypes`
--
ALTER TABLE `leveltypes`
 ADD PRIMARY KEY (`leveltype_id`);

--
-- Indexen voor tabel `locations`
--
ALTER TABLE `locations`
 ADD PRIMARY KEY (`location_id`);

--
-- Indexen voor tabel `login_attempts`
--
ALTER TABLE `login_attempts`
 ADD PRIMARY KEY (`login_attempt_id`), ADD KEY `login_attempts_user_id_foreign` (`user_id`);

--
-- Indexen voor tabel `notifications`
--
ALTER TABLE `notifications`
 ADD PRIMARY KEY (`notification_id`);

--
-- Indexen voor tabel `onderdelen`
--
ALTER TABLE `onderdelen`
 ADD PRIMARY KEY (`onderdeel_id`);

--
-- Indexen voor tabel `paginas`
--
ALTER TABLE `paginas`
 ADD PRIMARY KEY (`pagina_id`);

--
-- Indexen voor tabel `periodes`
--
ALTER TABLE `periodes`
 ADD PRIMARY KEY (`periode_id`), ADD KEY `periodes_location_id_foreign` (`location_id`);

--
-- Indexen voor tabel `projectcategories`
--
ALTER TABLE `projectcategories`
 ADD PRIMARY KEY (`projectcategories_id`), ADD KEY `categories_projects_categorie_id_foreign` (`categorie_id`), ADD KEY `categories_projects_project_id_foreign` (`project_id`);

--
-- Indexen voor tabel `projectgroup`
--
ALTER TABLE `projectgroup`
 ADD PRIMARY KEY (`projectgroup_id`), ADD KEY `project_groups_year_id_foreign` (`year_id`), ADD KEY `project_groups_adress_id_foreign` (`adress_id`), ADD KEY `project_groups_location_id_foreign` (`location_id`), ADD KEY `project_groups_coach_id_foreign` (`coach_id`), ADD KEY `project_groups_leader_id_foreign` (`leader_id`);

--
-- Indexen voor tabel `projectgroup_categories`
--
ALTER TABLE `projectgroup_categories`
 ADD PRIMARY KEY (`projectgroup_categorie_id`), ADD KEY `group_project_categories_group_project_periode_id_foreign` (`projectgroup_periode_id`), ADD KEY `group_project_categories_categorie_id_foreign` (`categorie_id`);

--
-- Indexen voor tabel `projectgroup_periode`
--
ALTER TABLE `projectgroup_periode`
 ADD PRIMARY KEY (`projectgroup_periode_id`), ADD KEY `group_project_periode_project_group_id_foreign` (`projectgroup_id`), ADD KEY `group_project_periode_project_id_foreign` (`project_id`), ADD KEY `group_project_periode_periode_id_foreign` (`periode_id`);

--
-- Indexen voor tabel `projects`
--
ALTER TABLE `projects`
 ADD PRIMARY KEY (`project_id`), ADD KEY `projects_location_id_foreign` (`location_id`);

--
-- Indexen voor tabel `studentwage`
--
ALTER TABLE `studentwage`
 ADD PRIMARY KEY (`studentwage_id`), ADD KEY `student_wage_project_group_id_foreign` (`project_group_id`);

--
-- Indexen voor tabel `subgroups`
--
ALTER TABLE `subgroups`
 ADD PRIMARY KEY (`subgroup_id`);

--
-- Indexen voor tabel `tasks`
--
ALTER TABLE `tasks`
 ADD PRIMARY KEY (`task_id`), ADD KEY `tasks_categorie_id_foreign` (`categorie_id`);

--
-- Indexen voor tabel `userlogs`
--
ALTER TABLE `userlogs`
 ADD PRIMARY KEY (`userlog_id`), ADD KEY `user_logs_user_id_foreign` (`user_id`), ADD KEY `user_logs_task_id_foreign` (`task_id`);

--
-- Indexen voor tabel `usernotifications`
--
ALTER TABLE `usernotifications`
 ADD PRIMARY KEY (`usernotification_id`), ADD KEY `user_notifications_user_id_foreign` (`user_id`), ADD KEY `user_notifications_notification_id_foreign` (`notification_id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD KEY `users_user_type_id_foreign` (`usertype_id`), ADD KEY `users_location_id_foreign` (`location_id`), ADD KEY `users_project_group_id_foreign` (`projectgroup_id`), ADD KEY `users_adress_id_foreign` (`adress_id`);

--
-- Indexen voor tabel `usertypes`
--
ALTER TABLE `usertypes`
 ADD PRIMARY KEY (`usertype_id`);

--
-- Indexen voor tabel `user_subgroups`
--
ALTER TABLE `user_subgroups`
 ADD PRIMARY KEY (`user_subgroup_id`), ADD KEY `user_sub_groups_user_id_foreign` (`user_id`), ADD KEY `user_sub_groups_project_group_id_foreign` (`projectgroup_id`), ADD KEY `user_sub_groups_sub_group_id_foreign` (`subgroup_id`);

--
-- Indexen voor tabel `years`
--
ALTER TABLE `years`
 ADD PRIMARY KEY (`year_id`), ADD KEY `years_location_id_foreign` (`location_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `adresses`
--
ALTER TABLE `adresses`
MODIFY `adress_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT voor een tabel `categories`
--
ALTER TABLE `categories`
MODIFY `categorie_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `customers`
--
ALTER TABLE `customers`
MODIFY `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `estimated_time`
--
ALTER TABLE `estimated_time`
MODIFY `estimated_time_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `holidays`
--
ALTER TABLE `holidays`
MODIFY `holiday_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `leveltypes`
--
ALTER TABLE `leveltypes`
MODIFY `leveltype_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `locations`
--
ALTER TABLE `locations`
MODIFY `location_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `login_attempts`
--
ALTER TABLE `login_attempts`
MODIFY `login_attempt_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `notifications`
--
ALTER TABLE `notifications`
MODIFY `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `onderdelen`
--
ALTER TABLE `onderdelen`
MODIFY `onderdeel_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT voor een tabel `paginas`
--
ALTER TABLE `paginas`
MODIFY `pagina_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT voor een tabel `periodes`
--
ALTER TABLE `periodes`
MODIFY `periode_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `projectcategories`
--
ALTER TABLE `projectcategories`
MODIFY `projectcategories_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `projectgroup`
--
ALTER TABLE `projectgroup`
MODIFY `projectgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `projectgroup_categories`
--
ALTER TABLE `projectgroup_categories`
MODIFY `projectgroup_categorie_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `projectgroup_periode`
--
ALTER TABLE `projectgroup_periode`
MODIFY `projectgroup_periode_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `projects`
--
ALTER TABLE `projects`
MODIFY `project_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT voor een tabel `studentwage`
--
ALTER TABLE `studentwage`
MODIFY `studentwage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT voor een tabel `subgroups`
--
ALTER TABLE `subgroups`
MODIFY `subgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `tasks`
--
ALTER TABLE `tasks`
MODIFY `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `userlogs`
--
ALTER TABLE `userlogs`
MODIFY `userlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `usernotifications`
--
ALTER TABLE `usernotifications`
MODIFY `usernotification_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT voor een tabel `usertypes`
--
ALTER TABLE `usertypes`
MODIFY `usertype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `user_subgroups`
--
ALTER TABLE `user_subgroups`
MODIFY `user_subgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `customers`
--
ALTER TABLE `customers`
ADD CONSTRAINT `customers_adress_id_foreign` FOREIGN KEY (`adress_id`) REFERENCES `adresses` (`adress_id`),
ADD CONSTRAINT `customers_project_group_id_foreign` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`),
ADD CONSTRAINT `customers_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Beperkingen voor tabel `estimated_time`
--
ALTER TABLE `estimated_time`
ADD CONSTRAINT `estimated_time_project_group_id_foreign` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`),
ADD CONSTRAINT `estimated_time_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
ADD CONSTRAINT `estimated_time_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Beperkingen voor tabel `forgotten_passwordtokens`
--
ALTER TABLE `forgotten_passwordtokens`
ADD CONSTRAINT `forgotten_password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Beperkingen voor tabel `holidays`
--
ALTER TABLE `holidays`
ADD CONSTRAINT `holidays_periode_id_foreign` FOREIGN KEY (`periode_id`) REFERENCES `periodes` (`periode_id`);

--
-- Beperkingen voor tabel `login_attempts`
--
ALTER TABLE `login_attempts`
ADD CONSTRAINT `login_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Beperkingen voor tabel `periodes`
--
ALTER TABLE `periodes`
ADD CONSTRAINT `periodes_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Beperkingen voor tabel `projectcategories`
--
ALTER TABLE `projectcategories`
ADD CONSTRAINT `categories_projects_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`categorie_id`),
ADD CONSTRAINT `categories_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Beperkingen voor tabel `projectgroup`
--
ALTER TABLE `projectgroup`
ADD CONSTRAINT `project_groups_adress_id_foreign` FOREIGN KEY (`adress_id`) REFERENCES `adresses` (`adress_id`),
ADD CONSTRAINT `project_groups_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `users` (`user_id`),
ADD CONSTRAINT `project_groups_leader_id_foreign` FOREIGN KEY (`leader_id`) REFERENCES `users` (`user_id`),
ADD CONSTRAINT `project_groups_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
ADD CONSTRAINT `project_groups_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`);

--
-- Beperkingen voor tabel `projectgroup_categories`
--
ALTER TABLE `projectgroup_categories`
ADD CONSTRAINT `group_project_categories_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`categorie_id`),
ADD CONSTRAINT `group_project_categories_group_project_periode_id_foreign` FOREIGN KEY (`projectgroup_periode_id`) REFERENCES `projectgroup_periode` (`projectgroup_periode_id`);

--
-- Beperkingen voor tabel `projectgroup_periode`
--
ALTER TABLE `projectgroup_periode`
ADD CONSTRAINT `group_project_periode_periode_id_foreign` FOREIGN KEY (`periode_id`) REFERENCES `periodes` (`periode_id`),
ADD CONSTRAINT `group_project_periode_project_group_id_foreign` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`),
ADD CONSTRAINT `group_project_periode_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Beperkingen voor tabel `projects`
--
ALTER TABLE `projects`
ADD CONSTRAINT `projects_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Beperkingen voor tabel `studentwage`
--
ALTER TABLE `studentwage`
ADD CONSTRAINT `student_wage_project_group_id_foreign` FOREIGN KEY (`project_group_id`) REFERENCES `projectgroup` (`projectgroup_id`);

--
-- Beperkingen voor tabel `tasks`
--
ALTER TABLE `tasks`
ADD CONSTRAINT `tasks_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`categorie_id`);

--
-- Beperkingen voor tabel `userlogs`
--
ALTER TABLE `userlogs`
ADD CONSTRAINT `user_logs_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
ADD CONSTRAINT `user_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Beperkingen voor tabel `usernotifications`
--
ALTER TABLE `usernotifications`
ADD CONSTRAINT `user_notifications_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
ADD CONSTRAINT `user_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Beperkingen voor tabel `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_adress_id_foreign` FOREIGN KEY (`adress_id`) REFERENCES `adresses` (`adress_id`),
ADD CONSTRAINT `users_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
ADD CONSTRAINT `users_project_group_id_foreign` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`),
ADD CONSTRAINT `users_user_type_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertypes` (`usertype_id`);

--
-- Beperkingen voor tabel `user_subgroups`
--
ALTER TABLE `user_subgroups`
ADD CONSTRAINT `user_sub_groups_project_group_id_foreign` FOREIGN KEY (`projectgroup_id`) REFERENCES `projectgroup` (`projectgroup_id`),
ADD CONSTRAINT `user_sub_groups_sub_group_id_foreign` FOREIGN KEY (`subgroup_id`) REFERENCES `categories` (`categorie_id`),
ADD CONSTRAINT `user_sub_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Beperkingen voor tabel `years`
--
ALTER TABLE `years`
ADD CONSTRAINT `years_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
