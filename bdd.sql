-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 02, 2020 at 12:03 PM
-- Server version: 10.2.31-MariaDB-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctormo_bddr`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidoPaterno` varchar(255) NOT NULL,
  `apellidoMaterno` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` int(10) NOT NULL,
  `secret` text NOT NULL,
  `nuevo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `email`, `telefono`, `secret`, `nuevo`) VALUES
(23, 'Angelo', 'Terrile', 'Terrile', 'aterrile@gmail.com', 933979873, 'eb0a191797624dd3a48fa681d3061212', 0),
(24, 'Jose Antonio', 'Garay', 'Bustos', 'pepe_garay@yahoo.com', 965317206, '52133345f7a648c71c9ac425a736add7', 0),
(25, 'Marcelo', 'Chaparro', 'Gonzalez', 'marcelochaparrog@gmail.com', 975162481, '5550102e77f5b3cff29d430cbcd8f5a3', 0),
(26, 'Lorena', 'Castro', 'Castro', 'lorena.castr84@gmail.com', 965679207, 'ded32ff0bdfda6760c69dda8fbaa7553', 0),
(27, 'Gabriel', 'Noches', 'Perez', 'gnochesp@gmail.com', 992960215, '1fefeee3a7aa3137b27f6c09ea638d1e', 0),
(28, 'Gonzalo', 'Bascuñan', 'Gomez', 'gonzalobascu@gmail.com', 977909924, '02d89abefa3304dad1be2ab17f4a537c', 0),
(29, 'Omar', 'Valdebenito', 'Salgado', 'ovaldebe@gmail.com', 966561229, 'ae27c8e9be0304b0041b2429a49d43fe', 0),
(30, 'Juan', 'Caceres', 'Riquelme', 'jcaceres@caviauditores.cl', 998424943, 'e3376cffd0a8e153f545bf9e2b4219f3', 0),
(31, 'Javier', 'Basso', 'Diaz', 'j.basso@me.com', 931129343, 'a74c2c4ec9f93be12a4726bbec5eefda', 0),
(32, 'Bruno', 'Estefania', 'Elizondo', 'brunoe_cl@hotmail.com', 958384780, '56813b55002c070f65504c34cf0e651a', 0),
(33, 'Jorge', 'Guzman', 'Rojas', 'jguzman000@gmail.com', 33883194, '4ac9138c5bfdaf1275ee2427ad76dcbd', 0),
(35, 'Benjamin', 'Lainez', 'Tapia', 'benjamin.lainez@gmail.com', 982994382, 'c4010ba8b7fb3e301c4d1690be5d0327', 0),
(36, 'Alvaro', 'Dapremont', 'Huilcan', 'to.alvaro7@gmail.com', 985297150, '74d1b6440b78bd58d82ca7eb99574420', 0),
(37, 'Mauricio', 'Sepulveda', 'Corrales', 'msmarcangel@yahoo.es', 976680428, 'a77228183e151d57fcd2943d2c3e49fd', 1),
(38, 'Carlos', 'Criollo', 'Marruffo', 'carlos.criollo@mail.udp.cl', 998263862, '4f1cd9924bbbec2de2202029ae51fb14', 0),
(39, 'Arnaldo', 'Nuñez', 'Guerra', 'angcl1951@gmail.com', 992228676, 'c963501e50039e316d5c6f227da8ee44', 0),
(40, 'Luis', 'Vidal', 'Duran', 'luisvidald@gmail.com', 973356859, 'a70fcc8602c351ba8ee167a4c4f130a2', 0),
(41, 'Matias', 'Montenegro', 'Aravena', 'matias@viuprint.cl', 986279836, '1c3976cbaa58d4d969ab3c53461ca45a', 0),
(42, 'Jose Manuel', 'Soto', 'Caro', 'jose1.soto1@gmail.com', 978826067, '5b088a9f00b5c459615fa0117284cd4f', 1),
(43, 'Dante', 'Candelori', 'Meneses', 'dante.fabrizio@candelori.net', 931900558, 'd9686a92c335ec0428e3854ec26302ae', 0),
(44, 'Roman', 'Lachowytsch', 'Avila', 'romanct_1986@hotmail.com', 962387535, 'e18adaabd5f0f1ebb543dfefd0c13cb3', 1),
(45, 'Jonathan', 'Castillo', 'Varela', 'jonathan.acastillov@gmail.com', 987526751, 'f3487a4a15ffc45e433bb0562e3cdc23', 1),
(46, 'Camila', 'Salvo', 'Martinez', 'cami@ludics.cl', 982192486, 'f1524f359c9e3c603d9d19c64327d88d', 1),
(47, 'Andres', 'Catalan', 'Melo', 'andrescatalanm@gmail.com', 995926742, 'e80626d5d3e2436f054645f0bade45d9', 0),
(48, 'Javier', 'Villalobos', 'Rojas', 'javier.villalobos.r@gmail.com', 950997811, 'e9588111a57565b465f753c5b7a6401f', 1),
(49, 'Francisco', 'Zegers', 'Fracei', 'franciscozegers08@gmail.com', 968398795, 'd6d43d9974fad28be5eb8c3eac750914', 1),
(50, 'Cristian', 'Leiva', 'Constantinni', 'cristianleiva.20@gmail.com', 967198365, 'f06e38c1422f7c12a5ab41df3a6750dc', 1),
(51, 'Cristian', 'Silva', 'Cisternas', 'crisbenja33@gmail.com', 987549374, 'ba46de31b7cc416d95577e8fd04c109d', 0),
(52, 'Cristian', 'Donoso', 'Pinilla', 'cdonosop@gmail.com', 979593510, 'cef20dba8b72f2df70a79347fa6f1c35', 1),
(53, 'Bruno', 'Eitel', 'Olivares', 'bruno.eitel@gmail.com', 969180211, '6c1ec8612c9fb1c8d098bdb92b2aaa37', 1),
(54, 'Javier', 'Diaz', 'Rivera', 'jadiazr@gmail.com', 982341800, '24a470a22bb603995a06fa587e3523ac', 1),
(55, 'Pablo', 'Beaupuits', 'Aguirre', 'pmervier@gmail.com', 973492740, '5cf5d6d8efd0e38e7a2d6d2b2d5184d7', 1),
(56, 'Beatriz', 'Gonzalez', 'Aguilera', 'gonzalez.mbeatriz@gmail.com', 981969433, 'b1d42bd01a0de7783da0b51bd8db63e6', 0),
(57, 'Paulina', 'Leiva', 'Ubeda', 'paulina130104@gmail.com', 966680863, '77b6850162edb2676840c4ff5ee0f847', 1),
(58, 'Felipe', 'Goretta', 'Sandoval', 'felipe.goretta@gmail.com', 944120565, '13cddf80944a41517c12afc92b0a849f', 0);

