-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2021 a las 04:54:30
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `paquetesturisticos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Rut` varchar(8) NOT NULL COMMENT 'RUT del cliente sin puntos ni guión.',
  `ID_Paquete` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `FechaNac` date NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Rut`, `ID_Paquete`, `Nombre`, `FechaNac`, `Telefono`, `Email`) VALUES
('12436520', 1001, 'John Baltica', '1987-01-01', 938576323, 'balticrazy@gmail.com'),
('17348561', 1002, 'Pedro Pedrero', '1988-03-14', 946573535, 'pedropedre@gmail.com'),
('18123456', 1003, 'Juan Perez', '1990-01-22', 32124322, 'juanperez@gmail.com'),
('20333132', 1004, 'Elvis Tek', '2001-02-28', 945787378, 'elvistek@gmail.com'),
('8576822', 1005, 'Gonzalo Gonzalez', '1962-06-29', 3254709, 'gonzgonz@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `ID_Boleta` int(11) NOT NULL,
  `Rut` varchar(8) NOT NULL,
  `Valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`ID_Boleta`, `Rut`, `Valor`) VALUES
(123, '18123456', 500000),
(234, '17348561', 400000),
(345, '8576822', 550000),
(456, '12436520', 750000),
(567, '20333132', 1000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `ID_Paquete` int(11) NOT NULL,
  `ID_Pasaje` int(11) NOT NULL,
  `Cant_Personas` int(11) NOT NULL,
  `Automovil` varchar(60) NOT NULL,
  `Restaurante` varchar(60) NOT NULL,
  `Aire_Ac` tinyint(1) NOT NULL DEFAULT 0,
  `Wifi` tinyint(1) NOT NULL DEFAULT 0,
  `Sanitización` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Control sanitario',
  `Piscina` tinyint(1) NOT NULL DEFAULT 0,
  `Hospedaje` tinyint(1) NOT NULL DEFAULT 0,
  `PackBebes` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`ID_Paquete`, `ID_Pasaje`, `Cant_Personas`, `Automovil`, `Restaurante`, `Aire_Ac`, `Wifi`, `Sanitización`, `Piscina`, `Hospedaje`, `PackBebes`) VALUES
