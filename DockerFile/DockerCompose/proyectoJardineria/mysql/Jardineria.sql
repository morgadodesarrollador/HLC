-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 22-01-2021 a las 21:48:02
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.3.9
CREATE DATABASE Jardineria;
USE Jardineria;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Jardineria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Telefono` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LimiteCredito` double(15,2) NOT NULL,
  `Direccion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ciudad` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pais` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodigoPostal` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Codigo`, `Nombre`, `Telefono`, `LimiteCredito`, `Direccion`, `Ciudad`, `Pais`, `CodigoPostal`, `userid`, `created_at`, `updated_at`) VALUES
(1, 'DGPRODUCTIONS GARDEN', '5556901745', 3000.00, 'False Street 52 2 A', 'San Francisco', 'USA', '24006', 1, NULL, NULL),
(3, 'Gardening Associates', '5557410345', 6000.00, 'Wall-e Avenue', 'Miami', 'USA', '24010', NULL, NULL, NULL),
(4, 'Gerudo Valley', '5552323129', 12000.00, 'Oaks Avenue nº22', 'New York', 'USA', '85495', 10, NULL, NULL),
(6, 'Lasas S.A.', '34916540145', 154310.00, 'C/Leganes 15', 'Fuenlabrada', 'Spain', '28945', NULL, NULL, NULL),
(7, 'Beragua', '654987321', 20000.00, 'C/pintor segundo', 'Madrid', 'España', '28942', NULL, NULL, NULL),
(9, 'Naturagua', '689234750', 32000.00, 'C/majadahonda', 'Madrid', 'España', '28947', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gamasproductos`
--

