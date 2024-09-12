-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-09-2024 a las 01:09:12
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido_1` varchar(30) NOT NULL,
  `apellido_2` varchar(30) NOT NULL,
  `calle` varchar(75) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `piso` varchar(5) NOT NULL,
  `puerta` varchar(2) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `pais` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `fecha_registro` date NOT NULL,
  `cliente_amigo` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla de clientes';

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`id`, `nombre`, `apellido_1`, `apellido_2`, `calle`, `numero`, `piso`, `puerta`, `ciudad`, `codigo_postal`, `pais`, `telefono`, `email`, `fecha_registro`, `cliente_amigo`) VALUES
(1, 'Luis', 'Soto', 'Mayor', 'Pedroche', '21', '4', '3', 'Barcelona', '08029', 'España', '648456222', 'luis.pedroche@jmail.can', '2009-02-02', NULL),
(2, 'Petra', 'Mon', 'Tana', 'Del viento', '66', '1', '3', 'Vilafranca', '08720', 'España', '648456132', 'petra.montana@jmail.can', '2015-01-02', NULL),
(3, 'Javier', 'Nes', 'Mola', 'Santa Cruz', '1', 'Bajos', '3', 'Córdoba', '14009', 'España', '647776132', 'viernes.fiesta@jmail.can', '2021-03-06', NULL),
(4, 'Melchor', 'Balta', 'Sar', 'Mirra', '12', '1', '1', 'Sitges', '08870', 'España', '634556132', 'reyesmagos@jmail.can', '2019-06-02', NULL),
(5, 'Jesús', 'To', 'Madao', 'Tranquilidad', '13', 'Ático', '3', 'murcia', '30005', 'España', '647771982', 'jesus.madaoa@jmail.can', '2023-07-06', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Gafas`
--

CREATE TABLE `Gafas` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_marca` int(11) UNSIGNED NOT NULL,
  `grado_izq` decimal(2,0) NOT NULL,
  `grado_der` decimal(2,0) NOT NULL,
  `tipo_montura` enum('Flotante','Pasta','Metálica','') NOT NULL,
  `color_montura` varchar(30) NOT NULL,
  `color_vid_izq` varchar(30) NOT NULL,
  `color_vid_der` varchar(30) NOT NULL,
  `precio` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Info de las gafas';

--
-- Volcado de datos para la tabla `Gafas`
--

INSERT INTO `Gafas` (`id`, `id_marca`, `grado_izq`, `grado_der`, `tipo_montura`, `color_montura`, `color_vid_izq`, `color_vid_der`, `precio`) VALUES
(1, 1, 2, 3, 'Flotante', 'Verde', 'Oliva', 'Oliva', 148.00),
(2, 1, 2, 3, 'Metálica', 'Verde', 'Gris', 'Gris', 150.24),
(3, 1, 1, 2, 'Metálica', 'Azul', 'Amarillo', 'Amarillo', 220.18),
(4, 2, 4, 4, 'Pasta', 'Verde', 'Gris', 'Gris', 148.00),
(5, 4, 2, 2, 'Pasta', 'Marino', 'Incoloro', 'Incoloro', 177.99),
(6, 5, 3, 3, 'Pasta', 'Cielo', 'Diamante', 'Diamante', 277.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Marcas`
--

CREATE TABLE `Marcas` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_proveedor` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Marcas`
--

