-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 15-09-2021 a las 15:13:23
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id17443821_traductor02`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`id17443821_root2`@`%` FUNCTION `fun_agregar_palabra` (`p_palabra` VARCHAR(255), `p_id_tipo` INT, `p_id_idioma` INT) RETURNS BIT(1) BEGIN 
	DECLARE v BIT;
	SET v = IF((SELECT COUNT(*) FROM palabras t1 WHERE t1.palabra = p_palabra AND t1.id_idioma = p_id_idioma) = 0, 1, 0);
	IF (v = 1) then
		INSERT INTO palabras(palabra, id_tipo, id_idioma)
		VALUES(UPPER(p_palabra), p_id_tipo, p_id_idioma); 
		RETURN 1;
	ELSE
		RETURN 0;
	END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id` int(3) NOT NULL,
  `idioma` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `composicion_prosa` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id`, `idioma`, `composicion_prosa`) VALUES
(1, 'español', '1,2,3,4,5,6,7,8,9,10,'),
(4, 'tucano', '4,10,9,8,7,6,5,3,2,1,');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `palabras`
--

CREATE TABLE `palabras` (
  `id` int(11) NOT NULL,
  `palabra` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_tipo` int(2) NOT NULL,
  `id_idioma` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `palabras`
--

INSERT INTO `palabras` (`id`, `palabra`, `id_tipo`, `id_idioma`) VALUES
(1, 'mamá', 1, 1),
(2, 'pacó', 1, 4),
(6, 'mama', 1, 1),
(8, 'papá', 1, 1),
(10, 'jugar', 5, 1),
(12, 'quiere', 5, 1),
(14, 'dormir', 5, 1),
(15, 'cãrĩ', 5, 4),
(16, 'mamamá', 1, 1),
(18, 'Hola', 7, 1),
(25, 'cuántos', 1, 1),
(26, 'dicṹrã', 1, 4),
(27, 'animales', 1, 1),
(28, 'wa\'ícũrã', 1, 4),
(31, 'tío', 1, 1),
(32, 'pacú\'mami', 1, 4),
(39, 'abuelos', 1, 1),
(40, 'ñecũ-sumuá', 1, 4),
(41, 'abuelo', 1, 1),
(42, 'ñecú', 1, 4),
(45, 'corro', 5, 1),
(46, 'omagũ\'ti', 5, 4),
(47, 'correr', 5, 1),
(48, 'omagú\'ti', 5, 4),
(49, 'apérã', 5, 4),
(50, 'juego', 5, 1),
(51, 'a\'pei\'ti', 5, 4),
(52, 'juegamos', 5, 1),
(53, 'ape\'sé', 5, 4),
(54, 'ustedes', 4, 1),
(55, 'mũsa', 4, 4),
(56, 'usted', 4, 1),
(57, 'mu\'ú ', 4, 4),
(58, 'jugamos', 5, 1),
(59, 'a\'perasa', 5, 4),
(60, 'juguemos', 5, 1),
(61, 'jueguen', 5, 1),
(62, 'duermo', 5, 1),
(63, 'cari\'tibe', 5, 4),
(64, 'dormimos', 5, 1),
(65, 'duerman', 5, 1),
(66, 'cãrĩ\'ña', 5, 4),
(67, 'cãrí\'ña', 5, 4),
(68, 'duerma', 5, 1),
(69, 'estoy', 5, 1),
(70, 'ní\'i', 5, 4),
(71, 'jugando', 5, 1),
(74, 'negros', 2, 1),
(75, 'ñii\'sé', 2, 4),
(76, 'negro', 2, 1),
(77, 'ñii\'ro', 2, 4),
(78, 'amarillo', 2, 1),
(79, 'e\'búro', 2, 4),
(80, 'amarillos', 2, 1),
(81, 'e\'búri', 2, 4),
(82, 'blancos', 2, 1),
(83, 'bu\'tise', 2, 4),
(84, 'blanco', 2, 1),
(85, 'bu\'tiro', 2, 4),
(86, 'azul', 2, 1),
(87, 'yasa\'borero', 2, 4),
(88, 'azules', 2, 1),
(89, 'yasa\'bocuresé', 2, 4),
(90, 'rojos', 2, 1),
(91, 'sua\'sé', 2, 4),
(92, 'rojo', 2, 1),
(93, 'sua\'ro', 2, 4),
(94, 'verdes', 2, 1),
(95, 'yasa\'sé', 2, 4),
(96, 'verde', 2, 1),
(97, 'yasa\'ro', 2, 4),
(98, 'morado', 2, 1),
(99, 'soa\'bocũrero', 2, 4),
(100, 'morados', 2, 1),
(101, 'soa\'bocure\'sé', 2, 4),
(102, 'naranja', 2, 1),
(103, 'soabocũre\'ro', 2, 4),
(104, 'naranjas', 2, 1),
(105, 'soati\'sé', 2, 4),
(106, 'perro', 2, 1),
(107, 'Diayi', 2, 4),
(108, 'gato', 2, 1),
(109, 'pisana', 1, 4),
(110, 'loro', 2, 1),
(111, 'we\'co', 2, 4),
(112, 'perros', 2, 1),
(113, 'Diayia', 2, 4),
(114, 'loros', 2, 1),
(115, 'we\'cũa', 2, 4),
(116, 'guacamaya', 2, 1),
(117, 'ma\'ja', 2, 4),
(118, 'guibo', 2, 1),
(119, 'piro', 2, 4),
(120, 'guibos', 2, 1),
(121, 'piro\'áá', 2, 4),
(122, 'mojojoy', 2, 1),
(123, 'pico\'rú', 2, 4),
(124, 'mojojoys', 2, 1),
(125, 'pico\'rá', 2, 4),
(126, 'tucan', 2, 1),
(127, 'yataro', 2, 4),
(128, 'cocodrilo', 2, 1),
(129, 'u\'so', 2, 4),
(130, 'pez', 2, 1),
(131, 'wai', 2, 4),
(132, 'cocodrilos', 2, 1),
(133, 'u\'sua', 2, 4),
(134, 'peces', 2, 1),
(135, 'wá\'ya', 2, 4),
(136, 'mono', 2, 1),
(137, 'ake suagu', 2, 4),
(138, 'monos', 2, 1),
(139, 'akea sua\'rá', 2, 4),
(140, 'pajaro', 2, 1),
(141, 'miri\'cú', 2, 4),
(142, 'pajaros', 2, 1),
(143, 'miri\'ca', 2, 4),
(144, 'mico', 2, 1),
(145, 'micos', 2, 1),
(146, 'tigrillo', 2, 1),
(147, 'yai', 2, 4),
(148, 'tigre', 2, 1),
(149, 'jaguar', 2, 1),
(150, 'tigrillos', 2, 1),
(151, 'yaiya', 2, 4),
(152, 'tigres', 2, 1),
(153, 'jaguares', 2, 1),
(154, 'danta', 2, 1),
(155, 'dantas', 2, 1),
(156, 'we\'cúa', 2, 4),
(157, 'venado', 2, 1),
(158, 'ñama', 2, 4),
(159, 'venados', 2, 1),
(160, 'ñama\'ra', 2, 4),
(161, 'lapa', 2, 1),
(162, 'se\'me', 2, 4),
(163, 'lapas', 2, 1),
(164, 'se\'mea', 2, 4),
(165, 'pavo', 2, 1),
(166, 'pajui', 2, 4),
(167, 'pava', 2, 1),
(168, 'cũta\'casoro', 2, 4),
(169, 'pavas', 2, 1),
(170, 'cũta\'casoroa', 2, 4),
(171, 'duerme', 5, 1),
(172, 'cãrĩmí', 5, 4),
(173, 'corre', 5, 1),
(174, 'omamí', 5, 4),
(179, 'dos', 2, 1),
(180, 'puáru', 2, 4),
(181, '2', 2, 1),
(182, 'uno', 2, 1),
(183, 'ni\'cú', 2, 4),
(184, '1', 2, 1),
(185, 'tres', 2, 1),
(186, 'i\'tiara', 2, 4),
(187, '3', 2, 1),
(188, 'cuatro', 2, 1),
(189, 'ba\'pari\'tina', 2, 4),
(190, 'cinco', 2, 1),
(191, 'ni\'camoucũ\'ra', 2, 4),
(192, '5', 2, 1),
(193, 'río', 1, 1),
(195, 'ríos', 1, 1),
(197, 'casa', 1, 1),
(198, 'vi\'i', 1, 4),
(199, 'caños', 1, 1),
(200, 'mari\'ca', 1, 4),
(201, 'casas', 1, 1),
(202, 'vi\'seri', 1, 4),
(203, 'chagra', 2, 1),
(204, 've\'se', 2, 4),
(206, 'puerto', 1, 1),
(207, 'pe\'ta', 1, 1),
(208, 'puertos', 1, 1),
(209, 'pe\'tari', 1, 4),
(210, 'pueblo', 1, 1),
(211, 'ma\'ca', 1, 4),
(212, 'pueblos', 1, 1),
(213, 'ma\'cari', 1, 4),
(214, 'ciudad', 1, 1),
(215, 'pajiri\'maca', 1, 4),
(216, 'ciudades', 1, 1),
(217, 'paca\'se maca\'ri', 1, 4),
(218, 'monte', 1, 1),
(219, 'nũ\'cú', 1, 4),
(220, 'montes', 1, 1),
(221, 'un\'cũri', 1, 4),
(222, 'ropa', 1, 1),
(223, ' su\'ti', 1, 4),
(224, 'jefe', 1, 1),
(225, 'wiógu', 1, 4),
(226, 'cuál', 6, 1),
(227, 'dicó', 6, 4),
(228, 'cual', 6, 1),
(229, 'cómo', 6, 1),
(230, 'de´ró', 6, 4),
(231, 'quién', 4, 1),
(232, 'noá', 4, 4),
(233, 'como', 6, 1),
(234, 'agua', 1, 1),
(235, 'acó', 1, 4),
(236, 'nosotros', 4, 1),
(237, 'ũsằ', 4, 4),
(238, 'ay', 7, 1),
(239, 'agú', 7, 4),
(240, 'oh', 7, 1),
(241, 'a\'yú', 7, 4),
(242, 'malo', 2, 1),
(243, 'ña\'á', 2, 4),
(244, 'mujer', 1, 1),
(245, 'númió', 1, 4),
(246, 'muy', 6, 1),
(247, 'pṹrõ', 6, 4),
(248, 'caliente', 2, 1),
(249, 'asĩ', 2, 4),
(250, 'hermano', 1, 1),
(251, 'pánumu', 1, 4),
(252, 'banano', 1, 1),
(253, 'Ojò', 1, 4),
(254, 'hoy', 6, 1),
(255, '  ní\'cãcã', 6, 4),
(256, 'mucho', 2, 1),
(257, 'asé', 2, 4),
(258, 'ella', 4, 1),
(259, 'A-mo', 4, 4),
(260, 'viejo', 2, 1),
(261, 'Bucú', 2, 4),
(262, 'ña\'á', 2, 4),
(263, 'bueno', 2, 1),
(264, 'añurằ', 2, 4),
(265, 'bien', 6, 1),
(266, 'añurṍ', 6, 4),
(267, 'este', 2, 1),
(268, 'a\'tí', 2, 4),
(269, 'mañana', 6, 1),
(270, 'ñami', 6, 4),
(272, 'mujĩpũ', 1, 4),
(273, 'vamos', 5, 1),
(274, 'te\'á', 5, 4),
(275, 'tambien', 6, 1),
(276, 'que\'rãrẽ', 6, 4),
(277, 'entonces', 6, 1),
(278, 'tojó', 6, 4),
(279, 'juegan', 5, 1),
(280, 'juega', 5, 1),
(281, 'malos', 2, 1),
(282, 'ña\'agṹ', 2, 4),
(283, 'negra', 2, 1),
(284, 'ojo', 1, 1),
(285, 'capé\'a', 1, 4),
(286, 'ojos', 1, 1),
(287, 'capé\'ri', 1, 4),
(288, 'semilla', 1, 1),
(289, 'pé ', 1, 4),
(290, 'semillas', 1, 1),
(291, 'péri', 1, 4),
(292, 'mano', 1, 1),
(293, 'omócã', 1, 4),
(294, 'manos', 1, 1),
(295, 'omócã\'rĩ', 1, 4),
(296, 'morir', 1, 1),
(297, 'wari', 1, 4),
(298, 'dañar', 1, 1),
(299, 'ṹrĩ', 1, 4),
(300, 'terminar', 1, 1),
(301, 'pe\'tí', 1, 4),
(302, 'ir', 5, 1),
(303, 'wa\'a', 5, 4),
(304, 'decir', 5, 1),
(305, 'weré', 5, 4),
(306, 'venir', 5, 1),
(307, 'murio', 1, 1),
(308, 'weria', 1, 4),
(309, 'pasear', 5, 1),
(310, 'wee\'wú', 5, 4),
(311, 'cada', 2, 1),
(312, 'umúcori', 2, 4),
(313, 'otro', 2, 1),
(314, 'apé', 2, 4),
(315, 'estuvo', 5, 1),
(316, 'ni\'ápu', 5, 4),
(317, 'estuve', 5, 1),
(318, 'el estuvo', 5, 1),
(319, 'ni\'ami', 5, 4),
(320, 'ella estuvo', 5, 1),
(321, 'ni\'amo', 5, 4),
(322, 'ellos estuvieron', 5, 1),
(323, 'ní\'wũ', 5, 4),
(324, 'ellas estuvieron', 5, 1),
(325, 'está', 5, 1),
(326, 'el esta', 5, 1),
(327, 'ní\'mi', 5, 4),
(328, 'vaya', 5, 1),
(329, 'wa\'áya', 5, 4),
(330, 'trae', 5, 1),
(331, 'mítimi', 5, 4),
(332, 'romper', 5, 1),
(333, 'dojá', 5, 4),
(334, 'tiene', 5, 1),
(335, 'cuomí', 5, 4),
(336, 'hace', 5, 1),
(337, 'wee', 5, 4),
(339, 'hace', 5, 4),
(340, 'hacer', 5, 1),
(341, 'fui', 5, 1),
(342, 'wa\'águ', 5, 4),
(343, 'fue', 5, 1),
(344, 'wa\'ágo', 5, 4),
(345, 'fuimos', 5, 1),
(346, 'wa\'á´ra', 5, 4),
(347, 'haria', 5, 1),
(348, 'fueron', 5, 1),
(349, 'cuidamos', 5, 1),
(350, 'co\'teápu', 5, 4),
(351, 'esa', 5, 1),
(352, 'té', 5, 4),
(353, 'ellos', 4, 1),
(354, 'ná', 4, 4),
(355, 'ese', 4, 1),
(356, 'sĩ\'í', 4, 4),
(357, 'los', 3, 1),
(358, 'nárẽ', 3, 4),
(359, 'quiero', 4, 1),
(360, 'uá\'carore', 4, 4),
(361, 'día', 1, 1),
(362, 'nucṹ', 1, 4),
(363, 'ayer', 1, 1),
(364, 'ñamíca\'a', 1, 4),
(365, 'antes', 6, 1),
(366, 'deporó', 6, 4),
(367, 'despues', 6, 1),
(368, 'be\'ró', 6, 4),
(369, '4', 2, 1),
(370, 'debajo', 6, 1),
(371, 'docá', 6, 4),
(372, 'abajo', 6, 1),
(373, 'noticias', 1, 1),
(374, 'quetí', 1, 4),
(375, 'no se', 4, 1),
(376, 'ṹba\'a', 4, 4),
(377, 'entre', 9, 1),
(378, 'sãjằtia', 9, 4),
(379, 'comer', 5, 1),
(380, 'ba\'á', 5, 4),
(381, 'comen', 5, 1),
(382, 'ba\'árã', 5, 4),
(383, 'yo como', 5, 1),
(384, 'yu\'ú ba\'agũti', 5, 4),
(385, 'cocinan', 5, 1),
(386, 'duasé', 5, 4),
(387, 'arreglan', 5, 1),
(388, 'apo\'sé', 5, 4),
(389, 'aprendo', 5, 1),
(390, 'buegũ\'ti', 5, 4),
(391, 'estudio', 5, 1),
(392, 'perezosas', 1, 1),
(393, 'daratigo', 1, 4),
(394, 'perezosa', 1, 1),
(395, 'nisiago', 1, 4),
(396, 'perezoso', 1, 1),
(397, 'nisiagu', 1, 4),
(398, 'perezosos', 1, 1),
(399, 'daratigu', 1, 4),
(400, 'pelear', 5, 1),
(401, ' amenkei\'ti', 5, 4),
(402, 'pelearon', 5, 1),
(403, 'amenken\'sé', 5, 4),
(404, 'cortar', 5, 1),
(405, 'paũ\'ti', 5, 4),
(406, 'cortaron', 5, 1),
(407, 'dúte\'sé', 5, 4),
(408, 'comemos', 5, 1),
(409, 'ba\'ara', 5, 4),
(412, 'caño', 1, 1),
(413, 'ma', 1, 4),
(414, 'chagras', 1, 1),
(415, 've\'seri', 1, 4),
(416, 'padres', 1, 1),
(417, 'pacósũma', 1, 4),
(418, 'tatara tatara', 2, 1),
(419, 'tiropũ', 2, 4),
(420, 'tia', 1, 1),
(421, 'wameo', 1, 4),
(422, 'tio', 1, 1),
(423, 'primos', 1, 1),
(424, 'basũkará', 1, 4),
(425, 'primo', 1, 1),
(426, 'basũcú', 1, 4),
(427, 'prima', 1, 1),
(428, 'basũcó', 1, 4),
(429, 'pacú', 1, 4),
(430, 'abuela', 1, 1),
(431, 'ñe\'cṍ', 1, 4),
(432, 'vieja', 1, 1),
(433, 'bucó', 1, 4),
(434, 'esposa', 1, 1),
(435, 'nu\'mó', 1, 4),
(436, 'señora', 1, 1),
(437, 'esposo', 1, 1),
(438, 'marằ\'pú', 1, 4),
(439, 'marido', 1, 1),
(440, 'hijo', 1, 1),
(441, 'ma\'cú', 1, 4),
(442, 'hijos', 1, 1),
(443, 'po\'raa', 1, 4),
(444, 'hija', 1, 1),
(445, 'ma\'có', 1, 4),
(446, 'hijas', 1, 1),
(447, 'pa\'ra numia', 1, 4),
(448, 'hombre', 1, 1),
(449, 'umú', 1, 4),
(450, 'hola', 7, 1),
(451, 'né', 7, 4),
(452, 'aqui', 6, 1),
(453, 'a\'tó', 6, 4),
(454, 'allá', 6, 1),
(455, 'sõ\'ó', 6, 4),
(456, 'cerca', 6, 1),
(457, 'pu\'tó', 6, 4),
(458, 'lejos', 6, 1),
(459, 'yoaró', 6, 4),
(460, 'rio arriba', 6, 1),
(461, 'bú\'i', 6, 4),
(462, 'arriba', 6, 1),
(463, '¿Dónde?', 6, 1),
(464, 'no\'ó', 6, 4),
(465, 'borde', 1, 1),
(466, 'sumúto', 1, 4),
(467, 'orrilla', 2, 1),
(468, 'central', 2, 1),
(469, 'decó', 2, 4),
(470, 'mitad', 1, 1),
(471, 'orilla', 1, 1),
(472, 'centro', 1, 1),
(473, 'pasado', 1, 1),
(474, 'yu\'ruró', 1, 4),
(475, 'mas alla', 6, 1),
(476, 'lugar', 1, 1),
(477, 'tíro', 1, 4),
(478, 'cabecera', 1, 1),
(479, 'po\'té', 1, 4),
(480, 'desembocadura', 1, 1),
(481, 'pi\'tó', 1, 4),
(482, 'río abajo', 6, 1),
(483, 'síro', 6, 4),
(484, 'final', 2, 1),
(485, 'yapá', 2, 4),
(486, 'frente', 1, 1),
(487, 'diápoa', 1, 4),
(488, 'delantero', 1, 1),
(489, 'atrás', 6, 1),
(490, 'se\'éma', 6, 4),
(491, 'detrás', 6, 1),
(492, 'adentro', 6, 1),
(493, 'po\'peápu', 6, 4),
(494, 'en', 9, 1),
(495, '-re', 9, 4),
(496, 'hacia', 9, 1),
(497, 'a', 9, 1),
(498, '-pu', 9, 4),
(499, 'ahora', 6, 1),
(500, 'ni\'cằrõ', 6, 4),
(501, 'la tarde', 1, 1),
(502, 'anteayer', 6, 1),
(503, 'ñamíca\'a yu\'ruro', 6, 4),
(504, 'noche', 1, 1),
(505, 'ñámí', 1, 4),
(506, 'esta noche', 1, 1),
(507, 'ni\'cãcằ ñami', 1, 4),
(508, 'anoche', 6, 1),
(509, 'ñamíca\'a ñami', 6, 4),
(510, 'ñamiácã', 1, 4),
(511, 'por la mañana', 6, 1),
(512, '¿cuando?', 6, 1),
(513, 'de\'ro nicằ', 6, 4),
(514, 'inmediatamente', 6, 1),
(515, 'maatá', 6, 4),
(516, 'mas temprano', 2, 1),
(517, 'mejépu', 2, 4),
(518, 'hace rato', 2, 1),
(519, 'hace unos dias', 2, 1),
(520, 'cằrṹ', 2, 4),
(521, 'sin embargo', 6, 1),
(522, 'yujúpu', 6, 4),
(523, 'todavía', 6, 1),
(524, 'al principio', 1, 1),
(525, 'né waro', 1, 4),
(526, 'mucho tiempo', 6, 1),
(527, 'yoacằ', 6, 4),
(528, '¿cuándo, en que tiempo?', 6, 1),
(529, 'no\'ocátero', 6, 4),
(530, '¿en que tiempo?', 6, 1),
(531, '¿Cuánto tiempo', 6, 1),
(532, 'no\'o cṍrõ yoacằ', 6, 4),
(533, 'en este tiempo', 6, 1),
(534, 'a\'tócatero', 6, 4),
(535, 'como en este tiempo', 6, 1),
(536, 'esa vez', 6, 1),
(537, 'sõ\'o nĩcatero', 6, 4),
(538, 'hace algunos dias', 6, 1),
(539, 'tí numú', 6, 4),
(540, 'otro momento', 6, 1),
(541, 'apétero', 6, 4),
(542, 'otro tiempo', 6, 1),
(543, 'hace tiempo', 6, 1),
(544, 'to dupóro', 6, 4),
(545, 'umúco', 6, 4),
(546, 'rio', 1, 1),
(547, 'dia', 1, 4),
(548, 'rios', 1, 1),
(549, 'dia\'ri', 1, 4),
(550, 'amanecer', 5, 1),
(551, 'bo\'reacằ', 5, 4),
(552, 'mediodía', 1, 1),
(553, 'dajarí tero', 1, 4),
(554, 'tarde', 6, 1),
(555, 'medianoche', 1, 1),
(556, 'ñami deco', 1, 4),
(557, ' anochecer', 5, 1),
(558, 'mujĩpũ sãjằrĩ cura', 5, 4),
(559, 'temprano por la mañana', 6, 1),
(560, 'ñamí ña\'cũrõ', 6, 4),
(561, 'mal', 6, 1),
(562, 'ña\'arṍ', 6, 4),
(563, 'lentamente', 6, 1),
(564, 'sajátiro', 6, 4),
(565, 'rápidamente', 6, 1),
(566, 'sojaró', 6, 4),
(567, 'demasiado', 6, 1),
(568, 'umúñarõ', 6, 4),
(569, 'realmente', 6, 1),
(570, 'upútu', 6, 4),
(571, 'así', 6, 1),
(572, 'juntos', 6, 1),
(573, 'su\'orí', 6, 4),
(574, 'como eso', 6, 1),
(575, 'recíprocamente', 6, 1),
(576, 'a\'mérĩ', 6, 4),
(577, 'yo', 4, 1),
(578, 'yu\'ú', 4, 4),
(582, 'parecido', 6, 1),
(583, 'ni\'cằrõ me\'rã', 6, 4),
(584, 'de verdad', 6, 1),
(585, 'diacjṹ', 6, 4),
(586, 'presisamente así', 6, 1),
(587, 'tojóta', 6, 4),
(588, 'tanto', 6, 1),
(589, 'tócõ\'rõta', 6, 4),
(590, 'no más', 6, 1),
(591, 'definitivamente no', 6, 1),
(592, 'mejéta', 6, 4),
(593, 'no', 6, 1),
(594, 'disitnto', 6, 1),
(595, 'mejẽcã', 6, 4),
(596, 'de otra manera', 6, 1),
(597, 'werónojõ', 6, 4),
(598, 'más que', 6, 1),
(599, 'nemorṍ', 6, 4),
(600, 'mi', 2, 4),
(601, 'menos que', 6, 1),
(602, 'dujáro', 6, 4),
(603, 'más escaso que', 6, 1),
(604, 'mí', 4, 1),
(605, 'más pequeño que', 6, 1),
(606, 'cã\'rṍ', 6, 4),
(607, 'más grande que', 6, 1),
(608, 'yu\'ruóro', 6, 4),
(609, 'luna', 1, 1),
(611, 'niño', 1, 1),
(612, 'wi\'ma-gṹ', 1, 4),
(613, 'ná-rẽ', 4, 4),
(614, 'niños', 1, 1),
(615, 'wi\'ma-rằ', 1, 4),
(616, 'niña', 1, 1),
(617, 'wi\'ma-gṍ', 1, 4),
(618, 'hombre tucano', 1, 1),
(619, 'dasé-i', 1, 4),
(620, 'mujer tucana', 1, 1),
(621, 'dasé-o', 1, 4),
(622, 'tucanos', 1, 1),
(623, 'dase-a', 1, 4),
(625, 'mujĩpũ-a', 1, 4),
(626, 'mes', 1, 1),
(627, 'Mujĩpṹ', 1, 4),
(628, 'sol', 1, 1),
(629, 'Mujīpũ', 1, 4),
(630, 'esposos', 1, 1),
(631, 'marằ\'pu-sumua', 1, 4),
(632, 'esposas', 1, 1),
(633, 'nu\'mó-sánumia', 1, 4),
(634, 'abuelas', 1, 1),
(635, 'ñecõ-sánumia', 1, 4),
(640, 'hermana', 1, 1),
(641, 'pánumo', 1, 4),
(642, 'buenos días', 1, 1),
(643, 'wakatí Mũsa', 1, 4),
(644, 'hermanos', 1, 1),
(645, 'ma\'mi', 1, 4),
(646, 'mayores', 1, 1),
(647, 'sumuá', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion_palabras`
--

CREATE TABLE `relacion_palabras` (
  `id` int(11) NOT NULL,
  `id_palabra_origen` int(11) NOT NULL,
  `id_palabra_traduccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `relacion_palabras`
--

INSERT INTO `relacion_palabras` (`id`, `id_palabra_origen`, `id_palabra_traduccion`) VALUES
(1, 1, 2),
(237, 8, 429),
(28, 10, 49),
(8, 14, 15),
(14, 25, 26),
(15, 27, 28),
(17, 31, 32),
(22, 39, 40),
(23, 41, 42),
(26, 45, 46),
(27, 47, 48),
(29, 50, 51),
(30, 52, 53),
(31, 54, 55),
(32, 56, 57),
(33, 58, 59),
(34, 60, 59),
(35, 61, 59),
(36, 62, 63),
(37, 64, 63),
(38, 65, 66),
(39, 65, 67),
(40, 68, 67),
(41, 69, 70),
(42, 71, 51),
(44, 74, 75),
(45, 76, 77),
(46, 78, 79),
(47, 80, 81),
(48, 82, 83),
(49, 84, 85),
(50, 86, 87),
(51, 88, 89),
(52, 90, 91),
(53, 92, 93),
(54, 94, 95),
(55, 96, 97),
(56, 98, 99),
(57, 100, 101),
(58, 102, 103),
(59, 104, 105),
(60, 106, 107),
(61, 108, 109),
(62, 110, 111),
(63, 112, 113),
(64, 114, 115),
(65, 116, 117),
(66, 118, 119),
(67, 120, 121),
(68, 122, 123),
(69, 124, 125),
(70, 126, 127),
(71, 128, 129),
(72, 130, 131),
(73, 132, 133),
(74, 134, 135),
(75, 136, 137),
(76, 138, 139),
(77, 140, 141),
(78, 142, 143),
(79, 144, 137),
(80, 145, 139),
(81, 146, 147),
(82, 148, 147),
(83, 149, 147),
(84, 150, 151),
(85, 152, 151),
(86, 153, 151),
(87, 154, 111),
(88, 155, 156),
(89, 157, 158),
(90, 159, 160),
(91, 161, 162),
(92, 163, 164),
(93, 165, 166),
(94, 167, 168),
(95, 169, 170),
(96, 171, 172),
(97, 173, 174),
(100, 179, 180),
(101, 181, 180),
(102, 182, 183),
(103, 184, 183),
(104, 185, 186),
(105, 187, 186),
(106, 188, 189),
(107, 190, 191),
(108, 192, 191),
(111, 197, 198),
(112, 199, 200),
(113, 201, 202),
(114, 203, 204),
(116, 206, 207),
(117, 208, 209),
(118, 210, 211),
(119, 212, 213),
(120, 214, 215),
(121, 216, 217),
(122, 218, 219),
(123, 220, 221),
(124, 222, 223),
(125, 224, 225),
(126, 226, 227),
(127, 228, 227),
(128, 229, 230),
(129, 231, 232),
(130, 233, 230),
(336, 233, 597),
(131, 234, 235),
(132, 236, 237),
(133, 238, 239),
(134, 240, 241),
(135, 242, 243),
(145, 242, 262),
(136, 244, 245),
(137, 246, 247),
(138, 248, 249),
(139, 250, 251),
(140, 252, 253),
(141, 254, 255),
(142, 256, 257),
(143, 258, 259),
(144, 260, 261),
(146, 263, 264),
(147, 265, 266),
(148, 267, 268),
(149, 269, 270),
(284, 269, 510),
(151, 273, 274),
(152, 275, 276),
(153, 277, 278),
(154, 279, 59),
(155, 280, 51),
(156, 281, 282),
(157, 283, 75),
(158, 284, 285),
(159, 286, 287),
(160, 288, 289),
(161, 290, 291),
(162, 292, 293),
(163, 294, 295),
(164, 296, 297),
(165, 298, 299),
(166, 300, 301),
(167, 302, 303),
(168, 304, 305),
(169, 306, 305),
(170, 307, 308),
(171, 309, 310),
(172, 311, 312),
(173, 313, 314),
(174, 315, 316),
(175, 317, 316),
(176, 318, 319),
(177, 320, 321),
(178, 322, 323),
(179, 324, 323),
(180, 325, 70),
(181, 326, 327),
(182, 328, 329),
(183, 330, 331),
(184, 332, 333),
(185, 334, 335),
(186, 336, 337),
(188, 340, 337),
(189, 341, 342),
(190, 343, 344),
(191, 345, 346),
(192, 347, 337),
(193, 348, 346),
(194, 349, 350),
(195, 351, 352),
(196, 353, 354),
(197, 355, 356),
(198, 357, 358),
(347, 357, 613),
(199, 359, 360),
(200, 361, 362),
(305, 361, 545),
(201, 363, 364),
(202, 365, 366),
(203, 367, 368),
(204, 369, 189),
(205, 370, 371),
(206, 372, 371),
(207, 373, 374),
(208, 375, 376),
(209, 377, 378),
(210, 379, 380),
(211, 381, 382),
(212, 383, 384),
(213, 385, 386),
(214, 387, 388),
(215, 389, 390),
(216, 391, 390),
(217, 392, 393),
(218, 394, 395),
(219, 396, 397),
(220, 398, 399),
(221, 400, 401),
(222, 402, 403),
(223, 404, 405),
(224, 406, 407),
(225, 408, 409),
(228, 412, 413),
(229, 414, 415),
(230, 416, 417),
(231, 418, 419),
(232, 420, 421),
(233, 422, 32),
(234, 423, 424),
(235, 425, 426),
(236, 427, 428),
(238, 430, 431),
(239, 432, 433),
(240, 434, 435),
(241, 436, 435),
(242, 437, 438),
(243, 439, 438),
(244, 440, 441),
(245, 442, 443),
(246, 444, 445),
(247, 446, 447),
(248, 448, 449),
(249, 450, 451),
(250, 452, 453),
(251, 454, 455),
(252, 456, 457),
(253, 458, 459),
(254, 460, 461),
(255, 462, 461),
(256, 463, 464),
(257, 465, 466),
(258, 467, 466),
(259, 468, 469),
(260, 470, 469),
(261, 471, 466),
(262, 472, 469),
(263, 473, 474),
(264, 475, 474),
(265, 476, 477),
(266, 478, 479),
(267, 480, 481),
(268, 482, 483),
(269, 484, 485),
(270, 486, 487),
(271, 488, 487),
(272, 489, 490),
(273, 491, 490),
(274, 492, 493),
(275, 494, 495),
(276, 496, 495),
(277, 497, 498),
(278, 499, 500),
(279, 501, 364),
(280, 502, 503),
(281, 504, 505),
(282, 506, 507),
(283, 508, 509),
(285, 511, 510),
(286, 512, 513),
(287, 514, 515),
(288, 516, 517),
(289, 518, 517),
(290, 519, 520),
(291, 521, 522),
(292, 523, 522),
(293, 524, 525),
(294, 526, 527),
(295, 528, 529),
(296, 530, 529),
(297, 531, 532),
(298, 533, 534),
(299, 535, 534),
(300, 536, 537),
(301, 538, 539),
(302, 540, 541),
(303, 542, 541),
(304, 543, 544),
(306, 546, 547),
(307, 548, 549),
(308, 550, 551),
(309, 552, 553),
(310, 554, 364),
(311, 555, 556),
(312, 557, 558),
(313, 559, 560),
(314, 561, 562),
(315, 563, 564),
(316, 565, 566),
(317, 567, 568),
(318, 569, 570),
(319, 571, 278),
(320, 572, 573),
(321, 574, 278),
(322, 575, 576),
(323, 577, 578),
(327, 582, 583),
(328, 584, 585),
(329, 586, 587),
(330, 588, 589),
(331, 590, 589),
(332, 591, 592),
(333, 593, 592),
(334, 594, 595),
(335, 596, 595),
(337, 598, 599),
(338, 600, 578),
(339, 601, 602),
(340, 603, 602),
(341, 604, 578),
(342, 605, 606),
(343, 607, 608),
(344, 609, 272),
(346, 611, 612),
(348, 614, 615),
(349, 616, 617),
(350, 618, 619),
(351, 620, 621),
(352, 622, 623),
(354, 626, 627),
(355, 628, 629),
(356, 630, 631),
(357, 632, 633),
(358, 634, 635),
(361, 640, 641),
(362, 642, 643),
(363, 644, 645),
(364, 646, 647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(2) NOT NULL,
  `tipo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `tipo`, `descripcion`) VALUES
(1, 'sustantivo', 'Palabra que se usa para nombrar a una persona, lugar, cosa, idea o cualidad. Acepta artículos y flexiones plurales.<br>Niño, mesa, profesor, belleza, automóvil, campos…<br>El <b>hombre</b> entró en la <b>habitación </b>sin hacer <b>ruido</b>.<br>Entre las <b>frutas</b> que <b>Julia</b> prefiere están: las <i>peras</i> y las <b>fresas</b>.'),
(2, 'adjetivo', 'Palabra que se usa para modificar o limitar un nombre.<br>Rojo, azul, alto, bella, feliz, diez.<br>Los <b>mejores</b> promedios son de los alumnos <b>aplicados</b>.'),
(3, 'artículo', 'Palabra que determina un sustantivo. &nbsp;Pueden ser determinados: el, la, los, las; o indeterminados: un, una, unos, unas.<br><b>Los</b> quejosos trajeron <b>unas</b> pancartas.'),
(4, 'pronombre', 'Palabra que se usa en lugar de un sustantivo:<br>Yo, tú, él, nosotros, ustedes, ellos, que, quien, me, mi, su…<br><b>Ella </b>dijo que <b>se lo</b> compraría a <b>ustedes</b>.'),
(5, 'verbo', 'Palabra que se usa para expresar una acción o un estado del ser. Por definición, el verbo contiene información relativa a tiempo y persona, por ello, éste siempre debe estar conjugado.<br>Estudiamos, has jugado, soñó, trabaja, va a vivir, descansarán…<br>Él <b>cantó </b>mientras la orquesta <b>tocaba</b> (verbos de acción).<br><b>Estamos</b> felices de <b>saber </b>que <b>luces</b> mejor (verbos copulativos).'),
(6, 'adverbio', 'Palabra que se usa para modificar el significado de un verbo, de un adjetivo o de otro adverbio.<br>Rápidamente, obviamente, más, muy, demasiado, hoy, ayer, sí, no…<br><b>Repentinamente</b> gritó la verdad (modifica al verbo “gritó”). <br>La miel es <b>demasiado</b> dulce para mi gusto (modifica al adjetivo “dulce”).<br>Corrió <b>muy rápidamente</b> (modifica al adverbio “rápidamente”).'),
(7, 'interjección', 'Una palabra usada para expresar emoción repentina; no tiene conexión gramatical con el resto de la oración.<br>Híjole, chin, bah, ah, oh, hey, ¿ah, sí?, ah bueno, wow…<br>¡<b>Ah</b>!, ¿eras tú el que estaba tocando la puerta como si viniera a cobrar?'),
(8, 'conjunción', 'Una palabra que se usa para conectar palabras, frases y cláusulas dentro de las oraciones. Se clasifican en coordinantes (unen elementos de la misma categoría) y subordinantes (introducen oraciones subordinadas que se unen con una oración independiente).<br>Y, o, pero, que, porque, si, cuando<br>Los tuvieron a pan <b>y</b> agua (la conjunción une dos sustantivos).<br>El cielo muestra notables cambios en la mañana <b>y</b> en la noche (la conjunción une frases).<br>Mariana se quedó en casa <b>porque</b> quiere estudiar (la conjunción une cláusulas: una independiente y otra subordinada).'),
(9, 'preposición', 'Una palabra que se usa para mostrar la relación entre un nombre o pronombre y otra parte de la oración.<br>A, ante, bajo, cabe, con, contra, de, desde, en, entre, hacia, hasta, para, por, según, sin, so, sobre, tras.<br>Lola viajó <b>a</b> Monterrey <b>para</b> el concurso <b>de </b>canto (“a Monterrey” y “para el concurso de canto” son frases preposicionales; “Monterrey” y “el concurso de canto” son los objetos de las preposiciones “a” y “para”).'),
(10, 'objeto', 'El objeto directo y el objeto indirecto son estructuras sintácticas que modifican al verbo y, por ende, están presentes en el predicado de la oración. Por ejemplo: Entregamos el <b>diploma</b> a María');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(3) NOT NULL,
  `usuario` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `contrasena` varchar(255) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contrasena`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_idiomas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_idiomas` (
`conteo` bigint(21)
,`idioma` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_palabras`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_palabras` (
`conteo` bigint(21)
,`palabra` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_idiomas`
--
DROP TABLE IF EXISTS `vista_idiomas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id17443821_root2`@`%` SQL SECURITY DEFINER VIEW `vista_idiomas`  AS  select count(0) AS `conteo`,`t1`.`idioma` AS `idioma` from `idiomas` `t1` where `t1`.`id` <> 0 group by `t1`.`idioma` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_palabras`
--
DROP TABLE IF EXISTS `vista_palabras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id17443821_root2`@`%` SQL SECURITY DEFINER VIEW `vista_palabras`  AS  select count(0) AS `conteo`,`t1`.`palabra` AS `palabra` from `palabras` `t1` where `t1`.`id` <> 0 group by `t1`.`palabra` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `palabras`
--
ALTER TABLE `palabras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_id_idioma` (`id_idioma`),
  ADD KEY `FK_id_tipo` (`id_tipo`);

--
-- Indices de la tabla `relacion_palabras`
--
ALTER TABLE `relacion_palabras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_id_palabra` (`id_palabra_origen`,`id_palabra_traduccion`),
  ADD KEY `id_palabra_traduccion` (`id_palabra_traduccion`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `palabras`
--
ALTER TABLE `palabras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=648;

--
-- AUTO_INCREMENT de la tabla `relacion_palabras`
--
ALTER TABLE `relacion_palabras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `palabras`
--
ALTER TABLE `palabras`
  ADD CONSTRAINT `palabras_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `palabras_ibfk_2` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `relacion_palabras`
--
ALTER TABLE `relacion_palabras`
  ADD CONSTRAINT `relacion_palabras_ibfk_1` FOREIGN KEY (`id_palabra_origen`) REFERENCES `palabras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relacion_palabras_ibfk_2` FOREIGN KEY (`id_palabra_traduccion`) REFERENCES `palabras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
