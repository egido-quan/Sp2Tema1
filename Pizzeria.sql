-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-09-2024 a las 20:16:14
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
-- Base de datos: `Pizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantidades`
--

CREATE TABLE `cantidades` (
  `id_pedido` int(11) UNSIGNED NOT NULL,
  `id_producto` int(11) UNSIGNED NOT NULL,
  `cantidad` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cantidades`
--

INSERT INTO `cantidades` (`id_pedido`, `id_producto`, `cantidad`) VALUES
(1, 3, 2),
(1, 9, 3),
(2, 5, 2),
(2, 1, 1),
(2, 7, 3),
(2, 4, 4),
(3, 2, 2),
(3, 4, 2),
(3, 8, 4),
(3, 5, 4),
(4, 2, 2),
(4, 5, 2),
(5, 8, 1),
(5, 4, 2),
(5, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categ_pizza`
--

CREATE TABLE `categ_pizza` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categ_pizza`
--

INSERT INTO `categ_pizza` (`id`, `Nombre`) VALUES
(1, 'primavera'),
(2, 'invierno'),
(3, 'festival'),
(4, 'carnaval');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `localidad` varchar(30) NOT NULL,
  `provincia` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido1`, `apellido2`, `direccion`, `codigo_postal`, `localidad`, `provincia`, `telefono`) VALUES
(1, 'Luis', 'Soto', 'Mayor', 'Pedroche 21, 4º 3ª', '08029', 'Barcelona', 'Barcelona', '648456222'),
(2, 'Petra', 'Mon', 'Tana', 'Del viento 66, 1º 3ª', '08720', 'Vilafranca', 'Barcelona', '648456132'),
(3, 'Javier', 'Nes', 'Mola', 'Santa Cruz 1, Bajos 3ª', '14009', 'Córdoba', 'Córdoba', '647776132'),
(4, 'Melchor', 'Balta', 'Sar', 'Mirra 12, 1º 1ª', '08870', 'Sitges', 'Barcelona', '634556132'),
(5, 'Jesús', 'To', 'Madao', 'Tranquilidad 13, Ático 3ª', '30005', 'Mazarrón', 'Murcia', '647771982'),
(6, 'Juanjo', 'Lines', 'Mayor', 'Atocha 21, 4º 3ª', '08029', 'Barcelona', 'Barcelona', '648876222'),
(7, 'Armando', 'Ja', 'Leo', 'Fortuny 24, 1º 3ª', '08720', 'Vilafranca', 'Barcelona', '698456132'),
(8, 'Duli', 'Mona', 'Margo', 'Perejil 1, Bajos 3ª', '14009', 'Córdoba', 'Córdoba', '647876232'),
(9, 'Cristina', 'lópez', 'Sánchez', 'Providencia 12, 1º 1ª', '08870', 'Sitges', 'Barcelona', '634555552'),
(10, 'Ana', 'Mejías', 'Sancho', 'Paz 13, Ático 3ª', '30005', 'Mazarrón', 'Murcia', '647771982');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
  `nif` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `cargo` enum('cocinero','repartidor') NOT NULL,
  `id_tienda` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellido1`, `apellido2`, `nif`, `telefono`, `cargo`, `id_tienda`) VALUES
(1, 'Juana', 'Luz', 'Oscura', '32645587G', '687544221', 'repartidor', 1),
(2, 'Alberto', 'Dote', 'Reno', '32005587G', '687000221', 'repartidor', 1),
(3, 'Mariano', 'Pelado', 'Solo', '32765587G', '687525321', 'cocinero', 1),
(4, 'Silvana', 'Cuesta', 'Riba', '32645599M', '685554221', 'repartidor', 2),
(5, 'Salvador', 'Mido', 'Dedía', '32111187G', '649994221', 'cocinero', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_vendedor` int(11) UNSIGNED NOT NULL,
  `id_cliente` int(11) UNSIGNED NOT NULL,
  `fecha_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_vendedor`, `id_cliente`, `fecha_hora`) VALUES