CREATE TABLE `gamasproductos` (
  `Gama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Imagen` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gamasproductos`
--

INSERT INTO `gamasproductos` (`Gama`, `Descripcion`, `Imagen`, `created_at`, `updated_at`) VALUES
('Aromáticas', 'Plantas aromáticas', 'aromaticas.png', NULL, NULL),
('Frutales', 'Árboles pequeños de producción frutal', 'frutales.png', NULL, NULL),
('Herbaceas', 'Plantas para jardin decorativas', 'herbaceas.png', NULL, NULL),
('Herramientas', 'Herramientas para todo tipo de acción', 'herramientas.png', NULL, NULL),
('Ornamentales', 'Plantas vistosas para la decoración del jardín', 'ornamentales.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(102, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(103, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(104, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(105, '2016_06_01_000004_create_oauth_clients_table', 1),
(106, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(139, '2020_12_04_161006_create_productos_table', 2),
(140, '2020_12_04_163048_add__precios_to_productos', 2),
(141, '2020_12_04_190901_create_table__gamas_productos', 2),
(142, '2020_12_04_191257_create_table_clientes', 2),
(143, '2020_12_04_192026_add_direccion_to_clientes', 2),
(144, '2020_12_04_204502_create_table_users', 2),
(145, '2020_12_04_205120_add_fk_gama_to_productos', 2),
(146, '2020_12_04_211022_add_fk_clientes_to__users', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('01fed9983cbb87ff5ba8f7561420c9cbe16e317d4ae8591b82240199ef24dce55bbf1e699091f556', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-18 07:24:43', '2021-01-18 07:24:43', '2021-01-25 08:24:43'),
('05767086d38faddc42a8f8510f3363fe2246c80a82039bc3fb1330a989d6a20dce5ebc591277d8c1', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:48:15', '2021-01-19 21:48:15', '2021-01-26 22:48:15'),
('06bbab184e7b1ce71ac773f38f47b7c65fd39d37f0c80ad51454045fd2403b13c272e2aa24d49573', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 12:06:33', '2021-01-19 12:06:33', '2021-01-26 13:06:33'),
('07ad471cfb28fbaa9b7f675f740910cd4c88c0132a6a62b4de50305c50d62c6e63b3cd175ad3c07a', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-20 15:52:26', '2021-01-20 15:52:26', '2021-01-27 16:52:26'),
('0b74792c469ced36c5de7adf2863adc4c944bbe68d896a48f3933d43e55079b216040ae9668cacce', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:17:24', '2021-01-19 21:17:24', '2021-01-26 22:17:24'),
('105bd5a960ea8375a16cee32f85bff9c82616580e30ce7b0f4fc38390c29931bb4aa5d273065f43c', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 21:49:17', '2021-01-11 21:49:17', '2021-01-18 22:49:17'),
('10ef2f5448d24dc6f2ef35ed4bb559fc775d81f8782e366b1682149b0ca45fd941fc8c3afa37e8e1', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-20 15:51:07', '2021-01-20 15:51:07', '2021-01-27 16:51:07'),
('143b9ec6a69bc08a714a719a4f6a47c7e38f168ceff6f08eda86d84dbfc13e7bcbd41f997f436b84', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 23:00:40', '2021-01-19 23:00:40', '2021-01-27 00:00:40'),
('14fc7a24508d1985f782731e95242dc943359d75e98287d346ea4dee2cd5f802dbb092247b416084', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-21 07:17:54', '2021-01-21 07:17:54', '2021-01-28 08:17:54'),
('185b8075dcad7f7963a30952bf2279c426612c8380e5d859bc74f6a8d2840fee9f23e734849d8f08', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:43:39', '2021-01-11 22:43:39', '2021-01-18 23:43:39'),
('2879fdeb60f10f405a495f5273c2989759f30e424cc1c94a13fbe6c09feb0bfdc003b40d94ec7933', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 22:59:55', '2021-01-19 22:59:55', '2021-01-26 23:59:55'),
('2a64c6590aa531507a6ccc2ad323281763a4ab2592485ac1472fadbe7e6a1264e75693e755185091', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:42:31', '2021-01-11 22:42:31', '2021-01-18 23:42:31'),
('2b3506562ac47e826df11d7e55e866754355144f915767bcc95d698cf2f88b8e037b928f7629b81d', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:09:56', '2021-01-19 21:09:56', '2021-01-26 22:09:56'),
('2e06370cd8ec5952488695a7553e37d37ddce23b11ba68677f9bff4faecf9a0ca20ba9068feab587', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-18 07:33:06', '2021-01-18 07:33:06', '2022-01-18 08:33:06'),
('32a00b3f5d34062f4d94394c030b359fcebe8094016cdef11a17f5738e879869104164bea296725a', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:49:37', '2021-01-11 22:49:37', '2021-01-18 23:49:37'),
('3e13a0d8a20d56f35985152d7dc5a1bc57462be27fa3fc83e6647bf2f7f50b261f846226083174fe', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-12 12:29:17', '2021-01-12 12:29:17', '2021-01-19 13:29:17'),
('3e24a931398dfdb781e5c92e372737b143d7b4fc8b3d41322d8ff55b23b500b4e1e39191fcdd6dac', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-21 07:17:54', '2021-01-21 07:17:54', '2021-01-28 08:17:54'),
('43add2cf6e1b30890abf8482a4f362a16c5053acc100dd9fcb655c5b169a22f87c7f5437a18faf0f', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:17:42', '2021-01-19 21:17:42', '2021-01-26 22:17:42'),
('47f445893331adbc7bfa1b92d42ecd367872450e8d006f78eb83298c8d158feb7a13bae8571257f5', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-18 07:19:30', '2021-01-18 07:19:30', '2021-01-25 08:19:30'),
('4b7994bbb99faa85177ae172baa6af48b9c6bfee0aba42538e193664a5be80d411241d9069c91e94', 5, '9272c269-86a8-4220-b2d5-957ce9247238', 'task api', '[]', 0, '2021-01-12 12:02:57', '2021-01-12 12:02:57', '2022-01-12 13:02:57'),
('4d9c46a21235f6a96005b7aef8b1fef862938e4fcb36c502c743828fc48304d8908e11356aed6ac3', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-20 15:50:39', '2021-01-20 15:50:39', '2021-01-27 16:50:39'),
('4dedb885351e70864b9c62b56f346c196300d394bb749e7591cd4822e93f968f9643c7ea95637240', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:33:53', '2021-01-19 21:33:53', '2021-01-26 22:33:53'),
('4f741ea0034307a7520b992c2f6948789e7cf63cc42d438a224909708f8dec321fe33ceb80d6109d', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 22:34:18', '2021-01-19 22:34:18', '2021-01-26 23:34:18'),
('5417d5437f2c557d6b66c458d23342d1d9010c36ad154252ccf04812c66877dfc8c227db24671db6', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 15:41:48', '2021-01-19 15:41:48', '2021-01-26 16:41:48'),
('544ea3e8802b7c96d3001135fd6c614e68d9bc9ea5f903b5f975155857b95027f90dd90f50009fb0', 3, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-12 10:50:08', '2021-01-12 10:50:08', '2021-01-19 11:50:08'),
('5e5b8fd2715617a2124a7298abbd1603a6b72c9087c183e8b9ba79200df2af4aa79b9200a068cc2b', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-20 15:10:17', '2021-01-20 15:10:17', '2021-01-27 16:10:17'),
('638c0366eea81ef7822b756b6fde04dbce69d08d5163b11762b47a2dd618b147ae86b1311e3da3c7', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-12 10:52:26', '2021-01-12 10:52:26', '2021-01-19 11:52:26'),
('6405c4e9db5fa1a622733a3dea32f5732478c30566add7b9ff5a26dd5dab898714b8c0f3ab0a5fa4', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 10:49:58', '2021-01-19 10:49:58', '2021-01-26 11:49:59'),
('641ec816392893026a593be28a80d588467ef5fb266119807c434e1a15b0f3e9f85f5b380878c040', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 15:15:42', '2021-01-19 15:15:42', '2021-01-26 16:15:42'),
('6465f451fc7355e154a8e906dea547bf2fdce2cc0b297747328c5365987eb8c8b6341ca36f848a8c', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 22:53:25', '2021-01-19 22:53:25', '2021-01-26 23:53:25'),
('648312f4bed04bbd38f830a647e8d00b2e047d52ead4912918381e2fd4ab99f872a6364ebc58401f', 10, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 12:13:43', '2021-01-19 12:13:43', '2021-01-26 13:13:43'),
('66c57d8d38f86638c634302c1fe642f043c63539190426c81e1930e333301ac2e3672d932f9fdace', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 1, '2021-01-19 11:02:34', '2021-01-19 11:02:34', '2021-01-26 12:02:34'),
('6f7d2f8309c025262a3c0ec78c0eb3614cf9cb49c4c3fcc1bdb2cf7e008f75fd574df472d41a7b18', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 23:02:17', '2021-01-19 23:02:17', '2021-01-27 00:02:17'),
('7382050a78b22d7bf8f421ae3e2f4c34c63ec1f048db6b73fe62541bfac91b6afe1557e06c21d854', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:50:00', '2021-01-19 21:50:00', '2021-01-26 22:50:00'),
('73be788d8e70cba2ea0ba4e7f3613798d9ad245f852ebc506e2487e3d6381b36680953599e592ae4', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:18:35', '2021-01-19 21:18:35', '2021-01-26 22:18:35'),
('745faa445107ff5dba204f9e4f732d9ae4793ea834ae56cbea36f49038079314633caaf751ab088d', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 15:17:38', '2021-01-19 15:17:38', '2021-01-26 16:17:38'),
('7a1c75f08919c0aac46d23cad2d4ed7afff919283fdd567d707045fd6c11fa7fa2b085204602c7f7', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 22:53:58', '2021-01-19 22:53:58', '2021-01-26 23:53:58'),
('80403643eaeddbddec9849c98085b8c845a6ece039d8b38ba3eae78617406e17e72b99b19edd8b21', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:34:53', '2021-01-11 22:34:53', '2021-01-18 23:34:53'),
('80e6a5e1b6a5dad8e3307564628766c1907c6464128f64ef8d4bf22d83779cda5366f3cf465f11a2', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 16:00:16', '2021-01-19 16:00:16', '2021-01-26 17:00:16'),
('84312ee3860baff1acc82cfeb2b03cab51e5c888d167f3425d4d14563c8206d7a9f1baeccaac3eca', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 19:19:50', '2021-01-11 19:19:50', '2021-01-18 20:19:50'),
('8b53c1b7db7cc34e19d68ec3e5a42262d68b303233c57585ba7d602d9d08e782b29288ba1e00f28a', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:18:18', '2021-01-19 21:18:18', '2021-01-26 22:18:18'),
('8ba7fd89e6c6d2c708c2531eaf9af1377a2e037553c8d2764820334507cadaa159983c3305952397', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 21:32:17', '2021-01-11 21:32:17', '2021-01-18 22:32:17'),
('8db64b2899c122aeac9e0789e9ba4b0a27f9e4270c7506de9482c512dda0eb11f8ce55557be5d3af', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:18:32', '2021-01-11 22:18:32', '2021-01-18 23:18:32'),
('8e005d81e75c175a33d92d79c0a9200f9ec3a9de5ba8ecc734e4a2e2e04909b22b6e8dd4a258e725', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-18 07:42:13', '2021-01-18 07:42:13', '2022-01-18 08:42:13'),
('8f794e991aa1d1ae9a1969268a5e2f79e71763ca99aa5c1a14ef9f444ae661ab80cd83dc5892cc51', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:28:36', '2021-01-19 21:28:36', '2021-01-26 22:28:36'),
('8f8809f930f4bdc3c01af1a5f752daf6768c332edd34432a05d3afc0b80e1af1053c6a80a79e07bc', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:45:34', '2021-01-11 22:45:34', '2021-01-18 23:45:34'),
('90c334b8a898781d754356efcc8093c9ccf033a1ccae3634a5e5c9cf0dadb09dcd6d8772d749a69c', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-21 07:17:54', '2021-01-21 07:17:54', '2021-01-28 08:17:54'),
('92992e11292f5c36dc3543fd3fe39474ecb8e7893e2a33b4fe855f1b5c078f7ac12843c43e5007f7', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:47:25', '2021-01-11 22:47:25', '2021-01-18 23:47:25'),
('93ea2f672ea8da8847accb42be99054a1fbb23ef7699f8dc85b93176f8f79d33f0cc50786cfa9927', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 21:47:53', '2021-01-11 21:47:53', '2021-01-18 22:47:53'),
('97698e65de86fbaa435e2306d6893fc65a17510017bf232221e9ff12d756ad2889a6923708539b84', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 12:08:46', '2021-01-19 12:08:46', '2021-01-26 13:08:47'),
('a5ecbc6302b35b0685c8d99fea4f03c2b1c16453bab7289f9bedd0bae5b6a13d3049728d21fa2f8e', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:30:01', '2021-01-19 21:30:01', '2021-01-26 22:30:01'),
('a9a5785314f402a8c2776d4a9983719963b257503eba59b4e6bf922b5c6c019200e6c9c33b8554ce', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:09:27', '2021-01-19 21:09:27', '2021-01-26 22:09:27'),
('aa268c501e721466540165648dab278a79dbb4df9179690666070ae56628947e4a8ac90c65502985', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:36:59', '2021-01-11 22:36:59', '2021-01-18 23:36:59'),
('ab8abfb9188489748e37f4bcb0c88828890d79514137518451521f38f5deeb8f5d0758a636cb3350', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 22:50:57', '2021-01-19 22:50:57', '2021-01-26 23:50:57'),
('abfefda1570b541e516136a26e5dfcc2c2352dbd06cc5f97a8462b2a94acfed98ba68be541f8a171', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:18:07', '2021-01-19 21:18:07', '2021-01-26 22:18:08'),
('ad2b67b948afba9e3aa62964558ae24e668e21794e55677e28a0d14010f2f36d7b16d73a98410a5b', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-20 14:59:36', '2021-01-20 14:59:36', '2021-01-27 15:59:36'),
('af472108f520dcc58f5b85758f5cc3300233769161eb774143fb0f6b01b24059fc9ae36cc7491581', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:49:09', '2021-01-11 22:49:09', '2021-01-18 23:49:09'),
('b2e53debb50109f688a319384fc332ecabfd74d5e49cd9a58416376a3cf9b21d7560600176de78b8', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-20 15:20:40', '2021-01-20 15:20:40', '2021-01-27 16:20:40'),
('b420440a1f4b27400c5109d8c35776363d145412922e8ee82bdb8ce392d40eb9453c7f5b7f32a115', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:42:22', '2021-01-11 22:42:22', '2021-01-18 23:42:22'),
('b90f74530f4a70b7fd740159a17a330f5809c5f45dadbf5727413f5a0d61cddc06a488c70c2b7f62', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:08:38', '2021-01-19 21:08:38', '2021-01-26 22:08:38'),
('ba33e0de5d6f24b1649ab4fb98ba43202cbdd97060df59e68c5d5524bafd1a0e929ba16f9cc0a577', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:42:49', '2021-01-11 22:42:49', '2021-01-18 23:42:49'),
('bc9b86a2ebcd1f7bc8f3484246ac06983f7095ad8755b4703bc9484f21be2b5cc0941fc751ec8a49', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-18 07:48:13', '2021-01-18 07:48:13', '2021-01-25 08:48:13'),
('c0dc035030faf3cb9705338188c61bcead4367eeb85f1bf0cde943d6e6e5e85aeae16e18672771dc', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 12:09:33', '2021-01-19 12:09:33', '2021-01-26 13:09:33'),
('c3cb7c6247c8a1ec1d71a363b52c34076ab7471a05aeff72921b5e340460ab6eeee432347287c103', 10, '9272c269-86a8-4220-b2d5-957ce9247238', 'task api', '[]', 0, '2021-01-19 12:10:54', '2021-01-19 12:10:54', '2022-01-19 13:10:54'),
('c56c42c43568c39d1bb1309d7890bfa97c5c93100f475ea4308b6c264332e9bd4ecc11848028d2d5', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:43:22', '2021-01-11 22:43:22', '2021-01-18 23:43:22'),
('c9482e5989fcb9da52261a059dc873b561507a5c04d16eb257af2834ebfff44144be551d6df3a909', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:14:05', '2021-01-11 22:14:05', '2021-01-18 23:14:05'),
('c9b01c114047ee7d9302baf7e8fca7a38b6c826b10aa81001f0c540fad92839f9aee7a6650b90dba', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:55:52', '2021-01-11 22:55:52', '2021-01-18 23:55:52'),
('cc83307622afe121866cf1dfda8b61bb514113bf755b367e01a90ced110a1803b2cdccacac29a1f1', 10, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 12:15:04', '2021-01-19 12:15:04', '2021-01-26 13:15:04'),
('cdd1a6b6bfef4011e8a78e61a66ba9b71ed51c7f22e52c7e834bebc45b55121cd26fee77d9507be8', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'task api', '[]', 0, '2021-01-11 22:48:58', '2021-01-11 22:48:58', '2022-01-11 23:48:58'),
('cf25da03602eedd1d5671f5e64d89ec177e0897072f9525aa105e3a20fdd038c87a83c0e394889a2', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 23:02:32', '2021-01-19 23:02:32', '2021-01-27 00:02:32'),
('d4cbe20183ec6b669f0053ee510fbd9bbfcee21bee10155608eb698f6441689a0f02b1815890f785', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:32:26', '2021-01-19 21:32:26', '2021-01-26 22:32:26'),
('d900990eef39f007de1d16c24a90c47f65448392fb59f30b5b0bf1ffb59118e6f23a74adc4537374', 3, '9272c269-86a8-4220-b2d5-957ce9247238', 'task api', '[]', 0, '2021-01-12 10:48:01', '2021-01-12 10:48:01', '2022-01-12 11:48:01'),
('e26cb393b0b131330b3a8544c5213ad3d8e96eb862638da1a0f958500fb471eabd33079dd6f91940', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:48:42', '2021-01-19 21:48:42', '2021-01-26 22:48:42'),
('e3c127e6e60bb6f7f57a366738e95c126a1a441380424a196599e067083c098324f408345e788814', 4, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-12 12:27:29', '2021-01-12 12:27:29', '2021-01-19 13:27:29'),
('e7b6396e6ef0dd1982e670044ca34b4081d1ca70f7f51d625979d14eaaf44b7bb8de316b7a553393', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'task api', '[]', 0, '2021-01-11 19:18:37', '2021-01-11 19:18:37', '2022-01-11 20:18:37'),
('ef4e5fd641848b77defa90ef8ffb068f57daa044bc184489104388af781e8f1a3ac13732b50a50d7', 4, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-12 12:26:32', '2021-01-12 12:26:32', '2021-01-19 13:26:32'),
('f82393155b791ee5524b4c140e18c4eb7de567fbdcb13c4f5d430dae89f02a6b3b13e758d0a038d5', 2, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-12 10:53:00', '2021-01-12 10:53:00', '2021-01-19 11:53:00'),
('f9a3015b701090e0fb20a6468f85f79e456d6ddafb130a4481709d7a816cd85b18026e3f5080bb08', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-19 21:11:00', '2021-01-19 21:11:00', '2021-01-26 22:11:00'),
('fb492a0cc8c2475f1cc501cbe3fc787c38e9c0c6839c5db5a4151c5da025f0975680aa69ffcc8d34', 1, '9272c269-86a8-4220-b2d5-957ce9247238', 'Personal Access Token', '[]', 0, '2021-01-11 22:40:28', '2021-01-11 22:40:28', '2021-01-18 23:40:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9272c269-86a8-4220-b2d5-957ce9247238', NULL, 'Laravel Personal Access Client', 'HHTSgfin2TAUwQanbZpQIPeUXFVAIhpygYFMKVqy', NULL, 'http://localhost', 1, 0, 0, '2021-01-09 17:10:56', '2021-01-09 17:10:56'),
('9272c269-9386-470d-8568-316b223edd04', NULL, 'Laravel Password Grant Client', 'ixLORE2WAmaROQykEoX6kPdlgeGcc0VV2KvFR69e', 'users', 'http://localhost', 0, 1, 0, '2021-01-09 17:10:56', '2021-01-09 17:10:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(9, '9272c269-86a8-4220-b2d5-957ce9247238', '2021-01-09 17:10:56', '2021-01-09 17:10:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `CodigoProducto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Gama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Proveedor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `CantidadEnStock` smallint(6) NOT NULL,
  `PrecioVenta` double(15,2) NOT NULL,
  `PrecioProveedor` double(15,2) NOT NULL,
  `imagen` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `rol` enum('invitado','usuario','gestor','administrador') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `rol`, `name`, `surname`, `email`, `password`, `image`, `created_at`, `updated_at`) VALUES