INSERT INTO `Marcas` (`id`, `nombre`, `id_proveedor`) VALUES
(1, 'Olekey', 3),
(2, 'Pay&Run', 5),
(3, 'Doir', 5),
(4, 'Lacuesta', 1),
(5, 'Totus', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedores`
--

CREATE TABLE `Proveedores` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `calle` varchar(75) NOT NULL,
  `número` varchar(5) NOT NULL,
  `piso` varchar(5) NOT NULL,
  `puerta` varchar(2) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `codigo_postal` varchar(30) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `fax` varchar(30) NOT NULL,
  `nif` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla de proveedores';

--
-- Volcado de datos para la tabla `Proveedores`
--

INSERT INTO `Proveedores` (`id`, `nombre`, `calle`, `número`, `piso`, `puerta`, `ciudad`, `codigo_postal`, `pais`, `telefono`, `fax`, `nif`) VALUES
(1, 'Distriglass', 'De los morteros', '44', '', '', 'Valladolid', '47001', 'España', '+34-648456986', '+34-648456987', 'A56739965'),
(2, 'Cristalglass', 'Ampurias', '95', '3', '', 'Girona', '17005', 'España', '+34-648456444', '+34-648456445', 'A56739392'),
(3, 'Notevi', 'Pasaje de los corderos', '2', '', '', 'Huelva', '21005', 'España', '+34-648412345', '+34-648412346', 'B45634492'),
(4, 'Gafas Casimiro', 'Rompetechos', '66', '2', '1', 'Bilbao', '48003', 'España', '+34-648446739', '+34-689465332', 'A98457623'),
(5, 'Multiglass', 'De los picos de oro', '57', '', '', 'Toledo', '45160', 'España', '+34-648111186', '+34-643333345', 'A56223965'),
(6, 'Gafisol', 'Manacor', '109', '', '', 'Menorca', '07769', 'España', '+34-648999986', '+34-64456745', 'A561111125');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Vendedores`
--

CREATE TABLE `Vendedores` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido_1` varchar(30) NOT NULL,
  `apellido_2` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Vendedores`
--

INSERT INTO `Vendedores` (`id`, `nombre`, `apellido_1`, `apellido_2`) VALUES
(1, 'Joana', 'Lacuesta', 'Sube'),
(2, 'Pedro', 'Cansado', 'Suda'),
(3, 'Aitor', 'Tilla', 'Buena'),
(4, 'Alberto', 'Mate', 'Soso'),
(5, 'Alejandro', 'Medario', 'Joroba'),
(6, 'Ricardo', 'Borri', 'Quero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ventas`
--

CREATE TABLE `Ventas` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_cliente` int(11) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `id_gafas` int(11) UNSIGNED NOT NULL,
  `cantidad` int(3) UNSIGNED NOT NULL,
  `id_vendedor` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Ventas`
--

INSERT INTO `Ventas` (`id`, `id_cliente`, `fecha`, `id_gafas`, `cantidad`, `id_vendedor`) VALUES
(1, 1, '2023-07-04', 2, 1, 3),
(2, 1, '2023-06-09', 4, 2, 2),
(3, 2, '2023-12-09', 3, 5, 1),
(4, 2, '2023-01-24', 3, 3, 2),
(5, 3, '2024-07-09', 6, 5, 5),
(6, 1, '2023-10-12', 4, 2, 2),
(7, 1, '2024-01-09', 1, 1, 1),
(8, 1, '2023-02-06', 6, 5, 1),
(9, 1, '2022-12-09', 3, 5, 1),
(10, 1, '2021-01-24', 3, 3, 2),
(11, 2, '2022-07-09', 1, 5, 5),
(12, 1, '2020-10-12', 2, 2, 5),
(13, 1, '2022-01-09', 2, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cliente_amigo` (`cliente_amigo`);

--
-- Indices de la tabla `Gafas`
--
ALTER TABLE `Gafas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `Marcas`
--
ALTER TABLE `Marcas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Vendedores`
--
ALTER TABLE `Vendedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_vendedor` (`id_vendedor`),
  ADD KEY `id_cliente` (`id_cliente`) USING BTREE,
  ADD KEY `id_gafas` (`id_gafas`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `Gafas`
--
ALTER TABLE `Gafas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Marcas`
--
ALTER TABLE `Marcas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Vendedores`
--
ALTER TABLE `Vendedores`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`cliente_amigo`) REFERENCES `Clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `Gafas`
--
ALTER TABLE `Gafas`
  ADD CONSTRAINT `gafas_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `Marcas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Marcas`
--
ALTER TABLE `Marcas`
  ADD CONSTRAINT `marcas_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `Vendedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_gafas`) REFERENCES `Gafas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
