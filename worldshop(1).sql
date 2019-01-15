-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 15-01-2019 a las 22:52:42
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `worldshop`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_IdUsuario` (`corr` VARCHAR(40), `pass` VARCHAR(30))  SELECT idusuario FROM usuario WHERE correo  = corr AND clave = pass$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_productos_DetalleCarrito` (`carro` INT(11), `prod` INT(11))  SELECT d.idcarrito  AS idcarrito , p.idproducto AS idproducto , p.categoria AS categoria, p.nombre AS nombre , 
	p.descripcion AS descripcion , p.url AS url , p.precio AS precio , d.cantidad AS cantidad, p.precio*d.cantidad AS subtotal
FROM detallecarrito d INNER JOIN producto p ON d.idproducto = p.idproducto
WHERE d.idcarrito = carro AND d.producto = prod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_productos_carrito` (`carro` INT(11))  SELECT d.idcarrito  AS idcarrito , p.idproducto AS idproducto , p.categoria AS categoria, p.nombre AS nombre , 
	p.descripcion AS descripcion , p.url AS url , p.precio AS precio , d.cantidad AS cantidad, p.precio*d.cantidad AS subtotal
FROM detallecarrito d INNER JOIN producto p ON d.idproducto = p.idproducto
WHERE d.idcarrito = carro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_clave` (`id` INT(11), `pass` VARCHAR(30))  UPDATE usuario SET clave = pass WHERE idusuario = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_imagenUsuario` (`id` INT(11), `image` VARCHAR(215))  UPDATE usuario SET imagen = image WHERE idusuario = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `producto_buscar_categoria` (`categ` VARCHAR(20))  SELECT * FROM producto WHERE categoria = categ ORDER BY nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `producto_buscar_id` (`codigo` INT(11))  SELECT * FROM producto WHERE codigo = idproducto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `producto_buscar_todos` ()  SELECT * FROM producto ORDER BY nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spF_carrito_one` (`_codigoUsuario` INT)  SELECT v.idcarrito AS idcarrito, v.idusuario AS idusuario, v.fecha AS fecha, d.idproducto AS idproducto, p.nombre AS nombre, p.precio AS precio, 
d.cantidad AS cantidad, p.precio*d.cantidad AS subtotal,
 ( SELECT SUM(dT.cantidad * pT.precio) AS totalpagar 
FROM detallecarrito AS dT INNER JOIN producto AS pT 
on dT.idproducto = pT.idproducto 
WHERE dT. idcarrito =v. idcarrito) AS totalpagar 
FROM carrito AS v INNER JOIN detallecarrito AS d 
ON v. idcarrito = d. idcarrito INNER JOIN producto AS p 
ON d.idproducto = p.idproducto 
WHERE v.idusuario= _codigoUsuario
ORDER BY nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detalleCarrito` (IN `codi` INT(11))  SELECT d.idcarrito, d.idproducto, p.nombre , d.cantidad, d.url 
 FROM detallecarrito d INNER JOIN producto p ON p.idproducto = d.idproducto 
WHERE d.idcarrito = codi$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_devolver_id_carrito` (`usuario` INT)  Select idcarrito 
FROM carrito
WHERE usuario = idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_buscar` (`corr` VARCHAR(40), `pass` VARCHAR(30))  SELECT * FROM usuario WHERE correo  = corr AND clave = pass$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_buscarCorreo` (`mail` VARCHAR(40))  SELECT * FROM usuario WHERE correo  = mail$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_buscarId` (`id` INT(11))  SELECT * FROM usuario WHERE idusuario  = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `idcarrito` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`idcarrito`, `idusuario`, `fecha`) VALUES
(1, 28, '2018-12-18 00:00:00'),
(2, 29, '2018-12-18 00:00:00'),
(3, 30, '2018-12-20 00:00:00'),
(8, 32, '2019-01-11 00:00:00'),
(9, 33, '2019-01-11 00:00:00'),
(10, 34, '2019-01-11 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecarrito`
--

