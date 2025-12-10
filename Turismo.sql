-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-10-2025 a las 20:15:01
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Turismo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `id_usuario`, `fecha_creacion`) VALUES
(1, 1, '2025-10-01'),
(2, 2, '2025-10-02'),
(3, 3, '2025-10-03'),
(4, 4, '2025-10-04'),
(5, 5, '2025-10-05'),
(6, 6, '2025-10-06'),
(7, 7, '2025-10-07'),
(8, 8, '2025-10-08'),
(9, 9, '2025-10-09'),
(10, 10, '2025-10-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_paquete` int(11) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id_compra`, `id_usuario`, `id_paquete`, `fecha_compra`, `estado`, `total`) VALUES
(1, 1, 3, '2026-01-10', 'Confirmada', 1800.00),
(2, 2, 2, '2026-08-15', 'confirmada', 1200.00),
(3, 3, 5, '2025-11-20', 'Confirmada', 1100.00),
(4, 4, 1, '2026-03-01', 'Confirmada', 650.00),
(5, 5, 4, '2025-12-01', 'Confirmada', 1500.00),
(6, 6, 6, '2026-01-05', 'Confirmada', 1300.00),
(7, 7, 7, '2026-03-15', 'Confirmada', 1400.00),
(8, 8, 8, '2026-02-10', 'Confirmada', 950.00),
(9, 9, 9, '2025-12-07', 'Confirmada', 2000.00),
(10, 10, 10, '2025-11-02', 'Confirmada', 900.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino`
--

CREATE TABLE `destino` (
  `id_destino` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `destino`
--

INSERT INTO `destino` (`id_destino`, `nombre`, `pais`, `tipo`) VALUES
(1, 'Bariloche', 'Argentina', 'Montaña'),
(2, 'Cancún', 'México', 'Playa'),
(3, 'París', 'Francia', 'Cultural'),
(4, 'Roma', 'Italia', 'Histórico'),
(5, 'New York', 'Estados Unidos', 'Urbano'),
(6, 'Madrid', 'España', 'Cultural'),
(7, 'Londres', 'Reino Unido', 'Ciudad'),
(8, 'Río de Janeiro', 'Brasil', 'Playa'),
(9, 'Tokio', 'Japón', 'Urbano'),
(10, 'Mendoza', 'Argentina', 'Montaña');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_carrito`
--

CREATE TABLE `detalle_carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_paquete` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_carrito`
--

INSERT INTO `detalle_carrito` (`id_carrito`, `id_paquete`, `cantidad`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 1),
(4, 4, 3),
(5, 5, 2),
(6, 6, 1),
(7, 7, 1),
(8, 8, 2),
(9, 9, 1),
(10, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `id_paquete` int(11) NOT NULL,
  `id_destino` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `duracion_dias` int(11) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `fecha_regreso` date DEFAULT NULL,
  `Estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`id_paquete`, `id_destino`, `nombre`, `descripcion`, `precio`, `duracion_dias`, `categoria`, `fecha_salida`, `fecha_regreso`, `Estado`) VALUES
(1, 1, 'Aventura Patagónica', 'Excursiones y nieve en Bariloche', 650.00, 7, 'Aventura', '2025-07-10', '2025-07-17', ''),
(2, 2, 'Sol y Mar Cancún', 'Hotel 4 estrellas y playa', 1200.00, 5, 'Playa', '2025-06-15', '2025-06-20', ''),
(3, 3, 'Romance en París', 'Cena en la Torre Eiffel y museos', 1800.00, 6, 'Romántico', '2025-09-01', '2025-09-07', ''),
(4, 4, 'Encantos de Roma', 'Visita al Coliseo y Vaticano', 1500.00, 5, 'Cultural', '2025-05-10', '2025-05-15', ''),
(5, 5, 'Luces de New York', 'Tour por Manhattan y espectáculos', 1100.00, 4, 'Urbano', '2025-12-10', '2025-12-14', ''),
(6, 6, 'Historia de Madrid', 'Museos y gastronomía española', 1300.00, 5, 'Cultural', '2025-04-15', '2025-04-20', ''),
(7, 7, 'Aventura en Londres', 'Excursiones y tours por la ciudad', 1400.00, 6, 'Urbano', '2025-03-10', '2025-03-16', ''),
(8, 8, 'Playas de Río', 'Carnaval y playa de Copacabana', 950.00, 5, 'Playa', '2025-02-01', '2025-02-06', ''),
(9, 9, 'Tecnología en Tokio', 'Tour por Akihabara y templos', 2000.00, 7, 'Moderno', '2025-08-05', '2025-08-12', ''),
(10, 10, 'Vinos de Mendoza', 'Visita a bodegas y montañas', 900.00, 4, 'Gastronómico', '2025-11-01', '2025-11-05', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete_servicio`
--

CREATE TABLE `paquete_servicio` (
  `id_paquete` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquete_servicio`
--

INSERT INTO `paquete_servicio` (`id_paquete`, `id_servicio`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(2, 4),
(2, 5),
(3, 2),
(3, 3),
(3, 8),
(4, 1),
(4, 2),
(4, 8),
(5, 1),
(5, 3),
(5, 9),
(6, 2),
(6, 3),
(6, 5),
(7, 1),
(7, 2),
(7, 6),
(8, 3),
(8, 5),
(8, 9),
(9, 1),
(9, 2),
(9, 10),
(10, 2),
(10, 3),
(10, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre`, `descripcion`) VALUES
(1, 'Traslados', 'Desde aeropuerto al hotel'),
(2, 'Guía turística', 'Guía local en excursiones'),
(3, 'Hotel 4 estrellas', 'Alojamiento con desayuno'),
(4, 'Seguro de viaje', 'Cobertura médica internacional'),
(5, 'Comidas incluidas', 'Desayuno, almuerzo y cena'),
(6, 'Excursiones', 'Actividades locales guiadas'),
(7, 'Transporte interno', 'Movilidad dentro del destino'),
(8, 'Entrada a museos', 'Incluye entradas a sitios culturales'),
(9, 'Fotografía', 'Servicio de fotos profesional'),
(10, 'Spa', 'Acceso a spa del hotel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `telefono`, `edad`) VALUES
(1, 'Jazmín Soria', 'jazmin@example.com', '351-6001001', 22),
(2, 'Lucas Pérez', 'lucas.perez@example.com', '351-6001002', 28),
(3, 'Valentina Ruiz', 'valen.ruiz@example.com', '351-6001003', 25),
(4, 'Martín Gómez', 'martin.gomez@example.com', '351-6001004', 31),
(5, 'Ana Torres', 'ana.torres@example.com', '351-6001005', 27),
(6, 'Camila López', 'camilopez@example.com', '351-6001006', 24),
(7, 'Santiago Díaz', 'santiago.diaz@example.com', '351-6001007', 29),
(8, 'Lucía Romero', 'lucia.romero@example.com', '351-6001008', 26),
(9, 'Tomás Fernández', 'tomas.fernandez@example.com', '351-6001009', 30),
(10, 'Florencia Medina', 'flor.medina@example.com', '351-6001010', 23);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_paquete` (`id_paquete`);

--
-- Indices de la tabla `destino`
--
ALTER TABLE `destino`
  ADD PRIMARY KEY (`id_destino`);

--
-- Indices de la tabla `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD PRIMARY KEY (`id_carrito`,`id_paquete`),
  ADD KEY `id_paquete` (`id_paquete`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`id_paquete`),
  ADD KEY `id_destino` (`id_destino`);

--
-- Indices de la tabla `paquete_servicio`
--
ALTER TABLE `paquete_servicio`
  ADD PRIMARY KEY (`id_paquete`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `destino`
--
ALTER TABLE `destino`
  MODIFY `id_destino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `paquete`
--
ALTER TABLE `paquete`
  MODIFY `id_paquete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_paquete`) REFERENCES `paquete` (`id_paquete`);

--
-- Filtros para la tabla `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD CONSTRAINT `detalle_carrito_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`),
  ADD CONSTRAINT `detalle_carrito_ibfk_2` FOREIGN KEY (`id_paquete`) REFERENCES `paquete` (`id_paquete`);

--
-- Filtros para la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`id_destino`) REFERENCES `destino` (`id_destino`);

--
-- Filtros para la tabla `paquete_servicio`
--
ALTER TABLE `paquete_servicio`
  ADD CONSTRAINT `paquete_servicio_ibfk_1` FOREIGN KEY (`id_paquete`) REFERENCES `paquete` (`id_paquete`),
  ADD CONSTRAINT `paquete_servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