(1, 2, 7, '2024-07-01 22:49:25'),
(2, 1, 4, '2024-06-11 00:13:34'),
(3, 2, 4, '2024-07-23 00:13:34'),
(4, 5, 8, '2024-07-22 14:07:16'),
(5, 5, 4, '2024-08-13 15:39:31');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `precio_pedidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `precio_pedidos` (
`id` int(11) unsigned
,`id_cliente` int(11) unsigned
,`fecha_hora` datetime
,`Total(€)` decimal(35,0)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(3,0) NOT NULL,
  `imagen` varchar(25) NOT NULL,
  `id_categ_pizza` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `imagen`, `id_categ_pizza`) VALUES
(1, 'Hamburguesa vegana', 'La vegan burguer que está desbancando a la mítica Beyond Meat. Heura es su afán de evolución e innovación, primero comercializó unos bocados de heura imitando a la perfección el pollo, pero en este caso siendo no chicken.', 15, './vegana.jpg', NULL),
(2, 'Hamburguesa de pollo', 'Crujiente por fuera, tierno por dentro. El mejor pollo con un empanado crujiente y ligeramente picante, tomates recién cortados, lechuga fresca y mayonesa en un pan de semillas recién tostado. Una auténtica obra maestra.', 12, './pollo.jpg', NULL),
(3, 'Hambruguesa Bacon', 'Esto es BACON con mayúsculas. Pan brioche con trocitos de bacon, para seguir con doble de crema de queso y bacon, tomate fresco, bacon en lonchas, lonchas de queso de bacon, doble carne', 10, './bacon.jpg', NULL),
(4, 'Lolacola', 'El referesco más dicharachero del verano', 4, './lolacola.jpg', NULL),
(5, 'Limaloca', 'Bébela y se te pondrá una cara como la del Fari mirando al sol de cara', 5, './limaloca.jpg', NULL),
(7, 'Pizza Mortadela', 'Telepizza Belísima Maestra, Exquisita Combinación con Mortadela y Queso\r\n', 11, './motadela.jpg', 3),
(8, 'Pizza Picante', 'Telepizza Picante Maestra Mediana, Explosión de Sabor para Amantes del Picante\r\n', 13, './picante.jpg', 3),
(9, 'Pizza Campera', 'Campera Maestra Mediana, Una Obra Maestra para Saborear con las Manos', 14, './campera.jpg', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparto`
--

CREATE TABLE `reparto` (
  `id_pedido` int(11) UNSIGNED NOT NULL,
  `id_repartidor` int(11) UNSIGNED NOT NULL,
  `fecha/hora reparto` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reparto`
--

INSERT INTO `reparto` (`id_pedido`, `id_repartidor`, `fecha/hora reparto`) VALUES
(2, 1, '2024-06-11 00:45:03'),
(4, 4, '2024-07-22 14:38:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `codigo_postal` varchar(20) NOT NULL,
  `localidad` varchar(30) NOT NULL,
  `provincia` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tiendas`
--

INSERT INTO `tiendas` (`id`, `nombre`, `direccion`, `codigo_postal`, `localidad`, `provincia`) VALUES
(1, 'Norte', 'Vía Láctea 18, Bajos', '08054', 'Badalona', 'Barcelona'),
(2, 'Sur', 'Andrómeda 19, Bajos B', '17001', 'Burriana', 'Valencia'),
(3, 'Este', 'Nebulosa 22, Bajos', '17009', 'Denia', 'Valencia'),
(4, 'Oeste', 'Planeta 1, 3º 4ª', '55014', 'San Xustu', 'Pontevedra'),
(5, 'Villalba', 'Maíz 44', '09045', 'Gandesa', 'Tarragona'),
(6, 'Acequia', 'Río 19, 2º 4ª', '44025', 'La Fresneda', 'Teruel'),
(7, 'Nieve', 'Hielo 44, 2º 2ª', '44007', 'Jaca', 'Huesca');

-- --------------------------------------------------------

--
-- Estructura para la vista `precio_pedidos`
--
DROP TABLE IF EXISTS `precio_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pizzeria`.`precio_pedidos`  AS SELECT `p`.`id` AS `id`, `p`.`id_cliente` AS `id_cliente`, `p`.`fecha_hora` AS `fecha_hora`, sum(`pr`.`precio` * `c`.`cantidad`) AS `Total(€)` FROM ((`pizzeria`.`pedidos` `p` join `pizzeria`.`cantidades` `c` on(`c`.`id_pedido` = `p`.`id`)) join `pizzeria`.`productos` `pr` on(`pr`.`id` = `c`.`id_producto`)) GROUP BY `p`.`id` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cantidades`
--
ALTER TABLE `cantidades`
  ADD KEY `id_pedido` (`id_pedido`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `categ_pizza`
--
ALTER TABLE `categ_pizza`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tienda` (`id_tienda`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_vendedor` (`id_vendedor`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categ_pizza` (`id_categ_pizza`);

--
-- Indices de la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_repartidor` (`id_repartidor`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categ_pizza`
--
ALTER TABLE `categ_pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cantidades`
--
ALTER TABLE `cantidades`
  ADD CONSTRAINT `cantidades_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cantidades_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categ_pizza`) REFERENCES `categ_pizza` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD CONSTRAINT `reparto_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reparto_ibfk_3` FOREIGN KEY (`id_repartidor`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
