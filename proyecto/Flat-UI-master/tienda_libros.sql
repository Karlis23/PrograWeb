-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2013 a las 00:34:44
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tienda_libros`
--
CREATE DATABASE IF NOT EXISTS `tienda_libros` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tienda_libros`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aparador`
--

CREATE TABLE IF NOT EXISTS `aparador` (
  `id_aparador` char(5) NOT NULL,
  `tipo_aparador` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_aparador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` char(5) NOT NULL,
  `nombre_cliente` varchar(25) DEFAULT NULL,
  `apellido_paterno` varchar(25) DEFAULT NULL,
  `apellido_materno` varchar(25) DEFAULT NULL,
  `telefono` char(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id_libro` char(5) NOT NULL DEFAULT '',
  `id_venta` char(5) NOT NULL DEFAULT '',
  `cantidad` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`,`id_libro`),
  KEY `id_libro` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `id_empleado` char(5) NOT NULL,
  `nombre_empleado` varchar(20) DEFAULT NULL,
  `apellido_paterno_empleado` varchar(20) DEFAULT NULL,
  `apellido_materno_empleado` varchar(20) DEFAULT NULL,
  `edad` char(2) DEFAULT NULL,
  `calle_empleado` varchar(25) DEFAULT NULL,
  `colonia_empleado` varchar(25) DEFAULT NULL,
  `numero_empleado` char(3) DEFAULT NULL,
  `telefono` char(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `id_tipo_empleado` char(5) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_tipo_empleado` (`id_tipo_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` char(5) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
  `id_genero` char(5) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE IF NOT EXISTS `libro` (
  `id_libro` char(5) NOT NULL,
  `nombre_libro` varchar(25) DEFAULT NULL,
  `no_copias` int(11) DEFAULT NULL,
  `id_genero` char(5) DEFAULT NULL,
  `id_aparador` char(5) DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `id_genero` (`id_genero`),
  KEY `id_aparador` (`id_aparador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE IF NOT EXISTS `municipio` (
  `id_municipio` char(5) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_municipio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE IF NOT EXISTS `prestamo` (
  `id_prestamo` char(5) NOT NULL,
  `id_socio` char(5) DEFAULT NULL,
  `id_empleado` char(5) DEFAULT NULL,
  `id_tienda` char(5) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `costo_prestamo` float DEFAULT NULL,
  `total_prestamo` float DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `id_socio` (`id_socio`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_tienda` (`id_tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE IF NOT EXISTS `socio` (
  `id_socio` char(5) NOT NULL,
  `id_cliente` char(5) DEFAULT NULL,
  `id_status` char(5) DEFAULT NULL,
  `calle_socio` varchar(25) DEFAULT NULL,
  `colonia_socio` varchar(25) DEFAULT NULL,
  `numero_socio` char(3) DEFAULT NULL,
  `id_municipio` char(5) DEFAULT NULL,
  `id_estado` char(5) DEFAULT NULL,
  PRIMARY KEY (`id_socio`),
  KEY `id_municipio` (`id_municipio`),
  KEY `id_estado` (`id_estado`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_status` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_socio`
--

CREATE TABLE IF NOT EXISTS `status_socio` (
  `id_status` char(5) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE IF NOT EXISTS `tienda` (
  `id_tienda` char(5) NOT NULL,
  `nombre_tienda` varchar(25) DEFAULT NULL,
  `no_tienda` char(3) DEFAULT NULL,
  `calle_tienda` varchar(25) DEFAULT NULL,
  `colonia_tienda` varchar(25) DEFAULT NULL,
  `id_estado` char(5) DEFAULT NULL,
  `id_municipio` char(5) DEFAULT NULL,
  `id_empleado` char(5) DEFAULT NULL,
  PRIMARY KEY (`id_tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE IF NOT EXISTS `tipo_empleado` (
  `id_tipo_empleado` char(5) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_libros`
--

CREATE TABLE IF NOT EXISTS `venta_libros` (
  `id_venta` char(5) NOT NULL,
  `id_cliente` char(5) DEFAULT NULL,
  `id_empleado` char(5) DEFAULT NULL,
  `id_tienda` char(5) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_tienda` (`id_tienda`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `venta_libros` (`id_venta`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_tipo_empleado`) REFERENCES `tipo_empleado` (`id_tipo_empleado`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`id_aparador`) REFERENCES `aparador` (`id_aparador`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `prestamo_ibfk_3` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`);

--
-- Filtros para la tabla `socio`
--
ALTER TABLE `socio`
  ADD CONSTRAINT `socio_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`),
  ADD CONSTRAINT `socio_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `socio_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `socio_ibfk_4` FOREIGN KEY (`id_status`) REFERENCES `status_socio` (`id_status`);

--
-- Filtros para la tabla `venta_libros`
--
ALTER TABLE `venta_libros`
  ADD CONSTRAINT `venta_libros_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`),
  ADD CONSTRAINT `venta_libros_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `venta_libros_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