CREATE TABLE `detallecarrito` (
  `idcarrito` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallecarrito`
--

INSERT INTO `detallecarrito` (`idcarrito`, `idproducto`, `cantidad`) VALUES
(1, 10, 6),
(1, 13, 1),
(1, 16, 9),
(1, 17, 2),
(2, 9, 3),
(2, 13, 5),
(2, 16, 8),
(3, 13, 3),
(3, 17, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `precio` double(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `categoria`, `nombre`, `descripcion`, `url`, `precio`) VALUES
(1, 'hombres', 'Chompa versión invierno', 'Es una chompa para el invierno', 'https://sandrasc3.github.io/proyectoVentas/assets/images/product_1.png', 52.00),
(3, 'hombres', 'zapatillas marrones', 'zapatillas talla algo', 'https://sandrasc3.github.io/proyectoVentas/assets/images/product_5.png', 180.00),
(4, 'hombres', 'chompa marron', 'Es una compa marron', 'https://sandrasc3.github.io/proyectoVentas/assets/images/product_9.png', 41.00),
(5, 'hombres', 'chompa verde', 'Es una chompa verde', 'https://sandrasc3.github.io/proyectoVentas/assets/images/product_10.png', 180.00),
(6, 'mujeres', 'cartera verde', 'Es una cartera verde', 'https://sandrasc3.github.io/proyectoVentas/assets/images/product_2.png', 61.00),
(7, 'mujeres', 'chompa amarilla', 'Es una chompa que abriga xD', 'https://sandrasc3.github.io/proyectoVentas/assets/images/product_3.png', 120.00),
(8, 'mujeres', 'chompa cafe', 'Es una chompa cafe claro', 'https://sandrasc3.github.io/proyectoVentas/assets/images/product_7.png', 61.00),
(9, 'accesorios', 'cartera chanel', 'Es de color verde grisaceo', 'https://sandrasc3.github.io/proyectoVentas/assets/images/product_4.png', 41.00),
(10, 'accesorios', 'lentes', 'Son letes oscuros', 'https://sandrasc3.github.io/proyectoVentas/assets/images/product_6.png', 52.00),
(11, 'accesorios', 'billetera', 'Billetera color caramelo', 'https://sandrasc3.github.io/proyectoVentas/assets/images/product_8.png', 16.00),
(13, 'mujeres', 'Taiga', 'La tsundere. Se enamoró del de lentes, y luego fue descubierta por Ryuuji. Al final se enamoraron.', 'https://i.pinimg.com/originals/aa/1f/b5/aa1fb509a80d36625456d48774e21348.jpg', 1500.00),
(16, 'mujeres', 'Ushio', 'Hija de Nagisa y Tomoya', 'https://i.warosu.org/data/tg/img/0375/78/1422081961513.jpg', 10000.00),
(17, 'mujeres', 'Mashiro Shiina', 'Vive en la Residencia Sakurasou', 'https://i.gifer.com/BSLw.gif', 4500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(35) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `rol` varchar(15) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `clave` varchar(30) DEFAULT NULL,
  `imagen` varchar(215) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `rol`, `correo`, `clave`, `imagen`) VALUES
(28, 'Anthony', 'Rojas', 'usuario', 'rojasanthony@gmail.com', '123', 'https://i.imgur.com/d4W9Vjo.jpg'),
(29, 'Jazmin', 'Mendez', 'usuario', 'muÃ±iz@gmail.com', '123', 'https://i.imgur.com/nXkcexQ.jpg'),
(30, 'Thony', 'GarcÃ­a', 'usuario', 'thony.garcia@unmsm.edu.pe', '123', 'https://i.imgur.com/ckQD8Qy.png'),
(32, 'Brenda', 'Mendez', 'usuario', 'muÃ±iz2@gmail.com', '123', 'https://i.imgur.com/ckQD8Qy.png'),
(33, 'BrendaJazmin', 'Mendez', 'usuario', 'muÃ±iz3@gmail.com', '123', 'https://i.imgur.com/ckQD8Qy.png'),
(34, 'christiam', 'Mendez', 'usuario', 'anthony.rojas1@unmsm.edu.pe', '123', 'https://i.imgur.com/ckQD8Qy.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idcarrito`),
  ADD KEY `FK_carrito_usuario` (`idusuario`);

--
-- Indices de la tabla `detallecarrito`
--
ALTER TABLE `detallecarrito`
  ADD PRIMARY KEY (`idcarrito`,`idproducto`),
  ADD KEY `FK_DetalleCarrito_Producto` (`idproducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idcarrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `FK_carrito_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `detallecarrito`
--
ALTER TABLE `detallecarrito`
  ADD CONSTRAINT `FK_DetalleCarrito_Carrito` FOREIGN KEY (`idcarrito`) REFERENCES `carrito` (`idcarrito`),
  ADD CONSTRAINT `FK_DetalleCarrito_Producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