(1, 'usuario', 'antonio', 'sanchez', 'antonio@gmail.com', '$2y$10$A13qOlV28qkRforNIDXsgeDTlmAyd7uSw7TqQzChi981.0tJesCZS', 'antonio.jpg', '2021-01-11 19:18:37', '2021-01-11 19:18:37'),
(2, 'usuario', 'Claudia', 'Fuentes Laroya', 'claudia@gmail.com2', '$2y$10$4OndWsNX5EnDVmfEqy25qewj8cTmQumhzq5RLWFIDcPcEcmwJkGJG', 'claudia.jpg', '2021-01-11 22:48:58', '2021-01-11 22:48:58'),
(3, 'usuario', 'Domenica', 'sanchez', 'domenica@gmail.com', '$2y$10$c.sl0GLLVNdnS4v.UnHhPuOfbrdDkMnUOyjdQCKZEjUQM1/YaEtzC', 'domemnica.jpg', '2021-01-12 10:48:01', '2021-01-12 10:48:01'),
(4, 'administrador', 'morgado', 'sanchez', 'morgado@gmail.com', '$2y$10$1/eQ2VD1EstEUkujUhY5/eKVNaE3umGzX6QvICyoZwq8.ES0EE3Qa', 'morgado.jpg', '2021-01-12 11:30:19', '2021-01-12 11:30:19'),
(5, 'administrador', 'morgado', 'sanchez', 'morgado@gmail.com', '$2y$10$s.DQvWtv/oCEUSSqjsQyLesIbrcoUvObS0J0UyAYyfjUZBdZ4zlS6', 'morgado.jpg', '2021-01-12 12:02:57', '2021-01-12 12:02:57'),
(10, 'administrador', 'pepito', 'garcia', 'pepito@gmail.com', '$2y$10$ctrF89N8.h0QhRObdbdgUuonRqcYGGCrprY.AsQWL./HY32SvTzGG', 'garcia.jpg', '2021-01-19 12:10:54', '2021-01-19 12:10:54');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `clientes_userid_foreign` (`userid`);

--
-- Indices de la tabla `gamasproductos`
--
ALTER TABLE `gamasproductos`
  ADD PRIMARY KEY (`Gama`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`CodigoProducto`),
  ADD KEY `productos_gama_foreign` (`Gama`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_userid_foreign` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_gama_foreign` FOREIGN KEY (`Gama`) REFERENCES `gamasproductos` (`Gama`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
