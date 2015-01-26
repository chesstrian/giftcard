-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-08-2011 a las 18:47:29
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.2-1ubuntu4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db_giftcard`
--
CREATE DATABASE `db_giftcard` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_giftcard`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `call_log`
--

CREATE TABLE IF NOT EXISTS `call_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(32) NOT NULL,
  `callerid` varchar(20) DEFAULT NULL,
  `start_epoch` datetime NOT NULL,
  `end_epoch` datetime NOT NULL,
  `code_ingresed` varchar(30) DEFAULT NULL,
  `ivr` varchar(20) NOT NULL,
  `result` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `call_log`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `card`
--

CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `generation_date` datetime NOT NULL,
  `use_date` datetime DEFAULT NULL,
  `expiration_date` datetime NOT NULL,
  `initial_value` int(11) NOT NULL,
  `callerid` varchar(20) DEFAULT NULL,
  `actual_value` int(11) NOT NULL,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `card`
--

INSERT INTO `card` (`id`, `code`, `generation_date`, `use_date`, `expiration_date`, `initial_value`, `callerid`, `actual_value`, `active`) VALUES
(1, '1234567890', '2011-08-26 12:04:57', NULL, '2021-08-26 12:04:57', 100000, NULL, 100000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confirmation_log`
--

CREATE TABLE IF NOT EXISTS `confirmation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(20) NOT NULL,
  `code_verified` varchar(30) NOT NULL,
  `amount_approved` int(11) NOT NULL,
  `start_epoch` datetime NOT NULL,
  `end_epoch` datetime NOT NULL,
  `result` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code_verified` (`code_verified`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `confirmation_log`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seller`
--

CREATE TABLE IF NOT EXISTS `seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `seller`
--


--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `confirmation_log`
--
ALTER TABLE `confirmation_log`
  ADD CONSTRAINT `confirmation_log_ibfk_1` FOREIGN KEY (`code_verified`) REFERENCES `card` (`code`);
