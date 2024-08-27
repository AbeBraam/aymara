-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2024 a las 09:32:25
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aymara`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `fecha_subida` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `texto` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diccionario`
--

CREATE TABLE `diccionario` (
  `id` int(11) NOT NULL,
  `aymara` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `espanol` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `diccionario`
--

INSERT INTO `diccionario` (`id`, `aymara`, `espanol`, `activo`) VALUES
(1, 'alwa', 'amanecer', 1),
(2, 'ampara', 'mano', 1),
(3, 'anata', 'juego', 1),
(4, 'ancha', 'mucho', 1),
(5, 'añu', 'perro', 1),
(6, 'aru', 'palabra', 1),
(7, 'asaña', 'dormir', 1),
(8, 'atipaña', 'ganar', 1),
(9, 'awicha', 'abuela', 1),
(10, 'awki', 'abuelo', 1),
(11, 'ch\'ama', 'fuerza', 1),
(12, 'ch\'usi', 'frío', 1),
(13, 'chaka', 'puente', 1),
(14, 'ch\'uxña', 'verde', 1),
(15, 'ch\'iqchi', 'sucio', 1),
(16, 'ch\'uwa', 'claro', 1),
(17, 'chiq\'i', 'mojado', 1),
(18, 'chuqila', 'maní', 1),
(19, 'ch\'iji', 'seco', 1),
(20, 'chuq\'a', 'dulce', 1),
(21, 'chiri', 'frío', 1),
(22, 'ch\'uqi', 'papa', 1),
(23, 'ch\'allwa', 'pescado', 1),
(24, 'ch\'amanchäwi', 'trabajo', 1),
(25, 'chhuxla', 'enfermo', 1),
(26, 'ch\'usaqäwi', 'tristeza', 1),
(27, 'chhuxk\'äwi', 'obscuridad', 1),
(28, 'chhiyara', 'amanecer', 1),
(29, 'chhijña', 'despertar', 1),
(30, 'ch\'ukhu', 'negro', 1),
(31, 'ch\'uwa', 'limpio', 1),
(32, 'chhichhi', 'gallina', 1),
(33, 'chhupi', 'verde', 1),
(34, 'chh\'ulla', 'pálido', 1),
(35, 'chh\'ipita', 'rojo', 1),
(36, 'chh\'ajña', 'amarillo', 1),
(37, 'chh\'ajña', 'azul', 1),
(38, 'chhupina', 'rosa', 1),
(39, 'chh\'ajchi', 'cordero', 1),
(40, 'chh\'ukhuna', 'vaca', 1),
(41, 'chhajwa', 'montaña', 1),
(42, 'chh\'ojña', 'hierba', 1),
(43, 'chh\'ajña', 'flor', 1),
(44, 'chhumpi', 'marrón', 1),
(45, 'chhuchhuna', 'arena', 1),
(46, 'chh\'aja', 'polvo', 1),
(47, 'chh\'uma', 'agua', 1),
(48, 'chhujña', 'rápido', 1),
(49, 'chhullku', 'viejo', 1),
(50, 'chhuyma', 'corazón', 1),
(51, 'chhama', 'pierna', 1),
(52, 'chhujña', 'sangre', 1),
(53, 'chh\'uma', 'río', 1),
(54, 'chhuyña', 'largo', 1),
(55, 'chhajwa', 'calor', 1),
(56, 'chhuñuña', 'fuego', 1),
(57, 'chhurura', 'tierra', 1),
(58, 'chh\'ajña', 'huevo', 1),
(59, 'chhuchhuna', 'nieve', 1),
(60, 'chh\'ijña', 'luz', 1),
(61, 'chhijlla', 'palo', 1),
(62, 'chhucha', 'hoja', 1),
(63, 'chh\'uma', 'lluvia', 1),
(64, 'chh\'ila', 'estrella', 1),
(65, 'chh\'uxña', 'luna', 1),
(66, 'chh\'ajña', 'sol', 1),
(67, 'chh\'uku', 'tarde', 1),
(68, 'chh\'uqi', 'noche', 1),
(69, 'chhuchhuna', 'polvo', 1),
(70, 'chh\'ajña', 'rojo', 1),
(71, 'chhuxña', 'blanco', 1),
(72, 'chhujña', 'carne', 1),
(73, 'chhuxña', 'pan', 1),
(74, 'chhujña', 'mesa', 1),
(75, 'chhajña', 'silla', 1),
(76, 'chhujña', 'casa', 1),
(77, 'chh\'ajña', 'puerta', 1),
(78, 'chh\'ichhila', 'ventana', 1),
(79, 'chh\'ajña', 'pared', 1),
(80, 'chh\'axña', 'techo', 1),
(81, 'chh\'ajña', 'piso', 1),
(82, 'chhujña', 'llave', 1),
(83, 'chhuchhuna', 'cerradura', 1),
(84, 'chh\'ajña', 'bolsa', 1),
(85, 'chhuchhuna', 'caja', 1),
(86, 'chh\'ujña', 'plato', 1),
(87, 'chh\'ajña', 'taza', 1),
(88, 'chhuxña', 'cuchara', 1),
(89, 'chhujña', 'tenedor', 1),
(90, 'chh\'ajña', 'cuchillo', 1),
(91, 'chh\'ichhila', 'comida', 1),
(92, 'chh\'ajña', 'bebida', 1),
(93, 'chhuxña', 'fruta', 1),
(94, 'chhujña', 'verdura', 1),
(95, 'chh\'ajña', 'carne', 1),
(96, 'chh\'uchhuna', 'pescado', 1),
(97, 'chh\'ajña', 'pollo', 1),
(98, 'chhuchhuna', 'cerdo', 1),
(99, 'chh\'ajña', 'vaca', 1),
(100, 'chh\'ajña', 'huevo', 1),
(101, 'chhuchhuna', 'queso', 1),
(102, 'chh\'ajña', 'pan', 1),
(103, 'chh\'ajña', 'mantequilla', 1),
(104, 'chh\'ichhila', 'aceite', 1),
(105, 'chh\'ajña', 'sal', 1),
(106, 'chhuchhuna', 'azúcar', 1),
(107, 'chh\'ajña', 'pimienta', 1),
(108, 'chh\'ajña', 'ajo', 1),
(109, 'chh\'ajña', 'cebolla', 1),
(110, 'chh\'ajña', 'tomate', 1),
(111, 'chh\'ajña', 'patata', 1),
(112, 'chh\'ajña', 'zanahoria', 1),
(113, 'chh\'ichhila', 'calabaza', 1),
(114, 'chh\'ajña', 'lechuga', 1),
(115, 'chh\'ajña', 'maíz', 1),
(116, 'chh\'ajña', 'arroz', 1),
(117, 'chh\'ajña', 'frijoles', 1),
(118, 'chh\'ajña', 'pasta', 1),
(119, 'chh\'ajña', 'pan', 1),
(120, 'chh\'ichhila', 'leche', 1),
(121, 'chh\'ajña', 'agua', 1),
(122, 'chh\'ajña', 'jugo', 1),
(123, 'chh\'ajña', 'té', 1),
(124, 'chh\'ajña', 'café', 1),
(125, 'chh\'ajña', 'cerveza', 1),
(126, 'chh\'ajña', 'vino', 1),
(127, 'chh\'ajña', 'licor', 1),
(128, 'chh\'ajña', 'jugo', 1),
(129, 'chh\'ajña', 'refresco', 1),
(130, 'chh\'ajña', 'hielo', 1),
(131, 'chh\'ajña', 'sopa', 1),
(132, 'chh\'ajña', 'ensalada', 1),
(133, 'chh\'ajña', 'postre', 1),
(134, 'chh\'ajña', 'helado', 1),
(135, 'chh\'ajña', 'pastel', 1),
(136, 'chh\'ajña', 'chocolate', 1),
(137, 'chh\'ajña', 'dulce', 1),
(138, 'chh\'ajña', 'caramelo', 1),
(139, 'chh\'ajña', 'galleta', 1),
(140, 'chh\'ajña', 'mermelada', 1),
(141, 'chh\'ajña', 'miel', 1),
(142, 'chh\'ajña', 'mantequilla', 1),
(143, 'chh\'ajña', 'yogur', 1),
(144, 'chh\'ajña', 'nata', 1),
(145, 'chh\'ajña', 'flan', 1),
(146, 'chh\'ajña', 'pudín', 1),
(147, 'chh\'ajña', 'natillas', 1),
(148, 'chh\'ajña', 'gelatina', 1),
(149, 'chh\'ajña', 'tarta', 1),
(150, 'chh\'ajña', 'bizcocho', 1),
(151, 'chh\'ajña', 'torta', 1),
(152, 'chh\'ajña', 'relleno', 1),
(153, 'chh\'ajña', 'compota', 1),
(154, 'chh\'ajña', 'salsa', 1),
(155, 'chh\'ajña', 'guarnición', 1),
(156, 'chh\'ajña', 'aderezo', 1),
(157, 'chh\'ajña', 'condimento', 1),
(158, 'chh\'ajña', 'especia', 1),
(159, 'chh\'ajña', 'hierba', 1),
(160, 'chh\'ajña', 'perejil', 1),
(161, 'chh\'ajña', 'albahaca', 1),
(162, 'chh\'ajña', 'orégano', 1),
(163, 'chh\'ajña', 'romero', 1),
(164, 'chh\'ajña', 'tomillo', 1),
(165, 'chh\'ajña', 'menta', 1),
(166, 'chh\'ajña', 'canela', 1),
(167, 'chh\'ajña', 'vainilla', 1),
(168, 'chh\'ajña', 'clavo', 1),
(169, 'chh\'ajña', 'jengibre', 1),
(170, 'chh\'ajña', 'mostaza', 1),
(171, 'chh\'ajña', 'mayonesa', 1),
(172, 'chh\'ajña', 'ketchup', 1),
(173, 'chh\'ajña', 'vinagre', 1),
(174, 'chh\'ajña', 'aceituna', 1),
(175, 'chh\'ajña', 'pepinillo', 1),
(176, 'chh\'ajña', 'almendra', 1),
(177, 'chh\'ajña', 'nuez', 1),
(178, 'chh\'ajña', 'avellana', 1),
(179, 'chh\'ajña', 'pistacho', 1),
(180, 'chh\'ajña', 'anacardo', 1),
(181, 'chh\'ajña', 'maní', 1),
(182, 'chh\'ajña', 'girasol', 1),
(183, 'chh\'ajña', 'amapola', 1),
(184, 'chh\'ajña', 'sésamo', 1),
(185, 'chh\'ajña', 'linaza', 1),
(186, 'chh\'ajña', 'chía', 1),
(187, 'chh\'ajña', 'calabaza', 1),
(188, 'chh\'ajña', 'girasol', 1),
(189, 'chh\'ajña', 'amapola', 1),
(190, 'chh\'ajña', 'sésamo', 1),
(191, 'chh\'ajña', 'linaza', 1),
(192, 'chh\'ajña', 'chía', 1),
(193, 'chh\'ajña', 'calabaza', 1),
(194, 'chh\'ajña', 'girasol', 1),
(195, 'chh\'ajña', 'amapola', 1),
(196, 'chh\'ajña', 'sésamo', 1),
(197, 'chh\'ajña', 'linaza', 1),
(198, 'chh\'ajña', 'chía', 1),
(199, 'chh\'ajña', 'calabaza', 1),
(200, 'chh\'ajña', 'girasol', 1),
(201, 'chh\'ajña', 'amapola', 1),
(202, 'chh\'ajña', 'sésamo', 1),
(203, 'chh\'ajña', 'linaza', 1),
(204, 'chh\'ajña', 'chía', 1),
(205, 'chh\'ajña', 'calabaza', 1),
(206, 'chh\'ajña', 'girasol', 1),
(207, 'chh\'ajña', 'amapola', 1),
(208, 'chh\'ajña', 'sésamo', 1),
(209, 'chh\'ajña', 'linaza', 1),
(210, 'chh\'ajña', 'chía', 1),
(211, 'chh\'ajña', 'calabaza', 1),
(212, 'chh\'ajña', 'girasol', 1),
(213, 'chh\'ajña', 'amapola', 1),
(214, 'chh\'ajña', 'sésamo', 1),
(215, 'chh\'ajña', 'linaza', 1),
(216, 'chh\'ajña', 'chía', 1),
(217, 'chh\'ajña', 'calabaza', 1),
(218, 'chh\'ajña', 'girasol', 1),
(219, 'chh\'ajña', 'amapola', 1),
(220, 'chh\'ajña', 'sésamo', 1),
(221, 'chh\'ajña', 'linaza', 1),
(222, 'chh\'ajña', 'chía', 1),
(223, 'chh\'ajña', 'calabaza', 1),
(224, 'chh\'ajña', 'girasol', 1),
(225, 'chh\'ajña', 'amapola', 1),
(226, 'chh\'ajña', 'sésamo', 1),
(227, 'chh\'ajña', 'linaza', 1),
(228, 'chh\'ajña', 'chía', 1),
(229, 'chh\'ajña', 'calabaza', 1),
(230, 'chh\'ajña', 'girasol', 1),
(231, 'chh\'ajña', 'amapola', 1),
(232, 'achachila', 'ancestro', 1),
(233, 'akaña', 'éste', 1),
(234, 'alaxa', 'arriba', 1),
(235, 'alkasiña', 'descansar', 1),
(236, 'amaya', 'espíritu', 1),
(237, 'amawta', 'sabio', 1),
(238, 'anataña', 'jugar', 1),
(239, 'anqara', 'sopa de quinua', 1),
(240, 'api', 'bebida de maíz', 1),
(241, 'apthapi', 'compartir comida', 1),
(242, 'awicha', 'abuela', 1),
(243, 'awki', 'abuelo', 1),
(244, 'axullitu', 'comida típica', 1),
(245, 'aya', 'difunto', 1),
(246, 'aycha', 'carne', 1),
(247, 'ayni', 'trabajo comunitario', 1),
(248, 'chacha', 'hombre', 1),
(249, 'chacha warmi', 'pareja', 1),
(250, 'ch\'alla', 'ritual de ofrenda', 1),
(251, 'chhuxña', 'blanco', 1),
(252, 'chuq\'i', 'papa', 1),
(253, 'ch\'uspa', 'bolsa', 1),
(254, 'jaqi', 'persona', 1),
(255, 'japu', 'oreja', 1),
(256, 'jichha', 'ahora', 1),
(257, 'jisk\'a', 'pequeño', 1),
(258, 'jiwasa', 'nosotros', 1),
(259, 'jucha', 'pecado', 1),
(260, 'k\'echi', 'hierba', 1),
(261, 'k\'isimira', 'estrella', 1),
(262, 'k\'uchu', 'esquina', 1),
(263, 'kama', 'hasta', 1),
(264, 'kamisa', 'saludos', 1),
(265, 'kapu', 'sombrero', 1),
(266, 'kari', 'varón', 1),
(267, 'kasa', 'hombre', 1),
(268, 'kawki', 'hermano', 1),
(269, 'khunu', 'nieve', 1),
(270, 'kipa', 'atrás', 1),
(271, 'k\'ullu', 'madera', 1),
(272, 'k\'usillu', 'mono', 1),
(273, 'lawa', 'sopa de maíz', 1),
(274, 'lluqu', 'izquierda', 1),
(275, 'lupi', 'sol', 1),
(276, 'machaqa', 'nuevo', 1),
(277, 'maka', 'golpear', 1),
(278, 'malku', 'montaña', 1),
(279, 'mama', 'madre', 1),
(280, 'mana', 'no', 1),
(281, 'manq\'a', 'comida', 1),
(282, 'masi', 'compañero', 1),
(283, 'mayja', 'diferente', 1),
(284, 'maya', 'uno', 1),
(285, 'mikhuna', 'alimento', 1),
(286, 'misi', 'gato', 1),
(287, 'munay', 'querer', 1),
(288, 'munayni', 'quiero', 1),
(289, 'munata', 'amado', 1),
(290, 'nayra', 'ojo', 1),
(291, 'ñanaka', 'nosotros', 1),
(292, 'ñawi', 'rostro', 1),
(293, 'ñuñu', 'pecho', 1),
(294, 'p\'iqi', 'cabeza', 1),
(295, 'pacha', 'tiempo', 1),
(296, 'pachakuti', 'ciclo', 1),
(297, 'pampja', 'abajo', 1),
(298, 'panka', 'hoja', 1),
(299, 'paxi', 'luna', 1),
(300, 'phaxi', 'mes', 1),
(301, 'phuyu', 'nube', 1),
(302, 'piqi', 'cabeza', 1),
(303, 'puriña', 'caminar', 1),
(304, 'pusña', 'cuatro', 1),
(305, 'q\'ala', 'desnudo', 1),
(306, 'qhathu', 'mercado', 1),
(307, 'qillqaña', 'escribir', 1),
(308, 'qucha', 'lago', 1),
(309, 'q\'umu', 'codo', 1),
(310, 'q\'upi', 'corto', 1),
(311, 'quta', 'lago', 1),
(312, 'q\'uwa', 'tabaco', 1),
(313, 'riwa', 'canal', 1),
(314, 'riwri', 'frente', 1),
(315, 'saqi', 'sal', 1),
(316, 'sasaña', 'cansarse', 1),
(317, 'sata', 'nombre', 1),
(318, 'sikuri', 'flautista', 1),
(319, 'suma', 'bonito', 1),
(320, 'suru', 'tobillo', 1),
(321, 'taipa', 'lleno', 1),
(322, 'tawa', 'cuatro', 1),
(323, 'thakhina', 'caminata', 1),
(324, 'thanta', 'viejo', 1),
(325, 'tinku', 'encuentro', 1),
(326, 'tiqi', 'semilla', 1),
(327, 'titi', 'puma', 1),
(328, 'tunta', 'papa deshidratada', 1),
(329, 'tunka', 'diez', 1),
(330, 'uch\'uku', 'guardián', 1),
(331, 'uñt\'ata', 'aprendido', 1),
(332, 'utjiri', 'creador', 1),
(333, 'waka', 'vaca', 1),
(334, 'wali', 'bien', 1),
(335, 'waña', 'quemar', 1),
(336, 'waqay', 'llorar', 1),
(337, 'wawa', 'niño', 1),
(338, 'wichay', 'arriba', 1),
(339, 'wila', 'sangre', 1),
(340, 'wilanchay', 'familia', 1),
(341, 'wiqu', 'brazo', 1),
(342, 'yaku', 'agua', 1),
(343, 'yana', 'negro', 1),
(344, 'yapu', 'tierra cultivable', 1),
(345, 'yati', 'saber', 1),
(346, 'yatichaña', 'enseñar', 1),
(347, 'yatiña', 'conocer', 1),
(348, 'yawa', 'helado', 1),
(349, 'wayna', 'joven', 1),
(350, 'yujra', 'pelo', 1),
(351, 'yuli', 'amarillo', 1),
(352, 'yuri', 'río', 1),
(353, 'pay-suma', 'gracias', 1),
(354, 'yuqalla', 'niño', 1),
(355, 'aka', 'este', 1),
(356, 'uka', 'aquel', 1),
(357, 'pachamama', 'madre tierra', 1),
(358, 'tata', 'padre', 1),
(359, 'jaqi', 'gente', 1),
(360, 'yatiña', 'saber', 1),
(361, 'munasiña', 'amor', 1),
(362, 'uñt\'aña', 'aprender', 1),
(363, 'jach\'a uru', 'día grande', 1),
(364, 'yatiqaña', 'estudiar', 1),
(365, 'thakhi', 'camino', 1),
(366, 'wawa', 'niño', 1),
(367, 'warmi', 'mujer', 1),
(368, 'chacha', 'hombre', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `nota` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `permiso` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('maestro','estudiante','admin') NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `role`, `activo`, `email`) VALUES
(1, 'Abraham', '$2y$10$.qpdtZrUFTil3Vflh5Pv9.Y0OPdtV932fQKK64lHpdXrQ/cQnKxn2', 'maestro', 1, 'abraham@gmail.com'),
(2, 'Miguel', '$2y$10$.qpdtZrUFTil3Vflh5Pv9.Y0OPdtV932fQKK64lHpdXrQ/cQnKxn2', 'estudiante', 1, 'Miguel@gmail.com'),
(3, 'Admin', '$2y$10$.qpdtZrUFTil3Vflh5Pv9.Y0OPdtV932fQKK64lHpdXrQ/cQnKxn2', 'admin', 1, 'Admin@gmail.com'),
(4, 'juanito', '$2y$10$B0ADhAZ0qK0LcTxwjMsN2u/BtZlCF5CZVw.zwH3.nsyrR.E9WVEL6', 'estudiante', 1, 'juanito@example.com'),
(5, 'maria25', '$2y$10$B0ADhAZ0qK0LcTxwjMsN2u/BtZlCF5CZVw.zwH3.nsyrR.E9WVEL6', 'estudiante', 1, 'maria25@example.com'),
(6, 'pedrito', '$2y$10$B0ADhAZ0qK0LcTxwjMsN2u/BtZlCF5CZVw.zwH3.nsyrR.E9WVEL6', 'maestro', 1, 'pedrito@example.com'),
(7, 'luisa_2000', '$2y$10$B0ADhAZ0qK0LcTxwjMsN2u/BtZlCF5CZVw.zwH3.nsyrR.E9WVEL6', 'estudiante', 1, 'luisa_2000@example.com'),
(8, 'carlos89', 'hashed_password5', 'maestro', 1, 'carlos89@example.com'),
(9, 'Daniel', '$2y$10$.qpdtZrUFTil3Vflh5Pv9.Y0OPdtV932fQKK64lHpdXrQ/cQnKxn2', 'estudiante', 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `diccionario`
--
ALTER TABLE `diccionario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diccionario`
--
ALTER TABLE `diccionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