-- --------------------------------------------------------

--
-- Table structure for table `historial`
--

CREATE TABLE `historial` (
  `id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `uploads` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historial`
--

INSERT INTO `historial` (`id`, `vehiculo_id`, `titulo`, `contenido`, `fecha`, `uploads`) VALUES
(12, 12, 'historial de pruebas', '<p style=\\\"font-family: Times;\\\">commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>\r\n<p style=\\\"font-family: Times;\\\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>', '2019-12-06 13:03:46', '[\"Chevrolet_ORlando___5dea51b2c42b9.jpeg\",\"Bridge _ Transitions In UX Design___5dea51b2c43c4.pdf\"]');

-- --------------------------------------------------------

--
-- Table structure for table `modelos`
--

CREATE TABLE `modelos` (
  `id` int(11) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `imagen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modelos`
--

INSERT INTO `modelos` (`id`, `marca`, `modelo`, `version`, `imagen`) VALUES
(5, 'DODGE', 'CALIBER', '2009 - 2012', 'caliber-2___5e32e6f13d348.png'),
(6, 'JEEP', 'GRAND CHEROKEE WK2', '2014 - 2020', 'grandcherokee2014-2___5e32e73348c1f.png'),
(7, 'JEEP', 'PATRIOT', '2007 - 2017', 'patriot-2___5e32e7a809d8a.png'),
(8, 'JEEP', 'COMPASS', '2011 - 2015', 'compass-mk49-2___5e32e7fd75386.png'),
(9, 'JEEP', 'CHEROKEE', '2013 - 2020', 'cherokee2014-2___5e32ec36d6024.png'),
(10, 'JEEP', 'COMPASS', '2016 - 2020', 'compass2016-2___5e32ec65d0988.png'),
(11, 'JEEP', 'CHEROKEE', '2007 - 2013', 'cherokee2___5e32ecc21b897.png'),
(12, 'JEEP', 'WRANGLER JK', '2007 - 2018', 'wrangler2___5e32ed9e1900e.png'),
(13, 'JEEP', 'RENEGADE', '2014 - 2020', 'renegade2___5e32edda81cc8.png'),
(14, 'DODGE', 'DURANGO', '2011 - 2020', 'new-durango-2___5e32ee5258837.png'),
(15, 'DODGE', 'DURANGO', '2004 - 2010', 'durango-2___5e32ee8ecdeff.png'),
(16, 'JEEP', 'GRAND CHEROKEE WK', '2005 - 2010', 'jeep-wk___5e32f0b46f7ee.png'),
(17, 'DODGE', 'JOURNEY', '2007 - 2020', 'journey-2___5e32f1cb02d77.png'),
(18, 'TOYOTA', 'RAV-4', '2013 - 2018', 'rav4___5e32f49904eb9.png');

-- --------------------------------------------------------

--
-- Table structure for table `ot`
--

CREATE TABLE `ot` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `detalle` text NOT NULL,
  `valor` int(11) NOT NULL,
  `km` int(11) NOT NULL,
  `estado` int(1) NOT NULL,
  `observaciones` text NOT NULL,
  `archivo` text NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ot`
--

INSERT INTO `ot` (`id`, `cliente_id`, `vehiculo_id`, `titulo`, `detalle`, `valor`, `km`, `estado`, `observaciones`, `archivo`, `regdate`) VALUES
(6, 27, 17, 'Reparacion de alternador', '{\"item\":[\"Reparaci\\u00f3n de alternador\",\"Remover e instalar alternador\"],\"precio\":[\"85000\",\"60000\"]}', 145000, 94087, 2, 'Reparacion realizada en medel body y cia ltda calle 10 de julio 433 factura numero 5363', '', '2020-01-06 19:23:02'),
(8, 23, 12, 'OT Test 111', '{\"item\":[\"item 1\",\"item 2\",\"item 3\"],\"precio\":[\"1\",\"10\",\"100\"]}', 111, 111, 1, 'observaciones test 111', 'dodge_dakota.png', '2020-01-09 12:18:16'),
(9, 29, 24, 'Reparacion de carter, cambio de fluidos', '{\"item\":[\"Mantenimiento de caja\",\"Cambio de 2 luces de posici\\u00f3n delantera\",\"Reparaci\\u00f3n de carter, cambio de aceite, filtro de aceite, tap\\u00f3n\"],\"precio\":[\"70000\",\"15000\",\"100000\"]}', 185000, 118277, 2, 'Proximo cambio de aceite 10.000KM', '', '2020-01-23 20:33:26'),
(11, 31, 28, 'CAMBIO DE ACEITE', '{\"item\":[\"CAMBIO DE ACEITE Y FILTRO TOYOTA\"],\"precio\":[\"50000\"]}', 50000, 10000, 2, 'CAMBIO DE ACEITE POR MANTENIMIENTO', '', '2020-01-25 02:55:24'),
(12, 30, 27, 'Mantenimiento', '{\"item\":[\"Filtro de aceite\",\"Filtro de aire\",\"bujias\",\"aceite\",\"mano de obra\"],\"precio\":[\"4664\",\"5864\",\"7776\",\"18520\",\"20000\"]}', 56824, 103, 2, 'Se rellena liquido refrigerante y limpiaparabrisas, inspeccion en elevador OK.', '', '2020-01-25 02:59:59'),
(17, 32, 29, 'Mantenimiento de transmisión', '{\"item\":[\"Mantenimiento de transmisi\\u00f3n: cambio de aceite, empaquetadura, filtro de caja y de enfriador\",\"Cambio de bujias\"],\"precio\":[\"70000\",\"10000\"]}', 80000, 153527, 2, '', '', '2020-01-27 16:21:22'),
(18, 33, 30, 'ruido en sistema de poleas', '{\"item\":[\"repuestos: 2 poleas y correa\",\"instalaci\\u00f3n de piezas\"],\"precio\":[\"75000\",\"50000\"]}', 125000, 114000, 2, 'se compran repuestos para verificar ruido', '', '2020-01-28 13:10:59'),
(19, 33, 30, 'Cambio de sensor de presion de aceite', '{\"item\":[\"Sensor de presion de aceite\",\"cambio de aceite y filtro\",\"cambio de sensor\"],\"precio\":[\"145000\",\"60000\",\"70000\"]}', 275000, 114000, 2, '', '', '2020-01-28 18:47:40'),
(22, 35, 34, 'Cambio de aceite y frenos', '{\"item\":[\"Cambio de aceite\",\"Cambio de 4 pastillas de freno\"],\"precio\":[\"70000\",\"120000\"]}', 190000, 114000, 2, 'falta rectificar discos', '', '2020-01-30 22:08:52'),
(23, 36, 35, 'Mantenimiento 20.000KMS', '{\"item\":[\"Mantenimiento: Cambio de aceite, filtro de aceite, filtro de aire, filtro de polen, inspecci\\u00f3n\"],\"precio\":[\"150000\"]}', 150000, 19787, 2, 'Tren delantero OK\r\nFrenos OK\r\nScanner sin fallas\r\nSe rellenan niveles', '', '2020-01-31 15:45:46'),
(24, 37, 36, 'Falla en cuerpo acelerador', '{\"item\":[\"Cuerpo de aceleraci\\u00f3n original\",\"Empaquetadura\",\"Cambio de buj\\u00edas\",\"Instalaci\\u00f3n \"],\"precio\":[\"310000\",\"20000\",\"30000\",\"80000\"]}', 440000, 41744, 2, '', '', '2020-02-03 23:00:31'),
(25, 38, 37, 'Mantenimiento', '{\"item\":[\"Mantenimiento: Cambio aceite, filtro aceite, aire, polen inspecci\\u00f3n, relleno fluidos, scanner\",\"Cambio de luz H9\"],\"precio\":[\"130000\",\"10000\"]}', 140000, 53416, 2, 'En inspección se detectan gomas de barra estabilizadora trasera y delantera que necesitan cambio, pueden producir crujidos.', '', '2020-02-03 23:06:29'),
(26, 39, 38, 'Amortiguadores', '{\"item\":[\"2 Amortiguadores\",\"2 Cazoletas\",\"Correa alternador\",\"2 Bandejas de suspensi\\u00f3n trasera\",\"Instalaci\\u00f3n\"],\"precio\":[\"95888\",\"73008\",\"44344\",\"80000\",\"120000\"]}', 413240, 124357, 2, 'Se realiza apriete de columna de dirección por volante suelto', '', '2020-02-04 20:19:00'),
(27, 40, 39, 'Reparaciones', '{\"item\":[\"Cambio de gomas de barra delantera y trasera\",\"Rectificado de 4 discos, pulido de pastillas\",\"Reparaci\\u00f3n de alternador\",\"Cambio de brazos de soporte de suspensi\\u00f3n trasera\",\"Cambio de switch de freno\",\"Amortiguadores delanteros\",\"Amortiguadores traseros\",\"2 Cazoletas\",\"Instalaci\\u00f3n suspensi\\u00f3n\",\"Cambio de aceite, filtro aceite, polen, aire\",\"Mantenimiento de caja, cambio aceite, filtro, limpieza\",\"Alineaci\\u00f3n y balanceo\",\"Cambio de buj\\u00edas\",\"Cambio de liquido de diferencial delantero y trasero\",\"Remover arranque\",\"Instalaci\\u00f3n de nueva correa de accesorios\"],\"precio\":[\"100000\",\"50000\",\"120000\",\"110000\",\"50000\",\"120000\",\"90000\",\"73008\",\"120000\",\"110000\",\"180000\",\"30000\",\"30000\",\"120000\",\"40000\",\"40000\"]}', 1383008, 138795, 2, '', '', '2020-02-05 15:04:32'),
(28, 41, 40, 'Mantenimiento y cambio de piezas', '{\"item\":[\"Cambio de aceite, filtro aceite, polen, aire\",\"Rectificado y instalaci\\u00f3n nuevas pastillas\",\"Instalaci\\u00f3n de terminales de direccion y\\/o axiales\",\"Terminales de direccion\",\"Alineaci\\u00f3n y balanceo\"],\"precio\":[\"110000\",\"70000\",\"40000\",\"45328\",\"30000\"]}', 295328, 85333, 2, '\r\nAlineación necesita cuadratura de angulo derecho delantero y trasero', '', '2020-02-05 21:08:14'),
(29, 42, 41, 'Mantenimiento', '{\"item\":[\"Cambio de aceite, filtro aceite, polen, aire\"],\"precio\":[\"110000\"]}', 110000, 80058, 2, 'Revisión OK\r\nSe debe cambiar cinta de airbag', '', '2020-02-05 21:51:18'),
(31, 43, 42, 'Reparaciones', '{\"item\":[\"Cambio de bujias\",\"Cambio de aceite, filtro aceite, polen, aire\",\"Pastilla de freno delantera Raybestos\",\"Pastilla de freno trasera Raybestos\",\"Instalaci\\u00f3n de pastillas\"],\"precio\":[\"15000\",\"60000\",\"45000\",\"39000\",\"0\"]}', 159000, 70685, 2, '', '', '2020-02-08 00:25:12'),
(32, 44, 43, 'Mantenimiento', '{\"item\":[\"Mantenimiento 20.000kms\"],\"precio\":[\"130000\"]}', 130000, 20407, 2, 'Cambio de aceite 5w20 Mopar, filtro de aceite, filtro de aire, relleno de fluidos, scanner, inspeccion en elevador. Sin fallas en scanner ni en inspección, se rellena liquido refrigerante, se debe cambiar gas de aire acondicionado, enfria poco.', 'KKXR42___5e417435227c3.pdf', '2020-02-10 15:18:13'),
(33, 46, 45, 'Mantenimiento y cambio de piezas', '{\"item\":[\"Pastillas delanteras\",\"Pastillas traseras\",\"Terminales\",\"Axiales\",\"Alineaci\\u00f3n\",\"Instalacion de pastillas\",\"Instalaci\\u00f3n de tren delantero\",\"Mantenimiento\",\"Rectificado de discos\"],\"precio\":[\"35300\",\"25000\",\"45600\",\"35400\",\"15000\",\"40000\",\"70000\",\"130000\",\"30000\"]}', 426300, 120147, 2, 'Cambio de aceite, filtro de aceite, filtro de polen, filtro de aire, scanner OK', '', '2020-02-13 22:15:38'),
(34, 47, 46, 'Cambio de aceite y filtro', '{\"item\":[\"Cambio de aceite\",\"Cambio de filtro de aire\"],\"precio\":[\"50000\",\"20000\"]}', 70000, 119966, 2, '', '', '2020-02-15 15:06:55'),
(35, 43, 42, 'Reparacion de eje desviado', '{\"item\":[\"Remover pastillas y rectificar 4 discos\",\"Amortiguadores delanteros (alternativos)\",\"Amortiguadores traseros (alternativos)\",\"Cazoletas (alternativo)\",\"Alineaci\\u00f3n, rotaci\\u00f3n y balanceo\",\"Terminales de direcci\\u00f3n (alternativo)\",\"Axiales (alternativo)\",\"Instalaci\\u00f3n suspensi\\u00f3n y tren delantero\"],\"precio\":[\"40000\",\"120000\",\"90000\",\"73000\",\"30000\",\"35400\",\"45600\",\"160000\"]}', 594000, 70997, 3, '', '', '2020-02-15 16:24:46'),
(36, 48, 47, 'Diagnóstico por ruido', '{\"item\":[\"Diagn\\u00f3stico\"],\"precio\":[\"15000\"]}', 15000, 158101, 2, '4 Discos requieren rectificado, posible soporte dañado.\r\nComenzando fuga de aceite en cárter de motor\r\nBandeja de soporte de suspensión trasera requieren cambio (5105271AA)\r\nSe realiza scanner, sensor de angulo de dirección requiere calibración o cambio de clockspring, odometro fué modificado, kilometraje original 194.189', '158101___5e4a9655543f4.pdf', '2020-02-17 13:34:13'),
(37, 48, 47, 'Presupuesto por revision', '{\"item\":[\"Calibrar sensor de angulo de direccion\",\"Rectificar 4 discos\",\"Cambio de bandeja de soporte de suspension trasera\"],\"precio\":[\"40000\",\"60000\",\"120000\"]}', 220000, 0, 1, '', '', '2020-02-17 13:42:01'),
(38, 49, 48, 'Diagnóstico ', '{\"item\":[\"Enfriador de aceite de motor\",\"Cambio de enfriador, cambio de aceite 5w20 y filtro de motor\",\"Rectificado de 4 discos\",\"Instalaci\\u00f3n de pastillas delanteras originales, incluye repuesto\",\"Instalaci\\u00f3n de pastillas traseras Raybestos, incluye repuesto\",\"Cambio de Relay y fusible de bomba de combustible\"],\"precio\":[\"220000\",\"180000\",\"60000\",\"120000\",\"45000\",\"5000\"]}', 630000, 103917, 2, 'Filtro de aire y filtro de polen en buenas condiciones, tren delantero ok, scanner contiene errores volátiles que serán borrados, pero guardados para futura inspección, se cambia relay y fusible de bomba de combustible por intermitencia en el encendido, proximo cambio de aceite en 10.000KM', 'FLWV93___5e4aa7a4db09b.pdf', '2020-02-17 14:48:04'),
(39, 43, 42, 'Reparaciones', '{\"item\":[\"Amortiguador delantero (original izquierdo)\",\"Amortiguadores traseros (original)\",\"Terminales axiales (original)\",\"Terminales de direcci\\u00f3n (original)\",\"Cazoletas (original)\",\"Amortiguadores delantero (original derecho)\",\"Alineaci\\u00f3n, rotaci\\u00f3n y balanceo\",\"Instalaci\\u00f3n suspensi\\u00f3n y tren delantero\",\"Remover pastillas y rectificar 4 discos\"],\"precio\":[\"109144\",\"140848\",\"134800\",\"100000\",\"128000\",\"95864\",\"30000\",\"160000\",\"40000\"]}', 938656, 70997, 2, '', '', '2020-02-17 15:00:50'),
(40, 50, 49, 'Mantenimiento 20.000KMS', '{\"item\":[\"Mantenimiento\"],\"precio\":[\"150000\"]}', 150000, 21213, 2, 'Inspeccion en elevador: discos delanteros requieren rectificado para garantizar un frenado estable y maximizar la duracion de las pastillas, se realiza rotación de neumaticos, tren delantero OK, sin fugas.\r\nScanner: no se encuentran codigos de error relevantes\r\nCambio de aceite, filtro de aceite, filtro de aire, filtro de polen, repuestos originales.\r\nLiquido refrigerante bajo, se rellena.', 'JYJF46___5e4abc30001da.pdf', '2020-02-17 15:42:33'),
(41, 51, 50, 'Diagnostico por ruido en motor', '{\"item\":[\"Repuestos\",\"Instalaci\\u00f3n de nuevo alternador\",\"Cambio de 3 poleas\"],\"precio\":[\"62657\",\"120000\",\"17343\"]}', 200000, 145354, 2, 'Se instala alternador con polea, carbones y 2 rodamientos nuevos, garantía de un año en alternador ', 'brfh60___5e4f06cef1994.pdf', '2020-02-20 12:58:31'),
(42, 52, 51, 'Mantenimiento y cambio de pastillas', '{\"item\":[\"Cambio de pastillas delanteras originales\",\"Cambio de aceite y relleno de fluidos\"],\"precio\":[\"120000\",\"80000\"]}', 200000, 140513, 2, 'Necesita cambio de barra estabilizadora delantera para disminuir ruido.', '', '2020-02-20 23:02:23'),
(43, 53, 52, 'Reparaciones', '{\"item\":[\"Rectificado de 4 discos\",\"Pastillas traseras\",\"Enfriador de aceite de motor \",\"2 Bandejas delanteras originales\",\"Instalaci\\u00f3n de pastillas y cambio de bandejas\",\"Instalacion de enfriador, cambio de aceite y filtro\"],\"precio\":[\"50000\",\"40000\",\"220000\",\"270000\",\"150000\",\"180000\"]}', 910000, 147499, 1, '', '', '2020-02-21 13:56:30'),
(44, 53, 52, 'Reparaciones', '{\"item\":[\"Reparaciones\"],\"precio\":[\"550000\"]}', 550000, 140513, 2, 'Cambio de enfriador de motor, cambio de aceite, filtro, cambio de bandejas', '', '2020-02-21 14:07:15'),
(45, 54, 53, 'Mantenimiento', '{\"item\":[\"Mantenimiento 10.000km\"],\"precio\":[\"130000\"]}', 130000, 12145, 2, 'cambio de aceite, filtro de aceite, filtro de aire, inspeccion y relleno de fluidos', '', '2020-02-21 22:30:22'),
(46, 55, 54, 'Inspección', '{\"item\":[\"Mantenimiento de caja, cambio aceite, filtro, limpieza\",\"Pastillas delanteras originales\",\"Pastillas traseras originales\",\"Discos delanteros\",\"Discos traseros\",\"Cambio de pastillas, discos y liquido de frenos\"],\"precio\":[\"180000\",\"93250\",\"83830\",\"93000\",\"82500\",\"90000\"]}', 622580, 0, 2, '', '', '2020-02-24 13:36:16'),
(47, 56, 55, 'Diagnostico', '{\"item\":[\"Cambio de tapa de radiador Mopar\",\"Cambio de pastillas de freno traseras originales\",\"Rectificado de 4 discos en la rueda\",\"Cambio de ret\\u00e9n de caja de transferencia, cambio de liquido 80w90\",\"Cambio de tap\\u00f3n y empaquetadura de c\\u00e1rter\",\"resellado de tapa de cadena y cambio de aceite y filtro\"],\"precio\":[\"30000\",\"95000\",\"60000\",\"250000\",\"180000\",\"140000\"]}', 755000, 0, 1, 'Tapa de radiador con pequeña fuga, pastillas traseras con mucho desgaste, discos torcidos y con ruido al frenar, pérdida de liquido en caja de transferencia por retén de homocinetica, se debe vaciar el liquido y cambiar retén y rellenar con liquido nuevo, tapon, tapa de cadena y carter de motor fugando se debe botar aceite para trabajar, una vez sellado se debe incorporar nuevo aceite y filtro de motor', '', '2020-02-25 18:01:28'),
(48, 57, 56, 'Reparacion de motor', '{\"item\":[\"Eje de levas lado conductor\",\"Bomba de agua\",\"Retenes de valvula ambas culatas\",\"8 Guias de valvula lado conductor\",\"4 valvulas de escape y 4 de admision lado conductor\",\"8 Retenedores del resorte de valvulas lado conductor\",\"2 empaquetaduras de culata\",\"2 Juegos de pernos de culata\",\"Juego de balancines culata lado conductor\",\"Rectificado de superficie de 2 culatas\",\"Rectificado de bancadas de eje de levas lado conductor\",\"Rectificado del asiento de las 16 v\\u00e1lvulas\",\"8 buj\\u00edas de escape y 8 buj\\u00edas de admisi\\u00f3n\",\"12 aceites, 2 filtros de aceite y refrigerante\",\"Tapa de radiador, termostato, bulbo de temperatura\",\"Mano de obra e insumos\"],\"precio\":[\"220000\",\"160000\",\"90000\",\"70000\",\"110000\",\"30000\",\"170000\",\"85000\",\"120000\",\"120000\",\"30000\",\"70000\",\"140000\",\"80000\",\"69364\",\"1300000\"]}', 2864364, 0, 1, '\r\nMotor ha sido previamente reparado, se encuentran señales de desarme. Motor sufrió torcedura interna de componentes producto de recalentamiento, se cambian y reparan los componentes dañados. \r\n\r\nGarantía de la reparación: 1 año o 20.000 KM (lo que primero se cumpla)\r\nPrimera inspección: 500KM (gratis)\r\nSegunda revisión y mantenimiento: 5.000KM \r\nTercera y próximos mantenimientos: cada 10.000KM ', '', '2020-02-26 18:27:29'),
(49, 58, 57, 'Mantenimiento', '{\"item\":[\"Cambio de aceite y filtro de aceite\"],\"precio\":[\"70000\"]}', 70000, 81099, 2, 'Se rellena liquido de dirección electrica, inspeccionar en cada cambio de aceite, scanner sin fallas, tren delantero en buenas condiciones, pequeña fuga en cremallera, discos de freno traseros torcidos, vida util de pastillas delanteras inferior a 10.000KM', '', '2020-02-28 13:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `patente` varchar(6) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `ano` int(11) NOT NULL,
  `nro_motor` varchar(50) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `modelo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `patente`, `marca`, `modelo`, `color`, `ano`, `nro_motor`, `cliente_id`, `modelo_id`) VALUES
(14, 'JTXS96', 'DODGE', 'RAM 5.7', 'NEGRO', 2016, '3C6RRBET1GG390499', 24, 0),
(15, 'GSFX11', 'DODGE', 'DURANGO 3.6', 'BLANCO', 2014, '1C4RDHAG3EC442945', 25, 0),
(16, 'dwkp43', 'JEEP', 'GRAND CHEROKEE 3.6', 'GRIS', 2012, '1C4RJFBG7CC184132', 26, 0),
(17, 'CWBX94', 'DODGE', 'JOURNEY', 'AZUL', 2011, '3D4PG5FD3AT234531', 27, 0),
(18, 'LW7576', 'JEEP', 'Compass', 'AZUL', 2007, '1J8FF47W07D336320', 28, 0),
(24, 'CYGX10', 'DODGE', 'CALIBER', 'BEIGE', 2011, 'AD645043', 29, 0),
(27, 'YZ5461', 'TOYOTA', 'RAV4', 'GRIS GRAFITO', 2005, 'JTEGR20V550068681', 30, 0),
(28, 'LFXJ15', 'TOYOTA', 'RAV4', 'AZUL METALICO', 2019, 'VIN', 31, 18),
(29, 'BRYR68', 'JEEP', 'PATRIOT', 'GRIS', 2008, '1J8FFF8W98D677694', 32, NULL),
(30, 'GPLW90', 'Jeep', 'Cherokee', 'Negro', 2014, 'EW210112', 33, 9),
(34, 'CZRG90', 'JEEP', 'CHEROKEE', 'VERDE', 2010, '1J4PN5GK7BW526303', 35, 11),
(35, 'KXYB57', 'JEEP', 'RENEGADE', 'GRIS', 2019, '988611457KK196530', 36, 13),
(36, 'JZYH17', 'DODGE', 'JOURNEY', 'NEGRO', 2017, '3C4PDCAB8JT683266', 37, 17),
(37, 'FYWW20', 'JEEP', 'Compass', 'Gris', 2014, '1C4NJDAB5ED586446', 38, 8),
(38, 'CKHP46', 'JEEP', 'PATRIOT', 'BEIGE', 2010, '1J4NF2GB2AD559383', 39, 7),
(39, 'CYRP35', 'JEEP', 'COMPASS', 'NEGRO', 2011, 'BD174510', 40, 8),
(40, 'FZPX46', 'JEEP', 'COMPASS', 'Gris', 2014, '1C4NJDCB0ED579904', 41, 8),
(41, 'FZWS65', 'JEEP', 'COMPASS', 'GRIS', 2014, '1C4NJDAB6ED586455', 42, 8),
(42, 'DYFX27', 'JEEP', 'COMPASS', 'BLANCO', 2012, 'CD629893', 43, 8),
(43, 'KKXR42', 'JEEP', 'RENEGADE', 'NEGRO', 2019, '988611457KK171893', 44, 13),
(44, 'FDTV98', 'Chevrolet', 'Orlando', 'Negro', 2013, 'AUTO_DE_PRUEBAS', 23, 5),
(45, 'CZGW24', 'JEEP', 'COMPASS', 'GRIS', 2010, 'AD660484', 46, 8),
(46, 'FCJL96', 'DODGE', 'CALIBER', 'NEGRO', 2012, '0000', 47, 5),
(47, 'BHJR14', 'JEEP', 'COMPASS', 'GRIS', 2008, '8D648436', 48, 8),
(48, 'FLWV93', 'JEEP', 'GRAND CHEROKEE WK2', 'GRIS', 2013, '8D648436', 49, 6),
(49, 'JYJF46', 'JEEP', 'RENEGADE', 'BLANCO', 2018, 'JK130724', 50, 13),
(50, 'BRFH60', 'JEEP', 'COMPASS', 'GRIS', 2009, '0', 51, 8),
(51, 'CVSX24', 'JEEP', 'GRAND CHEROKEE', 'NEGRO', 2011, 'BC519701', 52, 6),
(52, 'DFCT68', 'DODGE', 'DURANGO', 'BLANCO', 2011, '8D784866', 53, 14),
(53, 'LGGS74', 'JEEP', 'RENEGADE', 'GRIS', 2019, '0', 54, 13),
(54, 'CPCX76', 'JEEP', 'CHEROKEE', 'NEGRO', 2010, '1JPN2GK1AW142255', 55, 11),
(55, 'GDCK69', 'JEEP', 'COMPASS', 'BLANCO', 2013, '0', 56, 8),
(56, 'CDZY24', 'JEEP', 'GRAND CHEROKEE', 'BLANCO', 2009, '9C531958', 57, 16),
(57, 'FFGL39', 'JEEP', 'GRAND CHEROKEE', 'GRIS', 2013, 'CC355443', 58, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehiculo_id` (`vehiculo_id`);

--
-- Indexes for table `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ot`
--
ALTER TABLE `ot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ot`
--
ALTER TABLE `ot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
