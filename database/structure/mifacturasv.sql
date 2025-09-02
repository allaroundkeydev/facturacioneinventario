SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `actividad_economica` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seleccionable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `actividad_economica` (`id`, `codigo`, `descripcion`, `seleccionable`, `created_at`, `updated_at`) VALUES
(1, NULL, 'AGRICULTURA, GANADERÍA, SILVICULTURA Y PESCA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(2, NULL, 'PRODUCCIÓN AGRÍCOLA, PECUARIA, CAZA Y ACTIVIDADES DE SERVICIOS CONEXAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(3, '01111', 'Cultivo de cereales excepto arroz y para forrajes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(4, '01112', 'Cultivo de legumbres', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(5, '01113', 'Cultivo de semillas oleaginosas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(6, '01114', 'Cultivo de plantas para la preparación de semillas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(7, '01119', 'Cultivo de otros cereales excepto arroz y forrajeros n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(8, '01120', 'Cultivo de arroz', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(9, '01131', 'Cultivo de raíces y tubérculos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(10, '01132', 'Cultivo de brotes, bulbos, vegetales tubérculos y cultivos similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(11, '01133', 'Cultivo hortícola de fruto', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(12, '01134', 'Cultivo de hortalizas de hoja y otras hortalizas ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(13, '01140', 'Cultivo de caña de azúcar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(14, '01150', 'Cultivo de tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(15, '01161', 'Cultivo de algodón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(16, '01162', 'Cultivo de fibras vegetales excepto algodón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(17, '01191', 'Cultivo de plantas no perennes para la producción de semillas y flores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(18, '01192', 'Cultivo de cereales y pastos para la alimentación animal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(19, '01199', 'Producción de cultivos no estacionales ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(20, '01220', 'Cultivo de frutas tropicales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(21, '01230', 'Cultivo de cítricos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(22, '01240', 'Cultivo de frutas de pepita y hueso', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(23, '01251', 'Cultivo de frutas ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(24, '01252', 'Cultivo de otras frutos y nueces de árboles y arbustos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(25, '01260', 'Cultivo de frutos oleaginosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(26, '01271', 'Cultivo de café', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(27, '01272', 'Cultivo de plantas para la elaboración de bebidas excepto café', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(28, '01281', 'Cultivo de especias y aromáticas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(29, '01282', 'Cultivo de plantas para la obtención de productos medicinales y farmacéuticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(30, '01291', 'Cultivo de árboles de hule (caucho) para la obtención de látex', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(31, '01292', 'Cultivo de plantas para la obtención de productos químicos y colorantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(32, '01299', 'Producción de cultivos perennes ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(33, '01300', 'Propagación de plantas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(34, '01301', 'Cultivo de plantas y flores ornamentales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(35, '01410', 'Cría y engorde de ganado bovino', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(36, '01420', 'Cría de caballos y otros equinos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(37, '01440', 'Cría de ovejas y cabras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(38, '01450', 'Cría de cerdos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(39, '01460', 'Cría de aves de corral y producción de huevos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(40, '01491', 'Cría de abejas apicultura para la obtención de miel y otros productos apícolas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(41, '01492', 'Cría de conejos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(42, '01493', 'Cría de iguanas y garrobos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(43, '01494', 'Cría de mariposas y otros insectos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(44, '01499', 'Cría y obtención de productos animales n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(45, '01500', 'Cultivo de productos agrícolas en combinación con la cría de animales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(46, '01611', 'Servicios de maquinaria agrícola', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(47, '01612', 'Control de plagas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(48, '01613', 'Servicios de riego', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(49, '01614', 'Servicios de contratación de mano de obra para la agricultura', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(50, '01619', 'Servicios agrícolas ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(51, '01621', 'Actividades para mejorar la reproducción, el crecimiento y el rendimiento de los animales y sus productos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(52, '01622', 'Servicios de mano de obra pecuaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(53, '01629', 'Servicios pecuarios ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(54, '01631', 'Labores post cosecha de preparación de los productos agrícolas para su comercialización o para la industria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(55, '01632', 'Servicios de beneficio de café', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(56, '01633', 'Servicio de beneficiado de plantas textiles (incluye el beneficiado cuando este es realizado en la misma explotación agropecuaria)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(57, '01640', 'Tratamiento de semillas para la propagación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(58, '01700', 'Caza ordinaria y mediante trampas, repoblación de animales de caza y servicios conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(59, NULL, 'SILVICULTURA Y EXTRACCIÓN DE MADERA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(60, '02100', 'Silvicultura y otras actividades forestales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(61, '02200', 'Extracción de madera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(62, '02300', 'Recolección de productos diferentes a la madera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(63, '02400', 'Servicios de apoyo a la silvicultura', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(64, NULL, 'PESCA Y ACUICULTURA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(65, '03110', 'Pesca marítima de altura y costera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(66, '03120', 'Pesca de agua dulce', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(67, '03210', 'Acuicultura marítima', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(68, '03220', 'Acuicultura de agua dulce', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(69, '03300', 'Servicios de apoyo a la pesca y acuicultura', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(70, NULL, 'EXPLOTACIÓN DE MINAS Y CANTERAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(71, NULL, 'EXTRACCIÓN CARBÓN DE PIEDRA Y LIGNITO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(72, '05100', 'Extracción de hulla', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(73, '05200', 'Extracción y aglomeración de lignito', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(74, NULL, 'EXTRACCIÓN DE PETRÓLEO CRUDO Y GAS NATURAL', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(75, '06100', 'Extracción de petróleo crudo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(76, '06200', 'Extracción de gas natural', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(77, NULL, 'EXTRACCIÓN DE MINERALES METALÍFEROS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(78, '07100', 'Extracción de minerales de hierro', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(79, '07210', 'Extracción de minerales de uranio y torio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(80, '07290', 'Extracción de minerales metalíferos no ferrosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(81, NULL, 'EXPLOTACIÓN DE OTRAS MINAS Y CANTERAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(82, '08100', 'Extracción de piedra, arena y arcilla', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(83, '08910', 'Extracción de minerales para la fabricación de abonos y productos químicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(84, '08920', 'Extracción y aglomeración de turba', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(85, '08930', 'Extracción de sal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(86, '08990', 'Explotación de otras minas y canteras ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(87, NULL, 'ACTIVIDADES DE SERVICIOS DE APOYO A LA EXPLOTACIÓN DE MINAS Y CANTERAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(88, '09100', 'Actividades de apoyo a la extracción de petróleo y gas natural', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(89, '09900', 'Actividades de apoyo a la explotación de minas y canteras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(90, NULL, 'INDUSTRIAS MANUFACTURERAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(91, NULL, 'ELABORACIÓN DE PRODUCTOS ALIMENTICIOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(92, '10101', 'Servicio de rastros y mataderos de bovinos y porcinos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(93, '10102', 'Matanza y procesamiento de bovinos y porcinos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(94, '10103', 'Matanza y procesamientos de aves de corral', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(95, '10104', 'Elaboración y conservación de embutidos y tripas naturales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(96, '10105', 'Servicio de conservación y empaque de carnes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(97, '10106', 'Elaboración y conservación de grasas y aceites animales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(98, '10107', 'Servicios de molienda de carne', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(99, '10108', 'Elaboración de productos de carne ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(100, '10201', 'Procesamiento y conservación de pescado, crustáceos y moluscos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(101, '10209', 'Fabricación de productos de pescado ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(102, '10301', 'Elaboración de jugos de frutas y hortalizas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(103, '10302', 'Elaboración y envasado de frutas, mermeladas y frutas deshidratadas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(104, '10309', 'Elaboración de productos de frutas y hortalizas n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(105, '10401', 'Fabricación de aceites y grasas vegetales y animales comestibles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(106, '10402', 'Fabricación de aceites y grasas vegetales y animales no comestibles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(107, '10409', 'Servicio de maquilado de aceites', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(108, '10501', 'Fabricación de productos lácteos excepto sorbetes y quesos sustitutos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(109, '10502', 'Fabricación de sorbetes y helados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(110, '10503', 'Fabricación de quesos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(111, '10611', 'Molienda de cereales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(112, '10612', 'Elaboración de cereales para el desayuno y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(113, '10613', 'Servicios de beneficiado de productos agrícolas ncp (excluye Beneficio de azúcar rama 1072 y beneficio de café rama 0163)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(114, '10621', 'Fabricación de almidón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(115, '10628', 'Servicio de molienda de maíz húmedo molino para nixtamal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(116, '10711', 'Elaboración de tortillas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(117, '10712', 'Fabricación de pan, galletas y barquillos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(118, '10713', 'Fabricación de repostería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(119, '10721', 'Ingenios azucareros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(120, '10722', 'Molienda de caña de azúcar para la elaboración de dulces', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(121, '10723', 'Elaboración de jarabes de azúcar y otros similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(122, '10724', 'Maquilado de azúcar de caña', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(123, '10730', 'Fabricación de cacao, chocolates y productos de confitería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(124, '10740', 'Elaboración de macarrones, fideos, y productos farináceos similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(125, '10750', 'Elaboración de comidas y platos preparados para la reventa en', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(126, '10791', 'Elaboración de productos de café', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(127, '10792', 'Elaboración de especies, sazonadores y condimentos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(128, '10793', 'Elaboración de sopas, cremas y consomé', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(129, '10794', 'Fabricación de bocadillos tostados y/o fritos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(130, '10799', 'Elaboración de productos alimenticios ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(131, '10800', 'Elaboración de alimentos preparados para animales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(132, NULL, 'ELABORACIÓN DE BEBIDAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(133, '11012', 'Fabricación de aguardiente y licores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(134, '11020', 'Elaboración de vinos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(135, '11030', 'Fabricación de cerveza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(136, '11041', 'Fabricación de aguas gaseosas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(137, '11042', 'Fabricación y envasado de agua', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(138, '11043', 'Elaboración de refrescos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(139, '11048', 'Maquilado de aguas gaseosas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(140, '11049', 'Elaboración de bebidas no alcohólicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(141, NULL, 'ELABORACIÓN DE PRODUCTOS DE TABACO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(142, '12000', 'Elaboración de productos de tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(143, NULL, 'FABRICACIÓN DE PRODUCTOS TEXTILES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(144, '13111', 'Preparación de fibras textiles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(145, '13112', 'Fabricación de hilados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(146, '13120', 'Fabricación de telas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(147, '13130', 'Acabado de productos textiles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(148, '13910', 'Fabricación de tejidos de punto y ganchillo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(149, '13921', 'Fabricación de productos textiles para el hogar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(150, '13922', 'Sacos, bolsas y otros artículos textiles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(151, '13929', 'Fabricación de artículos confeccionados con materiales textiles, excepto prendas de vestir n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(152, '13930', 'Fabricación de tapices y alfombras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(153, '13941', 'Fabricación de cuerdas de henequén y otras fibras naturales (lazos, pitas)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(154, '13942', 'Fabricación de redes de diversos materiales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(155, '13948', 'Maquilado de productos trenzables de cualquier material (petates, sillas, etc.)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(156, '13991', 'Fabricación de adornos, etiquetas y otros artículos para prendas de vestir', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(157, '13992', 'Servicio de bordados en artículos y prendas de tela', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(158, '13999', 'Fabricación de productos textiles ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(159, NULL, 'FABRICACIÓN DE PRENDAS DE VESTIR', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(160, '14101', 'Fabricación de ropa interior, para dormir y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(161, '14102', 'Fabricación de ropa para niños', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(162, '14103', 'Fabricación de prendas de vestir para ambos sexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(163, '14104', 'Confección de prendas a medida', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(164, '14105', 'Fabricación de prendas de vestir para deportes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(165, '14106', 'Elaboración de artesanías de uso personal confeccionadas especialmente de materiales textiles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(166, '14108', 'Maquilado de prendas de vestir, accesorios y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(167, '14109', 'Fabricación de prendas y accesorios de vestir n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(168, '14200', 'Fabricación de artículos de piel', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(169, '14301', 'Fabricación de calcetines, calcetas, medias (panty house) y otros similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(170, '14302', 'Fabricación de ropa interior de tejido de punto', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(171, '14309', 'Fabricación de prendas de vestir de tejido de punto ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(172, NULL, 'FABRICACIÓN DE CUEROS Y PRODUCTOS CONEXOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(173, '15110', 'Curtido y adobo de cueros; adobo y teñido de pieles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(174, '15121', 'Fabricación de maletas, bolsos de mano y otros artículos de marroquinería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(175, '15122', 'Fabricación de monturas, accesorios y vainas talabartería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(176, '15123', 'Fabricación de artesanías principalmente de cuero natural y sintético', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(177, '15128', 'Maquilado de artículos de cuero natural, sintético y de otros materiales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(178, '15201', 'Fabricación de calzado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(179, '15202', 'Fabricación de partes y accesorios de calzado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(180, '15208', 'Maquilado de partes y accesorios de calzado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(181, NULL, 'PRODUCCIÓN DE MADERA Y FABRICACIÓN DE PRODUCTOS DE MADERA Y CORCHO EXCEPTO MUEBLES; FABRICACIÓN DE ARTÍCULOS DE PAJA Y DE MATERIALES TRENZABLES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(182, '16100', 'Aserradero y acepilladura de madera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(183, '16210', 'Fabricación de madera laminada, terciada, enchapada y contrachapada, paneles para la construcción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(184, '16220', 'Fabricación de partes y piezas de carpintería para edificios y construcciones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(185, '16230', 'Fabricación de envases y recipientes de madera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(186, '16292', 'Fabricación de artesanías de madera, semillas, materiales trenzables', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(187, '16299', 'Fabricación de productos de madera, corcho, paja y materiales trenzables ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(188, NULL, 'FABRICACIÓN DE PAPEL Y DE PRODUCTOS DE PAPEL', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(189, '17010', 'Fabricación de pasta de madera, papel y cartón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(190, '17020', 'Fabricación de papel y cartón ondulado y envases de papel y cartón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(191, '17091', 'Fabricación de artículos de papel y cartón de uso personal y doméstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(192, '17092', 'Fabricación de productos de papel ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(193, NULL, 'IMPRESIÓN Y REPRODUCCIÓN DE GRABACIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(194, '18110', 'Impresión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(195, '18120', 'Servicios relacionados con la impresión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(196, '18200', 'Reproducción de grabaciones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(197, NULL, 'FABRICACIÓN DE COQUE Y DE PRODUCTOS DE LA REFINACIÓN DE PETRÓLEO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(198, '19100', 'Fabricación de productos de hornos de coque', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(199, '19201', 'Fabricación de combustible', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(200, '19202', 'Fabricación de aceites y lubricantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(201, NULL, 'FABRICACIÓN DE SUSTANCIAS Y PRODUCTOS QUÍMICOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(202, '20111', 'Fabricación de materias primas para la fabricación de colorantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(203, '20112', 'Fabricación de materiales curtientes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(204, '20113', 'Fabricación de gases industriales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(205, '20114', 'Fabricación de alcohol etílico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(206, '20119', 'Fabricación de sustancias químicas básicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(207, '20120', 'Fabricación de abonos y fertilizantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(208, '20130', 'Fabricación de plástico y caucho en formas primarias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(209, '20210', 'Fabricación de plaguicidas y otros productos químicos de uso agropecuario', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(210, '20220', 'Fabricación de pinturas, barnices y productos de revestimiento similares, tintas de imprenta y masillas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(211, '20231', 'Fabricación de jabones, detergentes y similares para limpieza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(212, '20232', 'Fabricación de perfumes, cosméticos y productos de higiene y cuidado personal, incluyendo tintes, champú, etc.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(213, '20291', 'Fabricación de tintas y colores para escribir y pintar; fabricación de cintas para impresoras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(214, '20292', 'Fabricación de productos pirotécnicos, explosivos y municiones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(215, '20299', 'Fabricación de sustancias químicas n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(216, '20300', 'Fabricación de fibras artificiales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(217, NULL, 'FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS, SUSTANCIAS QUÍMICAS MEDICINALES Y PRODUCTOS BOTÁNICOS DE USO FARMACÉUTICO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(218, '21001', 'Manufactura de productos farmacéuticos, sustancias químicas y productos botánicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(219, '21008', 'Maquilado de medicamentos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(220, NULL, 'FABRICACIÓN DE PRODUCTOS DE CAUCHO Y PLÁSTICO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(221, '22110', 'Fabricación de cubiertas y cámaras; renovación y recauchutado de cubiertas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(222, '22190', 'Fabricación de otros productos de caucho', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(223, '22201', 'Fabricación de envases plásticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(224, '22202', 'Fabricación de productos plásticos para uso personal o doméstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(225, '22208', 'Maquilado de plásticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(226, '22209', 'Fabricación de productos de plásticos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(227, NULL, 'FABRICACIÓN DE PRODUCTOS MINERALES NO METÁLICOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(228, '23101', 'Fabricación de vidrio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(229, '23102', 'Fabricación de recipientes y envases de vidrio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(230, '23108', 'Servicio de maquilado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(231, '23109', 'Fabricación de productos de vidrio ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(232, '23910', 'Fabricación de productos de refractarios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(233, '23920', 'Fabricación de productos de arcilla para la construcción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(234, '23931', 'Fabricación de productos de cerámica y porcelana no refractaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(235, '23932', 'Fabricación de productos de cerámica y porcelana ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(236, '23940', 'Fabricación de cemento, cal y yeso', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(237, '23950', 'Fabricación de artículos de hormigón, cemento y yeso', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(238, '23960', 'Corte, tallado y acabado de la piedra', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(239, '23990', 'Fabricación de productos minerales no metálicos ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(240, NULL, 'FABRICACIÓN DE METALES COMUNES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(241, '24100', 'Industrias básicas de hierro y acero', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(242, '24200', 'Fabricación de productos primarios de metales preciosos y metales no ferrosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(243, '24310', 'Fabricación de hierro y acero', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(244, '24320', 'Fundición de metales no ferrosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(245, NULL, 'FABRICACIÓN DE PRODUCTOS DERIVADOS DE METAL, EXCEPTO MAQUINARIA Y EQUIPO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(246, '25111', 'Fabricación de productos metálicos para uso estructural', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(247, '25118', 'Servicio de maquila para la fabricación de estructuras metálicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(248, '25120', 'Fabricación de tanques, depósitos y recipientes de metal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(249, '25130', 'Fabricación de generadores de vapor, excepto calderas de agua caliente para calefacción central', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(250, '25200', 'Fabricación de armas y municiones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(251, '25910', 'Forjado, prensado, estampado y laminado de metales; pulvimetalurgia', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(252, '25920', 'Tratamiento y revestimiento de metales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(253, '25930', 'Fabricación de artículos de cuchillería, herramientas de mano y artículos de ferretería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(254, '25991', 'Fabricación de envases y artículos conexos de metal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(255, '25992', 'Fabricación de artículos metálicos de uso personal y/o doméstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(256, '25999', 'Fabricación de productos elaborados de metal ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(257, NULL, 'FABRICACIÓN DE PRODUCTOS DE INFORMÁTICA, ELECTRÓNICA Y ÓPTICA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(258, '26100', 'Fabricación de componentes electrónicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(259, '26200', 'Fabricación de computadoras y equipo conexo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(260, '26300', 'Fabricación de equipo de comunicaciones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(261, '26400', 'Fabricación de aparatos electrónicos de consumo para audio, video radio y televisión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(262, '26510', 'Fabricación de instrumentos y aparatos para medir, verificar, ensayar, navegar y de control de procesos industriales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(263, '26520', 'Fabricación de relojes y piezas de relojes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(264, '26600', 'Fabricación de equipo médico de irradiación y equipo electrónico de uso médico y terapéutico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(265, '26700', 'Fabricación de instrumentos de óptica y equipo fotográfico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(266, '26800', 'Fabricación de medios magnéticos y ópticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(267, NULL, 'FABRICACIÓN DE EQUIPO ELÉCTRICO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(268, '27100', 'Fabricación de motores, generadores, transformadores eléctricos, aparatos de distribución y control de electricidad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(269, '27200', 'Fabricación de pilas, baterías y acumuladores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(270, '27310', 'Fabricación de cables de fibra óptica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(271, '27320', 'Fabricación de otros hilos y cables eléctricos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(272, '27330', 'Fabricación de dispositivos de cableados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(273, '27400', 'Fabricación de equipo eléctrico de iluminación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(274, '27500', 'Fabricación de aparatos de uso doméstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(275, '27900', 'Fabricación de otros tipos de equipo eléctrico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(276, NULL, 'FABRICACIÓN DE MAQUINARIA Y EQUIPO NCP', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(277, '28110', 'Fabricación de motores y turbinas, excepto motores para aeronaves, vehículos automotores y motocicletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(278, '28120', 'Fabricación de equipo hidráulico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(279, '28130', 'Fabricación de otras bombas, compresores, grifos y válvulas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(280, '28140', 'Fabricación de cojinetes, engranajes, trenes de engranajes y piezas de transmisión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(281, '28150', 'Fabricación de hornos y quemadores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(282, '28160', 'Fabricación de equipo de elevación y manipulación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(283, '28170', 'Fabricación de maquinaria y equipo de oficina', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(284, '28180', 'Fabricación de herramientas manuales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(285, '28190', 'Fabricación de otros tipos de maquinaria de uso general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(286, '28210', 'Fabricación de maquinaria agropecuaria y forestal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(287, '28220', 'Fabricación de máquinas para conformar metales y maquinaria herramienta', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(288, '28230', 'Fabricación de maquinaria metalúrgica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(289, '28240', 'Fabricación de maquinaria para la explotación de minas y canteras y para obras de construcción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(290, '28250', 'Fabricación de maquinaria para la elaboración de alimentos, bebidas y tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(291, '28260', 'Fabricación de maquinaria para la elaboración de productos textiles, prendas de vestir y cueros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(292, '28291', 'Fabricación de máquinas para imprenta', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(293, '28299', 'Fabricación de maquinaria de uso especial ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(294, NULL, 'FABRICACIÓN DE VEHÍCULOS AUTOMOTORES, REMOLQUES Y SEMIREMOLQUES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(295, '29100', 'Fabricación de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(296, '29200', 'Fabricación de carrocerías para vehículos automotores; fabricación de remolques y semirremolques', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(297, '29300', 'Fabricación de partes, piezas y accesorios para vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(298, NULL, 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO DE TRANSPORTE', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(299, '30110', 'Fabricación de buques', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(300, '30120', 'Construcción y reparación de embarcaciones de recreo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(301, '30200', 'Fabricación de locomotoras y de material rodante', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(302, '30300', 'Fabricación de aeronaves y naves espaciales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(303, '30400', 'Fabricación de vehículos militares de combate', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(304, '30910', 'Fabricación de motocicletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(305, '30920', 'Fabricación de bicicletas y sillones de ruedas para inválidos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(306, '30990', 'Fabricación de equipo de transporte ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(307, NULL, 'FABRICACIÓN DE MUEBLES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(308, '31001', 'Fabricación de colchones y somier', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(309, '31002', 'Fabricación de muebles y otros productos de madera a medida', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(310, '31008', 'Servicios de maquilado de muebles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(311, '31009', 'Fabricación de muebles ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(312, NULL, 'OTRAS INDUSTRIAS MANUFACTURERAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(313, '32110', 'Fabricación de joyas platería y joyerías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(314, '32120', 'Fabricación de joyas de imitación (fantasía) y artículos conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(315, '32200', 'Fabricación de instrumentos musicales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(316, '32301', 'Fabricación de artículos de deporte', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(317, '32308', 'Servicio de maquila de productos deportivos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(318, '32401', 'Fabricación de juegos de mesa y de salón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(319, '32402', 'Fabricación de juegos y juguetes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(320, '32409', 'Fabricación de juegos y juguetes n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(321, '32500', 'Fabricación de instrumentos y materiales médicos y odontológicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(322, '32901', 'Fabricación de lápices, bolígrafos, sellos y artículos de librería en general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(323, '32902', 'Fabricación de escobas, cepillos, pinceles y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(324, '32903', 'Fabricación de artesanías de materiales diversos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(325, '32904', 'Fabricación de artículos de uso personal y domésticos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(326, '32905', 'Fabricación de accesorios para las confecciones y la marroquinería n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(327, '32908', 'Servicios de maquila ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(328, '32909', 'Reparación de productos manufacturados n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(329, NULL, 'REPARACIÓN E INSTALACIÓN DE MAQUINARIA Y EQUIPO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(330, '33110', 'Reparación y mantenimiento de productos elaborados de metal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(331, '33120', 'Reparación y mantenimiento de maquinaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(332, '33130', 'Reparación y mantenimiento de equipo electrónico y óptico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(333, '33140', 'Reparación y mantenimiento de equipo eléctrico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(334, '33150', 'Reparación y mantenimiento de equipo de transporte, excepto vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(335, '33190', 'Reparación y mantenimiento de equipos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(336, '33200', 'Instalación de maquinaria y equipo industrial', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(337, NULL, 'SUMINISTROS DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(338, NULL, 'SUMINISTROS DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(339, '35101', 'Generación de energía eléctrica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(340, '35102', 'Transmisión de energía eléctrica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(341, '35103', 'Distribución de energía eléctrica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(342, '35200', 'Fabricación de gas, distribución de combustibles gaseosos por tuberías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(343, '35300', 'Suministro de vapor y agua caliente', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(344, NULL, 'SUMINISTRO DE AGUA; EVACUACIÓN DE AGUAS RESIDUALES (ALCANTARILLADO); GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(345, NULL, 'CAPTACIÓN, TRATAMIENTO Y SUMINISTRO DE AGUA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(346, '36000', 'Captación, tratamiento y suministro de agua', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(347, NULL, 'EVACUACIÓN DE AGUAS RESIDUALES (ALCANTARILLADO)', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(348, '37000', 'Evacuación de aguas residuales (alcantarillado)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(349, NULL, 'RECOLECCIÓN, TRATAMIENTO Y ELIMINACIÓN DE DESECHOS; RECICLAJE', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(350, '38110', 'Recolección y transporte de desechos sólidos proveniente de hogares y sector urbano', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(351, '38120', 'Recolección de desechos peligrosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(352, '38210', 'Tratamiento y eliminación de desechos inocuos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(353, '38220', 'Tratamiento y eliminación de desechos peligrosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(354, '38301', 'Reciclaje de desperdicios y desechos textiles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(355, '38302', 'Reciclaje de desperdicios y desechos de plástico y caucho', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(356, '38303', 'Reciclaje de desperdicios y desechos de vidrio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(357, '38304', 'Reciclaje de desperdicios y desechos de papel y cartón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(358, '38305', 'Reciclaje de desperdicios y desechos metálicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(359, '38309', 'Reciclaje de desperdicios y desechos no metálicos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(360, NULL, 'ACTIVIDADES DE SANEAMIENTO Y OTROS SERVICIOS DE GESTIÓN DE DESECHOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(361, '39000', 'Actividades de Saneamiento y otros Servicios de Gestión de Desechos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(362, NULL, 'CONSTRUCCIÓN', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(363, NULL, 'CONSTRUCCIÓN DE EDIFICIOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(364, '41001', 'Construcción de edificios residenciales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(365, '41002', 'Construcción de edificios no residenciales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(366, NULL, 'OBRAS DE INGENIERÍA CIVIL', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(367, '42100', 'Construcción de carreteras, calles y caminos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(368, '42200', 'Construcción de proyectos de servicio público', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(369, '42900', 'Construcción de obras de ingeniería civil n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(370, NULL, 'ACTIVIDADES ESPECIALIZADAS DE CONSTRUCCIÓN', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(371, '43110', 'Demolición', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(372, '43120', 'Preparación de terreno', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(373, '43210', 'Instalaciones eléctricas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(374, '43220', 'Instalación de fontanería, calefacción y aire acondicionado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(375, '43290', 'Otras instalaciones para obras de construcción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(376, '43300', 'Terminación y acabado de edificios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(377, '43900', 'Otras actividades especializadas de construcción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(378, '43901', 'Fabricación de techos y materiales diversos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(379, NULL, 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(380, NULL, 'COMERCIO AL POR MAYOR Y POR MENOR Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(381, '45100', 'Venta de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(382, '45201', 'Reparación mecánica de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(383, '45202', 'Reparación eléctricas del automotor y recarga de baterías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(384, '45203', 'Enderezado y pintura de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(385, '45204', 'Reparaciones de radiadores, escapes y silenciadores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(386, '45205', 'Reparación y reconstrucción de vías, stop y otros artículos de fibra de vidrio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(387, '45206', 'Reparación de llantas de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(388, '45207', 'Polarizado de vehículos (mediante la adhesión de papel especial a los vidrios)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(389, '45208', 'Lavado y pasteado de vehículos (carwash)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(390, '45209', 'Reparaciones de vehículos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(391, '45211', 'Remolque de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(392, '45301', 'Venta de partes, piezas y accesorios nuevos para vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(393, '45302', 'Venta de partes, piezas y accesorios usados para vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(394, '45401', 'Venta de motocicletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(395, '45402', 'Venta de repuestos, piezas y accesorios de motocicletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(396, '45403', 'Mantenimiento y reparación de motocicletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(397, NULL, 'COMERCIO AL POR MAYOR, EXCEPTO EL COMERCIO DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS (Parte 1)', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(398, '46100', 'Venta al por mayor a cambio de retribución o por contrata', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(399, '46201', 'Venta al por mayor de materias primas agrícolas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(400, '46202', 'Venta al por mayor de productos de la silvicultura', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(401, '46203', 'Venta al por mayor de productos pecuarios y de granja', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(402, '46211', 'Venta de productos para uso agropecuario', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(403, '46291', 'Venta al por mayor de granos básicos (cereales, leguminosas)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(404, '46292', 'Venta al por mayor de semillas mejoradas para cultivo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(405, '46293', 'Venta al por mayor de café oro y uva', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(406, '46294', 'Venta al por mayor de caña de azúcar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(407, '46295', 'Venta al por mayor de flores, plantas y otros productos naturales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(408, '46296', 'Venta al por mayor de productos agrícolas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(409, '46297', 'Venta al por mayor de ganado bovino (vivo)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(410, '46298', 'Venta al por mayor de animales porcinos, ovinos, caprino, canículas, avícolas, avícolas vivos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(411, '46299', 'Venta de otras especies vivas del reino animal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(412, '46301', 'Venta al por mayor de alimentos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(413, '46302', 'Venta al por mayor de bebidas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(414, '46303', 'Venta al por mayor de tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(415, '46371', 'Venta al por mayor de frutas, hortalizas (verduras), legumbres y tubérculos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(416, '46372', 'Venta al por mayor de pollos, gallinas destazadas, pavos y otras aves', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(417, '46373', 'Venta al por mayor de carne bovina y porcina, productos de carne y embutidos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(418, '46374', 'Venta al por mayor de huevos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(419, '46375', 'Venta al por mayor de productos lácteos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(420, '46376', 'Venta al por mayor de productos de panadería, repostería y galletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(421, '46377', 'Venta al por mayor de productos farináceos, aceites y grasas comestibles vegetal y animal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(422, '46378', 'Venta al por mayor de sal comestible', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(423, '46379', 'Venta al por mayor de azúcar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(424, '46391', 'Venta al por mayor de abarrotes (vinos, licores, productos alimenticios envasados, etc.)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(425, '46392', 'Venta al por mayor de aguas gaseosas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(426, '46393', 'Venta al por mayor de agua purificada', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(427, '46394', 'Venta al por mayor de refrescos y otras bebidas, líquidas o en polvo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(428, '46395', 'Venta al por mayor de cerveza y licores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(429, '46396', 'Venta al por mayor de hielo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(430, '46411', 'Venta al por mayor de hilados, tejidos y productos textiles de mercería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(431, '46412', 'Venta al por mayor de artículos textiles excepto confecciones para el hogar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(432, '46413', 'Venta al por mayor de confecciones textiles para el hogar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(433, '46414', 'Venta al por mayor de prendas de vestir y accesorios de vestir', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(434, '46415', 'Venta al por mayor de ropa usada', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(435, '46416', 'Venta al por mayor de calzado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34');
INSERT INTO `actividad_economica` (`id`, `codigo`, `descripcion`, `seleccionable`, `created_at`, `updated_at`) VALUES
(436, '46417', 'Venta al por mayor de artículos de marroquinería y talabartería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(437, '46418', 'Venta al por mayor de artículos de peletería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(438, '46419', 'Venta al por mayor de otros artículos textiles n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(439, '46471', 'Venta al por mayor de instrumentos musicales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(440, '46472', 'Venta al por mayor de colchones, almohadas, cojines, etc.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(441, '46473', 'Venta al por mayor de artículos de aluminio para el hogar y para otros usos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(442, '46474', 'Venta al por mayor de depósitos y otros artículos plásticos para el hogar y otros usos, incluyendo los desechables de durapax y no desechables', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(443, '46475', 'Venta al por mayor de cámaras fotográficas, accesorios y materiales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(444, '46482', 'Venta al por mayor de medicamentos, artículos y otros productos de uso veterinario', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(445, '46483', 'Venta al por mayor de productos y artículos de belleza y de uso personal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(446, '46484', 'Venta de productos farmacéuticos y medicinales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(447, '46491', 'Venta al por mayor de productos medicinales, cosméticos, perfumería y productos de limpieza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(448, '46492', 'Venta al por mayor de relojes y artículos de joyería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(449, '46493', 'Venta al por mayor de electrodomésticos y artículos del hogar excepto bazar; artículos de iluminación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(450, '46494', 'Venta al por mayor de artículos de bazar y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(451, '46495', 'Venta al por mayor de artículos de óptica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(452, '46496', 'Venta al por mayor de revistas, periódicos, libros, artículos de librería y papelería, y artículos en general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(453, '46497', 'Venta de artículos deportivos, juguetes y rodados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(454, '46498', 'Venta al por mayor de enseres usados para el hogar o el uso personal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(455, '46499', 'Venta al por mayor de enseres domésticos y de uso personal n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(456, '46500', 'Venta al por mayor de bicicletas, partes, accesorios y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(457, '46510', 'Venta al por mayor de computadoras, equipo periférico y programas informáticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(458, '46520', 'Venta al por mayor de equipos de comunicación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(459, '46530', 'Venta al por mayor de maquinaria y equipo agropecuario, accesorios, partes y suministros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(460, '46590', 'Venta al por mayor de equipos e instrumentos de uso profesional y científico y aparatos de medida y control', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(461, '46591', 'Venta al por mayor de maquinaria equipo, accesorios y materiales para la industria de la madera y sus productos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(462, '46592', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria gráfica y del papel, cartón y productos de papel y cartón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(463, '46593', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria de productos químicos, plástico y caucho', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(464, '46594', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria metálica y de sus productos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(465, '46595', 'Venta al por mayor de equipamiento para uso médico, odontológico, veterinario y servicios conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(466, '46596', 'Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria de la alimentación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(467, '46597', 'Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria textil, confecciones y cuero', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(468, '46598', 'Venta al por mayor de maquinaria, equipo y accesorios para la construcción y explotación de minas y canteras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(469, '46599', 'Venta al por mayor de otro tipo de maquinaria y equipo con sus accesorios y partes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(470, '46610', 'Venta al por mayor de otros combustibles sólidos, líquidos, gaseosos y de productos conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(471, '46612', 'Venta al por mayor de combustibles para automotores, aviones, barcos, maquinaria y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(472, '46613', 'Venta al por mayor de lubricantes, grasas y otros aceites para automotores, maquinaria industrial, etc.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(473, '46614', 'Venta al por mayor de gas propano', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(474, '46615', 'Venta al por mayor de leña y carbón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(475, '46620', 'Venta al por mayor de metales y minerales metalíferos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(476, '46631', 'Venta al por mayor de puertas, ventanas, vitrinas y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(477, '46632', 'Venta al por mayor de artículos de ferretería y pinturerías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(478, '46633', 'Vidrierías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(479, '46634', 'Venta al por mayor de maderas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(480, '46639', 'Venta al por mayor de materiales para la construcción n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(481, '46691', 'Venta al por mayor de sal industrial sin yodar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(482, '46692', 'Venta al por mayor de productos intermedios y desechos de origen textil', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(483, '46693', 'Venta al por mayor de productos intermedios y desechos de origen metálico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(484, '46694', 'Venta al por mayor de productos intermedios y desechos de papel y cartón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(485, NULL, 'COMERCIO AL POR MAYOR, EXCEPTO EL COMERCIO DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS (Parte 2)', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(486, '46695', 'Venta al por mayor fertilizantes, abonos, agroquímicos y productos similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(487, '46696', 'Venta al por mayor de productos intermedios y desechos de origen plástico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(488, '46697', 'Venta al por mayor de tintas para imprenta, productos curtientes y materias y productos colorantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(489, '46698', 'Venta de productos intermedios y desechos de origen químico y de caucho', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(490, '46699', 'Venta al por mayor de productos intermedios y desechos ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(491, '46701', 'Venta de algodón en oro', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(492, '46900', 'Venta al por mayor de otros productos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(493, '46901', 'Venta al por mayor de cohetes y otros productos pirotécnicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(494, '46902', 'Venta al por mayor de artículos diversos para consumo humano', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(495, '46903', 'Venta al por mayor de armas de fuego, municiones y accesorios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(496, '46904', 'Venta al por mayor de toldos y tiendas de campaña de cualquier material', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(497, '46905', 'Venta al por mayor de exhibidores publicitarios y rótulos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(498, '46906', 'Venta al por mayor de artículos promocionales diversos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(499, NULL, 'COMERCIO AL POR MENOR, EXCEPTO DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(500, '47111', 'Venta en supermercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(501, '47112', 'Venta en tiendas de artículos de primera necesidad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(502, '47119', 'Almacenes (venta de diversos artículos)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(503, '47190', 'Venta al por menor de otros productos en comercios no especializados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(504, '47199', 'Venta de establecimientos no especializados con surtido compuesto principalmente de alimentos, bebidas y tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(505, '47211', 'Venta al por menor de frutas y hortalizas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(506, '47212', 'Venta al por menor de carnes, embutidos y productos de granja', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(507, '47213', 'Venta al por menor de pescado y mariscos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(508, '47214', 'Venta al por menor de productos lácteos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(509, '47215', 'Venta al por menor de productos de panadería, repostería y galletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(510, '47216', 'Venta al por menor de huevos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(511, '47217', 'Venta al por menor de carnes y productos cárnicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(512, '47218', 'Venta al por menor de granos básicos y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(513, '47219', 'Venta al por menor de alimentos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(514, '47221', 'Venta al por menor de hielo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(515, '47223', 'Venta de bebidas no alcohólicas, para su consumo fuera del establecimiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(516, '47224', 'Venta de bebidas alcohólicas, para su consumo fuera del establecimiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(517, '47225', 'Venta de bebidas alcohólicas para su consumo dentro del establecimiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(518, '47230', 'Venta al por menor de tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(519, '47300', 'Venta de combustibles, lubricantes y otros (gasolineras)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(520, '47411', 'Venta al por menor de computadoras y equipo periférico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(521, '47412', 'Venta de equipo y accesorios de telecomunicación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(522, '47420', 'Venta al por menor de equipo de audio y vídeo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(523, '47510', 'Venta al por menor de hilados, tejidos y productos textiles de mercería; confecciones para el hogar y textiles n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(524, '47521', 'Venta al por menor de productos de madera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(525, '47522', 'Venta al por menor de artículos de ferretería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(526, '47523', 'Venta al por menor de productos de pinturerías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(527, '47524', 'Venta al por menor en vidrierías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(528, '47529', 'Venta al por menor de materiales de construcción y artículos conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(529, '47530', 'Venta al por menor de tapices, alfombras y revestimientos de paredes y pisos en comercios especializados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(530, '47591', 'Venta al por menor de productos agrícolas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(531, '47592', 'Venta al por menor de artículos de bazar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(532, '47593', 'Venta al por menor de aparatos electrodomésticos, repuestos y accesorios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(533, '47594', 'Venta al por menor de artículos eléctricos y de iluminación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(534, '47598', 'Venta al por menor de instrumentos musicales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(535, '47610', 'Venta al por menor de libros, periódicos y artículos de papelería en comercios especializados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(536, '47620', 'Venta al por menor de discos láser, cassettes, cintas de video y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(537, '47630', 'Venta al por menor de productos y equipos de deporte', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(538, '47631', 'Venta al por menor de bicicletas, accesorios y repuestos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(539, '47640', 'Venta al por menor de juegos y juguetes en comercios especializados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(540, '47711', 'Venta al por menor de prendas de vestir y accesorios de vestir', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(541, '47712', 'Venta al por menor de calzado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(542, '47713', 'Venta al por menor de artículos de peletería, marroquinería y talabartería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(543, '47721', 'Venta al por menor de medicamentos farmacéuticos y otros materiales y artículos de uso médico, odontológico y veterinario', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(544, '47722', 'Venta al por menor de productos cosméticos y de tocador', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(545, '47731', 'Venta al por menor de productos de joyería, bisutería, óptica, relojería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(546, '47732', 'Venta al por menor de plantas, semillas, animales y artículos conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(547, '47733', 'Venta al por menor de combustibles de uso doméstico (gas propano y gas licuado)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(548, '47734', 'Venta al por menor de artesanías, artículos cerámicos y recuerdos en general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(549, '47735', 'Venta al por menor de ataúdes, lápidas y cruces, trofeos, artículos religiosos en general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(550, '47736', 'Venta al por menor de armas de fuego, municiones y accesorios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(551, '47737', 'Venta al por menor de cohetería y pirotécnicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(552, '47738', 'Venta al por menor de artículos desechables de uso personal y doméstico (servilletas, papel higiénico, pañales, toallas sanitarias, etc.)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(553, '47739', 'Venta al por menor de otros productos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(554, '47741', 'Venta al por menor de artículos usados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(555, '47742', 'Venta al por menor de textiles y confecciones usados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(556, '47749', 'Venta al por menor de productos usados n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(557, '47811', 'Venta al por menor de frutas, verduras y hortalizas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(558, '47814', 'Venta al por menor de productos lácteos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(559, '47815', 'Venta al por menor de productos de panadería, galletas y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(560, '47816', 'Venta al por menor de bebidas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(561, '47818', 'Venta al por menor de tiendas de mercado y puestos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(562, '47821', 'Venta al por menor de hilados, tejidos y productos textiles de mercería en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(563, '47822', 'Venta al por menor de artículos textiles excepto confecciones para el hogar en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(564, '47823', 'Venta al por menor de confecciones textiles para el hogar en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(565, '47824', 'Venta al por menor de prendas de vestir, accesorios de vestir y similares en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(566, '47825', 'Venta al por menor de ropa usada', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(567, '47826', 'Venta al por menor de calzado, artículos de marroquinería y talabartería en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(568, '47827', 'Venta al por menor de artículos de marroquinería y talabartería en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(569, '47829', 'Venta al por menor de artículos textiles ncp en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(570, '47891', 'Venta al por menor de animales, flores y productos conexos en puestos de ferias y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(571, '47892', 'Venta al por menor de productos medicinales, cosméticos, de tocador y de limpieza en puestos de ferias y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(572, '47893', 'Venta al por menor de artículos de bazar en puestos de ferias y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(573, '47894', 'Venta al por menor de artículos de papel, envases, libros, revistas y conexos en puestos de feria y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(574, '47895', 'Venta al por menor de materiales de construcción, electrodomésticos, accesorios para autos y similares en puestos de feria y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(575, '47896', 'Venta al por menor de equipos accesorios para las comunicaciones en puestos de feria y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(576, '47899', 'Venta al por menor en puestos de ferias y mercados n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(577, '47910', 'Venta al por menor por correo o Internet', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(578, '47990', 'Otros tipos de venta al por menor no realizada, en almacenes, puestos de venta o mercado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(579, NULL, 'TRANSPORTE Y ALMACENAMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(580, NULL, 'TRANSPORTE POR VÍA TERRESTRE Y TRANSPORTE POR TUBERÍAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(581, '49110', 'Transporte interurbano de pasajeros por ferrocarril', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(582, '49120', 'Transporte de carga por ferrocarril', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(583, '49211', 'Transporte de pasajeros urbanos e interurbano mediante buses', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(584, '49212', 'Transporte de pasajeros urbanos e interurbano mediante microbuses', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(585, '49213', 'Transporte de pasajeros urbanos e interurbano mediante microbuses', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(586, '49214', 'Transporte de pasajeros interdepartamental mediante buses', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(587, '49221', 'Transporte internacional de pasajeros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(588, '49222', 'Transporte de pasajeros mediante taxis y autos con chofer', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(589, '49223', 'Transporte escolar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(590, '49225', 'Transporte de pasajeros para excursiones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(591, '49226', 'Servicios de transporte de personal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(592, '49229', 'Transporte de pasajeros por vía terrestre ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(593, '49231', 'Transporte de carga urbano', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(594, '49232', 'Transporte nacional de carga', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(595, '49233', 'Transporte de carga internacional', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(596, '49234', 'Servicios de mudanza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(597, '49235', 'Alquiler de vehículos de carga con conductor', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(598, '49300', 'Transporte por oleoducto o gasoducto', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(599, NULL, 'TRANSPORTE POR VÍA ACUÁTICA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(600, '50110', 'Transporte de pasajeros marítimo y de cabotaje', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(601, '50120', 'Transporte de carga marítimo y de cabotaje', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(602, '50211', 'Transporte de pasajeros por vías de navegación interiores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(603, '50212', 'Alquiler de equipo de transporte de pasajeros por vías de navegación interior con conductor', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(604, '50220', 'Transporte de carga por vías de navegación interiores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(605, NULL, 'TRANSPORTE POR VÍA AÉREA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(606, '51100', 'Transporte aéreo de pasajeros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(607, '51201', 'Transporte de carga por vía aérea', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(608, '51202', 'Alquiler de equipo de aeronave transporte con operadores para el propósito de transportar carga', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(609, NULL, 'ALMACENAMIENTO Y ACTIVIDADES DE APOYO AL TRANSPORTE', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(610, '52101', 'Alquiler de instalaciones de almacenamiento en zonas francas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(611, '52102', 'Alquiler de silos para conservación y almacenamiento de granos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(612, '52103', 'Alquiler de instalaciones con refrigeración para almacenamiento y conservación de alimentos y otros productos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(613, '52109', 'Alquiler de bodegas para almacenamiento y depósito n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(614, '52211', 'Servicio de garaje y estacionamiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(615, '52212', 'Servicios de terminales para el transporte por vía terrestre', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(616, '52219', 'Servicios para el transporte por vía terrestre n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(617, '52220', 'Servicios para el transporte acuático', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(618, '52230', 'Servicios para el transporte aéreo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(619, '52240', 'Manipulación de carga', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(620, '52290', 'Servicios para el transporte ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(621, '52291', 'Agencias de transmisiones aduanales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(622, NULL, 'ACTIVIDADES POSTALES Y DE MENSAJERÍA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(623, '53100', 'Servicios de correo nacional', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(624, '53200', 'Actividades de correo distintas a las actividades postales nacionales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(625, '53201', 'Agencia privada de correo y encomiendas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(626, NULL, 'ACTIVIDADES DE ALOJAMIENTO Y DE SERVICIO DE COMIDAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(627, NULL, 'ACTIVIDADES DE ALOJAMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(628, '55101', 'Actividades de alojamiento para estancias cortas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(629, '55102', 'Hoteles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(630, '55200', 'Actividades de campamentos, parques de vehículos de recreo y parques de caravanas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(631, '55900', 'Alojamiento n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(632, NULL, 'ACTIVIDADES DE SERVICIO DE COMIDAS Y BEBIDAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(633, '56101', 'Restaurantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(634, '56106', 'Panadería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(635, '56107', 'Actividades varias de restaurantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(636, '56108', 'Comedores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(637, '56109', 'Merenderos ambulantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(638, '56210', 'Preparación de comida para eventos especiales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(639, '56291', 'Servicios de provisión de comidas por contrato', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(640, '56292', 'Servicios de concesión de cafetines y chalet en empresas e', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(641, '56299', 'Servicio de provisión de comidas ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(642, '56301', 'Servicio de expendio de bebidas en salones y bares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(643, '56302', 'Servicio de expendio de bebidas en puestos callejeros, mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(644, NULL, 'INFORMACIÓN Y COMUNICACIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(645, NULL, 'ACTIVIDADES DE EDICIÓN', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(646, '58110', 'Edición de libros, folletos, partituras y otras ediciones distintas a estas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(647, '58120', 'Edición de directorios y listas de correos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(648, '58130', 'Edición de periódicos, revistas y otras publicaciones periódicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(649, '58190', 'Otras actividades de edición', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(650, '58200', 'Edición de programas informáticos (software)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(651, NULL, 'ACTIVIDADES DE PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS Y PROGRAMAS DE TELEVISIÓN, GRABACIÓN DE SONIDO Y EDICIÓN DE MÚSICA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(652, '59110', 'Actividades de producción cinematográfica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(653, '59120', 'Actividades de post producción de películas, videos y programas de televisión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(654, '59130', 'Actividades de distribución de películas cinematográficas, videos y programas de televisión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(655, '59140', 'Actividades de exhibición de películas cinematográficas y cintas de video', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(656, '59200', 'Actividades de edición y grabación de música', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(657, NULL, 'ACTIVIDADES DE PROGRAMACIÓN Y TRANSMISIÓN', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(658, '60100', 'Servicios de difusiones de radio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(659, '60201', 'Actividades de programación y difusión de televisión abierta', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(660, '60202', 'Actividades de suscripción y difusión de televisión por cable y/o suscripción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(661, '60299', 'Servicios de televisión, incluye televisión por cable', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(662, '60900', 'Programación y transmisión de radio y televisión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(663, NULL, 'TELECOMUNICACIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(664, '61101', 'Servicios de telefonía', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(665, '61102', 'Servicio de Internet', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(666, '61103', 'Servicio de telefonía fija', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(667, '61109', 'Servicio de Internet n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(668, '61201', 'Servicios de Internet inalámbrico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(669, '61202', 'Servicios de telefonía celular', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(670, '61209', 'Servicios de telecomunicaciones inalámbrico n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(671, '61301', 'Telecomunicaciones satelitales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(672, '61909', 'Comunicación vía satélite n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(673, '61900', 'Actividades de telecomunicación n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(674, NULL, 'PROGRAMACIÓN INFORMÁTICA, CONSULTORÍA INFORMÁTICA Y ACTIVIDADES CONEXAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(675, '62010', 'Programación informática', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(676, '62020', 'Consultorías y gestión de servicios informáticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(677, '62090', 'Otras actividades de tecnología de información y servicios de computadoras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(678, NULL, 'ACTIVIDADES DE SERVICIOS DE INFORMACIÓN', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(679, '63110', 'Procesamiento de datos y actividades relacionadas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(680, '63120', 'Portales WEB', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(681, '63910', 'Servicios de Agencias de Noticias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(682, '63990', 'Otros servicios de información n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(683, NULL, 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(684, NULL, 'ACTIVIDADES DE SERVICIOS FINANCIEROS EXCEPTO LAS DE SEGUROS Y FONDOS DE PENSIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(685, '64110', 'Servicios provistos por el Banco Central de El Salvador', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(686, '64190', 'Bancos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(687, '64191', 'Entidades dedicadas al envío de remesas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(688, '64199', 'Otras entidades financieras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(689, '64200', 'Actividades de sociedades de cartera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(690, '64300', 'Fideicomisos, fondos y otras fuentes de financiamiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(691, '64910', 'Arrendamientos financieros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(692, '64920', 'Asociaciones cooperativas de ahorro y crédito dedicadas a la intermediación financiera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(693, '64921', 'Instituciones emisoras de tarjetas de crédito y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(694, '64923', 'Tipos de crédito ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(695, '64928', 'Prestamistas y casas de empeño', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(696, '64990', 'Actividades de servicios financieros, excepto la financiación de planes de seguros y de pensiones n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(697, NULL, 'SEGUROS, REASEGUROS Y FONDOS DE PENSIONES; EXCEPTO PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(698, '65110', 'Planes de seguros de vida', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(699, '65120', 'Planes de seguro excepto de vida', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(700, '65199', 'Seguros generales de todo tipo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(701, '65200', 'Planes de reaseguro', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(702, '65300', 'Planes de pensiones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(703, NULL, 'ACTIVIDADES AUXILIARES DE LAS ACTIVIDADES DE SERVICIOS FINANCIEROS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(704, '66110', 'Administración de mercados financieros (Bolsa de Valores)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(705, '66120', 'Actividades bursátiles (Corredores de Bolsa)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(706, '66190', 'Actividades auxiliares de la intermediación financiera ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(707, '66210', 'Evaluación de riesgos y daños', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(708, '66220', 'Actividades de agentes y corredores de seguros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(709, '66290', 'Otras actividades auxiliares de seguros y fondos de pensiones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(710, '66300', 'Actividades de administración de fondos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(711, NULL, 'ACTIVIDADES INMOBILIARIAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(712, '68101', 'Servicio de alquiler y venta de lotes en cementerios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(713, '68109', 'Actividades inmobiliarias realizadas con bienes propios o arrendados n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(714, '68200', 'Actividades Inmobiliarias Realizadas a Cambio de una Retribución o por Contrata', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(715, NULL, 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(716, NULL, 'ACTIVIDADES JURÍDICAS Y CONTABLES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(717, '69100', 'Actividades jurídicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(718, '69200', 'Actividades de contabilidad, teneduría de libros y auditoría; asesoramiento en materia de impuestos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(719, NULL, 'ACTIVIDADES DE OFICINAS CENTRALES; ACTIVIDADES DE CONSULTORÍA EN GESTIÓN EMPRESARIAL', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(720, '70100', 'Actividades de oficinas centrales de sociedades de cartera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(721, '70200', 'Actividades de consultoría en gestión empresarial', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(722, NULL, 'ACTIVIDADES DE ARQUITECTURA E INGENIERÍA; ENSAYOS Y ANÁLISIS TÉCNICOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(723, '71101', 'Servicios de arquitectura y planificación urbana y servicios conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(724, '71102', 'Servicios de ingeniería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(725, '71103', 'Servicios de agrimensura, topografía, cartografía, prospección y geofísica y servicios conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(726, '71200', 'Ensayos y análisis técnicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(727, NULL, 'INVESTIGACIÓN CIENTÍFICA Y DESARROLLO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(728, '72100', 'Investigaciones y desarrollo experimental en el campo de las ciencias naturales y la ingeniería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(729, '72199', 'Investigaciones científicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(730, '72200', 'Investigaciones y desarrollo experimental en el campo de las ciencias sociales y las humanidades científica y desarrollo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(731, NULL, 'PUBLICIDAD Y ESTUDIOS DE MERCADO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(732, '73100', 'Publicidad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(733, '73200', 'Investigación de mercados y realización de encuestas de opinión publica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(734, NULL, 'OTRAS ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(735, '74100', 'Actividades de diseño especializado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(736, '74200', 'Actividades de fotografía', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(737, '74900', 'Servicios profesionales y científicos ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(738, NULL, 'ACTIVIDADES VETERINARIAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(739, '75000', 'Actividades veterinarias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(740, NULL, 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(741, NULL, 'ACTIVIDADES DE ALQUILER Y ARRENDAMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(742, '77101', 'Alquiler de equipo de transporte terrestre', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(743, '77102', 'Alquiler de equipo de transporte acuático', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(744, '77103', 'Alquiler de equipo de transporte por vía aérea', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(745, '77210', 'Alquiler y arrendamiento de equipo de recreo y deportivo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(746, '77220', 'Alquiler de cintas de video y discos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(747, '77290', 'Alquiler de otros efectos personales y enseres domésticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(748, '77300', 'Alquiler de maquinaria y equipo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(749, '77400', 'Arrendamiento de productos de propiedad intelectual', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(750, NULL, 'ACTIVIDADES DE EMPLEO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(751, '78100', 'Obtención y dotación de personal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(752, '78200', 'Actividades de las agencias de trabajo temporal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(753, '78300', 'Dotación de recursos humanos y gestión; gestión de las funciones de recursos humanos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(754, NULL, 'ACTIVIDADES DE AGENCIAS DE VIAJES, OPERADORES TURÍSTICOS Y OTROS SERVICIOS DE RESERVA Y ACTIVIDADES CONEXAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(755, '79110', 'Actividades de agencias de viajes y organizadores de viajes; actividades de asistencia a turistas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(756, '79120', 'Actividades de los operadores turísticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(757, '79900', 'Otros servicios de reservas y actividades relacionadas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(758, NULL, 'ACTIVIDADES DE INVESTIGACIÓN Y SEGURIDAD', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(759, '80100', 'Servicios de seguridad privados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(760, '80201', 'Actividades de servicios de sistemas de seguridad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(761, '80202', 'Actividades para la prestación de sistemas de seguridad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(762, '80300', 'Actividades de investigación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(763, NULL, 'ACTIVIDADES DE SERVICIOS A EDIFICIOS Y PAISAJISMO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(764, '81100', 'Actividades combinadas de mantenimiento de edificios e instalaciones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(765, '81210', 'Limpieza general de edificios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(766, '81290', 'Otras actividades combinadas de mantenimiento de edificios e instalaciones ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(767, '81300', 'Servicio de jardinería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(768, NULL, 'ACTIVIDADES ADMINISTRATIVAS Y DE APOYO DE OFICINAS Y OTRAS ACTIVIDADES DE APOYO A LAS EMPRESAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(769, NULL, 'SERVICIOS ADMINISTRATIVOS DE OFICINAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(770, '82110', 'Servicio de fotocopiado y similares, excepto en imprentas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(771, '82200', 'Actividades de las centrales de llamadas (call center)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(772, '82300', 'Organización de convenciones y ferias de negocios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(773, '82910', 'Actividades de agencias de cobro y oficinas de crédito', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(774, '82921', 'Servicios de envase y empaque de productos alimenticios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(775, '82922', 'Servicios de envase y empaque de productos medicinales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(776, '82929', 'Servicio de envase y empaque ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(777, '82990', 'Actividades de apoyo empresariales ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(778, NULL, 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(779, NULL, 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(780, '84110', 'Actividades de la Administración Pública en general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(781, '84111', 'Alcaldías Municipales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(782, '84120', 'Regulación de las actividades de prestación de servicios sanitarios, educativos, culturales y otros servicios sociales, excepto seguridad social', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(783, '84130', 'Regulación y facilitación de la actividad económica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(784, '84210', 'Actividades de administración y funcionamiento del Ministerio de Relaciones Exteriores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(785, '84220', 'Actividades de defensa', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(786, '84230', 'Actividades de mantenimiento del orden público y de seguridad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(787, '84300', 'Actividades de planes de seguridad social de afiliación obligatoria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(788, NULL, 'ENSEÑANZA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(789, '85101', 'Guardería educativa', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(790, '85102', 'Enseñanza preescolar o parvularia', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(791, '85103', 'Enseñanza primaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(792, '85104', 'Servicio de educación preescolar y primaria integrada', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(793, '85211', 'Enseñanza secundaria tercer ciclo (7°, 8° y 9°)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(794, '85212', 'Enseñanza secundaria de formación general bachillerato', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(795, '85221', 'Enseñanza secundaria de formación técnica y profesional', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(796, '85222', 'Enseñanza secundaria de formación técnica y profesional integrada con enseñanza primaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(797, '85301', 'Enseñanza superior universitaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(798, '85302', 'Enseñanza superior no universitaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(799, '85303', 'Enseñanza superior integrada a educación secundaria y/o primaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(800, '85410', 'Educación deportiva y recreativa', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(801, '85420', 'Educación cultural', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(802, '85490', 'Otros tipos de enseñanza n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(803, '85499', 'Enseñanza formal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(804, '85500', 'Servicios de apoyo a la enseñanza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(805, NULL, 'ACTIVIDADES DE ATENCIÓN A LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(806, NULL, 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(807, '86100', 'Actividades de hospitales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(808, '86201', 'Clínicas médicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(809, '86202', 'Servicios de Odontología', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(810, '86203', 'Servicios médicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(811, '86901', 'Servicios de análisis y estudios de diagnóstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(812, '86902', 'Actividades de atención de la salud humana', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(813, '86909', 'Otros Servicio relacionados con la salud ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(814, NULL, 'ACTIVIDADES DE ATENCIÓN DE ENFERMERÍA EN INSTITUCIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(815, '87100', 'Residencias de ancianos con atención de enfermería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(816, '87200', 'Instituciones dedicadas al tratamiento del retraso mental, problemas de salud mental y el uso indebido de sustancias nocivas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(817, '87300', 'Instituciones dedicadas al cuidado de ancianos y discapacitados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(818, '87900', 'Actividades de asistencia a niños y jóvenes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(819, '87901', 'Otras actividades de atención en instituciones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(820, NULL, 'ACTIVIDADES DE ASISTENCIA SOCIAL SIN ALOJAMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(821, '88100', 'Actividades de asistencia sociales sin alojamiento para ancianos y discapacitados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(822, '88900', 'Servicios sociales sin alojamiento ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(823, NULL, 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREATIVAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(824, NULL, 'ACTIVIDADES CREATIVAS ARTÍSTICAS Y DE ESPARCIMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(825, '90000', 'Actividades creativas artísticas y de esparcimiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(826, NULL, 'ACTIVIDADES BIBLIOTECAS, ARCHIVOS, MUSEOS Y OTRAS ACTIVIDADES CULTURALES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(827, '91010', 'Actividades de bibliotecas y archivos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(828, '91020', 'Actividades de museos y preservación de lugares y edificios históricos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(829, '91030', 'Actividades de jardines botánicos, zoológicos y de reservas naturales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(830, NULL, 'ACTIVIDADES DE JUEGOS DE AZAR Y APUESTAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(831, '92000', 'Actividades de juegos y apuestas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(832, NULL, 'ACTIVIDADES DEPORTIVAS, DE ESPARCIMIENTO Y RECREATIVAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(833, '93110', 'Gestión de instalaciones deportivas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(834, '93120', 'Actividades de clubes deportivos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(835, '93190', 'Otras actividades deportivas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(836, '93210', 'Actividades de parques de atracciones y parques temáticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(837, '93291', 'Discotecas y salas de baile', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(838, '93298', 'Centros vacacionales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(839, '93299', 'Actividades de esparcimiento ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(840, NULL, 'OTRAS ACTIVIDADES DE SERVICIOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(841, NULL, 'ACTIVIDADES DE ASOCIACIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(842, '94110', 'Actividades de organizaciones empresariales y de empleadores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(843, '94120', 'Actividades de organizaciones profesionales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(844, '94200', 'Actividades de sindicatos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(845, '94910', 'Actividades de organizaciones religiosas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(846, '94920', 'Actividades de organizaciones políticas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(847, '94990', 'Actividades de asociaciones n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(848, NULL, 'REPARACIÓN DE COMPUTADORAS Y DE EFECTOS PERSONALES Y ENSERES DOMÉSTICOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34');
INSERT INTO `actividad_economica` (`id`, `codigo`, `descripcion`, `seleccionable`, `created_at`, `updated_at`) VALUES
(849, '95110', 'Reparación de computadoras y equipo periférico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(850, '95120', 'Reparación de equipo de comunicación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(851, '95210', 'Reparación de aparatos electrónicos de consumo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(852, '95220', 'Reparación de aparatos doméstico y equipo de hogar y jardín', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(853, '95230', 'Reparación de calzado y artículos de cuero', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(854, '95240', 'Reparación de muebles y accesorios para el hogar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(855, '95291', 'Reparación de instrumentos musicales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(856, '95292', 'Servicios de cerrajería y copiado de llaves', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(857, '95293', 'Reparación de joyas y relojes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(858, '95294', 'Reparación de bicicletas, sillas de ruedas y rodados n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(859, '95299', 'Reparación de enseres personales n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(860, NULL, 'OTRAS ACTIVIDADES DE SERVICIOS PERSONALES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(861, '96010', 'Lavado y limpieza de prendas de tela y de piel, incluso la limpieza en seco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(862, '96020', 'Peluquería y otros tratamientos de belleza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(863, '96030', 'Pompas fúnebres y actividades conexas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(864, '96091', 'Servicios de sauna y otros servicios para la estética corporal n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(865, '96092', 'Servicios n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(866, NULL, 'ACTIVIDADES DE LOS HOGARES COMO EMPLEADORES, ACTIVIDADES INDIFERENCIADAS DE PRODUCCIÓN DE BIENES Y SERVICIOS DE LOS HOGARES PARA USO PROPIO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(867, NULL, 'ACTIVIDAD DE LOS HOGARES EN CALIDAD DE EMPLEADORES DE PERSONAL DOMÉSTICO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(868, '97000', 'Actividad de los hogares en calidad de empleadores de personal doméstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(869, NULL, 'ACTIVIDADES INDIFERENCIADAS DE PRODUCCIÓN DE BIENES Y SERVICIOS DE LOS HOGARES PARA USO PROPIO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(870, '98100', 'Actividades indiferenciadas de producción de bienes de los hogares privados para uso propio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(871, '98200', 'Actividades indiferenciadas de producción de servicios de los hogares privados para uso propio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(872, NULL, 'ACTIVIDADES DE ORGANIZACIONES Y ÓRGANOS EXTRATERRITORIALES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(873, NULL, 'ACTIVIDADES DE ORGANIZACIONES Y ÓRGANOS EXTRATERRITORIALES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(874, '99000', 'Actividades de organizaciones y órganos extraterritoriales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(875, NULL, 'EMPLEADOS Y OTRAS PERSONAS NATURALES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(876, '10001', 'Empleados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(877, '10002', 'Pensionado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(878, '10003', 'Estudiante', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(879, '10004', 'Desempleado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(880, '10005', 'Otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(881, '10006', 'Comerciante', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34');

CREATE TABLE `actividad_economica_b` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seleccionable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `actividad_economica_b` (`id`, `codigo`, `descripcion`, `seleccionable`, `created_at`, `updated_at`) VALUES
(1, NULL, 'AGRICULTURA, GANADERÍA, SILVICULTURA Y PESCA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(2, NULL, 'PRODUCCIÓN AGRÍCOLA, PECUARIA, CAZA Y ACTIVIDADES DE SERVICIOS CONEXAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(3, '01111', 'Cultivo de cereales excepto arroz y para forrajes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(4, '01112', 'Cultivo de legumbres', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(5, '01113', 'Cultivo de semillas oleaginosas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(6, '01114', 'Cultivo de plantas para la preparación de semillas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(7, '01119', 'Cultivo de otros cereales excepto arroz y forrajeros n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(8, '01120', 'Cultivo de arroz', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(9, '01131', 'Cultivo de raíces y tubérculos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(10, '01132', 'Cultivo de brotes, bulbos, vegetales tubérculos y cultivos similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(11, '01133', 'Cultivo hortícola de fruto', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(12, '01134', 'Cultivo de hortalizas de hoja y otras hortalizas ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(13, '01140', 'Cultivo de caña de azúcar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(14, '01150', 'Cultivo de tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(15, '01161', 'Cultivo de algodón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(16, '01162', 'Cultivo de fibras vegetales excepto algodón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(17, '01191', 'Cultivo de plantas no perennes para la producción de semillas y flores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(18, '01192', 'Cultivo de cereales y pastos para la alimentación animal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(19, '01199', 'Producción de cultivos no estacionales ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(20, '01220', 'Cultivo de frutas tropicales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(21, '01230', 'Cultivo de cítricos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(22, '01240', 'Cultivo de frutas de pepita y hueso', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(23, '01251', 'Cultivo de frutas ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(24, '01252', 'Cultivo de otras frutos y nueces de árboles y arbustos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(25, '01260', 'Cultivo de frutos oleaginosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(26, '01271', 'Cultivo de café', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(27, '01272', 'Cultivo de plantas para la elaboración de bebidas excepto café', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(28, '01281', 'Cultivo de especias y aromáticas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(29, '01282', 'Cultivo de plantas para la obtención de productos medicinales y farmacéuticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(30, '01291', 'Cultivo de árboles de hule (caucho) para la obtención de látex', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(31, '01292', 'Cultivo de plantas para la obtención de productos químicos y colorantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(32, '01299', 'Producción de cultivos perennes ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(33, '01300', 'Propagación de plantas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(34, '01301', 'Cultivo de plantas y flores ornamentales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(35, '01410', 'Cría y engorde de ganado bovino', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(36, '01420', 'Cría de caballos y otros equinos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(37, '01440', 'Cría de ovejas y cabras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(38, '01450', 'Cría de cerdos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(39, '01460', 'Cría de aves de corral y producción de huevos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(40, '01491', 'Cría de abejas apicultura para la obtención de miel y otros productos apícolas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(41, '01492', 'Cría de conejos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(42, '01493', 'Cría de iguanas y garrobos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(43, '01494', 'Cría de mariposas y otros insectos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(44, '01499', 'Cría y obtención de productos animales n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(45, '01500', 'Cultivo de productos agrícolas en combinación con la cría de animales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(46, '01611', 'Servicios de maquinaria agrícola', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(47, '01612', 'Control de plagas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(48, '01613', 'Servicios de riego', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(49, '01614', 'Servicios de contratación de mano de obra para la agricultura', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(50, '01619', 'Servicios agrícolas ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(51, '01621', 'Actividades para mejorar la reproducción, el crecimiento y el rendimiento de los animales y sus productos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(52, '01622', 'Servicios de mano de obra pecuaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(53, '01629', 'Servicios pecuarios ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(54, '01631', 'Labores post cosecha de preparación de los productos agrícolas para su comercialización o para la industria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(55, '01632', 'Servicios de beneficio de café', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(56, '01633', 'Servicio de beneficiado de plantas textiles (incluye el beneficiado cuando este es realizado en la misma explotación agropecuaria)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(57, '01640', 'Tratamiento de semillas para la propagación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(58, '01700', 'Caza ordinaria y mediante trampas, repoblación de animales de caza y servicios conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(59, NULL, 'SILVICULTURA Y EXTRACCIÓN DE MADERA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(60, '02100', 'Silvicultura y otras actividades forestales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(61, '02200', 'Extracción de madera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(62, '02300', 'Recolección de productos diferentes a la madera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(63, '02400', 'Servicios de apoyo a la silvicultura', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(64, NULL, 'PESCA Y ACUICULTURA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(65, '03110', 'Pesca marítima de altura y costera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(66, '03120', 'Pesca de agua dulce', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(67, '03210', 'Acuicultura marítima', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(68, '03220', 'Acuicultura de agua dulce', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(69, '03300', 'Servicios de apoyo a la pesca y acuicultura', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(70, NULL, 'EXPLOTACIÓN DE MINAS Y CANTERAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(71, NULL, 'EXTRACCIÓN CARBÓN DE PIEDRA Y LIGNITO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(72, '05100', 'Extracción de hulla', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(73, '05200', 'Extracción y aglomeración de lignito', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(74, NULL, 'EXTRACCIÓN DE PETRÓLEO CRUDO Y GAS NATURAL', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(75, '06100', 'Extracción de petróleo crudo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(76, '06200', 'Extracción de gas natural', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(77, NULL, 'EXTRACCIÓN DE MINERALES METALÍFEROS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(78, '07100', 'Extracción de minerales de hierro', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(79, '07210', 'Extracción de minerales de uranio y torio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(80, '07290', 'Extracción de minerales metalíferos no ferrosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(81, NULL, 'EXPLOTACIÓN DE OTRAS MINAS Y CANTERAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(82, '08100', 'Extracción de piedra, arena y arcilla', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(83, '08910', 'Extracción de minerales para la fabricación de abonos y productos químicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(84, '08920', 'Extracción y aglomeración de turba', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(85, '08930', 'Extracción de sal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(86, '08990', 'Explotación de otras minas y canteras ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(87, NULL, 'ACTIVIDADES DE SERVICIOS DE APOYO A LA EXPLOTACIÓN DE MINAS Y CANTERAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(88, '09100', 'Actividades de apoyo a la extracción de petróleo y gas natural', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(89, '09900', 'Actividades de apoyo a la explotación de minas y canteras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(90, NULL, 'INDUSTRIAS MANUFACTURERAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(91, NULL, 'ELABORACIÓN DE PRODUCTOS ALIMENTICIOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(92, '10101', 'Servicio de rastros y mataderos de bovinos y porcinos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(93, '10102', 'Matanza y procesamiento de bovinos y porcinos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(94, '10103', 'Matanza y procesamientos de aves de corral', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(95, '10104', 'Elaboración y conservación de embutidos y tripas naturales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(96, '10105', 'Servicio de conservación y empaque de carnes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(97, '10106', 'Elaboración y conservación de grasas y aceites animales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(98, '10107', 'Servicios de molienda de carne', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(99, '10108', 'Elaboración de productos de carne ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(100, '10201', 'Procesamiento y conservación de pescado, crustáceos y moluscos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(101, '10209', 'Fabricación de productos de pescado ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(102, '10301', 'Elaboración de jugos de frutas y hortalizas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(103, '10302', 'Elaboración y envasado de frutas, mermeladas y frutas deshidratadas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(104, '10309', 'Elaboración de productos de frutas y hortalizas n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(105, '10401', 'Fabricación de aceites y grasas vegetales y animales comestibles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(106, '10402', 'Fabricación de aceites y grasas vegetales y animales no comestibles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(107, '10409', 'Servicio de maquilado de aceites', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(108, '10501', 'Fabricación de productos lácteos excepto sorbetes y quesos sustitutos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(109, '10502', 'Fabricación de sorbetes y helados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(110, '10503', 'Fabricación de quesos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(111, '10611', 'Molienda de cereales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(112, '10612', 'Elaboración de cereales para el desayuno y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(113, '10613', 'Servicios de beneficiado de productos agrícolas ncp (excluye Beneficio de azúcar rama 1072 y beneficio de café rama 0163)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(114, '10621', 'Fabricación de almidón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(115, '10628', 'Servicio de molienda de maíz húmedo molino para nixtamal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(116, '10711', 'Elaboración de tortillas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(117, '10712', 'Fabricación de pan, galletas y barquillos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(118, '10713', 'Fabricación de repostería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(119, '10721', 'Ingenios azucareros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(120, '10722', 'Molienda de caña de azúcar para la elaboración de dulces', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(121, '10723', 'Elaboración de jarabes de azúcar y otros similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(122, '10724', 'Maquilado de azúcar de caña', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(123, '10730', 'Fabricación de cacao, chocolates y productos de confitería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(124, '10740', 'Elaboración de macarrones, fideos, y productos farináceos similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(125, '10750', 'Elaboración de comidas y platos preparados para la reventa en', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(126, '10791', 'Elaboración de productos de café', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(127, '10792', 'Elaboración de especies, sazonadores y condimentos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(128, '10793', 'Elaboración de sopas, cremas y consomé', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(129, '10794', 'Fabricación de bocadillos tostados y/o fritos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(130, '10799', 'Elaboración de productos alimenticios ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(131, '10800', 'Elaboración de alimentos preparados para animales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(132, NULL, 'ELABORACIÓN DE BEBIDAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(133, '11012', 'Fabricación de aguardiente y licores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(134, '11020', 'Elaboración de vinos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(135, '11030', 'Fabricación de cerveza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(136, '11041', 'Fabricación de aguas gaseosas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(137, '11042', 'Fabricación y envasado de agua', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(138, '11043', 'Elaboración de refrescos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(139, '11048', 'Maquilado de aguas gaseosas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(140, '11049', 'Elaboración de bebidas no alcohólicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(141, NULL, 'ELABORACIÓN DE PRODUCTOS DE TABACO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(142, '12000', 'Elaboración de productos de tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(143, NULL, 'FABRICACIÓN DE PRODUCTOS TEXTILES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(144, '13111', 'Preparación de fibras textiles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(145, '13112', 'Fabricación de hilados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(146, '13120', 'Fabricación de telas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(147, '13130', 'Acabado de productos textiles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(148, '13910', 'Fabricación de tejidos de punto y ganchillo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(149, '13921', 'Fabricación de productos textiles para el hogar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(150, '13922', 'Sacos, bolsas y otros artículos textiles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(151, '13929', 'Fabricación de artículos confeccionados con materiales textiles, excepto prendas de vestir n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(152, '13930', 'Fabricación de tapices y alfombras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(153, '13941', 'Fabricación de cuerdas de henequén y otras fibras naturales (lazos, pitas)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(154, '13942', 'Fabricación de redes de diversos materiales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(155, '13948', 'Maquilado de productos trenzables de cualquier material (petates, sillas, etc.)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(156, '13991', 'Fabricación de adornos, etiquetas y otros artículos para prendas de vestir', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(157, '13992', 'Servicio de bordados en artículos y prendas de tela', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(158, '13999', 'Fabricación de productos textiles ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(159, NULL, 'FABRICACIÓN DE PRENDAS DE VESTIR', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(160, '14101', 'Fabricación de ropa interior, para dormir y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(161, '14102', 'Fabricación de ropa para niños', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(162, '14103', 'Fabricación de prendas de vestir para ambos sexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(163, '14104', 'Confección de prendas a medida', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(164, '14105', 'Fabricación de prendas de vestir para deportes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(165, '14106', 'Elaboración de artesanías de uso personal confeccionadas especialmente de materiales textiles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(166, '14108', 'Maquilado de prendas de vestir, accesorios y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(167, '14109', 'Fabricación de prendas y accesorios de vestir n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(168, '14200', 'Fabricación de artículos de piel', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(169, '14301', 'Fabricación de calcetines, calcetas, medias (panty house) y otros similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(170, '14302', 'Fabricación de ropa interior de tejido de punto', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(171, '14309', 'Fabricación de prendas de vestir de tejido de punto ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(172, NULL, 'FABRICACIÓN DE CUEROS Y PRODUCTOS CONEXOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(173, '15110', 'Curtido y adobo de cueros; adobo y teñido de pieles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(174, '15121', 'Fabricación de maletas, bolsos de mano y otros artículos de marroquinería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(175, '15122', 'Fabricación de monturas, accesorios y vainas talabartería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(176, '15123', 'Fabricación de artesanías principalmente de cuero natural y sintético', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(177, '15128', 'Maquilado de artículos de cuero natural, sintético y de otros materiales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(178, '15201', 'Fabricación de calzado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(179, '15202', 'Fabricación de partes y accesorios de calzado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(180, '15208', 'Maquilado de partes y accesorios de calzado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(181, NULL, 'PRODUCCIÓN DE MADERA Y FABRICACIÓN DE PRODUCTOS DE MADERA Y CORCHO EXCEPTO MUEBLES; FABRICACIÓN DE ARTÍCULOS DE PAJA Y DE MATERIALES TRENZABLES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(182, '16100', 'Aserradero y acepilladura de madera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(183, '16210', 'Fabricación de madera laminada, terciada, enchapada y contrachapada, paneles para la construcción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(184, '16220', 'Fabricación de partes y piezas de carpintería para edificios y construcciones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(185, '16230', 'Fabricación de envases y recipientes de madera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(186, '16292', 'Fabricación de artesanías de madera, semillas, materiales trenzables', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(187, '16299', 'Fabricación de productos de madera, corcho, paja y materiales trenzables ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(188, NULL, 'FABRICACIÓN DE PAPEL Y DE PRODUCTOS DE PAPEL', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(189, '17010', 'Fabricación de pasta de madera, papel y cartón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(190, '17020', 'Fabricación de papel y cartón ondulado y envases de papel y cartón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(191, '17091', 'Fabricación de artículos de papel y cartón de uso personal y doméstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(192, '17092', 'Fabricación de productos de papel ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(193, NULL, 'IMPRESIÓN Y REPRODUCCIÓN DE GRABACIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(194, '18110', 'Impresión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(195, '18120', 'Servicios relacionados con la impresión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(196, '18200', 'Reproducción de grabaciones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(197, NULL, 'FABRICACIÓN DE COQUE Y DE PRODUCTOS DE LA REFINACIÓN DE PETRÓLEO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(198, '19100', 'Fabricación de productos de hornos de coque', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(199, '19201', 'Fabricación de combustible', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(200, '19202', 'Fabricación de aceites y lubricantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(201, NULL, 'FABRICACIÓN DE SUSTANCIAS Y PRODUCTOS QUÍMICOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(202, '20111', 'Fabricación de materias primas para la fabricación de colorantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(203, '20112', 'Fabricación de materiales curtientes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(204, '20113', 'Fabricación de gases industriales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(205, '20114', 'Fabricación de alcohol etílico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(206, '20119', 'Fabricación de sustancias químicas básicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(207, '20120', 'Fabricación de abonos y fertilizantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(208, '20130', 'Fabricación de plástico y caucho en formas primarias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(209, '20210', 'Fabricación de plaguicidas y otros productos químicos de uso agropecuario', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(210, '20220', 'Fabricación de pinturas, barnices y productos de revestimiento similares, tintas de imprenta y masillas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(211, '20231', 'Fabricación de jabones, detergentes y similares para limpieza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(212, '20232', 'Fabricación de perfumes, cosméticos y productos de higiene y cuidado personal, incluyendo tintes, champú, etc.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(213, '20291', 'Fabricación de tintas y colores para escribir y pintar; fabricación de cintas para impresoras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(214, '20292', 'Fabricación de productos pirotécnicos, explosivos y municiones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(215, '20299', 'Fabricación de sustancias químicas n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(216, '20300', 'Fabricación de fibras artificiales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(217, NULL, 'FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS, SUSTANCIAS QUÍMICAS MEDICINALES Y PRODUCTOS BOTÁNICOS DE USO FARMACÉUTICO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(218, '21001', 'Manufactura de productos farmacéuticos, sustancias químicas y productos botánicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(219, '21008', 'Maquilado de medicamentos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(220, NULL, 'FABRICACIÓN DE PRODUCTOS DE CAUCHO Y PLÁSTICO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(221, '22110', 'Fabricación de cubiertas y cámaras; renovación y recauchutado de cubiertas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(222, '22190', 'Fabricación de otros productos de caucho', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(223, '22201', 'Fabricación de envases plásticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(224, '22202', 'Fabricación de productos plásticos para uso personal o doméstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(225, '22208', 'Maquilado de plásticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(226, '22209', 'Fabricación de productos de plásticos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(227, NULL, 'FABRICACIÓN DE PRODUCTOS MINERALES NO METÁLICOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(228, '23101', 'Fabricación de vidrio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(229, '23102', 'Fabricación de recipientes y envases de vidrio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(230, '23108', 'Servicio de maquilado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(231, '23109', 'Fabricación de productos de vidrio ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(232, '23910', 'Fabricación de productos de refractarios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(233, '23920', 'Fabricación de productos de arcilla para la construcción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(234, '23931', 'Fabricación de productos de cerámica y porcelana no refractaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(235, '23932', 'Fabricación de productos de cerámica y porcelana ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(236, '23940', 'Fabricación de cemento, cal y yeso', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(237, '23950', 'Fabricación de artículos de hormigón, cemento y yeso', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(238, '23960', 'Corte, tallado y acabado de la piedra', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(239, '23990', 'Fabricación de productos minerales no metálicos ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(240, NULL, 'FABRICACIÓN DE METALES COMUNES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(241, '24100', 'Industrias básicas de hierro y acero', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(242, '24200', 'Fabricación de productos primarios de metales preciosos y metales no ferrosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(243, '24310', 'Fabricación de hierro y acero', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(244, '24320', 'Fundición de metales no ferrosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(245, NULL, 'FABRICACIÓN DE PRODUCTOS DERIVADOS DE METAL, EXCEPTO MAQUINARIA Y EQUIPO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(246, '25111', 'Fabricación de productos metálicos para uso estructural', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(247, '25118', 'Servicio de maquila para la fabricación de estructuras metálicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(248, '25120', 'Fabricación de tanques, depósitos y recipientes de metal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(249, '25130', 'Fabricación de generadores de vapor, excepto calderas de agua caliente para calefacción central', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(250, '25200', 'Fabricación de armas y municiones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(251, '25910', 'Forjado, prensado, estampado y laminado de metales; pulvimetalurgia', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(252, '25920', 'Tratamiento y revestimiento de metales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(253, '25930', 'Fabricación de artículos de cuchillería, herramientas de mano y artículos de ferretería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(254, '25991', 'Fabricación de envases y artículos conexos de metal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(255, '25992', 'Fabricación de artículos metálicos de uso personal y/o doméstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(256, '25999', 'Fabricación de productos elaborados de metal ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(257, NULL, 'FABRICACIÓN DE PRODUCTOS DE INFORMÁTICA, ELECTRÓNICA Y ÓPTICA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(258, '26100', 'Fabricación de componentes electrónicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(259, '26200', 'Fabricación de computadoras y equipo conexo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(260, '26300', 'Fabricación de equipo de comunicaciones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(261, '26400', 'Fabricación de aparatos electrónicos de consumo para audio, video radio y televisión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(262, '26510', 'Fabricación de instrumentos y aparatos para medir, verificar, ensayar, navegar y de control de procesos industriales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(263, '26520', 'Fabricación de relojes y piezas de relojes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(264, '26600', 'Fabricación de equipo médico de irradiación y equipo electrónico de uso médico y terapéutico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(265, '26700', 'Fabricación de instrumentos de óptica y equipo fotográfico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(266, '26800', 'Fabricación de medios magnéticos y ópticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(267, NULL, 'FABRICACIÓN DE EQUIPO ELÉCTRICO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(268, '27100', 'Fabricación de motores, generadores, transformadores eléctricos, aparatos de distribución y control de electricidad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(269, '27200', 'Fabricación de pilas, baterías y acumuladores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(270, '27310', 'Fabricación de cables de fibra óptica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(271, '27320', 'Fabricación de otros hilos y cables eléctricos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(272, '27330', 'Fabricación de dispositivos de cableados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(273, '27400', 'Fabricación de equipo eléctrico de iluminación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(274, '27500', 'Fabricación de aparatos de uso doméstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(275, '27900', 'Fabricación de otros tipos de equipo eléctrico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(276, NULL, 'FABRICACIÓN DE MAQUINARIA Y EQUIPO NCP', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(277, '28110', 'Fabricación de motores y turbinas, excepto motores para aeronaves, vehículos automotores y motocicletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(278, '28120', 'Fabricación de equipo hidráulico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(279, '28130', 'Fabricación de otras bombas, compresores, grifos y válvulas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(280, '28140', 'Fabricación de cojinetes, engranajes, trenes de engranajes y piezas de transmisión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(281, '28150', 'Fabricación de hornos y quemadores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(282, '28160', 'Fabricación de equipo de elevación y manipulación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(283, '28170', 'Fabricación de maquinaria y equipo de oficina', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(284, '28180', 'Fabricación de herramientas manuales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(285, '28190', 'Fabricación de otros tipos de maquinaria de uso general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(286, '28210', 'Fabricación de maquinaria agropecuaria y forestal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(287, '28220', 'Fabricación de máquinas para conformar metales y maquinaria herramienta', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(288, '28230', 'Fabricación de maquinaria metalúrgica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(289, '28240', 'Fabricación de maquinaria para la explotación de minas y canteras y para obras de construcción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(290, '28250', 'Fabricación de maquinaria para la elaboración de alimentos, bebidas y tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(291, '28260', 'Fabricación de maquinaria para la elaboración de productos textiles, prendas de vestir y cueros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(292, '28291', 'Fabricación de máquinas para imprenta', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(293, '28299', 'Fabricación de maquinaria de uso especial ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(294, NULL, 'FABRICACIÓN DE VEHÍCULOS AUTOMOTORES, REMOLQUES Y SEMIREMOLQUES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(295, '29100', 'Fabricación de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(296, '29200', 'Fabricación de carrocerías para vehículos automotores; fabricación de remolques y semirremolques', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(297, '29300', 'Fabricación de partes, piezas y accesorios para vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(298, NULL, 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO DE TRANSPORTE', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(299, '30110', 'Fabricación de buques', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(300, '30120', 'Construcción y reparación de embarcaciones de recreo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(301, '30200', 'Fabricación de locomotoras y de material rodante', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(302, '30300', 'Fabricación de aeronaves y naves espaciales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(303, '30400', 'Fabricación de vehículos militares de combate', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(304, '30910', 'Fabricación de motocicletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(305, '30920', 'Fabricación de bicicletas y sillones de ruedas para inválidos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(306, '30990', 'Fabricación de equipo de transporte ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(307, NULL, 'FABRICACIÓN DE MUEBLES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(308, '31001', 'Fabricación de colchones y somier', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(309, '31002', 'Fabricación de muebles y otros productos de madera a medida', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(310, '31008', 'Servicios de maquilado de muebles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(311, '31009', 'Fabricación de muebles ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(312, NULL, 'OTRAS INDUSTRIAS MANUFACTURERAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(313, '32110', 'Fabricación de joyas platería y joyerías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(314, '32120', 'Fabricación de joyas de imitación (fantasía) y artículos conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(315, '32200', 'Fabricación de instrumentos musicales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(316, '32301', 'Fabricación de artículos de deporte', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(317, '32308', 'Servicio de maquila de productos deportivos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(318, '32401', 'Fabricación de juegos de mesa y de salón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(319, '32402', 'Fabricación de juegos y juguetes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(320, '32409', 'Fabricación de juegos y juguetes n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(321, '32500', 'Fabricación de instrumentos y materiales médicos y odontológicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(322, '32901', 'Fabricación de lápices, bolígrafos, sellos y artículos de librería en general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(323, '32902', 'Fabricación de escobas, cepillos, pinceles y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(324, '32903', 'Fabricación de artesanías de materiales diversos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(325, '32904', 'Fabricación de artículos de uso personal y domésticos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(326, '32905', 'Fabricación de accesorios para las confecciones y la marroquinería n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(327, '32908', 'Servicios de maquila ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(328, '32909', 'Reparación de productos manufacturados n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(329, NULL, 'REPARACIÓN E INSTALACIÓN DE MAQUINARIA Y EQUIPO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(330, '33110', 'Reparación y mantenimiento de productos elaborados de metal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(331, '33120', 'Reparación y mantenimiento de maquinaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(332, '33130', 'Reparación y mantenimiento de equipo electrónico y óptico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(333, '33140', 'Reparación y mantenimiento de equipo eléctrico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(334, '33150', 'Reparación y mantenimiento de equipo de transporte, excepto vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(335, '33190', 'Reparación y mantenimiento de equipos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(336, '33200', 'Instalación de maquinaria y equipo industrial', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(337, NULL, 'SUMINISTROS DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(338, NULL, 'SUMINISTROS DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(339, '35101', 'Generación de energía eléctrica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(340, '35102', 'Transmisión de energía eléctrica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(341, '35103', 'Distribución de energía eléctrica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(342, '35200', 'Fabricación de gas, distribución de combustibles gaseosos por tuberías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(343, '35300', 'Suministro de vapor y agua caliente', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(344, NULL, 'SUMINISTRO DE AGUA; EVACUACIÓN DE AGUAS RESIDUALES (ALCANTARILLADO); GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(345, NULL, 'CAPTACIÓN, TRATAMIENTO Y SUMINISTRO DE AGUA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(346, '36000', 'Captación, tratamiento y suministro de agua', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(347, NULL, 'EVACUACIÓN DE AGUAS RESIDUALES (ALCANTARILLADO)', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(348, '37000', 'Evacuación de aguas residuales (alcantarillado)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(349, NULL, 'RECOLECCIÓN, TRATAMIENTO Y ELIMINACIÓN DE DESECHOS; RECICLAJE', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(350, '38110', 'Recolección y transporte de desechos sólidos proveniente de hogares y sector urbano', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(351, '38120', 'Recolección de desechos peligrosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(352, '38210', 'Tratamiento y eliminación de desechos inocuos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(353, '38220', 'Tratamiento y eliminación de desechos peligrosos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(354, '38301', 'Reciclaje de desperdicios y desechos textiles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(355, '38302', 'Reciclaje de desperdicios y desechos de plástico y caucho', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(356, '38303', 'Reciclaje de desperdicios y desechos de vidrio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(357, '38304', 'Reciclaje de desperdicios y desechos de papel y cartón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(358, '38305', 'Reciclaje de desperdicios y desechos metálicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(359, '38309', 'Reciclaje de desperdicios y desechos no metálicos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(360, NULL, 'ACTIVIDADES DE SANEAMIENTO Y OTROS SERVICIOS DE GESTIÓN DE DESECHOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(361, '39000', 'Actividades de Saneamiento y otros Servicios de Gestión de Desechos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(362, NULL, 'CONSTRUCCIÓN', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(363, NULL, 'CONSTRUCCIÓN DE EDIFICIOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(364, '41001', 'Construcción de edificios residenciales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(365, '41002', 'Construcción de edificios no residenciales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(366, NULL, 'OBRAS DE INGENIERÍA CIVIL', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(367, '42100', 'Construcción de carreteras, calles y caminos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(368, '42200', 'Construcción de proyectos de servicio público', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(369, '42900', 'Construcción de obras de ingeniería civil n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(370, NULL, 'ACTIVIDADES ESPECIALIZADAS DE CONSTRUCCIÓN', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(371, '43110', 'Demolición', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(372, '43120', 'Preparación de terreno', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(373, '43210', 'Instalaciones eléctricas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(374, '43220', 'Instalación de fontanería, calefacción y aire acondicionado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(375, '43290', 'Otras instalaciones para obras de construcción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(376, '43300', 'Terminación y acabado de edificios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(377, '43900', 'Otras actividades especializadas de construcción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(378, '43901', 'Fabricación de techos y materiales diversos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(379, NULL, 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(380, NULL, 'COMERCIO AL POR MAYOR Y POR MENOR Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(381, '45100', 'Venta de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(382, '45201', 'Reparación mecánica de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(383, '45202', 'Reparación eléctricas del automotor y recarga de baterías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(384, '45203', 'Enderezado y pintura de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(385, '45204', 'Reparaciones de radiadores, escapes y silenciadores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(386, '45205', 'Reparación y reconstrucción de vías, stop y otros artículos de fibra de vidrio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(387, '45206', 'Reparación de llantas de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(388, '45207', 'Polarizado de vehículos (mediante la adhesión de papel especial a los vidrios)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(389, '45208', 'Lavado y pasteado de vehículos (carwash)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(390, '45209', 'Reparaciones de vehículos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(391, '45211', 'Remolque de vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(392, '45301', 'Venta de partes, piezas y accesorios nuevos para vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(393, '45302', 'Venta de partes, piezas y accesorios usados para vehículos automotores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(394, '45401', 'Venta de motocicletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(395, '45402', 'Venta de repuestos, piezas y accesorios de motocicletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(396, '45403', 'Mantenimiento y reparación de motocicletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(397, NULL, 'COMERCIO AL POR MAYOR, EXCEPTO EL COMERCIO DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS (Parte 1)', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(398, '46100', 'Venta al por mayor a cambio de retribución o por contrata', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(399, '46201', 'Venta al por mayor de materias primas agrícolas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(400, '46202', 'Venta al por mayor de productos de la silvicultura', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(401, '46203', 'Venta al por mayor de productos pecuarios y de granja', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(402, '46211', 'Venta de productos para uso agropecuario', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(403, '46291', 'Venta al por mayor de granos básicos (cereales, leguminosas)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(404, '46292', 'Venta al por mayor de semillas mejoradas para cultivo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(405, '46293', 'Venta al por mayor de café oro y uva', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(406, '46294', 'Venta al por mayor de caña de azúcar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(407, '46295', 'Venta al por mayor de flores, plantas y otros productos naturales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(408, '46296', 'Venta al por mayor de productos agrícolas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(409, '46297', 'Venta al por mayor de ganado bovino (vivo)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(410, '46298', 'Venta al por mayor de animales porcinos, ovinos, caprino, canículas, avícolas, avícolas vivos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(411, '46299', 'Venta de otras especies vivas del reino animal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(412, '46301', 'Venta al por mayor de alimentos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(413, '46302', 'Venta al por mayor de bebidas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(414, '46303', 'Venta al por mayor de tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(415, '46371', 'Venta al por mayor de frutas, hortalizas (verduras), legumbres y tubérculos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(416, '46372', 'Venta al por mayor de pollos, gallinas destazadas, pavos y otras aves', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(417, '46373', 'Venta al por mayor de carne bovina y porcina, productos de carne y embutidos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(418, '46374', 'Venta al por mayor de huevos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(419, '46375', 'Venta al por mayor de productos lácteos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(420, '46376', 'Venta al por mayor de productos de panadería, repostería y galletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(421, '46377', 'Venta al por mayor de productos farináceos, aceites y grasas comestibles vegetal y animal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(422, '46378', 'Venta al por mayor de sal comestible', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(423, '46379', 'Venta al por mayor de azúcar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(424, '46391', 'Venta al por mayor de abarrotes (vinos, licores, productos alimenticios envasados, etc.)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(425, '46392', 'Venta al por mayor de aguas gaseosas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(426, '46393', 'Venta al por mayor de agua purificada', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(427, '46394', 'Venta al por mayor de refrescos y otras bebidas, líquidas o en polvo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(428, '46395', 'Venta al por mayor de cerveza y licores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(429, '46396', 'Venta al por mayor de hielo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(430, '46411', 'Venta al por mayor de hilados, tejidos y productos textiles de mercería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(431, '46412', 'Venta al por mayor de artículos textiles excepto confecciones para el hogar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(432, '46413', 'Venta al por mayor de confecciones textiles para el hogar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(433, '46414', 'Venta al por mayor de prendas de vestir y accesorios de vestir', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(434, '46415', 'Venta al por mayor de ropa usada', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(435, '46416', 'Venta al por mayor de calzado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34');
INSERT INTO `actividad_economica_b` (`id`, `codigo`, `descripcion`, `seleccionable`, `created_at`, `updated_at`) VALUES
(436, '46417', 'Venta al por mayor de artículos de marroquinería y talabartería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(437, '46418', 'Venta al por mayor de artículos de peletería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(438, '46419', 'Venta al por mayor de otros artículos textiles n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(439, '46471', 'Venta al por mayor de instrumentos musicales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(440, '46472', 'Venta al por mayor de colchones, almohadas, cojines, etc.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(441, '46473', 'Venta al por mayor de artículos de aluminio para el hogar y para otros usos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(442, '46474', 'Venta al por mayor de depósitos y otros artículos plásticos para el hogar y otros usos, incluyendo los desechables de durapax y no desechables', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(443, '46475', 'Venta al por mayor de cámaras fotográficas, accesorios y materiales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(444, '46482', 'Venta al por mayor de medicamentos, artículos y otros productos de uso veterinario', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(445, '46483', 'Venta al por mayor de productos y artículos de belleza y de uso personal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(446, '46484', 'Venta de productos farmacéuticos y medicinales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(447, '46491', 'Venta al por mayor de productos medicinales, cosméticos, perfumería y productos de limpieza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(448, '46492', 'Venta al por mayor de relojes y artículos de joyería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(449, '46493', 'Venta al por mayor de electrodomésticos y artículos del hogar excepto bazar; artículos de iluminación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(450, '46494', 'Venta al por mayor de artículos de bazar y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(451, '46495', 'Venta al por mayor de artículos de óptica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(452, '46496', 'Venta al por mayor de revistas, periódicos, libros, artículos de librería y papelería, y artículos en general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(453, '46497', 'Venta de artículos deportivos, juguetes y rodados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(454, '46498', 'Venta al por mayor de enseres usados para el hogar o el uso personal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(455, '46499', 'Venta al por mayor de enseres domésticos y de uso personal n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(456, '46500', 'Venta al por mayor de bicicletas, partes, accesorios y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(457, '46510', 'Venta al por mayor de computadoras, equipo periférico y programas informáticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(458, '46520', 'Venta al por mayor de equipos de comunicación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(459, '46530', 'Venta al por mayor de maquinaria y equipo agropecuario, accesorios, partes y suministros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(460, '46590', 'Venta al por mayor de equipos e instrumentos de uso profesional y científico y aparatos de medida y control', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(461, '46591', 'Venta al por mayor de maquinaria equipo, accesorios y materiales para la industria de la madera y sus productos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(462, '46592', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria gráfica y del papel, cartón y productos de papel y cartón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(463, '46593', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria de productos químicos, plástico y caucho', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(464, '46594', 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria metálica y de sus productos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(465, '46595', 'Venta al por mayor de equipamiento para uso médico, odontológico, veterinario y servicios conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(466, '46596', 'Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria de la alimentación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(467, '46597', 'Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria textil, confecciones y cuero', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(468, '46598', 'Venta al por mayor de maquinaria, equipo y accesorios para la construcción y explotación de minas y canteras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(469, '46599', 'Venta al por mayor de otro tipo de maquinaria y equipo con sus accesorios y partes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(470, '46610', 'Venta al por mayor de otros combustibles sólidos, líquidos, gaseosos y de productos conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(471, '46612', 'Venta al por mayor de combustibles para automotores, aviones, barcos, maquinaria y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(472, '46613', 'Venta al por mayor de lubricantes, grasas y otros aceites para automotores, maquinaria industrial, etc.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(473, '46614', 'Venta al por mayor de gas propano', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(474, '46615', 'Venta al por mayor de leña y carbón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(475, '46620', 'Venta al por mayor de metales y minerales metalíferos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(476, '46631', 'Venta al por mayor de puertas, ventanas, vitrinas y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(477, '46632', 'Venta al por mayor de artículos de ferretería y pinturerías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(478, '46633', 'Vidrierías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(479, '46634', 'Venta al por mayor de maderas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(480, '46639', 'Venta al por mayor de materiales para la construcción n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(481, '46691', 'Venta al por mayor de sal industrial sin yodar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(482, '46692', 'Venta al por mayor de productos intermedios y desechos de origen textil', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(483, '46693', 'Venta al por mayor de productos intermedios y desechos de origen metálico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(484, '46694', 'Venta al por mayor de productos intermedios y desechos de papel y cartón', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(485, NULL, 'COMERCIO AL POR MAYOR, EXCEPTO EL COMERCIO DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS (Parte 2)', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(486, '46695', 'Venta al por mayor fertilizantes, abonos, agroquímicos y productos similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(487, '46696', 'Venta al por mayor de productos intermedios y desechos de origen plástico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(488, '46697', 'Venta al por mayor de tintas para imprenta, productos curtientes y materias y productos colorantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(489, '46698', 'Venta de productos intermedios y desechos de origen químico y de caucho', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(490, '46699', 'Venta al por mayor de productos intermedios y desechos ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(491, '46701', 'Venta de algodón en oro', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(492, '46900', 'Venta al por mayor de otros productos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(493, '46901', 'Venta al por mayor de cohetes y otros productos pirotécnicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(494, '46902', 'Venta al por mayor de artículos diversos para consumo humano', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(495, '46903', 'Venta al por mayor de armas de fuego, municiones y accesorios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(496, '46904', 'Venta al por mayor de toldos y tiendas de campaña de cualquier material', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(497, '46905', 'Venta al por mayor de exhibidores publicitarios y rótulos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(498, '46906', 'Venta al por mayor de artículos promocionales diversos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(499, NULL, 'COMERCIO AL POR MENOR, EXCEPTO DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(500, '47111', 'Venta en supermercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(501, '47112', 'Venta en tiendas de artículos de primera necesidad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(502, '47119', 'Almacenes (venta de diversos artículos)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(503, '47190', 'Venta al por menor de otros productos en comercios no especializados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(504, '47199', 'Venta de establecimientos no especializados con surtido compuesto principalmente de alimentos, bebidas y tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(505, '47211', 'Venta al por menor de frutas y hortalizas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(506, '47212', 'Venta al por menor de carnes, embutidos y productos de granja', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(507, '47213', 'Venta al por menor de pescado y mariscos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(508, '47214', 'Venta al por menor de productos lácteos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(509, '47215', 'Venta al por menor de productos de panadería, repostería y galletas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(510, '47216', 'Venta al por menor de huevos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(511, '47217', 'Venta al por menor de carnes y productos cárnicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(512, '47218', 'Venta al por menor de granos básicos y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(513, '47219', 'Venta al por menor de alimentos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(514, '47221', 'Venta al por menor de hielo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(515, '47223', 'Venta de bebidas no alcohólicas, para su consumo fuera del establecimiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(516, '47224', 'Venta de bebidas alcohólicas, para su consumo fuera del establecimiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(517, '47225', 'Venta de bebidas alcohólicas para su consumo dentro del establecimiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(518, '47230', 'Venta al por menor de tabaco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(519, '47300', 'Venta de combustibles, lubricantes y otros (gasolineras)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(520, '47411', 'Venta al por menor de computadoras y equipo periférico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(521, '47412', 'Venta de equipo y accesorios de telecomunicación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(522, '47420', 'Venta al por menor de equipo de audio y vídeo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(523, '47510', 'Venta al por menor de hilados, tejidos y productos textiles de mercería; confecciones para el hogar y textiles n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(524, '47521', 'Venta al por menor de productos de madera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(525, '47522', 'Venta al por menor de artículos de ferretería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(526, '47523', 'Venta al por menor de productos de pinturerías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(527, '47524', 'Venta al por menor en vidrierías', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(528, '47529', 'Venta al por menor de materiales de construcción y artículos conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(529, '47530', 'Venta al por menor de tapices, alfombras y revestimientos de paredes y pisos en comercios especializados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(530, '47591', 'Venta al por menor de productos agrícolas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(531, '47592', 'Venta al por menor de artículos de bazar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(532, '47593', 'Venta al por menor de aparatos electrodomésticos, repuestos y accesorios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(533, '47594', 'Venta al por menor de artículos eléctricos y de iluminación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(534, '47598', 'Venta al por menor de instrumentos musicales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(535, '47610', 'Venta al por menor de libros, periódicos y artículos de papelería en comercios especializados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(536, '47620', 'Venta al por menor de discos láser, cassettes, cintas de video y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(537, '47630', 'Venta al por menor de productos y equipos de deporte', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(538, '47631', 'Venta al por menor de bicicletas, accesorios y repuestos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(539, '47640', 'Venta al por menor de juegos y juguetes en comercios especializados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(540, '47711', 'Venta al por menor de prendas de vestir y accesorios de vestir', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(541, '47712', 'Venta al por menor de calzado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(542, '47713', 'Venta al por menor de artículos de peletería, marroquinería y talabartería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(543, '47721', 'Venta al por menor de medicamentos farmacéuticos y otros materiales y artículos de uso médico, odontológico y veterinario', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(544, '47722', 'Venta al por menor de productos cosméticos y de tocador', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(545, '47731', 'Venta al por menor de productos de joyería, bisutería, óptica, relojería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(546, '47732', 'Venta al por menor de plantas, semillas, animales y artículos conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(547, '47733', 'Venta al por menor de combustibles de uso doméstico (gas propano y gas licuado)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(548, '47734', 'Venta al por menor de artesanías, artículos cerámicos y recuerdos en general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(549, '47735', 'Venta al por menor de ataúdes, lápidas y cruces, trofeos, artículos religiosos en general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(550, '47736', 'Venta al por menor de armas de fuego, municiones y accesorios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(551, '47737', 'Venta al por menor de cohetería y pirotécnicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(552, '47738', 'Venta al por menor de artículos desechables de uso personal y doméstico (servilletas, papel higiénico, pañales, toallas sanitarias, etc.)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(553, '47739', 'Venta al por menor de otros productos n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(554, '47741', 'Venta al por menor de artículos usados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(555, '47742', 'Venta al por menor de textiles y confecciones usados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(556, '47749', 'Venta al por menor de productos usados n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(557, '47811', 'Venta al por menor de frutas, verduras y hortalizas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(558, '47814', 'Venta al por menor de productos lácteos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(559, '47815', 'Venta al por menor de productos de panadería, galletas y similares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(560, '47816', 'Venta al por menor de bebidas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(561, '47818', 'Venta al por menor de tiendas de mercado y puestos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(562, '47821', 'Venta al por menor de hilados, tejidos y productos textiles de mercería en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(563, '47822', 'Venta al por menor de artículos textiles excepto confecciones para el hogar en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(564, '47823', 'Venta al por menor de confecciones textiles para el hogar en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(565, '47824', 'Venta al por menor de prendas de vestir, accesorios de vestir y similares en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(566, '47825', 'Venta al por menor de ropa usada', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(567, '47826', 'Venta al por menor de calzado, artículos de marroquinería y talabartería en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(568, '47827', 'Venta al por menor de artículos de marroquinería y talabartería en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(569, '47829', 'Venta al por menor de artículos textiles ncp en puestos de mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(570, '47891', 'Venta al por menor de animales, flores y productos conexos en puestos de ferias y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(571, '47892', 'Venta al por menor de productos medicinales, cosméticos, de tocador y de limpieza en puestos de ferias y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(572, '47893', 'Venta al por menor de artículos de bazar en puestos de ferias y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(573, '47894', 'Venta al por menor de artículos de papel, envases, libros, revistas y conexos en puestos de feria y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(574, '47895', 'Venta al por menor de materiales de construcción, electrodomésticos, accesorios para autos y similares en puestos de feria y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(575, '47896', 'Venta al por menor de equipos accesorios para las comunicaciones en puestos de feria y mercados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(576, '47899', 'Venta al por menor en puestos de ferias y mercados n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(577, '47910', 'Venta al por menor por correo o Internet', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(578, '47990', 'Otros tipos de venta al por menor no realizada, en almacenes, puestos de venta o mercado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(579, NULL, 'TRANSPORTE Y ALMACENAMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(580, NULL, 'TRANSPORTE POR VÍA TERRESTRE Y TRANSPORTE POR TUBERÍAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(581, '49110', 'Transporte interurbano de pasajeros por ferrocarril', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(582, '49120', 'Transporte de carga por ferrocarril', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(583, '49211', 'Transporte de pasajeros urbanos e interurbano mediante buses', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(584, '49212', 'Transporte de pasajeros urbanos e interurbano mediante microbuses', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(585, '49213', 'Transporte de pasajeros urbanos e interurbano mediante microbuses', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(586, '49214', 'Transporte de pasajeros interdepartamental mediante buses', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(587, '49221', 'Transporte internacional de pasajeros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(588, '49222', 'Transporte de pasajeros mediante taxis y autos con chofer', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(589, '49223', 'Transporte escolar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(590, '49225', 'Transporte de pasajeros para excursiones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(591, '49226', 'Servicios de transporte de personal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(592, '49229', 'Transporte de pasajeros por vía terrestre ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(593, '49231', 'Transporte de carga urbano', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(594, '49232', 'Transporte nacional de carga', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(595, '49233', 'Transporte de carga internacional', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(596, '49234', 'Servicios de mudanza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(597, '49235', 'Alquiler de vehículos de carga con conductor', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(598, '49300', 'Transporte por oleoducto o gasoducto', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(599, NULL, 'TRANSPORTE POR VÍA ACUÁTICA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(600, '50110', 'Transporte de pasajeros marítimo y de cabotaje', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(601, '50120', 'Transporte de carga marítimo y de cabotaje', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(602, '50211', 'Transporte de pasajeros por vías de navegación interiores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(603, '50212', 'Alquiler de equipo de transporte de pasajeros por vías de navegación interior con conductor', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(604, '50220', 'Transporte de carga por vías de navegación interiores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(605, NULL, 'TRANSPORTE POR VÍA AÉREA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(606, '51100', 'Transporte aéreo de pasajeros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(607, '51201', 'Transporte de carga por vía aérea', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(608, '51202', 'Alquiler de equipo de aeronave transporte con operadores para el propósito de transportar carga', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(609, NULL, 'ALMACENAMIENTO Y ACTIVIDADES DE APOYO AL TRANSPORTE', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(610, '52101', 'Alquiler de instalaciones de almacenamiento en zonas francas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(611, '52102', 'Alquiler de silos para conservación y almacenamiento de granos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(612, '52103', 'Alquiler de instalaciones con refrigeración para almacenamiento y conservación de alimentos y otros productos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(613, '52109', 'Alquiler de bodegas para almacenamiento y depósito n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(614, '52211', 'Servicio de garaje y estacionamiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(615, '52212', 'Servicios de terminales para el transporte por vía terrestre', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(616, '52219', 'Servicios para el transporte por vía terrestre n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(617, '52220', 'Servicios para el transporte acuático', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(618, '52230', 'Servicios para el transporte aéreo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(619, '52240', 'Manipulación de carga', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(620, '52290', 'Servicios para el transporte ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(621, '52291', 'Agencias de transmisiones aduanales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(622, NULL, 'ACTIVIDADES POSTALES Y DE MENSAJERÍA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(623, '53100', 'Servicios de correo nacional', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(624, '53200', 'Actividades de correo distintas a las actividades postales nacionales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(625, '53201', 'Agencia privada de correo y encomiendas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(626, NULL, 'ACTIVIDADES DE ALOJAMIENTO Y DE SERVICIO DE COMIDAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(627, NULL, 'ACTIVIDADES DE ALOJAMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(628, '55101', 'Actividades de alojamiento para estancias cortas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(629, '55102', 'Hoteles', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(630, '55200', 'Actividades de campamentos, parques de vehículos de recreo y parques de caravanas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(631, '55900', 'Alojamiento n.c.p', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(632, NULL, 'ACTIVIDADES DE SERVICIO DE COMIDAS Y BEBIDAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(633, '56101', 'Restaurantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(634, '56106', 'Panadería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(635, '56107', 'Actividades varias de restaurantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(636, '56108', 'Comedores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(637, '56109', 'Merenderos ambulantes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(638, '56210', 'Preparación de comida para eventos especiales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(639, '56291', 'Servicios de provisión de comidas por contrato', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(640, '56292', 'Servicios de concesión de cafetines y chalet en empresas e', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(641, '56299', 'Servicio de provisión de comidas ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(642, '56301', 'Servicio de expendio de bebidas en salones y bares', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(643, '56302', 'Servicio de expendio de bebidas en puestos callejeros, mercados y ferias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(644, NULL, 'INFORMACIÓN Y COMUNICACIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(645, NULL, 'ACTIVIDADES DE EDICIÓN', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(646, '58110', 'Edición de libros, folletos, partituras y otras ediciones distintas a estas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(647, '58120', 'Edición de directorios y listas de correos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(648, '58130', 'Edición de periódicos, revistas y otras publicaciones periódicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(649, '58190', 'Otras actividades de edición', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(650, '58200', 'Edición de programas informáticos (software)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(651, NULL, 'ACTIVIDADES DE PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS Y PROGRAMAS DE TELEVISIÓN, GRABACIÓN DE SONIDO Y EDICIÓN DE MÚSICA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(652, '59110', 'Actividades de producción cinematográfica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(653, '59120', 'Actividades de post producción de películas, videos y programas de televisión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(654, '59130', 'Actividades de distribución de películas cinematográficas, videos y programas de televisión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(655, '59140', 'Actividades de exhibición de películas cinematográficas y cintas de video', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(656, '59200', 'Actividades de edición y grabación de música', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(657, NULL, 'ACTIVIDADES DE PROGRAMACIÓN Y TRANSMISIÓN', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(658, '60100', 'Servicios de difusiones de radio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(659, '60201', 'Actividades de programación y difusión de televisión abierta', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(660, '60202', 'Actividades de suscripción y difusión de televisión por cable y/o suscripción', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(661, '60299', 'Servicios de televisión, incluye televisión por cable', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(662, '60900', 'Programación y transmisión de radio y televisión', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(663, NULL, 'TELECOMUNICACIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(664, '61101', 'Servicios de telefonía', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(665, '61102', 'Servicio de Internet', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(666, '61103', 'Servicio de telefonía fija', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(667, '61109', 'Servicio de Internet n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(668, '61201', 'Servicios de Internet inalámbrico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(669, '61202', 'Servicios de telefonía celular', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(670, '61209', 'Servicios de telecomunicaciones inalámbrico n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(671, '61301', 'Telecomunicaciones satelitales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(672, '61909', 'Comunicación vía satélite n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(673, '61900', 'Actividades de telecomunicación n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(674, NULL, 'PROGRAMACIÓN INFORMÁTICA, CONSULTORÍA INFORMÁTICA Y ACTIVIDADES CONEXAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(675, '62010', 'Programación informática', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(676, '62020', 'Consultorías y gestión de servicios informáticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(677, '62090', 'Otras actividades de tecnología de información y servicios de computadoras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(678, NULL, 'ACTIVIDADES DE SERVICIOS DE INFORMACIÓN', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(679, '63110', 'Procesamiento de datos y actividades relacionadas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(680, '63120', 'Portales WEB', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(681, '63910', 'Servicios de Agencias de Noticias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(682, '63990', 'Otros servicios de información n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(683, NULL, 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(684, NULL, 'ACTIVIDADES DE SERVICIOS FINANCIEROS EXCEPTO LAS DE SEGUROS Y FONDOS DE PENSIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(685, '64110', 'Servicios provistos por el Banco Central de El Salvador', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(686, '64190', 'Bancos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(687, '64191', 'Entidades dedicadas al envío de remesas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(688, '64199', 'Otras entidades financieras', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(689, '64200', 'Actividades de sociedades de cartera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(690, '64300', 'Fideicomisos, fondos y otras fuentes de financiamiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(691, '64910', 'Arrendamientos financieros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(692, '64920', 'Asociaciones cooperativas de ahorro y crédito dedicadas a la intermediación financiera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(693, '64921', 'Instituciones emisoras de tarjetas de crédito y otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(694, '64923', 'Tipos de crédito ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(695, '64928', 'Prestamistas y casas de empeño', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(696, '64990', 'Actividades de servicios financieros, excepto la financiación de planes de seguros y de pensiones n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(697, NULL, 'SEGUROS, REASEGUROS Y FONDOS DE PENSIONES; EXCEPTO PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(698, '65110', 'Planes de seguros de vida', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(699, '65120', 'Planes de seguro excepto de vida', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(700, '65199', 'Seguros generales de todo tipo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(701, '65200', 'Planes de reaseguro', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(702, '65300', 'Planes de pensiones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(703, NULL, 'ACTIVIDADES AUXILIARES DE LAS ACTIVIDADES DE SERVICIOS FINANCIEROS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(704, '66110', 'Administración de mercados financieros (Bolsa de Valores)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(705, '66120', 'Actividades bursátiles (Corredores de Bolsa)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(706, '66190', 'Actividades auxiliares de la intermediación financiera ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(707, '66210', 'Evaluación de riesgos y daños', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(708, '66220', 'Actividades de agentes y corredores de seguros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(709, '66290', 'Otras actividades auxiliares de seguros y fondos de pensiones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(710, '66300', 'Actividades de administración de fondos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(711, NULL, 'ACTIVIDADES INMOBILIARIAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(712, '68101', 'Servicio de alquiler y venta de lotes en cementerios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(713, '68109', 'Actividades inmobiliarias realizadas con bienes propios o arrendados n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(714, '68200', 'Actividades Inmobiliarias Realizadas a Cambio de una Retribución o por Contrata', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(715, NULL, 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(716, NULL, 'ACTIVIDADES JURÍDICAS Y CONTABLES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(717, '69100', 'Actividades jurídicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(718, '69200', 'Actividades de contabilidad, teneduría de libros y auditoría; asesoramiento en materia de impuestos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(719, NULL, 'ACTIVIDADES DE OFICINAS CENTRALES; ACTIVIDADES DE CONSULTORÍA EN GESTIÓN EMPRESARIAL', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(720, '70100', 'Actividades de oficinas centrales de sociedades de cartera', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(721, '70200', 'Actividades de consultoría en gestión empresarial', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(722, NULL, 'ACTIVIDADES DE ARQUITECTURA E INGENIERÍA; ENSAYOS Y ANÁLISIS TÉCNICOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(723, '71101', 'Servicios de arquitectura y planificación urbana y servicios conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(724, '71102', 'Servicios de ingeniería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(725, '71103', 'Servicios de agrimensura, topografía, cartografía, prospección y geofísica y servicios conexos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(726, '71200', 'Ensayos y análisis técnicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(727, NULL, 'INVESTIGACIÓN CIENTÍFICA Y DESARROLLO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(728, '72100', 'Investigaciones y desarrollo experimental en el campo de las ciencias naturales y la ingeniería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(729, '72199', 'Investigaciones científicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(730, '72200', 'Investigaciones y desarrollo experimental en el campo de las ciencias sociales y las humanidades científica y desarrollo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(731, NULL, 'PUBLICIDAD Y ESTUDIOS DE MERCADO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(732, '73100', 'Publicidad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(733, '73200', 'Investigación de mercados y realización de encuestas de opinión publica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(734, NULL, 'OTRAS ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(735, '74100', 'Actividades de diseño especializado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(736, '74200', 'Actividades de fotografía', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(737, '74900', 'Servicios profesionales y científicos ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(738, NULL, 'ACTIVIDADES VETERINARIAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(739, '75000', 'Actividades veterinarias', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(740, NULL, 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(741, NULL, 'ACTIVIDADES DE ALQUILER Y ARRENDAMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(742, '77101', 'Alquiler de equipo de transporte terrestre', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(743, '77102', 'Alquiler de equipo de transporte acuático', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(744, '77103', 'Alquiler de equipo de transporte por vía aérea', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(745, '77210', 'Alquiler y arrendamiento de equipo de recreo y deportivo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(746, '77220', 'Alquiler de cintas de video y discos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(747, '77290', 'Alquiler de otros efectos personales y enseres domésticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(748, '77300', 'Alquiler de maquinaria y equipo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(749, '77400', 'Arrendamiento de productos de propiedad intelectual', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(750, NULL, 'ACTIVIDADES DE EMPLEO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(751, '78100', 'Obtención y dotación de personal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(752, '78200', 'Actividades de las agencias de trabajo temporal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(753, '78300', 'Dotación de recursos humanos y gestión; gestión de las funciones de recursos humanos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(754, NULL, 'ACTIVIDADES DE AGENCIAS DE VIAJES, OPERADORES TURÍSTICOS Y OTROS SERVICIOS DE RESERVA Y ACTIVIDADES CONEXAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(755, '79110', 'Actividades de agencias de viajes y organizadores de viajes; actividades de asistencia a turistas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(756, '79120', 'Actividades de los operadores turísticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(757, '79900', 'Otros servicios de reservas y actividades relacionadas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(758, NULL, 'ACTIVIDADES DE INVESTIGACIÓN Y SEGURIDAD', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(759, '80100', 'Servicios de seguridad privados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(760, '80201', 'Actividades de servicios de sistemas de seguridad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(761, '80202', 'Actividades para la prestación de sistemas de seguridad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(762, '80300', 'Actividades de investigación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(763, NULL, 'ACTIVIDADES DE SERVICIOS A EDIFICIOS Y PAISAJISMO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(764, '81100', 'Actividades combinadas de mantenimiento de edificios e instalaciones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(765, '81210', 'Limpieza general de edificios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(766, '81290', 'Otras actividades combinadas de mantenimiento de edificios e instalaciones ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(767, '81300', 'Servicio de jardinería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(768, NULL, 'ACTIVIDADES ADMINISTRATIVAS Y DE APOYO DE OFICINAS Y OTRAS ACTIVIDADES DE APOYO A LAS EMPRESAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(769, NULL, 'SERVICIOS ADMINISTRATIVOS DE OFICINAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(770, '82110', 'Servicio de fotocopiado y similares, excepto en imprentas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(771, '82200', 'Actividades de las centrales de llamadas (call center)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(772, '82300', 'Organización de convenciones y ferias de negocios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(773, '82910', 'Actividades de agencias de cobro y oficinas de crédito', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(774, '82921', 'Servicios de envase y empaque de productos alimenticios', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(775, '82922', 'Servicios de envase y empaque de productos medicinales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(776, '82929', 'Servicio de envase y empaque ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(777, '82990', 'Actividades de apoyo empresariales ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(778, NULL, 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(779, NULL, 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(780, '84110', 'Actividades de la Administración Pública en general', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(781, '84111', 'Alcaldías Municipales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(782, '84120', 'Regulación de las actividades de prestación de servicios sanitarios, educativos, culturales y otros servicios sociales, excepto seguridad social', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(783, '84130', 'Regulación y facilitación de la actividad económica', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(784, '84210', 'Actividades de administración y funcionamiento del Ministerio de Relaciones Exteriores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(785, '84220', 'Actividades de defensa', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(786, '84230', 'Actividades de mantenimiento del orden público y de seguridad', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(787, '84300', 'Actividades de planes de seguridad social de afiliación obligatoria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(788, NULL, 'ENSEÑANZA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(789, '85101', 'Guardería educativa', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(790, '85102', 'Enseñanza preescolar o parvularia', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(791, '85103', 'Enseñanza primaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(792, '85104', 'Servicio de educación preescolar y primaria integrada', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(793, '85211', 'Enseñanza secundaria tercer ciclo (7°, 8° y 9°)', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(794, '85212', 'Enseñanza secundaria de formación general bachillerato', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(795, '85221', 'Enseñanza secundaria de formación técnica y profesional', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(796, '85222', 'Enseñanza secundaria de formación técnica y profesional integrada con enseñanza primaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(797, '85301', 'Enseñanza superior universitaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(798, '85302', 'Enseñanza superior no universitaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(799, '85303', 'Enseñanza superior integrada a educación secundaria y/o primaria', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(800, '85410', 'Educación deportiva y recreativa', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(801, '85420', 'Educación cultural', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(802, '85490', 'Otros tipos de enseñanza n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(803, '85499', 'Enseñanza formal', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(804, '85500', 'Servicios de apoyo a la enseñanza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(805, NULL, 'ACTIVIDADES DE ATENCIÓN A LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(806, NULL, 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(807, '86100', 'Actividades de hospitales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(808, '86201', 'Clínicas médicas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(809, '86202', 'Servicios de Odontología', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(810, '86203', 'Servicios médicos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(811, '86901', 'Servicios de análisis y estudios de diagnóstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(812, '86902', 'Actividades de atención de la salud humana', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(813, '86909', 'Otros Servicio relacionados con la salud ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(814, NULL, 'ACTIVIDADES DE ATENCIÓN DE ENFERMERÍA EN INSTITUCIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(815, '87100', 'Residencias de ancianos con atención de enfermería', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(816, '87200', 'Instituciones dedicadas al tratamiento del retraso mental, problemas de salud mental y el uso indebido de sustancias nocivas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(817, '87300', 'Instituciones dedicadas al cuidado de ancianos y discapacitados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(818, '87900', 'Actividades de asistencia a niños y jóvenes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(819, '87901', 'Otras actividades de atención en instituciones', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(820, NULL, 'ACTIVIDADES DE ASISTENCIA SOCIAL SIN ALOJAMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(821, '88100', 'Actividades de asistencia sociales sin alojamiento para ancianos y discapacitados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(822, '88900', 'Servicios sociales sin alojamiento ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(823, NULL, 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREATIVAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(824, NULL, 'ACTIVIDADES CREATIVAS ARTÍSTICAS Y DE ESPARCIMIENTO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(825, '90000', 'Actividades creativas artísticas y de esparcimiento', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(826, NULL, 'ACTIVIDADES BIBLIOTECAS, ARCHIVOS, MUSEOS Y OTRAS ACTIVIDADES CULTURALES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(827, '91010', 'Actividades de bibliotecas y archivos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(828, '91020', 'Actividades de museos y preservación de lugares y edificios históricos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(829, '91030', 'Actividades de jardines botánicos, zoológicos y de reservas naturales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(830, NULL, 'ACTIVIDADES DE JUEGOS DE AZAR Y APUESTAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(831, '92000', 'Actividades de juegos y apuestas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(832, NULL, 'ACTIVIDADES DEPORTIVAS, DE ESPARCIMIENTO Y RECREATIVAS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(833, '93110', 'Gestión de instalaciones deportivas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(834, '93120', 'Actividades de clubes deportivos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(835, '93190', 'Otras actividades deportivas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(836, '93210', 'Actividades de parques de atracciones y parques temáticos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(837, '93291', 'Discotecas y salas de baile', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(838, '93298', 'Centros vacacionales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(839, '93299', 'Actividades de esparcimiento ncp', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(840, NULL, 'OTRAS ACTIVIDADES DE SERVICIOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(841, NULL, 'ACTIVIDADES DE ASOCIACIONES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(842, '94110', 'Actividades de organizaciones empresariales y de empleadores', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(843, '94120', 'Actividades de organizaciones profesionales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(844, '94200', 'Actividades de sindicatos', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(845, '94910', 'Actividades de organizaciones religiosas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(846, '94920', 'Actividades de organizaciones políticas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(847, '94990', 'Actividades de asociaciones n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(848, NULL, 'REPARACIÓN DE COMPUTADORAS Y DE EFECTOS PERSONALES Y ENSERES DOMÉSTICOS', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34');
INSERT INTO `actividad_economica_b` (`id`, `codigo`, `descripcion`, `seleccionable`, `created_at`, `updated_at`) VALUES
(849, '95110', 'Reparación de computadoras y equipo periférico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(850, '95120', 'Reparación de equipo de comunicación', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(851, '95210', 'Reparación de aparatos electrónicos de consumo', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(852, '95220', 'Reparación de aparatos doméstico y equipo de hogar y jardín', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(853, '95230', 'Reparación de calzado y artículos de cuero', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(854, '95240', 'Reparación de muebles y accesorios para el hogar', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(855, '95291', 'Reparación de instrumentos musicales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(856, '95292', 'Servicios de cerrajería y copiado de llaves', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(857, '95293', 'Reparación de joyas y relojes', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(858, '95294', 'Reparación de bicicletas, sillas de ruedas y rodados n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(859, '95299', 'Reparación de enseres personales n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(860, NULL, 'OTRAS ACTIVIDADES DE SERVICIOS PERSONALES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(861, '96010', 'Lavado y limpieza de prendas de tela y de piel, incluso la limpieza en seco', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(862, '96020', 'Peluquería y otros tratamientos de belleza', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(863, '96030', 'Pompas fúnebres y actividades conexas', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(864, '96091', 'Servicios de sauna y otros servicios para la estética corporal n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(865, '96092', 'Servicios n.c.p.', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(866, NULL, 'ACTIVIDADES DE LOS HOGARES COMO EMPLEADORES, ACTIVIDADES INDIFERENCIADAS DE PRODUCCIÓN DE BIENES Y SERVICIOS DE LOS HOGARES PARA USO PROPIO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(867, NULL, 'ACTIVIDAD DE LOS HOGARES EN CALIDAD DE EMPLEADORES DE PERSONAL DOMÉSTICO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(868, '97000', 'Actividad de los hogares en calidad de empleadores de personal doméstico', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(869, NULL, 'ACTIVIDADES INDIFERENCIADAS DE PRODUCCIÓN DE BIENES Y SERVICIOS DE LOS HOGARES PARA USO PROPIO', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(870, '98100', 'Actividades indiferenciadas de producción de bienes de los hogares privados para uso propio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(871, '98200', 'Actividades indiferenciadas de producción de servicios de los hogares privados para uso propio', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(872, NULL, 'ACTIVIDADES DE ORGANIZACIONES Y ÓRGANOS EXTRATERRITORIALES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(873, NULL, 'ACTIVIDADES DE ORGANIZACIONES Y ÓRGANOS EXTRATERRITORIALES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(874, '99000', 'Actividades de organizaciones y órganos extraterritoriales', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(875, NULL, 'EMPLEADOS Y OTRAS PERSONAS NATURALES', 0, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(876, '10001', 'Empleados', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(877, '10002', 'Pensionado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(878, '10003', 'Estudiante', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(879, '10004', 'Desempleado', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(880, '10005', 'Otros', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34'),
(881, '10006', 'Comerciante', 1, '2025-07-30 20:37:34', '2025-07-30 20:37:34');

CREATE TABLE `ambientes_destino` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ambientes_destino` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '00', 'Modo Pruebas', NULL, NULL),
(2, '01', 'Modo Producción', NULL, NULL);

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cajas` (
  `id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `codigo_mh` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cajas` (`id`, `sucursal_id`, `codigo_mh`, `descripcion`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, 'Caja-1', '2025-08-06 04:12:43', '2025-08-06 04:13:41');

CREATE TABLE `cajeros` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `empresa_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cajeros` (`id`, `user_id`, `empresa_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '2025-08-08 03:08:59', '2025-08-08 03:08:59');

CREATE TABLE `cajero_caja` (
  `id` bigint UNSIGNED NOT NULL,
  `cajero_id` bigint UNSIGNED NOT NULL,
  `caja_id` bigint UNSIGNED NOT NULL,
  `asignado_desde` datetime NOT NULL,
  `asignado_hasta` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cajero_caja` (`id`, `cajero_id`, `caja_id`, `asignado_desde`, `asignado_hasta`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-08-07 21:48:13', NULL, '2025-08-08 03:48:13', '2025-08-08 03:48:13');

CREATE TABLE `certificados` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `crt_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `nit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dui` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nrc` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_actividad` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_actividad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complemento` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_documento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '13',
  `departamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '12',
  `municipio` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '22',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `clientes` (`id`, `nit`, `dui`, `nombre`, `nrc`, `cod_actividad`, `desc_actividad`, `correo`, `complemento`, `telefono`, `tipo_documento`, `departamento`, `municipio`, `created_at`, `updated_at`) VALUES
(3, NULL, '043193216', 'Carlos Urquilla', '2003671', '86201', 'Clínicas médicas', 'juancarlosurquilla@outlook.com', 'San Miguel', '72970867', '13', '12', '22', '2025-08-15 03:22:19', '2025-08-24 04:27:51'),
(4, '06141512201045', NULL, 'Delivery Hero El Salvador, S.A. de C.V.', '2966653', '96092', 'Servicios n.c.p.', 'tax.salvador@pedidosya.com', 'Calle El Mirador entre 87 y 89 Av. Norte, Local Ofi-19-01B, Edif. Torre Futura, complejo World Trade Center, Col. Escalón', '25351844', '02', '06', '23', '2025-08-24 04:30:27', '2025-08-24 04:30:27');

CREATE TABLE `condiciones_entrega` (
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `condiciones_entrega` (`codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
('01', 'Entrega inmediata', NULL, NULL),
('02', 'Entrega programada', NULL, NULL),
('03', 'Entrega a convenir', NULL, NULL),
('04', 'A domicilio', NULL, NULL),
('99', 'Otra condición', NULL, NULL);

CREATE TABLE `condiciones_operacion` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `condiciones_operacion` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'Contado', '2025-07-17 00:26:06', '2025-07-17 00:26:06'),
(2, '02', 'Crédito', '2025-07-17 00:26:06', '2025-07-17 00:26:06'),
(3, '03', 'otro', '2025-07-17 00:26:06', '2025-07-17 00:26:06');

CREATE TABLE `departamentos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `departamentos` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '01', 'Ahuachapán', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(2, '02', 'Santa Ana', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(3, '03', 'Sonsonate', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(4, '04', 'Chalatenango', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(5, '05', 'La Libertad', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(6, '06', 'San Salvador', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(7, '07', 'Cuscatlán', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(8, '08', 'La Paz', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(9, '09', 'Cabañas', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(10, '10', 'San Vicente', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(11, '11', 'Usulután', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(12, '12', 'San Miguel', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(13, '13', 'Morazán', '2025-07-17 00:26:27', '2025-07-17 00:26:27'),
(14, '14', 'La Unión', '2025-07-17 00:26:27', '2025-07-17 00:26:27');

CREATE TABLE `domicilios_fiscales` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `domicilios_fiscales` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1', 'Domiciliado', NULL, NULL),
(2, '2', 'No Domiciliado', NULL, NULL);

CREATE TABLE `dtes` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `fecha_envio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dte_json` json NOT NULL,
  `respuesta_json` longtext COLLATE utf8mb4_unicode_ci,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_generacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `dtes` (`id`, `usuario_id`, `fecha_envio`, `dte_json`, `respuesta_json`, `estado`, `codigo_generacion`, `created_at`, `updated_at`) VALUES
(10, 3, '2025-08-20 13:09:23', '{\"emisor\": {\"nit\": \"12171306901014\", \"nrc\": \"2104554\", \"correo\": \"juancarlosurquilla@gmail.com\", \"nombre\": \"JUAN CARLOS TRIGUEROS URQUILLA\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"RES. SATELITE DE ORIENTE, CALLE JUPITER, BLOCK E-3, CASA 30\", \"departamento\": \"12\"}, \"codEstable\": null, \"codActividad\": \"62010\", \"codEstableMH\": \"M001\", \"codPuntoVenta\": null, \"descActividad\": \"Programación Informática\", \"codPuntoVentaMH\": \"P001\", \"nombreComercial\": null, \"tipoEstablecimiento\": \"02\"}, \"resumen\": {\"pagos\": [{\"plazo\": null, \"codigo\": \"03\", \"periodo\": null, \"montoPago\": 10, \"referencia\": \"\"}], \"ivaRete1\": 0, \"subTotal\": 10, \"totalIva\": 1.15, \"tributos\": [], \"reteRenta\": 0, \"descuNoSuj\": 0, \"saldoFavor\": 0, \"totalDescu\": 0, \"totalNoSuj\": 0, \"totalPagar\": 10, \"descuExenta\": 0, \"totalExenta\": 0, \"totalLetras\": \"DIEZ DÓLARES\", \"descuGravada\": 0, \"totalGravada\": 10, \"subTotalVentas\": 10, \"totalNoGravado\": 0, \"condicionOperacion\": 1, \"numPagoElectronico\": null, \"montoTotalOperacion\": 10, \"porcentajeDescuento\": 0}, \"apendice\": null, \"receptor\": {\"nrc\": null, \"correo\": \"juancarlosurquilla@gmail.com\", \"nombre\": \"Juan Carlos Trigueros Urquilla\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"San Miguel\", \"departamento\": \"12\"}, \"codActividad\": null, \"numDocumento\": \"04319321-6\", \"descActividad\": null, \"tipoDocumento\": \"13\"}, \"extension\": {\"docuRecibe\": null, \"nombRecibe\": null, \"docuEntrega\": null, \"nombEntrega\": null, \"observaciones\": null, \"placaVehiculo\": null}, \"ventaTercero\": null, \"identificacion\": {\"fecEmi\": \"2025-08-20\", \"horEmi\": \"19:09:23\", \"tipoDte\": \"01\", \"version\": 1, \"ambiente\": \"00\", \"tipoModelo\": 1, \"tipoMoneda\": \"USD\", \"motivoContin\": null, \"numeroControl\": \"DTE-01-M001P001-963056307160686\", \"tipoOperacion\": 1, \"codigoGeneracion\": \"46C61B97-BB64-48C8-88B1-2E38F2508713\", \"tipoContingencia\": null}, \"cuerpoDocumento\": [{\"psv\": 0, \"codigo\": null, \"ivaItem\": 1.15, \"numItem\": 1, \"cantidad\": 1, \"tipoItem\": 2, \"tributos\": null, \"noGravado\": 0, \"precioUni\": 10, \"uniMedida\": 59, \"codTributo\": null, \"montoDescu\": 0, \"ventaNoSuj\": 0, \"descripcion\": \"prueba11\", \"ventaExenta\": 0, \"ventaGravada\": 10, \"numeroDocumento\": null}], \"otrosDocumentos\": null, \"documentoRelacionado\": null}', '{\"version\":2,\"ambiente\":\"00\",\"versionApp\":2,\"estado\":\"PROCESADO\",\"codigoGeneracion\":\"46C61B97-BB64-48C8-88B1-2E38F2508713\",\"selloRecibido\":\"2025570DB2A7596B4D04ADF137F45A323BFBOZKD\",\"fhProcesamiento\":\"20\\/08\\/2025 15:57:15\",\"clasificaMsg\":\"10\",\"codigoMsg\":\"001\",\"descripcionMsg\":\"RECIBIDO\",\"observaciones\":[]}', 'PROCESADO', '46C61B97-BB64-48C8-88B1-2E38F2508713', '2025-08-21 01:09:23', '2025-08-21 03:57:16'),
(15, 3, '2025-08-23 09:18:44', '{\"emisor\": {\"nit\": \"12171306901014\", \"nrc\": \"2104554\", \"correo\": \"juancarlosurquilla@gmail.com\", \"nombre\": \"JUAN CARLOS TRIGUEROS URQUILLA\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"RES. SATELITE DE ORIENTE, CALLE JUPITER, BLOCK E-3, CASA 30\", \"departamento\": \"12\"}, \"codEstable\": null, \"codActividad\": \"62010\", \"codEstableMH\": \"M001\", \"codPuntoVenta\": null, \"descActividad\": \"Programación Informática\", \"codPuntoVentaMH\": \"P001\", \"nombreComercial\": null, \"tipoEstablecimiento\": \"02\"}, \"resumen\": {\"pagos\": [{\"plazo\": null, \"codigo\": \"03\", \"periodo\": null, \"montoPago\": 1000, \"referencia\": \"\"}], \"ivaRete1\": 0, \"subTotal\": 1000, \"totalIva\": 115.04, \"tributos\": [], \"reteRenta\": 0, \"descuNoSuj\": 0, \"saldoFavor\": 0, \"totalDescu\": 0, \"totalNoSuj\": 0, \"totalPagar\": 1000, \"descuExenta\": 0, \"totalExenta\": 0, \"totalLetras\": \"MIL DÓLARES\", \"descuGravada\": 0, \"totalGravada\": 1000, \"subTotalVentas\": 1000, \"totalNoGravado\": 0, \"condicionOperacion\": 1, \"numPagoElectronico\": null, \"montoTotalOperacion\": 1000, \"porcentajeDescuento\": 0}, \"apendice\": null, \"receptor\": {\"nrc\": null, \"correo\": \"juancarlosurquilla@outlook.com\", \"nombre\": \"Carlos Urquilla\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"San Miguel\", \"departamento\": \"12\"}, \"codActividad\": \"86201\", \"numDocumento\": \"12171008851015\", \"descActividad\": \"Clínicas médicas\", \"tipoDocumento\": \"02\"}, \"extension\": {\"docuRecibe\": null, \"nombRecibe\": null, \"docuEntrega\": null, \"nombEntrega\": null, \"observaciones\": null, \"placaVehiculo\": null}, \"ventaTercero\": null, \"identificacion\": {\"fecEmi\": \"2025-08-23\", \"horEmi\": \"15:18:44\", \"tipoDte\": \"01\", \"version\": 1, \"ambiente\": \"00\", \"tipoModelo\": 1, \"tipoMoneda\": \"USD\", \"motivoContin\": null, \"numeroControl\": \"DTE-01-M001P001-747625758777525\", \"tipoOperacion\": 1, \"codigoGeneracion\": \"9B831EFB-CDE2-4742-902E-06E01444D3F6\", \"tipoContingencia\": null}, \"cuerpoDocumento\": [{\"psv\": 0, \"codigo\": null, \"ivaItem\": 115.04, \"numItem\": 1, \"cantidad\": 1, \"tipoItem\": 2, \"tributos\": null, \"noGravado\": 0, \"precioUni\": 1000, \"uniMedida\": 59, \"codTributo\": null, \"montoDescu\": 0, \"ventaNoSuj\": 0, \"descripcion\": \"Prueba 21\", \"ventaExenta\": 0, \"ventaGravada\": 1000, \"numeroDocumento\": null}], \"otrosDocumentos\": null, \"documentoRelacionado\": null}', '{\"version\":2,\"ambiente\":\"00\",\"versionApp\":2,\"estado\":\"PROCESADO\",\"codigoGeneracion\":\"9B831EFB-CDE2-4742-902E-06E01444D3F6\",\"selloRecibido\":\"2025C8CB6D07B7264779A9B740DB8C167760UEQJ\",\"fhProcesamiento\":\"23\\/08\\/2025 09:18:46\",\"clasificaMsg\":\"10\",\"codigoMsg\":\"001\",\"descripcionMsg\":\"RECIBIDO\",\"observaciones\":[]}', 'PROCESADO', '9B831EFB-CDE2-4742-902E-06E01444D3F6', '2025-08-23 21:18:44', '2025-08-23 21:18:48'),
(29, 3, '2025-08-23 16:54:54', '{\"emisor\": {\"nit\": \"12171306901014\", \"nrc\": \"2104554\", \"correo\": \"juancarlosurquilla@gmail.com\", \"nombre\": \"JUAN CARLOS TRIGUEROS URQUILLA\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"RES. SATELITE DE ORIENTE, CALLE JUPITER, BLOCK E-3, CASA 30\", \"departamento\": \"12\"}, \"codEstable\": null, \"codActividad\": \"62010\", \"codEstableMH\": \"M001\", \"codPuntoVenta\": null, \"descActividad\": \"Programación Informática\", \"codPuntoVentaMH\": \"P001\", \"nombreComercial\": null, \"tipoEstablecimiento\": \"02\"}, \"resumen\": {\"pagos\": [{\"plazo\": null, \"codigo\": \"03\", \"periodo\": null, \"montoPago\": 100, \"referencia\": \"\"}], \"ivaRete1\": 0, \"subTotal\": 100, \"totalIva\": 11.5, \"tributos\": [], \"reteRenta\": 0, \"descuNoSuj\": 0, \"saldoFavor\": 0, \"totalDescu\": 0, \"totalNoSuj\": 0, \"totalPagar\": 100, \"descuExenta\": 0, \"totalExenta\": 0, \"totalLetras\": \"CIEN DÓLARES\", \"descuGravada\": 0, \"totalGravada\": 100, \"subTotalVentas\": 100, \"totalNoGravado\": 0, \"condicionOperacion\": 1, \"numPagoElectronico\": null, \"montoTotalOperacion\": 100, \"porcentajeDescuento\": 0}, \"apendice\": null, \"receptor\": {\"nrc\": null, \"correo\": \"juancarlosurquilla@outlook.com\", \"nombre\": \"Carlos Urquilla\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"San Miguel\", \"departamento\": \"12\"}, \"codActividad\": \"86201\", \"numDocumento\": \"04319321-6\", \"descActividad\": \"Clínicas médicas\", \"tipoDocumento\": \"13\"}, \"extension\": {\"docuRecibe\": null, \"nombRecibe\": null, \"docuEntrega\": null, \"nombEntrega\": null, \"observaciones\": null, \"placaVehiculo\": null}, \"ventaTercero\": null, \"identificacion\": {\"fecEmi\": \"2025-08-23\", \"horEmi\": \"22:54:54\", \"tipoDte\": \"01\", \"version\": 1, \"ambiente\": \"00\", \"tipoModelo\": 1, \"tipoMoneda\": \"USD\", \"motivoContin\": null, \"numeroControl\": \"DTE-01-M001P001-078348387065476\", \"tipoOperacion\": 1, \"codigoGeneracion\": \"FCF71A9E-A813-446A-8BFB-86C75AFFB85D\", \"tipoContingencia\": null}, \"cuerpoDocumento\": [{\"psv\": 0, \"codigo\": null, \"ivaItem\": 11.5, \"numItem\": 1, \"cantidad\": 1, \"tipoItem\": 2, \"tributos\": null, \"noGravado\": 0, \"precioUni\": 100, \"uniMedida\": 59, \"codTributo\": null, \"montoDescu\": 0, \"ventaNoSuj\": 0, \"descripcion\": \"test\", \"ventaExenta\": 0, \"ventaGravada\": 100, \"numeroDocumento\": null}], \"otrosDocumentos\": null, \"documentoRelacionado\": null}', '{\"version\":2,\"ambiente\":\"00\",\"versionApp\":2,\"estado\":\"PROCESADO\",\"codigoGeneracion\":\"FCF71A9E-A813-446A-8BFB-86C75AFFB85D\",\"selloRecibido\":\"2025BB67BD730560446E9C7458E22870A4ECKTJO\",\"fhProcesamiento\":\"23\\/08\\/2025 16:55:06\",\"clasificaMsg\":\"10\",\"codigoMsg\":\"001\",\"descripcionMsg\":\"RECIBIDO\",\"observaciones\":[]}', 'PROCESADO', 'FCF71A9E-A813-446A-8BFB-86C75AFFB85D', '2025-08-24 04:54:54', '2025-08-24 04:55:07'),
(30, 3, '2025-08-23 17:08:29', '{\"emisor\": {\"nit\": \"12171306901014\", \"nrc\": \"2104554\", \"correo\": \"juancarlosurquilla@gmail.com\", \"nombre\": \"JUAN CARLOS TRIGUEROS URQUILLA\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"RES. SATELITE DE ORIENTE, CALLE JUPITER, BLOCK E-3, CASA 30\", \"departamento\": \"12\"}, \"codEstable\": null, \"codActividad\": \"62010\", \"codEstableMH\": \"M001\", \"codPuntoVenta\": null, \"descActividad\": \"Programación Informática\", \"codPuntoVentaMH\": \"P001\", \"nombreComercial\": null, \"tipoEstablecimiento\": \"02\"}, \"resumen\": {\"pagos\": [{\"plazo\": null, \"codigo\": \"03\", \"periodo\": null, \"montoPago\": 1, \"referencia\": \"\"}], \"ivaRete1\": 0, \"subTotal\": 1, \"totalIva\": 0.12, \"tributos\": [], \"reteRenta\": 0, \"descuNoSuj\": 0, \"saldoFavor\": 0, \"totalDescu\": 0, \"totalNoSuj\": 0, \"totalPagar\": 1, \"descuExenta\": 0, \"totalExenta\": 0, \"totalLetras\": \"UNO DÓLARES\", \"descuGravada\": 0, \"totalGravada\": 1, \"subTotalVentas\": 1, \"totalNoGravado\": 0, \"condicionOperacion\": 1, \"numPagoElectronico\": null, \"montoTotalOperacion\": 1, \"porcentajeDescuento\": 0}, \"apendice\": null, \"receptor\": {\"nrc\": null, \"correo\": \"juancarlosurquilla@outlook.com\", \"nombre\": \"Carlos Urquilla\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"San Miguel\", \"departamento\": \"12\"}, \"codActividad\": \"86201\", \"numDocumento\": \"04319321-6\", \"descActividad\": \"Clínicas médicas\", \"tipoDocumento\": \"13\"}, \"extension\": {\"docuRecibe\": null, \"nombRecibe\": null, \"docuEntrega\": null, \"nombEntrega\": null, \"observaciones\": null, \"placaVehiculo\": null}, \"ventaTercero\": null, \"identificacion\": {\"fecEmi\": \"2025-08-23\", \"horEmi\": \"23:08:29\", \"tipoDte\": \"01\", \"version\": 1, \"ambiente\": \"00\", \"tipoModelo\": 1, \"tipoMoneda\": \"USD\", \"motivoContin\": null, \"numeroControl\": \"DTE-01-M001P001-428525276912146\", \"tipoOperacion\": 1, \"codigoGeneracion\": \"97EFDD71-4746-4163-A5E3-965C693F7085\", \"tipoContingencia\": null}, \"cuerpoDocumento\": [{\"psv\": 0, \"codigo\": null, \"ivaItem\": 0.12, \"numItem\": 1, \"cantidad\": 1, \"tipoItem\": 2, \"tributos\": null, \"noGravado\": 0, \"precioUni\": 1, \"uniMedida\": 59, \"codTributo\": null, \"montoDescu\": 0, \"ventaNoSuj\": 0, \"descripcion\": \"test 8\", \"ventaExenta\": 0, \"ventaGravada\": 1, \"numeroDocumento\": null}], \"otrosDocumentos\": null, \"documentoRelacionado\": null}', '{\"version\":2,\"ambiente\":\"00\",\"versionApp\":2,\"estado\":\"PROCESADO\",\"codigoGeneracion\":\"97EFDD71-4746-4163-A5E3-965C693F7085\",\"selloRecibido\":\"202569FE4F1264AB4017B8FFEE111AFEE882AZVG\",\"fhProcesamiento\":\"23\\/08\\/2025 17:08:35\",\"clasificaMsg\":\"10\",\"codigoMsg\":\"001\",\"descripcionMsg\":\"RECIBIDO\",\"observaciones\":[]}', 'PROCESADO', '97EFDD71-4746-4163-A5E3-965C693F7085', '2025-08-24 05:08:29', '2025-08-24 05:08:36'),
(40, 3, '2025-08-23 21:08:47', '{\"emisor\": {\"nit\": \"12171306901014\", \"nrc\": \"2104554\", \"correo\": \"juancarlosurquilla@gmail.com\", \"nombre\": \"JUAN CARLOS TRIGUEROS URQUILLA\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"RES. SATELITE DE ORIENTE, CALLE JUPITER, BLOCK E-3, CASA 30\", \"departamento\": \"12\"}, \"codEstable\": null, \"codActividad\": \"62010\", \"codEstableMH\": \"M001\", \"codPuntoVenta\": null, \"descActividad\": \"Programación Informática\", \"codPuntoVentaMH\": \"P001\", \"nombreComercial\": \"JUAN CARLOS TRIGUEROS URQUILLA\", \"tipoEstablecimiento\": \"02\"}, \"resumen\": {\"pagos\": [{\"plazo\": null, \"codigo\": \"03\", \"periodo\": null, \"montoPago\": 113, \"referencia\": \"\"}], \"ivaRete1\": 0, \"subTotal\": 100, \"tributos\": [{\"valor\": 13, \"codigo\": \"20\", \"descripcion\": \"Impuesto al Valor Agregado (IVA 13%)\"}], \"ivaPerci1\": 0, \"reteRenta\": 0, \"descuNoSuj\": 0, \"saldoFavor\": 0, \"totalDescu\": 0, \"totalNoSuj\": 0, \"totalPagar\": 113, \"descuExenta\": 0, \"totalExenta\": 0, \"totalLetras\": \"CIENTO TRECE DÓLARES\", \"descuGravada\": 0, \"totalGravada\": 100, \"subTotalVentas\": 100, \"totalNoGravado\": 0, \"condicionOperacion\": 1, \"numPagoElectronico\": null, \"montoTotalOperacion\": 113, \"porcentajeDescuento\": 0}, \"apendice\": null, \"receptor\": {\"nit\": \"06141512201045\", \"nrc\": \"2966653\", \"correo\": \"tax.salvador@pedidosya.com\", \"nombre\": \"Delivery Hero El Salvador, S.A. de C.V.\", \"telefono\": \"25351844\", \"direccion\": {\"municipio\": \"23\", \"complemento\": \"Calle El Mirador entre 87 y 89 Av. Norte, Local Ofi-19-01B, Edif. Torre Futura, complejo World Trade Center, Col. Escalón\", \"departamento\": \"06\"}, \"codActividad\": \"96092\", \"descActividad\": \"Servicios n.c.p.\", \"nombreComercial\": \"Delivery Hero El Salvador, S.A. de C.V.\"}, \"extension\": null, \"ventaTercero\": null, \"identificacion\": {\"fecEmi\": \"2025-08-23\", \"horEmi\": \"21:08:47\", \"tipoDte\": \"03\", \"version\": 3, \"ambiente\": \"00\", \"tipoModelo\": 1, \"tipoMoneda\": \"USD\", \"motivoContin\": null, \"numeroControl\": \"DTE-03-M001P001-554260768599261\", \"tipoOperacion\": 1, \"codigoGeneracion\": \"6B543053-7F71-42D7-BA61-939E70EFC0AB\", \"tipoContingencia\": null}, \"cuerpoDocumento\": [{\"psv\": 0, \"codigo\": \"13\", \"numItem\": 1, \"cantidad\": 1, \"tipoItem\": 2, \"tributos\": [\"20\"], \"noGravado\": 0, \"precioUni\": 100, \"uniMedida\": 59, \"codTributo\": null, \"montoDescu\": 0, \"ventaNoSuj\": 0, \"descripcion\": \"test1\", \"ventaExenta\": 0, \"ventaGravada\": 100, \"numeroDocumento\": null}], \"otrosDocumentos\": null, \"documentoRelacionado\": null}', '{\"version\":2,\"ambiente\":\"00\",\"versionApp\":2,\"estado\":\"PROCESADO\",\"codigoGeneracion\":\"6B543053-7F71-42D7-BA61-939E70EFC0AB\",\"selloRecibido\":\"2025B38648E89E5C41669D8B4A3C4A93F717VRQX\",\"fhProcesamiento\":\"23\\/08\\/2025 21:09:16\",\"clasificaMsg\":\"10\",\"codigoMsg\":\"001\",\"descripcionMsg\":\"RECIBIDO\",\"observaciones\":[]}', 'PROCESADO', '6B543053-7F71-42D7-BA61-939E70EFC0AB', '2025-08-24 03:08:47', '2025-08-24 03:09:17'),
(41, 3, '2025-08-25 19:33:14', '{\"emisor\": {\"nit\": \"12171306901014\", \"nrc\": \"2104554\", \"correo\": \"juancarlosurquilla@gmail.com\", \"nombre\": \"JUAN CARLOS TRIGUEROS URQUILLA\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"RES. SATELITE DE ORIENTE, CALLE JUPITER, BLOCK E-3, CASA 30\", \"departamento\": \"12\"}, \"codEstable\": null, \"codActividad\": \"62010\", \"codEstableMH\": \"M001\", \"codPuntoVenta\": null, \"descActividad\": \"Programación Informática\", \"codPuntoVentaMH\": \"P001\", \"nombreComercial\": null, \"tipoEstablecimiento\": \"02\"}, \"resumen\": {\"pagos\": [{\"plazo\": null, \"codigo\": \"03\", \"periodo\": null, \"montoPago\": 100, \"referencia\": \"\"}], \"ivaRete1\": 0, \"subTotal\": 100, \"totalIva\": 11.5, \"tributos\": [], \"reteRenta\": 0, \"descuNoSuj\": 0, \"saldoFavor\": 0, \"totalDescu\": 0, \"totalNoSuj\": 0, \"totalPagar\": 100, \"descuExenta\": 0, \"totalExenta\": 0, \"totalLetras\": \"CIEN DÓLARES\", \"descuGravada\": 0, \"totalGravada\": 100, \"subTotalVentas\": 100, \"totalNoGravado\": 0, \"condicionOperacion\": 1, \"numPagoElectronico\": null, \"montoTotalOperacion\": 100, \"porcentajeDescuento\": 0}, \"apendice\": null, \"receptor\": {\"nrc\": null, \"correo\": \"juancarlosurquilla@outlook.com\", \"nombre\": \"Carlos Urquilla\", \"telefono\": \"72970867\", \"direccion\": {\"municipio\": \"22\", \"complemento\": \"San Miguel\", \"departamento\": \"12\"}, \"codActividad\": \"86201\", \"numDocumento\": \"04319321-6\", \"descActividad\": \"Clínicas médicas\", \"tipoDocumento\": \"13\"}, \"extension\": {\"docuRecibe\": null, \"nombRecibe\": null, \"docuEntrega\": null, \"nombEntrega\": null, \"observaciones\": null, \"placaVehiculo\": null}, \"ventaTercero\": null, \"identificacion\": {\"fecEmi\": \"2025-08-25\", \"horEmi\": \"19:33:12\", \"tipoDte\": \"01\", \"version\": 1, \"ambiente\": \"00\", \"tipoModelo\": 1, \"tipoMoneda\": \"USD\", \"motivoContin\": null, \"numeroControl\": \"DTE-01-M001P001-823809407811865\", \"tipoOperacion\": 1, \"codigoGeneracion\": \"7B0F5599-0A4A-4531-8161-2F2BC294E592\", \"tipoContingencia\": null}, \"cuerpoDocumento\": [{\"psv\": 0, \"codigo\": null, \"ivaItem\": 11.5, \"numItem\": 1, \"cantidad\": 1, \"tipoItem\": 2, \"tributos\": null, \"noGravado\": 0, \"precioUni\": 100, \"uniMedida\": 59, \"codTributo\": null, \"montoDescu\": 0, \"ventaNoSuj\": 0, \"descripcion\": \"test1\", \"ventaExenta\": 0, \"ventaGravada\": 100, \"numeroDocumento\": null}], \"otrosDocumentos\": null, \"documentoRelacionado\": null}', NULL, 'PENDIENTE', '7B0F5599-0A4A-4531-8161-2F2BC294E592', '2025-08-26 01:33:14', '2025-08-26 01:33:14');

CREATE TABLE `dte_tipos` (
  `codigo` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `empresas` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dui` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nrc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_actividad` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_actividad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_comercial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_establecimiento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamento` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipio` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_estable_mh` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_estable_int` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_punto_venta_mh` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_punto_venta_int` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crt_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gestiona_stock` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `empresas` (`id`, `usuario_id`, `nit`, `dui`, `razon_social`, `nrc`, `direccion`, `telefono`, `correo`, `cod_actividad`, `desc_actividad`, `nombre_comercial`, `tipo_establecimiento`, `departamento`, `municipio`, `cod_estable_mh`, `cod_estable_int`, `cod_punto_venta_mh`, `cod_punto_venta_int`, `crt_path`, `key_path`, `key_password`, `api_user`, `api_password`, `gestiona_stock`, `created_at`, `updated_at`) VALUES
(1, 3, '12171306901014', NULL, 'JUAN CARLOS TRIGUEROS URQUILLA', '2104554', 'RES. SATELITE DE ORIENTE, CALLE JUPITER, BLOCK E-3, CASA 30', '72970867', 'juancarlosurquilla@gmail.com', '62010', 'Programación Informática', NULL, '02', '12', '22', NULL, NULL, NULL, NULL, 'certificados/12171306901014.crt', 'certificados/12171306901014.crt', 'Salmo121:9', '12171306901014', 'Salmo121:9', 0, '2025-07-31 02:53:39', '2025-08-09 00:32:09');

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `formas_pago` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `formas_pago` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'Billetes y monedas', NULL, NULL),
(2, '02', 'Tarjeta Débito', NULL, NULL),
(3, '03', 'Tarjeta Crédito', NULL, NULL),
(4, '04', 'Cheque', NULL, NULL),
(5, '05', 'Transferencia-Depósito Bancario', NULL, NULL),
(6, '08', 'Dinero electrónico', NULL, NULL),
(7, '09', 'Monedero electrónico', NULL, NULL),
(8, '11', 'Bitcoin', NULL, NULL),
(9, '12', 'Otras Criptomonedas', NULL, NULL),
(10, '13', 'Cuentas por pagar del receptor', NULL, NULL),
(11, '14', 'Giro bancario', NULL, NULL),
(12, '99', 'Otros (se debe indicar el medio de pago)', NULL, NULL);

CREATE TABLE `incoterms` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `incoterms` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'EXW-En fabrica', NULL, NULL),
(2, '02', 'FCA-Libre transportista', NULL, NULL),
(3, '03', 'CPT-Transporte pagado hasta', NULL, NULL),
(4, '04', 'CIP-Transporte y seguro pagado hasta', NULL, NULL),
(5, '05', 'DAP-Entrega en el lugar', NULL, NULL),
(6, '06', 'DPU-Entregado en el lugar descargado', NULL, NULL),
(7, '07', 'DDP-Entrega con impuestos pagados', NULL, NULL),
(8, '08', 'FAS-Libre al costado del buque', NULL, NULL),
(9, '09', 'FOB-Libre a bordo', NULL, NULL),
(10, '10', 'CFR-Costo y flete', NULL, NULL),
(11, '11', 'CIF- Costo seguro y flete', NULL, NULL);

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(221, '0001_01_01_000000_create_users_table', 1),
(222, '0001_01_01_000001_create_cache_table', 1),
(223, '0001_01_01_000002_create_jobs_table', 1),
(224, '2025_07_09_160742_create_usuarios_table', 1),
(225, '2025_07_09_160747_create_clientes_table', 1),
(226, '2025_07_09_160748_create_certificados_table', 1),
(227, '2025_07_09_160748_create_tokens_table', 1),
(228, '2025_07_09_160749_create_dtes_table', 1),
(229, '2025_07_09_191654_create_sucursales_table', 1),
(230, '2025_07_09_191907_create_cajas_table', 1),
(231, '2025_07_09_191951_create_dte_tipos_table', 1),
(232, '2025_07_09_192027_create_usuario_dte_tipo_table', 1),
(233, '2025_07_14_191028_create_departamentos_table', 1),
(234, '2025_07_14_204242_create_municipios_table', 1),
(235, '2025_07_15_174259_create_unidades_medida_table', 1),
(236, '2025_07_15_211000_create_tipos_documento_identificacion_table', 1),
(237, '2025_07_15_211925_create_tipos_transmision_table', 1),
(238, '2025_07_15_213216_create_condiciones_entrega_table', 1),
(239, '2025_07_16_142404_create_condiciones_operacion_table', 1),
(240, '2025_07_16_164244_create_formas_pago_table', 1),
(241, '2025_07_16_181232_create_tributos_table', 1),
(242, '2025_07_16_191017_create_ambientes_destino_table', 2),
(243, '2025_07_16_212019_create_tipos_documento_table', 3),
(244, '2025_07_16_213403_create_modelos_facturacion_table', 4),
(245, '2025_07_16_214624_create_tipos_contingencia_table', 5),
(246, '2025_07_16_215514_create_retenciones_iva_table', 6),
(247, '2025_07_16_220012_create_tipos_generacion_documento_table', 7),
(248, '2025_07_17_182825_create_tipos_establecimiento_table', 8),
(249, '2025_07_17_183838_create_tipos_servicio_medico_table', 9),
(250, '2025_07_17_204154_create_tipos_item_table', 10),
(251, '2025_07_17_212149_create_plazos_table', 11),
(252, '2025_07_17_222239_create_actividad_economica_table', 12),
(253, '2025_07_18_201227_create_paises_table', 13),
(254, '2025_07_21_143603_create_otros_documentos_asociados_table', 14),
(255, '2025_07_21_143757_create_tipos_documento_contingencia_table', 15),
(256, '2025_07_21_145103_create_tipos_invalidacion_table', 16),
(257, '2025_07_21_145257_create_titulos_remision_bienes_table', 17),
(258, '2025_07_21_150739_create_tipos_donacion_table', 18),
(259, '2025_07_21_150903_create_recintos_fiscales_table', 19),
(262, '2025_07_21_153410_create_regimenes_table', 20),
(263, '2025_07_21_185411_create_tipos_persona_table', 21),
(264, '2025_07_21_201706_create_tipos_transporte_table', 22),
(265, '2025_07_21_202329_create_incoterms_table', 23),
(266, '2025_07_21_203723_create_domicilios_fiscales_table', 24),
(270, '2025_07_22_181927_create_empresas_table', 25),
(271, '2025_07_22_184416_create_permission_tables', 25),
(272, '2025_07_22_213037_add_empresa_id_to_users_table', 25),
(273, '2025_07_28_205043_add_usuario_id_to_empresas_table', 26),
(274, '2025_08_01_151720_add_dte_fields_to_empresas_table', 27),
(276, '2025_08_04_193236_relate_sucursales_to_empresas', 28),
(277, '2025_08_05_163035_drop_usuario_id_from_sucursales', 29),
(278, '2025_08_05_201943_add_empresa_id_to_sucursales', 30),
(279, '2025_08_07_165452_create_cajeros_table', 31),
(280, '2025_08_07_165515_create_cajero_caja_table', 31),
(281, '2025_08_07_205622_add_empresa_id_to_cajeros_table', 32),
(282, '2025_08_08_150052_create_productos_table', 33),
(283, '2025_08_08_150052_create_servicios_table', 33),
(284, '2025_08_08_170756_add_gestiona_stock_to_empresas_table', 34),
(285, '2025_08_11_220552_add_dte_fields_to_clientes_table', 35),
(286, '2025_08_12_160828_modify_dtes_nullable_response', 36),
(287, '2025_08_14_145442_update_dtes_table_change_foreign_key_to_users', 37),
(288, '2025_08_14_163859_fix_dtes_json_column', 38),
(289, '2025_08_14_175242_change_dtes_dte_json_to_json', 39),
(290, '2025_08_18_213426_fix_tokens_table', 40);

CREATE TABLE `modelos_facturacion` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `modelos_facturacion` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'Modelo Facturación Previo', NULL, NULL),
(2, '02', 'Modelo de Facturación Diferido', NULL, NULL);

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `municipios` (
  `id` bigint UNSIGNED NOT NULL,
  `departamento_id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `municipios` (`id`, `departamento_id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 1, '00', 'Otro (Para extranjeros)', NULL, NULL),
(2, 1, '13', 'AHUACHAPAN NORTE', NULL, NULL),
(3, 1, '14', 'AHUACHAPAN CENTRO', NULL, NULL),
(4, 1, '15', 'AHUACHAPAN SUR', NULL, NULL),
(5, 2, '14', 'SANTA ANA NORTE', NULL, NULL),
(6, 2, '15', 'SANTA ANA CENTRO', NULL, NULL),
(7, 2, '16', 'SANTA ANA ESTE', NULL, NULL),
(8, 2, '17', 'SANTA ANA OESTE', NULL, NULL),
(9, 3, '17', 'SONSONATE NORTE', NULL, NULL),
(10, 3, '18', 'SONSONATE CENTRO', NULL, NULL),
(11, 3, '19', 'SONSONATE ESTE', NULL, NULL),
(12, 3, '20', 'SONSONATE OESTE', NULL, NULL),
(13, 4, '34', 'CHALATENANGO NORTE', NULL, NULL),
(14, 4, '35', 'CHALATENANGO CENTRO', NULL, NULL),
(15, 4, '36', 'CHALATENANGO SUR', NULL, NULL),
(16, 5, '23', 'LA LIBERTAD NORTE', NULL, NULL),
(17, 5, '24', 'LA LIBERTAD CENTRO', NULL, NULL),
(18, 5, '25', 'LA LIBERTAD OESTE', NULL, NULL),
(19, 5, '26', 'LA LIBERTAD ESTE', NULL, NULL),
(20, 5, '27', 'LA LIBERTAD COSTA', NULL, NULL),
(21, 5, '28', 'LA LIBERTAD SUR', NULL, NULL),
(22, 6, '20', 'SAN SALVADOR NORTE', NULL, NULL),
(23, 6, '21', 'SAN SALVADOR OESTE', NULL, NULL),
(24, 6, '22', 'SAN SALVADOR ESTE', NULL, NULL),
(25, 6, '23', 'SAN SALVADOR CENTRO', NULL, NULL),
(26, 6, '24', 'SAN SALVADOR SUR', NULL, NULL),
(27, 7, '17', 'CUSCATLAN NORTE', NULL, NULL),
(28, 7, '18', 'CUSCATLAN SUR', NULL, NULL),
(29, 8, '23', 'LA PAZ OESTE', NULL, NULL),
(30, 8, '24', 'LA PAZ CENTRO', NULL, NULL),
(31, 8, '25', 'LA PAZ ESTE', NULL, NULL),
(32, 9, '10', 'CABAÑAS OESTE', NULL, NULL),
(33, 9, '11', 'CABAÑAS ESTE', NULL, NULL),
(34, 10, '14', 'SAN VICENTE NORTE', NULL, NULL),
(35, 10, '15', 'SAN VICENTE SUR', NULL, NULL),
(36, 11, '24', 'USULUTAN NORTE', NULL, NULL),
(37, 11, '25', 'USULUTAN ESTE', NULL, NULL),
(38, 11, '26', 'USULUTAN OESTE', NULL, NULL),
(39, 12, '21', 'SAN MIGUEL NORTE', NULL, NULL),
(40, 12, '22', 'SAN MIGUEL CENTRO', NULL, NULL),
(41, 12, '23', 'SAN MIGUEL OESTE', NULL, NULL),
(42, 13, '27', 'MORAZAN NORTE', NULL, NULL),
(43, 13, '28', 'MORAZAN SUR', NULL, NULL),
(44, 14, '19', 'LA UNION NORTE', NULL, NULL),
(45, 14, '20', 'LA UNION SUR', NULL, NULL);

CREATE TABLE `otros_documentos_asociados` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `otros_documentos_asociados` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1', 'Emisor', NULL, NULL),
(2, '2', 'Receptor', NULL, NULL),
(3, '3', 'Médico (solo aplica para contribuyentes obligados a la presentación de F-958)', NULL, NULL),
(4, '4', 'Transporte (solo aplica para Factura de exportación)', NULL, NULL);

CREATE TABLE `paises` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `paises` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afganistán', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(2, 'AX', 'Aland', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(3, 'AL', 'Albania', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(4, 'DE', 'Alemania', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(5, 'AD', 'Andorra', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(6, 'AO', 'Angola', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(7, 'AI', 'Anguilla', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(8, 'AQ', 'Antártica', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(9, 'AG', 'Antigua y Barbuda', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(10, 'AW', 'Aruba', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(11, 'SA', 'Arabia Saudita', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(12, 'DZ', 'Argelia', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(13, 'AR', 'Argentina', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(14, 'AM', 'Armenia', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(15, 'AU', 'Australia', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(16, 'AT', 'Austria', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(17, 'AZ', 'Azerbaiyán', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(18, 'BS', 'Bahamas', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(19, 'BH', 'Bahrein', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(20, 'BD', 'Bangladesh', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(21, 'BB', 'Barbados', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(22, 'BE', 'Bélgica', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(23, 'BZ', 'Belice', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(24, 'BJ', 'Benín', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(25, 'BM', 'Bermudas', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(26, 'BY', 'Bielorrusia', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(27, 'BO', 'Bolivia', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(28, 'BQ', 'Bonaire, Sint Eustatius and Saba', '2025-07-19 02:36:47', '2025-07-19 02:36:47'),
(29, 'BA', 'Bosnia–Herzegovina', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(30, 'BW', 'Botswana', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(31, 'BR', 'Brasil', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(32, 'BN', 'Brunei', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(33, 'BG', 'Bulgaria', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(34, 'BF', 'Burkina Faso', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(35, 'BI', 'Burundi', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(36, 'BT', 'Bután', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(37, 'CV', 'Cabo Verde', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(38, 'KY', 'Islas Caimán', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(39, 'KH', 'Camboya', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(40, 'CM', 'Camerún', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(41, 'CA', 'Canadá', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(42, 'CF', 'Centroafricana, República', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(43, 'TD', 'Chad', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(44, 'CL', 'Chile', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(45, 'CN', 'China', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(46, 'CY', 'Chipre', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(47, 'VA', 'Ciudad del Vaticano', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(48, 'CO', 'Colombia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(49, 'KM', 'Comoras', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(50, 'CG', 'Congo', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(51, 'CI', 'Costa de Marfil', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(52, 'CR', 'Costa Rica', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(53, 'HR', 'Croacia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(54, 'CU', 'Cuba', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(55, 'CW', 'Curazao', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(56, 'DK', 'Dinamarca', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(57, 'DM', 'Dominica', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(58, 'DJ', 'Yibuti', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(59, 'EC', 'Ecuador', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(60, 'EG', 'Egipto', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(61, 'SV', 'El Salvador', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(62, 'AE', 'Emiratos Árabes Unidos', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(63, 'ER', 'Eritrea', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(64, 'SK', 'Eslovaquia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(65, 'SI', 'Eslovenia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(66, 'ES', 'España', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(67, 'US', 'Estados Unidos', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(68, 'EE', 'Estonia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(69, 'ET', 'Etiopía', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(70, 'FJ', 'Fiji', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(71, 'PH', 'Filipinas', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(72, 'FI', 'Finlandia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(73, 'FR', 'Francia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(74, 'GA', 'Gabón', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(75, 'GM', 'Gambia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(76, 'GE', 'Georgia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(77, 'GH', 'Ghana', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(78, 'GI', 'Gibraltar', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(79, 'GD', 'Granada', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(80, 'GR', 'Grecia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(81, 'GL', 'Groenlandia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(82, 'GP', 'Guadalupe', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(83, 'GU', 'Guam', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(84, 'GT', 'Guatemala', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(85, 'GF', 'Guayana Francesa', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(86, 'GG', 'Guernsey', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(87, 'GN', 'Guinea', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(88, 'GQ', 'Guinea Ecuatorial', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(89, 'GW', 'Guinea-Bissau', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(90, 'GY', 'Guyana', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(91, 'HT', 'Haití', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(92, 'HN', 'Honduras', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(93, 'HK', 'Hong Kong', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(94, 'HU', 'Hungría', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(95, 'IN', 'India', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(96, 'ID', 'Indonesia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(97, 'IQ', 'Irak', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(98, 'IE', 'Irlanda', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(99, 'BV', 'Isla Bouvet', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(100, 'IM', 'Isla de Man', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(101, 'NF', 'Isla Norfolk', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(102, 'IS', 'Islandia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(103, 'CX', 'Islas Navidad', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(104, 'CC', 'Islas Cocos', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(105, 'CK', 'Islas Cook', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(106, 'FO', 'Islas Faroe', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(107, 'GS', 'Islas Georgias del Sur y Sandwich del Sur', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(108, 'HM', 'Islas Heard y McDonald', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(109, 'FK', 'Islas Malvinas (Falkland)', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(110, 'MP', 'Islas Marianas del Norte', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(111, 'MH', 'Islas Marshall', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(112, 'PN', 'Islas Pitcairn', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(113, 'TC', 'Islas Turcas y Caicos', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(114, 'UM', 'Islas Ultramarinas de EE.UU.', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(115, 'VI', 'Islas Vírgenes', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(116, 'IL', 'Israel', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(117, 'IT', 'Italia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(118, 'JM', 'Jamaica', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(119, 'JP', 'Japón', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(120, 'JE', 'Jersey', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(121, 'JO', 'Jordania', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(122, 'KZ', 'Kazajistán', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(123, 'KE', 'Kenia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(124, 'KG', 'Kirguistán', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(125, 'KI', 'Kiribati', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(126, 'KW', 'Kuwait', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(127, 'LA', 'Laos, República Democrática', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(128, 'LS', 'Lesotho', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(129, 'LV', 'Letonia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(130, 'LB', 'Líbano', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(131, 'LR', 'Liberia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(132, 'LY', 'Libia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(133, 'LI', 'Liechtenstein', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(134, 'LT', 'Lituania', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(135, 'LU', 'Luxemburgo', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(136, 'MO', 'Macao', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(137, 'MK', 'Macedonia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(138, 'MG', 'Madagascar', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(139, 'MY', 'Malasia', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(140, 'MW', 'Malawi', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(141, 'MV', 'Maldivas', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(142, 'ML', 'Mali', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(143, 'MT', 'Malta', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(144, 'MA', 'Marruecos', '2025-07-19 02:36:48', '2025-07-19 02:36:48'),
(145, 'MQ', 'Martinica', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(146, 'MU', 'Mauricio', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(147, 'MR', 'Mauritania', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(148, 'YT', 'Mayotte', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(149, 'MX', 'México', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(150, 'FM', 'Micronesia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(151, 'MD', 'Moldavia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(152, 'MC', 'Mónaco', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(153, 'MN', 'Mongolia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(154, 'ME', 'Montenegro', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(155, 'MS', 'Montserrat', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(156, 'MZ', 'Mozambique', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(157, 'MM', 'Myanmar', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(158, 'NA', 'Namibia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(159, 'NR', 'Nauru', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(160, 'NP', 'Nepal', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(161, 'NI', 'Nicaragua', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(162, 'NE', 'Niger', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(163, 'NG', 'Nigeria', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(164, 'NU', 'Niue', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(165, 'NO', 'Noruega', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(166, 'NC', 'Nueva Caledonia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(167, 'NZ', 'Nueva Zelanda', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(168, 'OM', 'Omán', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(169, 'NL', 'Países Bajos', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(170, 'PK', 'Pakistán', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(171, 'PW', 'Palaos', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(172, 'PS', 'Palestina', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(173, 'PA', 'Panamá', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(174, 'PG', 'Papúa Nueva Guinea', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(175, 'PY', 'Paraguay', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(176, 'PE', 'Perú', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(177, 'PF', 'Polinesia Francesa', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(178, 'PL', 'Polonia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(179, 'PT', 'Portugal', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(180, 'PR', 'Puerto Rico', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(181, 'QA', 'Qatar', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(182, 'GB', 'Reino Unido', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(183, 'KP', 'Corea del Norte', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(184, 'CZ', 'República Checa', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(185, 'KR', 'República de Corea', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(186, 'CD', 'República Democrática del Congo', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(187, 'DO', 'República Dominicana', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(188, 'IR', 'República Islámica de Irán', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(189, 'RE', 'Reunión', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(190, 'RW', 'Ruanda', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(191, 'RO', 'Rumanía', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(192, 'RU', 'Rusia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(193, 'EH', 'Sahara Occidental', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(194, 'BL', 'Saint Barthélemy', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(195, 'MF', 'Saint Martin', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(196, 'SB', 'Islas Salomón', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(197, 'WS', 'Samoa', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(198, 'AS', 'Samoa Americana', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(199, 'KN', 'San Cristóbal y Nieves', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(200, 'SM', 'San Marino', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(201, 'PM', 'San Pedro y Miquelón', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(202, 'VC', 'San Vicente y las Granadinas', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(203, 'SH', 'Santa Elena', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(204, 'LC', 'Santa Lucía', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(205, 'ST', 'Santo Tomé y Príncipe', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(206, 'SN', 'Senegal', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(207, 'RS', 'Serbia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(208, 'SC', 'Seychelles', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(209, 'SL', 'Sierra Leona', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(210, 'SG', 'Singapur', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(211, 'SX', 'Sint Maarten', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(212, 'SY', 'Siria', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(213, 'SO', 'Somalia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(214, 'SS', 'Sudán del Sur', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(215, 'LK', 'Sri Lanka', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(216, 'ZA', 'Sudáfrica', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(217, 'SD', 'Sudán', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(218, 'SE', 'Suecia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(219, 'CH', 'Suiza', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(220, 'SR', 'Surinam', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(221, 'SJ', 'Svalbard y Jan Mayen', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(222, 'SZ', 'Esuatini', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(223, 'TH', 'Tailandia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(224, 'TW', 'Taiwán', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(225, 'TZ', 'Tanzania, República Unida de', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(226, 'TJ', 'Tayikistán', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(227, 'IO', 'Territorio Británico del Océano Índico', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(228, 'TF', 'Territorios Australes Franceses', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(229, 'TL', 'Timor Oriental', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(230, 'TG', 'Togo', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(231, 'TK', 'Tokelau', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(232, 'TO', 'Tonga', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(233, 'TT', 'Trinidad y Tobago', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(234, 'TN', 'Túnez', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(235, 'TM', 'Turkmenistán', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(236, 'TR', 'Turquía', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(237, 'TV', 'Tuvalu', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(238, 'UA', 'Ucrania', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(239, 'UG', 'Uganda', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(240, 'UY', 'Uruguay', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(241, 'UZ', 'Uzbekistán', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(242, 'VU', 'Vanuatu', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(243, 'VE', 'Venezuela', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(244, 'VN', 'Vietnam', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(245, 'VG', 'Islas Vírgenes Británicas', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(246, 'WF', 'Wallis y Futuna', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(247, 'YE', 'Yemen', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(248, 'ZM', 'Zambia', '2025-07-19 02:36:49', '2025-07-19 02:36:49'),
(249, 'ZW', 'Zimbabue', '2025-07-19 02:36:49', '2025-07-19 02:36:49');

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view dashboard', 'web', '2025-07-23 03:34:24', '2025-07-23 03:34:24'),
(2, 'manage empresa', 'web', '2025-07-23 03:34:24', '2025-07-23 03:34:24'),
(3, 'manage emisores', 'web', '2025-07-23 03:34:24', '2025-07-23 03:34:24'),
(4, 'emitir dte', 'web', '2025-07-23 03:34:24', '2025-07-23 03:34:24');

CREATE TABLE `plazos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `plazos` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'Días', NULL, NULL),
(2, '02', 'Meses', NULL, NULL),
(3, '03', 'Años', NULL, NULL);

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `empresa_id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidad_medida` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `stock` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `productos` (`id`, `empresa_id`, `codigo`, `descripcion`, `unidad_medida`, `precio_unitario`, `stock`, `created_at`, `updated_at`) VALUES
(2, 1, '7412900301812', 'Jugo Sabor Mango Melocotón, Marca Salud, 1/2 galón.', 'unidad', 1.40, NULL, '2025-08-09 00:37:57', '2025-08-09 00:38:07');

CREATE TABLE `recintos_fiscales` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `recintos_fiscales` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'Terrestre San Bartolo', NULL, NULL),
(2, '02', 'Marítima de Acajutla', NULL, NULL),
(3, '03', 'Aérea De Comalapa', NULL, NULL),
(4, '04', 'Terrestre Las Chinamas', NULL, NULL),
(5, '05', 'Terrestre La Hachadura', NULL, NULL),
(6, '06', 'Terrestre Santa Ana', NULL, NULL),
(7, '07', 'Terrestre San Cristóbal', NULL, NULL),
(8, '08', 'Terrestre Anguitá', NULL, NULL),
(9, '09', 'Terrestre El Amatillo', NULL, NULL),
(10, '10', 'Marítima La Unión', NULL, NULL),
(11, '11', 'Terrestre El Poy', NULL, NULL),
(12, '12', 'Terrestre Metalio', NULL, NULL),
(13, '15', 'Fardos Postales', NULL, NULL),
(14, '16', 'Z.F. San Marcos', NULL, NULL),
(15, '17', 'Z.F. El Pedregal', NULL, NULL),
(16, '18', 'Z.F. San Bartolo', NULL, NULL),
(17, '20', 'Z.F. Exportsalva', NULL, NULL),
(18, '21', 'Z.F. American Park', NULL, NULL),
(19, '23', 'Z.F. Internacional', NULL, NULL),
(20, '24', 'Z.F. Diez', NULL, NULL),
(21, '26', 'Z.F. Miramar', NULL, NULL),
(22, '27', 'Z.F. Santo Tomas', NULL, NULL),
(23, '28', 'Z.F. Santa Tecla', NULL, NULL),
(24, '29', 'Z.F. Santa Ana', NULL, NULL),
(25, '30', 'Z.F. La Concordia', NULL, NULL),
(26, '31', 'Aérea Ilopango', NULL, NULL),
(27, '32', 'Z.F. Pipil', NULL, NULL),
(28, '33', 'Puerto Barillas', NULL, NULL),
(29, '34', 'Z.F. Calvo Conservas', NULL, NULL),
(30, '35', 'Feria Internacional', NULL, NULL),
(31, '36', 'Aduana El Papalón', NULL, NULL),
(32, '37', 'Z.F. Sam-Li', NULL, NULL),
(33, '38', 'Z.F. San José', NULL, NULL),
(34, '39', 'Z.F. Las Mercedes', NULL, NULL),
(35, '71', 'Aldesa', NULL, NULL),
(36, '72', 'Agdosia Merlot', NULL, NULL),
(37, '73', 'Bodesa', NULL, NULL),
(38, '76', 'Delegacion DHL', NULL, NULL),
(39, '77', 'Transauto', NULL, NULL),
(40, '80', 'Nejapa', NULL, NULL),
(41, '81', 'Almaconsa', NULL, NULL),
(42, '83', 'Agdosia Apopa', NULL, NULL),
(43, '85', 'Gutiérrez Courier Y Cargo', NULL, NULL),
(44, '99', 'San Bartolo Envío Hn/Gt', NULL, NULL);

CREATE TABLE `regimenes` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `regimenes` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'EX-1.1000.000', 'Exportación Definitiva, Exportación Definitiva, Régimen Común', NULL, NULL),
(2, 'EX-1.1040.000', 'Exportación Definitiva, Exportación Definitiva Sustitución de Mercancías, Régimen Común', NULL, NULL),
(3, 'EX-1.1041.020', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Provisional, Franq. Presidenciales exento de DAI', NULL, NULL),
(4, 'EX-1.1041.021', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Provisional, Franq. Presidenciales exento de DAI e IVA', NULL, NULL),
(5, 'EX-1.1048.025', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Maquinaria y Equipo LZF. DPA', NULL, NULL),
(6, 'EX-1.1048.031', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Distribución Internacional', NULL, NULL),
(7, 'EX-1.1048.032', 'Exportación Definitiva, Exportación Definitiva Proveniente. de Franquicia Definitiva, Operaciones Internacionales de Logística', NULL, NULL),
(8, 'EX-1.1048.033', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Centro Internacional de llamadas (Call Center)', NULL, NULL),
(9, 'EX-1.1048.034', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Tecnologías de Información LSI', NULL, NULL),
(10, 'EX-1.1048.035', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Investigación y Desarrollo LSI', NULL, NULL),
(11, 'EX-1.1048.036', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Reparación y Mantenimiento de Embarcaciones Marítimas LSI', NULL, NULL),
(12, 'EX-1.1048.037', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Reparación y Mantenimiento de Aeronaves LSI', NULL, NULL),
(13, 'EX-1.1048.038', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Procesos Empresariales LSI', NULL, NULL),
(14, 'EX-1.1048.039', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Servicios Medico–Hospitalarios LSI', NULL, NULL),
(15, 'EX-1.1048.040', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Servicios Financieros Internacionales LSI', NULL, NULL),
(16, 'EX-1.1048.043', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Reparación y Mantenimiento de Contenedores LSI', NULL, NULL),
(17, 'EX-1.1048.044', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Reparación de Equipos Tecnológicos LSI', NULL, NULL),
(18, 'EX-1.1048.054', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Atención Ancianos y Convalecientes LSI', NULL, NULL),
(19, 'EX-1.1048.055', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Telemedicina LSI', NULL, NULL),
(20, 'EX-1.1048.056', 'Exportación Definitiva, Exportación Definitiva Proveniente de Franquicia Definitiva, Cinematografía LSI', NULL, NULL),
(21, 'EX-1.1052.000', 'Exportación Definitiva, Exportación Definitiva de DPA con origen en Compras Locales, Régimen Común', NULL, NULL),
(22, 'EX-1.1054.000', 'Exportación Definitiva, Exportación Definitiva de Zona Franca con origen en Compras Locales, Régimen Común', NULL, NULL),
(23, 'EX-1.1100.000', 'Exportación Definitiva, Exportación Definitiva de Envíos de Socorro, Régimen Común', NULL, NULL),
(24, 'EX-1.1200.000', 'Exportación Definitiva, Exportación Definitiva de Envíos Postales, Régimen Común', NULL, NULL),
(25, 'EX-1.1300.000', 'Exportación Definitiva, Exportación Definitiva Envíos que requieren despacho urgente, Régimen Común', NULL, NULL),
(26, 'EX-1.1400.000', 'Exportación Definitiva, Exportación Definitiva Courier, Régimen Común', NULL, NULL),
(27, 'EX-1.1400.011', 'Exportación Definitiva, Exportación Definitiva Courier, Muestras Sin Valor Comercial', NULL, NULL),
(28, 'EX-1.1400.012', 'Exportación Definitiva, Exportación Definitiva Courier, Material Publicitario', NULL, NULL),
(29, 'EX-1.1400.017', 'Exportación Definitiva, Exportación Definitiva Courier, Declaración de Documentos', NULL, NULL),
(30, 'EX-1.1500.000', 'Exportación Definitiva, Exportación Definitiva Menaje de casa, Régimen Común', NULL, NULL),
(31, 'EX-2.2100.000', 'Exportación Temporal, Exportación Temporal para Perfeccionamiento Pasivo, Régimen Común', NULL, NULL),
(32, 'EX-2.2200.000', 'Exportación Temporal, Exportación Temporal con Reimportación en el mismo estado, Régimen Común', NULL, NULL),
(33, 'EX-2.2400.000', 'Traslados Definitivos', NULL, NULL),
(34, 'EX-3.3050.000', 'Re-Exportación, Reexportación Proveniente de Importación Temporal, Régimen Común', NULL, NULL),
(35, 'EX-3.3051.000', 'Re-Exportación, Reexportación Proveniente de Tiendas Libres, Régimen Común', NULL, NULL),
(36, 'EX-3.3052.000', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal para Perfeccionamiento Activo, Régimen Común', NULL, NULL),
(37, 'EX-3.3053.000', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal, Régimen Común', NULL, NULL),
(38, 'EX-3.3054.000', 'Re-Exportación, Reexportación Proveniente de Régimen de Zona Franca, Régimen Común', NULL, NULL),
(39, 'EX-3.3055.000', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal para Perfeccionamiento Activo con Garantía, Régimen Común', NULL, NULL),
(40, 'EX-3.3056.000', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Distribución Internacional Parque de Servicios, Régimen Común', NULL, NULL),
(41, 'EX-3.3056.057', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Distribución Internacional Parque de Servicios, Remisión entre Usuarios Directos del Mismo Parque de Servicios', NULL, NULL),
(42, 'EX-3.3056.072', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Distribución Internacional Parque de Servicios, Decreto 738 Eléctricos e Híbridos', NULL, NULL),
(43, 'EX-3.3057.000', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Operaciones Internacional de Logística Parque de Servicios, Régimen Común', NULL, NULL),
(44, 'EX-3.3057.057', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Operaciones Internacional de Logística Parque de Servicios, Remisión entre Usuarios Directos del Mismo Parque de Servicios', NULL, NULL),
(45, 'EX-3.3058.033', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Centro Servicio LSI, Centro Internacional de llamadas (Call Center)', NULL, NULL),
(46, 'EX-3.3058.036', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Centro Servicio LSI, Reparación y Mantenimiento de Embarcaciones Marítimas LSI', NULL, NULL),
(47, 'EX-3.3058.037', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Centro Servicio LSI, Reparación y Mantenimiento de Aeronaves LSI', NULL, NULL),
(48, 'EX-3.3059.000', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Reparación de Equipo Tecnológico Parque de Servicios, Régimen Común', NULL, NULL),
(49, 'EX-3.3059.057', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Reparación de Equipo Tecnológico Parque de Servicios, Remisión entre Usuarios Directos del Mismo Parque de Servicios', NULL, NULL),
(50, 'EX-3.3059.058', 'Re-Exportación, Reexportación Proveniente de Admisión Temporal Reparación de Equipo Tecnológico Parque de Servicios, Remisión entre Usuarios Directos de Diferente Parque de Servicios', NULL, NULL),
(51, 'EX-3.3070.000', 'Re-Exportación, Reexportación Proveniente de Depósito., Régimen Común', NULL, NULL),
(52, 'EX-3.3070.072', 'Re-Exportación, Reexportación Proveniente de Depósito., Decreto 738 Eléctricos e Híbridos', NULL, NULL),
(53, 'EX-3.3071.000', 'Reexp. Prov. de Deposito.', NULL, NULL),
(54, 'EX-3.3052.000', 'Reexp. Prov. de Adm Temp. para Perfeccionamiento Activo', NULL, NULL),
(55, 'EX-3.3054.000', 'Reexp. Prov. de Regimen de Zona Franca', NULL, NULL),
(56, 'EX-3.3055.000', 'Reexp. Prov.de Adm.Temporal para Perfeccionamiento Activo con Garantía', NULL, NULL),
(57, 'EX-3.3056.000', 'Re-Exp. Prov.de Adm.Temporal Ley de Servi. Internacionales', NULL, NULL),
(58, 'EX-3.3057.000', 'Reexportación Prov. de Centro de Servicio LSI', NULL, NULL);

CREATE TABLE `retenciones_iva` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `retenciones_iva` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '22', 'Retención IVA 1%', NULL, NULL),
(2, 'C4', 'Retención IVA 13%', NULL, NULL),
(3, 'C9', 'Otras Retenciones IVA Casos Especiales', NULL, NULL);

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrador', 'web', '2025-07-23 03:34:24', '2025-07-23 03:34:24'),
(2, 'emisor', 'web', '2025-07-23 03:34:24', '2025-07-23 03:34:24');

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(4, 2);

CREATE TABLE `servicios` (
  `id` bigint UNSIGNED NOT NULL,
  `empresa_id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `servicios` (`id`, `empresa_id`, `codigo`, `descripcion`, `precio_unitario`, `created_at`, `updated_at`) VALUES
(1, 1, '01', 'programación por hora', 30.00, '2025-08-08 22:32:57', '2025-08-08 22:33:59'),
(2, 1, '12', 'peque;a curacion', 50.00, '2025-08-26 01:47:43', '2025-08-26 01:47:43');

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dcoJ15fbUfikylL29fS52wqPsY3M5jH0b8fYYjoC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.22.0 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0o3ejZaMjNHd2RzaXRFWnA5N2piRGRFdThaRk1PQjVzZml5ZDRCZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9mYWN0dXJhY2lvbmVpbnZlbnRhcmlvLnRlc3QvP2hlcmQ9cHJldmlldyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756244526),
('IYVJogqzpyLZfPg7JwXhV3veTgjTV5MAxwWWwqFi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.22.0 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTThwQk4yR3VGQnE5Mjk1OXBZa2NFbEZKVGtPSnRSdUhzSThrelBLTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9mYWN0dXJhY2lvbmVpbnZlbnRhcmlvLnRlc3QvP2hlcmQ9cHJldmlldyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756249534),
('qKywGkLAI2gsM3uiIstuAOC70RVB9yP06bihnH7r', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMnNlYkljWjB0bGh1emljVFpvSkNhRG5HMDFyVHhDU0N0SVNwRG5LSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9mYWN0dXJhY2lvbmVpbnZlbnRhcmlvLnRlc3QvZHRlL3RpcG8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1756173079),
('v7ugByFg6yqureXCnwZaaZUJJ1cQsg8Dda22CnmS', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQnZBbG11MDNUOGloMTBBTUdURzFzVHJDWnB4SzhDOVhRV1ZZaEFybiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9mYWN0dXJhY2lvbmVpbnZlbnRhcmlvLnRlc3QvZHRlL3RpcG8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1756746348),
('WIctxlnzyiAF9e488VmfvBVxwmBUonPrownN5n1c', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibEozTmF2UmVWS2xmekhNU2xHV3VZMHBkQmJnbHk3MGRYaEx1R2JPVSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM4OiJodHRwOi8vZmFjdHVyYWNpb25laW52ZW50YXJpby50ZXN0L2R0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1756004957),
('wpFwxX64JoweSDhlKa8VqqOw03cKwTEfAVNsTwZh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.22.0 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1RFaTd1dGVvUHJFVWFjT05KaFUzTlZwTUhueDhKaTZ1blhjZGJlWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9mYWN0dXJhY2lvbmVpbnZlbnRhcmlvLnRlc3QvP2hlcmQ9cHJldmlldyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756171255);

CREATE TABLE `sucursales` (
  `id` bigint UNSIGNED NOT NULL,
  `empresa_id` bigint UNSIGNED NOT NULL,
  `codigo_mh` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sucursales` (`id`, `empresa_id`, `codigo_mh`, `descripcion`, `direccion`, `created_at`, `updated_at`) VALUES
(2, 1, NULL, 'Sucursal Ruta Militar', 'Kilometro 132, Ruta Militar, San Miguel', '2025-08-06 03:57:27', '2025-08-06 03:57:27');

CREATE TABLE `tipos_contingencia` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_contingencia` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1', 'No disponibilidad de sistema del MH', NULL, NULL),
(2, '2', 'No disponibilidad de sistema del emisor', NULL, NULL),
(3, '3', 'Falla en el suministro de servicio de Internet del Emisor', NULL, NULL),
(4, '4', 'Falla en el suministro de servicio de energía eléctrica del emisor que impida la transmisión de los DTE', NULL, NULL),
(5, '5', 'Otro (deberá digitar un máximo de 500 caracteres explicando el motivo)', NULL, NULL);

CREATE TABLE `tipos_documento` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_documento` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(23, '01', 'Factura', NULL, NULL),
(24, '03', 'Comprobante de Crédito fiscal', NULL, NULL),
(25, '04', 'Nota de Remision', NULL, NULL),
(26, '05', 'Nota de Crédito', NULL, NULL),
(27, '06', 'Nota de Débito', NULL, NULL),
(28, '07', 'Comprobante de Retención', NULL, NULL),
(29, '08', 'Comprobante de liquidación', NULL, NULL),
(30, '09', 'Documento Contable de Liquidación', NULL, NULL),
(31, '11', 'Factura de Exportación', NULL, NULL),
(32, '14', 'Factura de sujeto excluido', NULL, NULL),
(33, '15', 'Comprobante de Donación', NULL, NULL);

CREATE TABLE `tipos_documento_contingencia` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_documento_contingencia` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'Factura Electrónica', NULL, NULL),
(2, '03', 'Comprobante de Crédito Fiscal Electrónico', NULL, NULL),
(3, '04', 'Nota de Remisión Electrónica', NULL, NULL),
(4, '05', 'Nota de Crédito Electrónica', NULL, NULL),
(5, '06', 'Nota de Débito Electrónica', NULL, NULL),
(6, '11', 'Factura de Exportación Electrónica', NULL, NULL),
(7, '14', 'Factura de Sujeto Excluido Electrónica', NULL, NULL);

CREATE TABLE `tipos_documento_identificacion` (
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_documento_identificacion` (`codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
('13', 'DUI', '2025-07-17 00:31:00', '2025-07-17 00:31:00'),
('36', 'NIT', '2025-07-17 00:31:00', '2025-07-17 00:31:00'),
('37', 'PASAPORTE', '2025-07-17 00:31:00', '2025-07-17 00:31:00'),
('39', 'CEDULA', '2025-07-17 00:31:00', '2025-07-17 00:31:00'),
('91', 'OTRO DOCUMENTO', '2025-07-17 00:31:00', '2025-07-17 00:31:00');

CREATE TABLE `tipos_donacion` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_donacion` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'Efectivo', NULL, NULL),
(2, '02', 'Bien', NULL, NULL),
(3, '03', 'Servicio', NULL, NULL);

CREATE TABLE `tipos_establecimiento` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_establecimiento` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'Sucursal', NULL, NULL),
(2, '02', 'Casa matriz', NULL, NULL),
(3, '04', 'Bodega', NULL, NULL),
(4, '07', 'Patio', NULL, NULL);

CREATE TABLE `tipos_generacion_documento` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_generacion_documento` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1', 'Físico', NULL, NULL),
(2, '2', 'Electrónico', NULL, NULL);

CREATE TABLE `tipos_invalidacion` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_invalidacion` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1', 'Error en la Información del Documento Tributario Electrónico a invalidar.', NULL, NULL),
(2, '2', 'Rescindir de la operación realizada.', NULL, NULL),
(3, '3', 'Otro', NULL, NULL);

CREATE TABLE `tipos_item` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_item` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1', 'Bienes', NULL, NULL),
(2, '2', 'Servicios', NULL, NULL),
(3, '3', 'Ambos (Bienes y Servicios)', NULL, NULL),
(4, '4', 'Otros tributos por ítem', NULL, NULL);

CREATE TABLE `tipos_persona` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_persona` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'Natural', NULL, NULL),
(2, '02', 'Jurídica', NULL, NULL);

CREATE TABLE `tipos_servicio_medico` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_servicio_medico` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1', 'Cirugía', NULL, NULL),
(2, '2', 'Operación', NULL, NULL),
(3, '3', 'Tratamiento médico', NULL, NULL),
(4, '4', 'Cirugía Instituto Salvadoreño de Bienestar Magisterial', NULL, NULL),
(5, '5', 'Operación Instituto Salvadoreño de Bienestar Magisterial', NULL, NULL),
(6, '6', 'Tratamiento médico Instituto Salvadoreño de Bienestar Magisterial', NULL, NULL);

CREATE TABLE `tipos_transmision` (
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_transmision` (`codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
('01', 'Normal', NULL, NULL),
('02', 'Contingencia', NULL, NULL);

CREATE TABLE `tipos_transporte` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tipos_transporte` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1', 'TERRESTRE', NULL, NULL),
(2, '2', 'AÉREO', NULL, NULL),
(3, '3', 'MARÍTIMO', NULL, NULL),
(4, '4', 'FERREO', NULL, NULL),
(5, '5', 'MULTIMODAL', NULL, NULL),
(6, '6', 'CORREO', NULL, NULL);

CREATE TABLE `titulos_remision_bienes` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `titulos_remision_bienes` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '01', 'Depósito', NULL, NULL),
(2, '02', 'Propiedad', NULL, NULL),
(3, '03', 'Consignación', NULL, NULL),
(4, '04', 'Traslado', NULL, NULL),
(5, '05', 'Otros', NULL, NULL);

CREATE TABLE `tokens` (
  `empresa_id` bigint UNSIGNED NOT NULL,
  `token` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tokens` (`empresa_id`, `token`, `expire_at`, `created_at`, `updated_at`) VALUES
(1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwNDMxOTMyMTYiLCJhdXRob3JpdGllcyI6WyJVU0VSIiwiVVNFUl9BUEkiLCJVc3VhcmlvIl0sImNfbml0IjoiMTIxNzEzMDY5MDEwMTQiLCJjX2R1aSI6IjA0MzE5MzIxNiIsImlhdCI6MTc1NTk3MTg2OSwiZXhwIjoxNzU2MDU4MjY5fQ.Ex3zwGpVxma7WD4icemHVzY6IJIgUlG6x7kD6exNrFkmeNHnHOvV5Q6sLB920k5rsPF6Y4gkoUVei_ekTzPN4g', '2025-08-24 17:56:51', NULL, '2025-08-23 23:57:51');

CREATE TABLE `tributos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tributos` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '51', 'Bebidas Alcohólicas', NULL, NULL),
(2, '52', 'Cerveza', NULL, NULL),
(3, '53', 'Productos del Tabaco', NULL, NULL),
(4, '54', 'Bebidas Carbonatadas o Gaseosas Simples o Endulzadas', NULL, NULL),
(5, '55', 'Otros Específicos', NULL, NULL),
(6, '58', 'Alcohol', NULL, NULL),
(7, '77', 'Importador de Jugos, Néctares, Bebidas con Jugo y Refrescos', NULL, NULL),
(8, '78', 'Distribuidor de Jugos, Néctares, Bebidas con Jugo y Refrescos', NULL, NULL),
(9, '79', 'Sobre Llamadas Telefónicas Provenientes del Ext.', NULL, NULL),
(10, '85', 'Detallista de Jugos, Néctares, Bebidas con Jugo y Refrescos', NULL, NULL),
(11, '86', 'Fabricante de Preparaciones Concentradas o en Polvo para la Elaboración de Bebidas', NULL, NULL),
(12, '91', 'Fabricante de Jugos, Néctares, Bebidas con Jugo y Refrescos', NULL, NULL),
(13, '92', 'Importador de Preparaciones Concentradas o en Polvo para la Elaboración de Bebidas', NULL, NULL),
(14, 'A1', 'Específicos y Ad-Valorem', NULL, NULL),
(15, 'A5', 'Bebidas Gaseosas, Isotónicas, Deportivas, Fortificantes, Energizantes o Estimulantes', NULL, NULL),
(16, 'A7', 'Alcohol Etílico', NULL, NULL),
(17, 'A9', 'Sacos Sintéticos', NULL, NULL);

CREATE TABLE `unidades_medida` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `unidades_medida` (`id`, `codigo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '59', 'UNIDAD', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(2, '60', 'SERVICIO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(3, '61', 'MILLAR', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(4, '62', 'DOCENA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(5, '63', 'PAR', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(6, '64', 'GALÓN', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(7, '65', 'LITRO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(8, '66', 'KILOGRAMO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(9, '67', 'METRO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(10, '68', 'CAJA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(11, '69', 'SACO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(12, '70', 'BARRIL', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(13, '71', 'COSTAL', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(14, '72', 'TONELADA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(15, '73', 'BOLSA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(16, '74', 'PLANCHA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(17, '75', 'PLIEGO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(18, '76', 'TIRA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(19, '77', 'CILINDRO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(20, '78', 'AMPOLLETA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(21, '79', 'TABLETA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(22, '80', 'FRASCO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(23, '81', 'PAQUETE', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(24, '82', 'BLISTER', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(25, '83', 'CASETILLA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(26, '84', 'TUBO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(27, '85', 'JUEGO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(28, '86', 'TANDA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(29, '87', 'KIT', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(30, '88', 'ROLLO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(31, '89', 'LATA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(32, '90', 'TARRO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(33, '91', 'BOTELLA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(34, '92', 'CUBETA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(35, '93', 'POTE', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(36, '94', 'CAJILLA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(37, '95', 'SOBRE', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(38, '96', 'TAMBO', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(39, '97', 'UNIDAD EMPAQUE', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(40, '98', 'PLATAFORMA', '2025-07-17 00:32:04', '2025-07-17 00:32:04'),
(41, '99', 'OTRA', '2025-07-17 00:32:04', '2025-07-17 00:32:04');

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `empresa_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `empresa_id`) VALUES
(1, 'Test User', 'test@example.com', '2025-07-17 00:21:21', '$2y$12$QZG5qlp2g5UM4Mz708ETzuizwW.xDITPwoU2jxrvvAgSLNmb4g0iG', 'i81rw6XUzT', '2025-07-17 00:21:21', '2025-07-17 00:21:21', NULL),
(3, 'Juan Carlos Trigueros Urquilla', 'juancarlosurquilla@gmail.com', NULL, '$2y$12$j4dQZ2xJSKI5eUN38b68euyRP2jkD8plfGmLg1OuZbxbH7nXm80P6', NULL, '2025-07-29 03:29:56', '2025-07-29 03:29:56', NULL),
(4, 'Carlos Trigueros', 'juancarlosurquilla@outlook.es', NULL, '$2y$12$Hunh.OB37jIptTKnlGEqle1jNvEVq7AcMltODhCH9WQCb8IkVIsUe', NULL, '2025-08-08 03:08:59', '2025-08-08 03:08:59', NULL);

CREATE TABLE `usuarios` (
  `id` bigint UNSIGNED NOT NULL,
  `nit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dui` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nrc` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pub_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priv_key_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codActividad` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descActividad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombreComercial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoEstablecimiento` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamento` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipio` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codEstableMH` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codEstable` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codPuntoVentaMH` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codPuntoVenta` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `usuario_dte_tipo` (
  `usuario_id` bigint UNSIGNED NOT NULL,
  `dte_tipo_codigo` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `actividad_economica`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `actividad_economica_b`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `ambientes_destino`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ambientes_destino_codigo_unique` (`codigo`);

ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajas_sucursal_id_foreign` (`sucursal_id`);

ALTER TABLE `cajeros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cajeros_user_id_unique` (`user_id`),
  ADD KEY `cajeros_empresa_id_foreign` (`empresa_id`);

ALTER TABLE `cajero_caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajero_caja_cajero_id_foreign` (`cajero_id`),
  ADD KEY `cajero_caja_caja_id_foreign` (`caja_id`);

ALTER TABLE `certificados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificados_usuario_id_foreign` (`usuario_id`);

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientes_nit_unique` (`nit`),
  ADD UNIQUE KEY `clientes_dui_unique` (`dui`),
  ADD KEY `clientes_nrc_index` (`nrc`),
  ADD KEY `clientes_cod_actividad_index` (`cod_actividad`);

ALTER TABLE `condiciones_entrega`
  ADD PRIMARY KEY (`codigo`);

ALTER TABLE `condiciones_operacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `condiciones_operacion_codigo_unique` (`codigo`);

ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departamentos_codigo_unique` (`codigo`);

ALTER TABLE `domicilios_fiscales`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `dtes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dtes_usuario_id_foreign` (`usuario_id`);

ALTER TABLE `dte_tipos`
  ADD PRIMARY KEY (`codigo`);

ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `empresas_nit_unique` (`nit`),
  ADD UNIQUE KEY `empresas_dui_unique` (`dui`),
  ADD KEY `empresas_usuario_id_foreign` (`usuario_id`);

ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

ALTER TABLE `formas_pago`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `formas_pago_codigo_unique` (`codigo`);

ALTER TABLE `incoterms`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `modelos_facturacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modelos_facturacion_codigo_unique` (`codigo`);

ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipios_departamento_id_foreign` (`departamento_id`);

ALTER TABLE `otros_documentos_asociados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `otros_documentos_asociados_codigo_unique` (`codigo`);

ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `paises_codigo_unique` (`codigo`);

ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

ALTER TABLE `plazos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plazos_codigo_unique` (`codigo`);

ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productos_empresa_id_codigo_unique` (`empresa_id`,`codigo`);

ALTER TABLE `recintos_fiscales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recintos_fiscales_codigo_unique` (`codigo`);

ALTER TABLE `regimenes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `retenciones_iva`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `retenciones_iva_codigo_unique` (`codigo`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `servicios_empresa_id_codigo_unique` (`empresa_id`,`codigo`);

ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sucursales_empresa_id_foreign` (`empresa_id`);

ALTER TABLE `tipos_contingencia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipos_contingencia_codigo_unique` (`codigo`);

ALTER TABLE `tipos_documento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipos_documento_codigo_unique` (`codigo`);

ALTER TABLE `tipos_documento_contingencia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipos_documento_contingencia_codigo_unique` (`codigo`);

ALTER TABLE `tipos_documento_identificacion`
  ADD PRIMARY KEY (`codigo`);

ALTER TABLE `tipos_donacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipos_donacion_codigo_unique` (`codigo`);

ALTER TABLE `tipos_establecimiento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipos_establecimiento_codigo_unique` (`codigo`);

ALTER TABLE `tipos_generacion_documento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipos_generacion_documento_codigo_unique` (`codigo`);

ALTER TABLE `tipos_invalidacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipos_invalidacion_codigo_unique` (`codigo`);

ALTER TABLE `tipos_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipos_item_codigo_unique` (`codigo`);

ALTER TABLE `tipos_persona`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tipos_servicio_medico`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipos_servicio_medico_codigo_unique` (`codigo`);

ALTER TABLE `tipos_transmision`
  ADD PRIMARY KEY (`codigo`);

ALTER TABLE `tipos_transporte`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `titulos_remision_bienes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titulos_remision_bienes_codigo_unique` (`codigo`);

ALTER TABLE `tokens`
  ADD PRIMARY KEY (`empresa_id`);

ALTER TABLE `tributos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tributos_codigo_unique` (`codigo`);

ALTER TABLE `unidades_medida`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unidades_medida_codigo_unique` (`codigo`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_empresa_id_foreign` (`empresa_id`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_nit_unique` (`nit`),
  ADD UNIQUE KEY `usuarios_dui_unique` (`dui`);

ALTER TABLE `usuario_dte_tipo`
  ADD PRIMARY KEY (`usuario_id`,`dte_tipo_codigo`),
  ADD KEY `usuario_dte_tipo_dte_tipo_codigo_foreign` (`dte_tipo_codigo`);


ALTER TABLE `actividad_economica`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=882;

ALTER TABLE `actividad_economica_b`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=882;

ALTER TABLE `ambientes_destino`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `cajas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `cajeros`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `cajero_caja`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `certificados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `condiciones_operacion`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `departamentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

ALTER TABLE `domicilios_fiscales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `dtes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

ALTER TABLE `empresas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `formas_pago`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `incoterms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

ALTER TABLE `modelos_facturacion`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `municipios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

ALTER TABLE `otros_documentos_asociados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `paises`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `plazos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `recintos_fiscales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

ALTER TABLE `regimenes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

ALTER TABLE `retenciones_iva`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `servicios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `sucursales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `tipos_contingencia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `tipos_documento`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

ALTER TABLE `tipos_documento_contingencia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `tipos_donacion`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `tipos_establecimiento`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `tipos_generacion_documento`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `tipos_invalidacion`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `tipos_item`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `tipos_persona`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `tipos_servicio_medico`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `tipos_transporte`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `titulos_remision_bienes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `tributos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

ALTER TABLE `unidades_medida`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `usuarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE;

ALTER TABLE `cajeros`
  ADD CONSTRAINT `cajeros_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cajeros_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `cajero_caja`
  ADD CONSTRAINT `cajero_caja_caja_id_foreign` FOREIGN KEY (`caja_id`) REFERENCES `cajas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cajero_caja_cajero_id_foreign` FOREIGN KEY (`cajero_id`) REFERENCES `cajeros` (`id`) ON DELETE CASCADE;

ALTER TABLE `certificados`
  ADD CONSTRAINT `certificados_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

ALTER TABLE `dtes`
  ADD CONSTRAINT `dtes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE;

ALTER TABLE `productos`
  ADD CONSTRAINT `productos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

ALTER TABLE `sucursales`
  ADD CONSTRAINT `sucursales_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

ALTER TABLE `users`
  ADD CONSTRAINT `users_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

ALTER TABLE `usuario_dte_tipo`
  ADD CONSTRAINT `usuario_dte_tipo_dte_tipo_codigo_foreign` FOREIGN KEY (`dte_tipo_codigo`) REFERENCES `dte_tipos` (`codigo`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuario_dte_tipo_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
