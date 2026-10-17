-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2026 a las 21:00:01
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_clinicadental`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Estado` enum('Pendiente de confirmacion','Cancelada','Aprobada') NOT NULL,
  `id_pacientes` int(11) NOT NULL,
  `id_tratamientos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `Fecha`, `Hora`, `Estado`, `id_pacientes`, `id_tratamientos`) VALUES
(5, '2026-10-22', '09:30:00', 'Cancelada', 5, 6),
(11, '2026-10-20', '09:00:00', 'Cancelada', 1, 1),
(12, '2026-10-20', '10:30:00', 'Pendiente de confirmacion', 2, 4),
(13, '2026-10-21', '08:00:00', 'Aprobada', 3, 5),
(14, '2026-10-21', '11:00:00', 'Aprobada', 4, 2),
(15, '2026-10-22', '09:30:00', 'Cancelada', 5, 6),
(16, '2026-10-22', '14:00:00', 'Aprobada', 6, 9),
(17, '2026-10-23', '10:00:00', 'Cancelada', 7, 7),
(18, '2026-10-23', '15:30:00', 'Aprobada', 8, 3),
(19, '2026-10-24', '08:30:00', 'Aprobada', 9, 8),
(20, '2026-10-24', '13:00:00', 'Aprobada', 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(5) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Teléfono` varchar(20) NOT NULL,
  `Fecha_de_nacimiento` date NOT NULL,
  `Dirección` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `Nombre`, `Apellido`, `Teléfono`, `Fecha_de_nacimiento`, `Dirección`) VALUES
(1, 'María', 'González', '7012-3456', '1990-05-14', 'Col. Escalón, San Salvador'),
(2, 'Carlos', 'Martínez', '7098-7654', '1985-11-02', 'San Benito, San Salvador'),
(3, 'Ana', 'López', '7765-2345', '1998-02-20', 'Santa Tecla, La Libertad'),
(4, 'Jorge', 'Ramírez', '7421-9876', '1979-07-09', 'Antiguo Cuscatlán'),
(5, 'Lucía', 'Flores', '7012-6543', '2001-09-30', 'Mejicanos, San Salvador'),
(6, 'Pedro', 'Hernández', '7890-1234', '1992-03-18', 'Soyapango, San Salvador'),
(7, 'Daniela', 'Castro', '7345-6789', '1988-12-05', 'San Marcos, San Salvador'),
(8, 'Roberto', 'Mejía', '7654-3210', '1975-06-25', 'Apopa, San Salvador'),
(9, 'Sofía', 'Vásquez', '7123-4567', '1995-01-12', 'Ilopango, San Salvador'),
(10, 'Diego', 'Reyes', '7987-6543', '1983-10-08', 'Ciudad Delgado, San Salvador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `id_tratamiento` int(4) NOT NULL,
  `Nombre_tratamiento` varchar(100) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Costo` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tratamientos`
--

INSERT INTO `tratamientos` (`id_tratamiento`, `Nombre_tratamiento`, `Descripcion`, `Costo`) VALUES
(1, 'Limpieza dental', 'Profilaxis y remoción de sarro', 25.00),
(2, 'Extracción simple', 'Extracción de pieza dental sin complicaciones', 40.00),
(3, 'Extracción quirúrgica', 'Extracción de muela del juicio u otra compleja', 90.00),
(4, 'Resina dental', 'Restauración estética con resina compuesta', 35.00),
(5, 'Endodoncia', 'Tratamiento de conducto radicular', 120.00),
(6, 'Blanqueamiento dental', 'Aclaramiento del color de los dientes', 80.00),
(7, 'Corona dental', 'Colocación de corona protésica', 150.00),
(8, 'Ortodoncia (consulta)', 'Evaluación inicial para brackets', 30.00),
(9, 'Aplicación de flúor', 'Tratamiento preventivo con flúor', 15.00),
(10, 'Radiografía dental', 'Toma de radiografía panorámica o periapical', 20.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_pacientes` (`id_pacientes`),
  ADD KEY `id_tratamientos` (`id_tratamientos`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`id_tratamiento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `id_tratamiento` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_pacientes`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_tratamientos`) REFERENCES `tratamientos` (`id_tratamiento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
