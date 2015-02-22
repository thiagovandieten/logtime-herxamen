-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2015 at 10:39 PM
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
-- Table structure for table `onderdelen`
--

CREATE TABLE IF NOT EXISTS `onderdelen` (
  `onderdeel_id` int(10) NOT NULL AUTO_INCREMENT,
  `onderdeel` varchar(255) NOT NULL,
  `onderdeel_url` varchar(255) NOT NULL,
  `menubalk` int(10) NOT NULL DEFAULT '1',
  `actief` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`onderdeel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `onderdelen`
--

INSERT INTO `onderdelen` (`onderdeel_id`, `onderdeel`, `onderdeel_url`, `menubalk`, `actief`) VALUES
(1, 'home', '', 1, 1),
(2, 'gebruikers', 'gebruikers', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `paginas`
--

CREATE TABLE IF NOT EXISTS `paginas` (
  `pagina_id` int(10) NOT NULL AUTO_INCREMENT,
  `titel` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `kop` varchar(255) NOT NULL,
  `tekst` varchar(255) NOT NULL,
  `onderdeel_id` int(10) NOT NULL,
  `element` varchar(255) NOT NULL,
  `actief` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pagina_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `paginas`
--

INSERT INTO `paginas` (`pagina_id`, `titel`, `body`, `kop`, `tekst`, `onderdeel_id`, `element`, `actief`) VALUES
(1, 'Home', 'home.php', 'Logtime V2', 'Logtime - Makes Work Fun Again', 1, '', 1),
(2, 'Gebruikers', 'pagina.php', 'Gebruikers', 'Deze zin wordt in de content.php uit de database gehaald', 2, 'gebruikers.php', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