(1001, 80186, 1, 'No', 'No', 1, 1, 1, 0, 1, 0),
(1002, 80286, 3, 'Si', 'No', 1, 1, 1, 1, 1, 1),
(1003, 80386, 2, 'No', 'No', 1, 1, 1, 0, 0, 0),
(1004, 80486, 1, 'No', 'No', 1, 1, 1, 0, 0, 0),
(1005, 80586, 4, 'Si', 'Si', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasaje`
--

CREATE TABLE `pasaje` (
  `ID_Pasaje` int(11) NOT NULL,
  `ID_Vuelo` int(11) NOT NULL,
  `Clase` varchar(30) NOT NULL COMMENT 'Tipo de clase para el viaje	\r\n',
  `Asiento` int(11) NOT NULL,
  `Valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pasaje`
--

INSERT INTO `pasaje` (`ID_Pasaje`, `ID_Vuelo`, `Clase`, `Asiento`, `Valor`) VALUES
(80186, 186, 'Economica', 22, 500000),
(80286, 286, 'Economica', 33, 400000),
(80386, 386, 'Economica', 55, 550000),
(80486, 486, 'Premium', 14, 750000),
(80586, 586, 'Ejecutiva', 5, 1000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `ID_Ruta` int(11) NOT NULL,
  `Aeropuerto_Origen` varchar(30) NOT NULL,
  `Aeropuerto_Destino` varchar(30) NOT NULL,
  `Pais_Origen` varchar(20) NOT NULL,
  `Pais_Destino` varchar(20) NOT NULL,
  `Fecha_Ida` date NOT NULL,
  `Fecha_Vuelta` date NOT NULL,
  `Hora_Salida` time NOT NULL,
  `Hora_Vuelta` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`ID_Ruta`, `Aeropuerto_Origen`, `Aeropuerto_Destino`, `Pais_Origen`, `Pais_Destino`, `Fecha_Ida`, `Fecha_Vuelta`, `Hora_Salida`, `Hora_Vuelta`) VALUES
(1111, 'A.Inter.Arturo Merino Benítez', 'Aeropuerto de Brasil', 'Chile', 'Brasil', '2021-09-30', '2021-10-07', '08:30:00', '09:00:00'),
(1212, 'A.Inter.Arturo Merino Benítez', 'Aeropuerto de Peru', 'Chile', 'Peru', '2021-10-12', '2021-10-20', '07:30:00', '10:00:00'),
(1313, 'A.Inter.Arturo Merino Benítez', 'Aeropuerto de Argentina', 'Chile', 'Argentina', '2021-10-10', '2021-10-12', '05:00:00', '12:00:00'),
(1414, 'A.Inter.Arturo Merino Benítez', 'Aeropuerto de Colombia', 'Chile', 'Colombia', '2021-11-01', '2021-11-25', '09:00:00', '23:00:00'),
(1515, 'A.Inter.Arturo Merino Benítez', 'Aeropuerto de Mexico', 'Chile', 'Mexico', '2021-12-07', '2022-01-07', '23:00:00', '17:30:00'),
(1616, 'A.Inter.Arturo Merino Benítez', 'Aeropuerto de Uruguay', 'Chile', 'Uruguay', '2021-12-01', '2022-02-01', '00:00:00', '01:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE `vuelo` (
  `ID_Vuelo` int(11) NOT NULL,
  `ID_Ruta` int(11) NOT NULL,
  `modeloAvion` varchar(20) NOT NULL,
  `Capacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vuelo`
--

INSERT INTO `vuelo` (`ID_Vuelo`, `ID_Ruta`, `modeloAvion`, `Capacidad`) VALUES
(186, 1111, 'Boeing 777', 500),
(286, 1212, 'Boeing 777', 550),
(386, 1313, 'Boeing 767', 200),
(486, 1414, 'Boeing 757', 100),
(586, 1515, 'Boeing 777', 500);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Rut`),
  ADD KEY `FK_Cliente_Paquete` (`ID_Paquete`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_Boleta`),
  ADD KEY `FK_Pago_Cliente` (`Rut`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`ID_Paquete`),
  ADD KEY `FK_Paquete_Pasaje` (`ID_Pasaje`);

--
-- Indices de la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD PRIMARY KEY (`ID_Pasaje`),
  ADD KEY `FK_Pasaje_Vuelo` (`ID_Vuelo`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`ID_Ruta`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`ID_Vuelo`),
  ADD KEY `FK_Vuelo_Ruta` (`ID_Ruta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `ID_Boleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- AUTO_INCREMENT de la tabla `paquete`
--
ALTER TABLE `paquete`
  MODIFY `ID_Paquete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT de la tabla `pasaje`
--
ALTER TABLE `pasaje`
  MODIFY `ID_Pasaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80687;

--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `ID_Ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1617;

--
-- AUTO_INCREMENT de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  MODIFY `ID_Vuelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=687;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_Cliente_Paquete` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquete` (`ID_Paquete`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `FK_Pago_Cliente` FOREIGN KEY (`Rut`) REFERENCES `cliente` (`Rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD CONSTRAINT `FK_Paquete_Pasaje` FOREIGN KEY (`ID_Pasaje`) REFERENCES `pasaje` (`ID_Pasaje`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD CONSTRAINT `FK_Pasaje_Vuelo` FOREIGN KEY (`ID_Vuelo`) REFERENCES `vuelo` (`ID_Vuelo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `FK_Vuelo_Ruta` FOREIGN KEY (`ID_Ruta`) REFERENCES `ruta` (`ID_Ruta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
