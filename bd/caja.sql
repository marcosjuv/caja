-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2023 a las 22:21:14
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
-- Base de datos: `caja`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caja` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `is_rrss` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierres`
--

CREATE TABLE `cierres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supervisor` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `monto` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cierres`
--

CREATE TABLE `detalle_cierres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cierre_id` bigint(20) UNSIGNED NOT NULL,
  `caja` varchar(255) NOT NULL,
  `supervisor` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `cajero` varchar(255) NOT NULL,
  `tasa` double(8,2) NOT NULL,
  `efectivo` double(8,2) DEFAULT NULL,
  `punto` double(8,2) DEFAULT NULL,
  `transferencia` double(8,2) DEFAULT NULL,
  `pendiente` double(8,2) DEFAULT NULL,
  `cash` double(8,2) DEFAULT NULL,
  `zelle` double(8,2) DEFAULT NULL,
  `premium` double(8,2) DEFAULT NULL,
  `monto_total` double(11,2) DEFAULT NULL,
  `diferencia` double(11,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(92, '2014_10_12_000000_create_users_table', 1),
(93, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(94, '2019_08_19_000000_create_failed_jobs_table', 1),
(95, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(96, '2023_07_25_140344_create_cierres_table', 1),
(97, '2023_07_25_140409_create_detalle_cierres_table', 1),
(98, '2023_07_25_193858_create_cajas_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `card_id` varchar(255) NOT NULL,
  `is_supervisor` tinyint(1) DEFAULT NULL,
  `is_rrss` tinyint(1) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `card_id`, `is_supervisor`, `is_rrss`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Marcos', 'Urdaneta', '14278228', 1, 0, 'marcosjavieruv@gmail.com', NULL, '$2y$10$8Q93ewFtl/ukyhbrJ4ri3uslrYoxkcbVwtdJ9dDcMnVkv.8Iy98Jq', NULL, NULL, '2023-10-01 16:07:37'),
(2, 'Sharon', 'Tomas', '14420459', 1, 1, 'stomas@gmail.com', NULL, 'v14278228', NULL, NULL, NULL),
(3, 'Bill', 'Gates', '1641438', 0, 0, 'bgates@gmail.com', NULL, 'v14278228', NULL, NULL, NULL),
(4, 'Tony', 'Stark', '3109999', 0, 0, 'tstark@gmail.com', NULL, 'v14278228', NULL, NULL, NULL),
(5, 'Freddy Franecki', 'Davis', '3305208', 1, 1, 'dina92@example.com', NULL, '$2y$10$xcTRR5QE0NeJ0EHkSJwKse42CoJEqhjWNWhDLUc/N4t4GQFnvpZq6', NULL, '2023-09-20 20:53:21', '2023-09-20 20:53:21'),
(6, 'Dr. Ewell Hartmann Jr.', 'Shields', '87491735', 1, 1, 'bailey.ethelyn@example.net', NULL, '$2y$10$wrZ3HO2jWjcbFqsJou15F.HlOEmv7gtHE5dXnSMgHlFB4hzda.bjq', NULL, '2023-09-20 20:53:21', '2023-09-20 20:53:21'),
(7, 'Prof. Conrad Renner', 'Beatty', '81407384', 1, 0, 'frank44@example.com', NULL, '$2y$10$3YSpXP5dJYU9yP0qGRkU/uXtdxN09PrY5rJoybzBWqavOwaDsW8ZW', NULL, '2023-09-20 20:53:21', '2023-09-20 20:53:21'),
(8, 'Lora Mosciski', 'Zemlak', '89146823', 0, 1, 'cschuster@example.org', NULL, '$2y$10$sjXEYIWXl0s0KLm2ddPbQO5v2ukvuX8bgNDmWENbIUgXwKSXzhrbW', NULL, '2023-09-20 20:53:21', '2023-09-20 20:53:21'),
(9, 'Raymundo Hickle', 'Donnelly', '40357051', 1, 0, 'droob@example.org', NULL, '$2y$10$aX0VySEllFJimXKnohcvRuNVIdQE6zvmurIx1cNN21trLEVEA1IPq', NULL, '2023-09-20 20:53:21', '2023-09-20 20:53:21'),
(10, 'Arielle Monahan', 'Hyatt', '98473019', 1, 0, 'genoveva.dare@example.net', NULL, '$2y$10$7r5UVkWtbmoIpxkWV8DR9ePC6zX57TfZXjcq2I1Sooq12Jgl.M2Nq', NULL, '2023-09-20 20:53:21', '2023-09-20 20:53:21'),
(11, 'Cathryn Hand', 'Harvey', '12117438', 0, 1, 'doyle.suzanne@example.com', NULL, '$2y$10$nA4PHUJEJ3Udp76DWRoO4e0Gnqnj5Msl0oRyXOYW1z//eJH8v6d4i', NULL, '2023-09-20 20:53:21', '2023-09-20 20:53:21'),
(12, 'Prof. Doris Brown', 'Stiedemann', '23981697', 0, 1, 'terrence.reichert@example.org', NULL, '$2y$10$ZzV/HuZ/WFNe.WGP9lnhpeyIHY.ElGJc9fxnSE9e/f7oYuV8oOJgq', NULL, '2023-09-20 20:53:21', '2023-09-20 20:53:21'),
(13, 'Jacinthe Lemke', 'Monahan', '79000344', 1, 1, 'ybarrows@example.org', NULL, '$2y$10$X488kwxFYx9dbPdL5Zv8EOEeiQq4R.DyVyUTQnjAeK8ORXLnVGG1q', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(14, 'Dr. Scotty Hirthe', 'Kuhic', '38088401', 0, 0, 'kdare@example.net', NULL, '$2y$10$Wt20aapBow.uQ1thdNWsueG5lzZ53mqgDBcLfme.W.31b4vyDxJHO', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(15, 'Mandy Romaguera', 'Quitzon', '61682412', 1, 0, 'nels12@example.org', NULL, '$2y$10$Q2qK9cEmkEKFYOqDynWT4Otdbz1yXAe3TC5avyR2NlwNqmJR7f7/y', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(16, 'Prof. Monserrat Boehm', 'Deckow', '26582889', 0, 0, 'whilpert@example.org', NULL, '$2y$10$N9r1RV69xl63wifRYk4RQOZlRXHsUelcAhAkX0aPXS4W0TAaN8sqG', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(17, 'Dr. Max Douglas', 'Borer', '25631631', 1, 0, 'davon36@example.org', NULL, '$2y$10$gfkLK.66TN2IND8BhSBSGOgmTCw/bLV25d5Zdnt63ZYXSMOC/EcLK', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(18, 'Rodrigo Waelchi', 'Volkman', '59800637', 1, 0, 'lorena70@example.org', NULL, '$2y$10$qHK9sCdKm7md9tRc798DAuqbhoLpHUT1DxOtId0RXNUSFbqkjTqey', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(19, 'Prof. Arjun Hickle Jr.', 'Greenfelder', '1830831', 0, 0, 'parisian.brennan@example.net', NULL, '$2y$10$uqBwYCXe3TRS3/E.H5msW.SkxL8/JaYsNilYLbGD7G3Jfm1CMbOo6', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(20, 'Roxanne Cummings', 'Casper', '29667467', 1, 1, 'thackett@example.org', NULL, '$2y$10$95wnwc16yQsA8U3IB/0PVeKs5avHO7PxgFJ8/jQGyZ22VeCBTQZQi', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(21, 'Mallie Morar', 'Beier', '11082348', 1, 0, 'harris.royce@example.org', NULL, '$2y$10$ojRzcQBmxw8QHoWJQfh24..niSVr2XZbjwxpfWw/53spOxUKzgtzi', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(22, 'Ms. Tamia Jacobson DVM', 'Purdy', '27486001', 0, 1, 'jonathon.hagenes@example.com', NULL, '$2y$10$Usq6XREeAmKbpLJ.nJMXx.SrnlgfvkQen28d/Iftkadczk5XQvKe.', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(23, 'Ms. Estella Strosin', 'Bernier', '26351869', 1, 0, 'kertzmann.lon@example.com', NULL, '$2y$10$6px7YEBd5KP2z2XcPx/vHuvUup03bK7nIeG78PcsP3pqJku6oBlWi', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(24, 'Dr. Martin Cummings I', 'Batz', '35899251', 0, 1, 'altenwerth.earnest@example.net', NULL, '$2y$10$43Z1VFuF/bLPfSyfKlNBCOHjjP2FxAxUpG858sECaxO5ZYetivutO', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(25, 'Penelope Schuppe', 'Cummerata', '22058889', 1, 1, 'landen.senger@example.com', NULL, '$2y$10$CwAhZCGYxCJ0Hk/iqhI5COrQupiuKOCXcjnZrp4E2t0.87Kwhs0.e', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(26, 'Fidel Bayer', 'Beahan', '52894125', 1, 1, 'preston.aufderhar@example.net', NULL, '$2y$10$ExL4fAfe.5Yk/bLvkfNake1mOX88Jietu8rPCV7eOm/KsU3Ue8/pO', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(27, 'River Miller', 'Morissette', '53622516', 1, 0, 'telly33@example.org', NULL, '$2y$10$lCdvaXJK2Hn1G2C8rlIZN.SOHxsiUit19v3vAkwX8j6N7E0LsosMK', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(28, 'Pauline Kub', 'Tillman', '78444341', 0, 1, 'xgrimes@example.org', NULL, '$2y$10$U1UXYCh6LKKqjLp6lyXdRulj2tsiigQ/6Xb81daAKT2CFDuz5luJi', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(29, 'Kaylie Ratke', 'Bruen', '3403750', 1, 1, 'deontae.okeefe@example.net', NULL, '$2y$10$rcNm6S2fojeFn8XVdPrOsO/SQNjG5u7cuPJs.MJoStpg.qtDcD5kC', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(30, 'Mr. Reymundo Trantow II', 'Wehner', '16168544', 0, 0, 'vena55@example.com', NULL, '$2y$10$zDtN/C/Imascacb1R4c0Duyrw1zj2aFRAuTMb0Ez.2UAPP1x/0sAG', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(31, 'Reese Erdman', 'Lebsack', '28469846', 1, 1, 'grady16@example.net', NULL, '$2y$10$OD6r8WbDlHMPbGdLFGOoWOxOjgMmIJ7P4IB6ngxUmlYyUQwbY9GzK', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(32, 'Marjolaine Schowalter', 'Nienow', '85055989', 0, 0, 'benjamin91@example.org', NULL, '$2y$10$ME2bgQt/.LZU.0XcFo14J.so05GgevQ0hJy20A32z8ODp0gX7FLBm', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(33, 'Prof. Elinor Becker', 'Graham', '17576465', 0, 0, 'bklein@example.com', NULL, '$2y$10$nC0rV.zcX.D.4fwmus0/sONGqVfjflHHXg4HW4RoxzYR4G.W9oHPq', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(34, 'Laury Bogan', 'Koch', '12174709', 0, 1, 'schimmel.dianna@example.com', NULL, '$2y$10$RU9zPu2FXel98.WkzvUyEOt9Z7a3hg/f.S7AxEXLElDAghA2xK/1C', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(35, 'Heber Green', 'Gleichner', '647624', 1, 1, 'wwilderman@example.com', NULL, '$2y$10$kZOpv0xIknsP3kOLbN8yNeWdcDzQXtV3b7CcISycawIMSLQMUavIa', NULL, '2023-09-20 20:53:22', '2023-09-20 20:53:22'),
(36, 'Marisa Mraz', 'Hand', '76443607', 1, 0, 'bins.ryley@example.net', NULL, '$2y$10$hyEz215cO2t8Ygi0a6eAqOhz5Dy21qLyMhOWHJQcBimUJY9vAyBA.', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(37, 'Prof. Verona Dicki Jr.', 'Prosacco', '65747524', 1, 0, 'bettye64@example.com', NULL, '$2y$10$RPive0g5z8bVz/6IUS9uQ.wpfJa5JGiX2PZjvUEJapaOZeoGP0GHS', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(38, 'Prof. Evie Mante', 'Cremin', '8879970', 0, 1, 'epadberg@example.org', NULL, '$2y$10$00C30kvXwivb6Pag1/2JSeykL4fsbrrWDszOPJuemZ2w0qfc.FRba', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(39, 'Dr. Brice Schowalter', 'Mayert', '70923084', 1, 0, 'ugaylord@example.org', NULL, '$2y$10$NllriNGRQtopXJR9/CpR9uKNtgEjRFeDpO4QosohYmNcVsI6atRBa', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(40, 'Xavier Prohaska', 'Armstrong', '76982486', 0, 0, 'octavia25@example.net', NULL, '$2y$10$jvFmeSj1k87GR7ej6TXrlumoAF9q791ckrOS68vlejCp5rrUQXyaW', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(41, 'Mrs. Agnes Stiedemann PhD', 'Herzog', '2194764', 0, 1, 'granville.heathcote@example.com', NULL, '$2y$10$V4nJAN9kOklpcu67psR6W.HxH5Lr0Cy4myCntE02Dkj.1NiKpxXBO', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(42, 'Amaya Daniel', 'Rempel', '41982566', 0, 1, 'gussie53@example.com', NULL, '$2y$10$KrTFLekoUvaGxx.1IDv9HOJ32iEHJ5Jt7YsZ02jHw4dzgSdjINYey', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(43, 'Katelin Christiansen V', 'Emmerich', '7322671', 0, 0, 'veum.randal@example.org', NULL, '$2y$10$1gyWjjOfcDyBhGVxIzZ/Oe8OgxUKupn/eUTbtqa4E9wax64ZjWpKm', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(44, 'Shayna Gislason MD', 'Nitzsche', '93586047', 0, 0, 'dicki.jensen@example.org', NULL, '$2y$10$E5q97aSQPVugJqh7j4z/M.ze7viX.Rf0I2jLaijJ.FC16ypc3tGT.', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(45, 'Mr. Khalil Runte V', 'Pfeffer', '41795049', 0, 0, 'monahan.sabryna@example.org', NULL, '$2y$10$XSTuJo2.aBEZzSg2C9gLj.Cx7qtXbNBuNQ0LEhVQPzTEw4D06cHYy', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(46, 'Ollie Conroy', 'Kuhlman', '17557250', 1, 0, 'adams.elza@example.com', NULL, '$2y$10$Qn0wVPExEsC96kYgYbXD9Ov7paux9aEd7mG6zsDMHa0GXvLgDJG52', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(47, 'Mrs. Otilia West', 'Glover', '32154228', 1, 0, 'matilde.stark@example.net', NULL, '$2y$10$VnxTiKjcACVvvx1Q/zMFRucKDM14PNT3Bat0AYePvMZhwodrN3uve', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(48, 'Colt Kub Sr.', 'Wehner', '43430603', 1, 1, 'virginie10@example.com', NULL, '$2y$10$zTsTbQZoPG/c/pfFJC542.hM3K9stDbpGqMS99sX4Ow9loD4A7G2e', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(49, 'Kayla Schoen I', 'Hamill', '59807813', 1, 0, 'bailee27@example.com', NULL, '$2y$10$Mr4KhxrHzkyNsm4Xu5apUusYvUsI2NKX4dSwh/bHJPYn7H1lzQP02', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(50, 'Hailey Koch III', 'Yundt', '55333142', 0, 0, 'schinner.jarod@example.org', NULL, '$2y$10$YHwyYBkYrBRW8SV0kka3N.Y.vyP0FEbxuPz9zaLiNGXRpKzGARntC', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(51, 'Jaiden Hayes IV', 'Lubowitz', '3317599', 0, 0, 'schneider.william@example.net', NULL, '$2y$10$f3Q8DFG7l0n/8W92ybraQuD7UeVS34jytWFL2lm9SM9u3D8AcfElK', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(52, 'Vincenza Stracke', 'Kulas', '10057852', 0, 0, 'jovany.nikolaus@example.org', NULL, '$2y$10$UN5pmBiTsvHtZUb07L5N.u8Krzyy27L/fwgyDaiVsKyDDxWxOGjRq', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(53, 'Milan Franecki', 'Simonis', '1447125', 0, 0, 'weston.kutch@example.net', NULL, '$2y$10$jqC3LURU3wRPVu/NYO6KJOFXH6ShGOxEipsjVKDuab4pblyX7fHQO', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(54, 'Marley Goyette', 'Rau', '12885499', 0, 0, 'gohara@example.net', NULL, '$2y$10$A/2c0yqiGYvdA7xrAf/elOosHRfe6Mf1UF1H0m1NTm/YTFGzTAb7.', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(55, 'Mr. Coby Ernser V', 'Bernhard', '40899668', 1, 1, 'hirthe.stephon@example.org', NULL, '$2y$10$CcM04n5HJLfUTnyfDWU54u3eM3RygApINCXEG/UuwgDYvcaTlnY5u', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(56, 'Miss Clemmie Metz Sr.', 'Hodkiewicz', '86254407', 1, 1, 'xsimonis@example.com', NULL, '$2y$10$FUZCHGxkM9GwC9YKus38POU2XGKSWY3B5bMeUHSy70OpZ/0N9licW', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(57, 'Velma Kuhic', 'Kuvalis', '36272336', 1, 1, 'adalberto.koss@example.org', NULL, '$2y$10$NNPsGsjLr18B2f3iO14Y3e3YsGoBuDUK37XLpp1SSQRL5Riw4q8by', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(58, 'Syble Gleichner', 'Tillman', '397498', 1, 0, 'kolby09@example.org', NULL, '$2y$10$D85hmCo3PCAFYT7nXcMwr.PRvfPqb3Ggp8l.zD0kqIM7MSeDtdOfK', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(59, 'Miss Rosamond Abernathy PhD', 'Bruen', '32993210', 0, 1, 'kcrist@example.net', NULL, '$2y$10$f3y9BqVw3a97Wr5BWI5bbevZAg59hnorEsSkdyo/mdK6aPyyz5Fna', NULL, '2023-09-20 20:53:23', '2023-09-20 20:53:23'),
(60, 'Jaylen Armstrong', 'Gerlach', '49238683', 1, 0, 'ferry.telly@example.com', NULL, '$2y$10$8awUBxUh0sCZCOn.mwZlbe86Z85UxGgoSXLPqy5ep5duJux9tJSMC', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(61, 'Electa Schmeler', 'Schuster', '15304614', 0, 0, 'kerluke.antwan@example.com', NULL, '$2y$10$hVCJa26mq7v84HFGoAzO..gegeifOgw4Le3RUCW3ToIFmaM8WvokO', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(62, 'Domenica Kshlerin', 'Kutch', '14988765', 0, 0, 'clarissa.green@example.org', NULL, '$2y$10$dR/oy32dTb4TY/a0rtxuHuF4Fyor0xUSAT5f6GMHYn21WkHRskExm', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(63, 'Lexie Lemke', 'Kling', '5817145', 1, 1, 'mraz.jacky@example.org', NULL, '$2y$10$1Ft2gymrhgMdiGAhedi0teITDRcwyn/CA68sgGkeQ9Vp840ypMmBO', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(64, 'Alanis Hansen', 'Toy', '79466913', 0, 0, 'providenci63@example.org', NULL, '$2y$10$sK2EuyP0v8d.HF1Bx.cAoOOHpSLf9nuzvFV6fNjQp0B2jQ7casPUS', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(65, 'Margie Balistreri', 'Hoppe', '38495968', 0, 0, 'caterina.jacobs@example.net', NULL, '$2y$10$fH0/xfkHB3fjCnq0A/zj3OwAkH2vSH27yc7fZZ.Uz1th4BFt9F2Uu', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(66, 'Sydni Beer', 'Hodkiewicz', '50556920', 1, 0, 'kristina62@example.org', NULL, '$2y$10$p7Cm1LdTee1ZoUQGD/CmKOp6TDH/ruy8DJBelG11Dje6HHbXhrbdm', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(67, 'Evalyn Hilpert', 'Dietrich', '67430526', 0, 0, 'welch.kayden@example.net', NULL, '$2y$10$Vi1C7ICSTgoppcqx3AxriuiNiMfz3DEY/bu2rP5IDjNH/w.0fVg6i', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(68, 'Dr. Santos Hoeger Sr.', 'Erdman', '74044809', 0, 1, 'freda77@example.net', NULL, '$2y$10$dPnkq4KF4chwJrzI2q1icObtjTUJqvfs0PfjRfZcm9dBBmyOR.zb.', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(69, 'Gregorio Hettinger', 'Shanahan', '10997491', 1, 0, 'feeney.britney@example.net', NULL, '$2y$10$PQzT0ltBHr8Z3CVh37GzTenFKpGm8JmpBvzZ6bQAznjLjEExVlkHy', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(70, 'Payton Dibbert III', 'Larkin', '86568220', 1, 0, 'kuhn.miracle@example.com', NULL, '$2y$10$QMCVRrKWMnClvJi.AFCtxuxuIWTQgPWIoBMLAJbJYPhpMchi0K7vy', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(71, 'Robin Koepp', 'Balistreri', '39662427', 1, 1, 'igrady@example.com', NULL, '$2y$10$.PuRxO6FT330/f1VkBZ34eL4VmcLeGuJwdouaN6M4XnoODjYB7rpK', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(72, 'Sabina Johnson', 'Jakubowski', '1759205', 0, 1, 'lisette89@example.com', NULL, '$2y$10$S5pAGwyEizWBLuIbjLTgoeKgDQbB3l0JOqoJTg3XrIyW4aoEQAS4q', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(73, 'Leif Williamson', 'Terry', '78479580', 0, 0, 'elza.shanahan@example.net', NULL, '$2y$10$k.g.5W81AKcH5P1hBLBbm.yJKkUxdxrnY51vt.uuoQHNh6oDIKI8C', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(74, 'Magnolia Herman', 'Ondricka', '29808147', 1, 0, 'leo.little@example.com', NULL, '$2y$10$yoDZAfbcUi7XotKT26UAGO6/xURwShPjou6kHf23mfozO8ljlMI86', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(75, 'Jaqueline Runolfsson', 'Torphy', '24685460', 0, 0, 'edaniel@example.org', NULL, '$2y$10$OJwZ/o.HBGpA5s//RaCpIunSRihSfhwUJK9eTfPKcYStDCovmgrTm', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(76, 'Charlene Erdman PhD', 'Johnson', '80864901', 0, 1, 'wilhelmine.witting@example.com', NULL, '$2y$10$9Dmy27j4sTQgwNF.D.ALxeDHTvTq8LJwRy7FAfcD9GypNdez3zeAy', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(77, 'Loma Collins', 'Wintheiser', '27310706', 1, 1, 'jermain56@example.org', NULL, '$2y$10$HL9dA0wrRjAi4ECdi6rrNeHZ6d.X3TX32kT3ojx25/GQIEP9x0NO.', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(78, 'Ellsworth Brekke', 'Thiel', '39468394', 1, 1, 'thea83@example.net', NULL, '$2y$10$LxXGc7YfclRMH7NrMgINBOYPWh8E4/SN8F21i1DPkxZ5GJI7LCqtS', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(79, 'Dr. Susanna Brown', 'Willms', '83718571', 1, 1, 'antonette05@example.net', NULL, '$2y$10$l1IBB4Qi8nXiUgR0ylaHFuFhD9M7KQXpYLiDDrc0mrfkPRXmXjS.y', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(80, 'Jacinthe Bashirian DDS', 'Beer', '74265329', 0, 0, 'xander26@example.org', NULL, '$2y$10$LpY6h8njGi8Gsi/S1NVhoOnt9iMHQCCStT/OlPj379VioDV64ZurO', NULL, '2023-09-20 20:53:24', '2023-09-20 20:53:24'),
(81, 'Jana Mann', 'Cartwright', '60238423', 0, 0, 'rosa26@example.com', NULL, '$2y$10$iGFu5YlRHN9Kq99JLqWBmuiplmIQfAtt1Oz6NMRfeIJJINTFhYJT2', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(82, 'Wilfred Wuckert', 'Hagenes', '1333426', 0, 1, 'cole.nichole@example.net', NULL, '$2y$10$i8LWKznA9lgtAXVrqTFUguMSI7JOfiNj3Jd4FtKOfmPPSUggH36Mm', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(83, 'Jermaine Marquardt', 'Moore', '41816479', 0, 0, 'giovanny.batz@example.com', NULL, '$2y$10$M2wac1ZZa3k4xG4SbovEH.hkSwnnGKvbNR7fVJu.cQ9VCaEyitVZC', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(84, 'Rowland Heller', 'Von', '2812155', 0, 1, 'orn.sidney@example.com', NULL, '$2y$10$KsQDr3g5YP3rQYenrL4XDeor9GzU1FHY2IAhCwoDyB54mByTx06mO', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(85, 'Mr. Justen West DDS', 'Wehner', '61256616', 0, 1, 'maiya65@example.com', NULL, '$2y$10$RMn3utCak2duZt4LC0TC8OWaBrDOabWcMwo.hnf9ZUYpkvqdxwuWS', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(86, 'Roosevelt Kemmer', 'Collier', '67466784', 0, 1, 'vgottlieb@example.org', NULL, '$2y$10$kHFfXforwzP7rJePp8FV/.S2DK0aSBAgfoTH/cvbZUghDcCZ3Uq9y', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(87, 'Kenna O\'Connell', 'Waelchi', '43906276', 0, 0, 'schimmel.athena@example.net', NULL, '$2y$10$IKAvjQZ35LFFRurSwXMR4ucESY9nNhX/HPN0BQ/pUkNtwGky96GSq', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(88, 'Jennings Wolff', 'D\'Amore', '19432432', 1, 1, 'rowe.karli@example.org', NULL, '$2y$10$PugdWaNKM1sERWRTUav1MecsV/TfNuC6QFEqNYyw.zGtmC3L6NaFu', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(89, 'Thaddeus Grady', 'Hirthe', '81990204', 0, 1, 'greg71@example.com', NULL, '$2y$10$iurCbWPQDSogd6DJj7sGHePVH/iO/FvklvqY8o4SS535TbzYyHBdG', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(90, 'Andreane Langworth', 'Pollich', '99583033', 0, 0, 'neha.howe@example.org', NULL, '$2y$10$cnvoFdnSyff3LNMApoiC3OVTp/MLUTzAsP8bnxLlhDF2fPHSKehUa', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(91, 'Brent Mann', 'Lakin', '96387527', 0, 0, 'leuschke.kaitlin@example.org', NULL, '$2y$10$l/dcKRoMK79btPrZP81Q.OtYd1QZtyP2ycofXkTO4v87eX0ZsGr0S', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(92, 'Prof. Amina Schuppe', 'Leuschke', '7825272', 1, 0, 'cremin.kay@example.net', NULL, '$2y$10$sZzVHfNCGOwpA0aN00yvUeIomogNAkLYMTSQ91RcOADOPbXc9oUFO', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(93, 'Reyna Thiel DDS', 'Beer', '26699337', 1, 0, 'scasper@example.org', NULL, '$2y$10$ji/v4AlSNS6NBL2T.ixjxuuI.0W0cCtQelIUbKXH1iEFXhe4c4b8m', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(94, 'Miss Malvina Huel Sr.', 'Gibson', '51121376', 1, 1, 'kyla03@example.net', NULL, '$2y$10$XxW.BNLDB/oI/93Q3XiMGewYL2mf2SHAlVZF2.6xHUctBNhLO35YO', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(95, 'Mr. Darrin Hamill III', 'Baumbach', '30171564', 1, 0, 'yboyle@example.com', NULL, '$2y$10$ydM1B8YQ1UAOLXjj9asqxen7WP40kmklQR4M84KEhFYf65o73ycZi', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(96, 'Ellis Bins', 'Friesen', '91887269', 0, 0, 'marielle95@example.com', NULL, '$2y$10$UI8MieaU4rr0ikIq9.OyouP554w5sIj3cGy16vQmVDGJbIAo91r2O', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(97, 'Angelica Gulgowski V', 'Kuphal', '71915926', 1, 0, 'demetris64@example.com', NULL, '$2y$10$Yp8Ciuk9uClxTv9npjR1mujVRP/f3FjXCkhuOzlwanv9S.U0KBWz6', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(98, 'Mohammed Lubowitz', 'Nienow', '10981963', 1, 1, 'arne72@example.org', NULL, '$2y$10$4hzw1tB/nmGguQMBm9Lmf.X1aNsTyUWSCtxuYqdEnOcaoQcLeA6.6', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(99, 'Baron Heaney', 'Brown', '56836259', 0, 0, 'antonia.waelchi@example.com', NULL, '$2y$10$yNosajUWjurvvTbNhv2/UO2quUpaQUV3XJ8.2zMPgyHF8oYMliQP.', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(100, 'Ellie Kessler', 'Hickle', '28691637', 1, 0, 'daisy64@example.net', NULL, '$2y$10$t1cgmXUS51.E16uRd09wWOqsTXzvJmtM8xVeddqRCyPahZRpHxNEG', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(101, 'Mrs. Jaunita Wunsch Jr.', 'Waelchi', '15410817', 0, 1, 'graham.kyler@example.org', NULL, '$2y$10$.4WrL6EwKiPG9gdfcS8yGeoHNUvISY.mCONIc6mK6bdjzna0lzZAe', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(102, 'Therese Bergnaum', 'Keeling', '68752176', 0, 1, 'fcummerata@example.org', NULL, '$2y$10$eCIMCFh7AH2GpuCHRXuHquYt5JjiMov6JG6egnhBr66my/XuxHJj2', NULL, '2023-09-20 20:53:25', '2023-09-20 20:53:25'),
(103, 'Mrs. Shaylee Glover V', 'Koch', '85915478', 1, 1, 'bemmerich@example.net', NULL, '$2y$10$92AXz2XZkPv5i/asSHk0IuFrSocATEKWqagHxxo3WdifnVzAtH6gq', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(104, 'Terrell Hagenes', 'Gislason', '79746346', 0, 1, 'wvonrueden@example.org', NULL, '$2y$10$WUXYlQyUMS97RvmLGdA8GuvjxzAEsPeZYjwa0/MIvGJeu3B8oq4S.', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(105, 'Brycen Johnston MD', 'Berge', '34179672', 0, 1, 'sschaefer@example.org', NULL, '$2y$10$Wa1iiYnocujumyp9pZQywenEAj5zlBXN3mUH8qKwKx1YUi9t7mjzS', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(106, 'Dr. Wilton Kulas V', 'Langworth', '16160417', 1, 1, 'gdickinson@example.org', NULL, '$2y$10$5Fd9Mo/j0OogFDefxCTVTeOJeupxlEJzc7K3LyZRVXYgDXAdwbIbu', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(107, 'Kasandra Quitzon V', 'O\'Kon', '87793430', 0, 0, 'qaltenwerth@example.net', NULL, '$2y$10$elvn5gYzU4JLbidyNH315ustbpS9du2eu2VS/p8Vy4V77skQnG1B.', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(108, 'Arvid Klein', 'Kreiger', '25985779', 0, 1, 'talon89@example.com', NULL, '$2y$10$uEa0i6ePchyoR5f/zUAJ2OSVl5TsBAXiegYXa7hLRPPrM089j0hxG', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(109, 'Virginie Pagac PhD', 'Skiles', '57811794', 1, 0, 'rylan52@example.org', NULL, '$2y$10$t3zt21/irYqQ7FyQMMaQu.qljr1cB4WlNZmVEpV2/9uXCixo1.xfi', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(110, 'Donavon Harris', 'Dickens', '47645104', 1, 1, 'prosacco.oleta@example.net', NULL, '$2y$10$J9g1.sSlfbHOFtgvt70vf.k.Uf0phh.cvveI2JHedJqj//Bg.fU3m', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(111, 'Kellie Bayer', 'Smitham', '13986952', 1, 1, 'jenifer27@example.com', NULL, '$2y$10$4GCKGM8tIM8oJsBKHgqk/uErc1hONaZiozoUFDw5LG6MDoQKRNdBG', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(112, 'Mr. Montana O\'Kon IV', 'Mueller', '13467144', 1, 0, 'norbert.rau@example.net', NULL, '$2y$10$WeQQzlm4l1VoLMWIrmkPY.Mg54DpCB842k19hx7D.7.Z3u/iZ7vOS', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(113, 'Prof. Devyn Armstrong', 'Upton', '44290482', 0, 1, 'charity.lemke@example.com', NULL, '$2y$10$tyInJ7Ll6P62n.qLgOKkS.6tmF/l4kmlt1sprvMoTeOH0japMdW7K', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(114, 'Jaren Watsica', 'Bergstrom', '3038004', 0, 0, 'landen94@example.net', NULL, '$2y$10$yb7KzocrqePdo4fmaqdcIum4WNDboMWdBQnjkwmFE.hBV7jQ/egY.', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(115, 'Patience Schneider', 'Rodriguez', '58108585', 1, 1, 'christiansen.tyshawn@example.com', NULL, '$2y$10$8CfcKkb6kjhR7yFYf5mUnePY3N4/TTjEW61Z6ImVJ0YrH8tre9Tsq', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(116, 'Charlotte Larkin', 'Schaden', '76614285', 0, 1, 'esther.strosin@example.org', NULL, '$2y$10$6dxXgbocpqxwk9MLnXf7JuMbrjW6onJmJ70qZYLMcAhGx91WqNEVi', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(117, 'Lavonne Kemmer DDS', 'Mohr', '80584057', 0, 0, 'friesen.jennifer@example.com', NULL, '$2y$10$Ds9mb/Hc7weJIi.XYMst7e/CtZTWw52Qr4.QbuwA2GyZzItPaKkhm', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(118, 'Jermain Okuneva', 'Bruen', '13187550', 1, 1, 'ludwig59@example.org', NULL, '$2y$10$8I08JmEgC9VDrFc5UZZ5P.8IP/WkMQ4jwMSdLj1HWNmi/4WjMxWkS', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(119, 'Mr. Vern Donnelly', 'Armstrong', '90756739', 0, 0, 'koelpin.kari@example.net', NULL, '$2y$10$YoNn2.E4xaqOJTBMqZgkJ.AgWrTtziewVY99/kAcOGKd517Lrg2Bm', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(120, 'Dr. Enrico Gleichner', 'Grimes', '54264498', 0, 1, 'langworth.bailee@example.com', NULL, '$2y$10$92.CW82iOHcRvNCiLS/w5Op.uVsG7Du1PcuICg6yHKAGVaZx/Bao.', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(121, 'Marlin Ritchie PhD', 'Zemlak', '82583221', 0, 1, 'danial.reichel@example.net', NULL, '$2y$10$tXpWPRYHjXJEWaDEeGArOuG.yb.B5lRS11b8wMqQ5IUxlZk27keBO', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(122, 'Mrs. Josefa Thiel Sr.', 'Kunde', '59133863', 1, 0, 'qkreiger@example.org', NULL, '$2y$10$oTC0DfpLUtafW/j/g9dh/.B0zxiJcdfWCNbl/5L5qAVdejU.XnfKi', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(123, 'Maxie Ortiz', 'McCullough', '82759940', 0, 1, 'rodrigo01@example.org', NULL, '$2y$10$oZQidI6XkoOsVzRGfOP/ruybby.PgIBh3gdGLROwGKoVDiXCagVd2', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(124, 'Kelly Shields', 'Cassin', '77975002', 1, 0, 'mable62@example.com', NULL, '$2y$10$GQB79xtZlREkrExcpdinr.DW7GyOdZ8Eq25qP/pAat7KM9GE2eCaa', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(125, 'Vincent Nader', 'Yundt', '57291268', 0, 1, 'rcrooks@example.com', NULL, '$2y$10$GepGNcYlvHqH0sCbzG0RAe7vDn0Qm.neNmG8.89ns7ZgJHEtPdigC', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(126, 'Eda Kessler DDS', 'Schaefer', '35310466', 0, 0, 'kirsten.jacobson@example.net', NULL, '$2y$10$Qtmov8jXJhgsXGlZSWKlRe7iSkcb.GBXhXE7xur2D9hLNg6IAY0Li', NULL, '2023-09-20 20:53:26', '2023-09-20 20:53:26'),
(127, 'Prof. Emmanuel Harber', 'Walter', '17788372', 0, 1, 'nstanton@example.net', NULL, '$2y$10$95Uj4KV.sAi1CzFu/XI0l.ooDHPxtVm//uvCNUqa4dsDMkPvFYDAO', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(128, 'Sister Abbott', 'Schaefer', '52615013', 1, 0, 'qflatley@example.com', NULL, '$2y$10$oHLJ7B5mSpFbFdeW1z9UPuduse6sRss19VVd4/WJv03E/xRDekVRS', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(129, 'Keshaun Wisoky', 'Kuhlman', '4259139', 0, 1, 'margie.tillman@example.com', NULL, '$2y$10$FrqU7EpS0TVqxVuXFu5ESeEEmzIIKFoW0kafm1eZiUUI2O/BnqB0C', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(130, 'Louie Beier', 'Waters', '54699692', 0, 1, 'andy35@example.net', NULL, '$2y$10$F//Crd/CTFLPtgtTi5TA6eq71t1eRCWSaKBzyrKSDk1nBTka2cszi', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(131, 'Alfred Morissette', 'Jast', '35260821', 0, 1, 'gus56@example.com', NULL, '$2y$10$ESsMw5AW/TOUo4RWQc/NKe03lD5KKDQI8DLAC.yuCv93mgJAam9Du', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(132, 'Adrain Pacocha PhD', 'Price', '63123', 1, 1, 'earnest60@example.com', NULL, '$2y$10$xtk70TrM3gDr59PpK30fOeBIIclO9dAMD7A6SFHTefZzaUlM3uNdu', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(133, 'Dewayne Kemmer', 'Kunde', '28605479', 0, 0, 'tstokes@example.net', NULL, '$2y$10$5d76/nnFrunZrozeDyQNwOsFrnl7Q3bAGW7EahvJ/qFXM5JNtYa9C', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(134, 'Zane Bernier MD', 'Kling', '34011014', 0, 1, 'gbechtelar@example.org', NULL, '$2y$10$sQvcGSwYfknT68KKxN7HDOAPf19gykizCbzQ2Qb9fpguMr5di5E3a', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(135, 'Austin Heathcote', 'Wehner', '36803411', 1, 1, 'saige.gislason@example.net', NULL, '$2y$10$lFipZso7yLVp8Gh80ZYF.OVqXRBip.lTpSwfp6M0QjgX6PPiXP1ae', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(136, 'Kaylin Konopelski', 'Anderson', '49656252', 1, 0, 'mcruickshank@example.net', NULL, '$2y$10$r9HwsyuBRxVliMjgql8MLOLPkZdjeaVx5HeQ1a9DwLNIciXoIbPJ.', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(137, 'Doris Rohan', 'Erdman', '89035996', 1, 1, 'bernita39@example.org', NULL, '$2y$10$dJ0XpdlpCK.cmSJPuNxgXOuzvtkYh5CapLcCjR8L35FI.DoX2a/8i', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(138, 'Rowan Corwin', 'Dibbert', '49035827', 1, 1, 'rhane@example.com', NULL, '$2y$10$QB7QB.c/3iW9Fmcmrlw2B.95DsTAkXdcrgi/TxPxq6nt6r4b7nGpq', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(139, 'Cade Cremin', 'Cummings', '9934985', 0, 0, 'kshanahan@example.net', NULL, '$2y$10$XEVMZE3Ti8/vk0NBqlpjde85efV7JRmkMY8MY4T0eiYQGyYPqo3ya', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(140, 'Carli Bahringer I', 'Ondricka', '97462281', 1, 1, 'solon10@example.org', NULL, '$2y$10$ToBBJ2Ww5HHNufq64ENque/16YGY2J5pN9nKc66MC6Sl663asKgy6', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(141, 'Dr. Elliot Rau PhD', 'Vandervort', '94649371', 1, 0, 'okuneva.lelia@example.com', NULL, '$2y$10$MowtcfVsI9iLbY11IeB57uhVrtkhO68oxFTxtGwjqD8EEYabt79H.', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(142, 'Kelley Reichel', 'Ferry', '91038619', 0, 0, 'wiley41@example.com', NULL, '$2y$10$Skcqzva13E99TxOGr55xAO2KzEr/EL.xGoNLaRV3EtSqpAqlVgm8y', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(143, 'Eloise Dickens IV', 'Ritchie', '81100292', 0, 1, 'corene.purdy@example.net', NULL, '$2y$10$6uVCCuhSM42jZ1WlatwcNeBwUXHgGvB6W9v5d9Z7kxUJkiHLQjTMS', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(144, 'Kayli Huel', 'Herman', '26630046', 1, 0, 'myrna.herzog@example.net', NULL, '$2y$10$.nf9ZORwpjLsVpfxebRkS.M7J9HNnRHt/DxhzIcn8odz8sjsJkAJu', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(145, 'Mckenna Lebsack', 'McCullough', '54851333', 0, 0, 'frederique82@example.org', NULL, '$2y$10$jCXZ1rkatvXPJT4XkieTqurxFf4WGqdUUrLI82vRDfYq0LFR/2LAi', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(146, 'Eldon Lowe', 'Reinger', '96312505', 1, 1, 'urban.nader@example.net', NULL, '$2y$10$74JnkIpB.88Y3fTi6epmy.EQ1dFad8pNYXAL1nyRFfmDQMu5U4HJK', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(147, 'Kobe Rippin DDS', 'Walsh', '48060162', 0, 0, 'spinka.aracely@example.com', NULL, '$2y$10$60.MXZXu.M1UVjnAxIsv1OsAg2c3Nmjir3IBuMI.8ATkhBITqgrv.', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(148, 'Helga Kerluke', 'Adams', '72258662', 1, 0, 'ktromp@example.com', NULL, '$2y$10$hkboDwlsia2XtFA1py3vyOEofPzwXtbgQZSigBHBhPmMTph2d6V5O', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(149, 'Shannon Ritchie', 'White', '21348146', 0, 1, 'fhermiston@example.com', NULL, '$2y$10$XzChLq31gbU2HJaJJCJ4ouTU.M72r.Oh4FqIs00FmaBhbYsBWvhJm', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(150, 'Emiliano Hickle', 'Carter', '55276860', 1, 1, 'mhansen@example.net', NULL, '$2y$10$ztHvKO3vkRSfoADeV/Eb1.nXzKKE2/k1gKIam58lXHvIWR5M2QSAC', NULL, '2023-09-20 20:53:27', '2023-09-20 20:53:27'),
(151, 'Mr. Elton Flatley Sr.', 'Macejkovic', '26772853', 1, 0, 'rebeka.ratke@example.org', NULL, '$2y$10$.Q2JV9FbORugf2jIeOqx3eIC/4uZbACMirfzAOIv.XtnQpjUjR.WO', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(152, 'Mr. Donald Sporer I', 'Greenholt', '20255117', 0, 0, 'kris.ervin@example.org', NULL, '$2y$10$y8fo4IrrjumeHyoBBGEMW.st2M2RRVN2oAp00mk9P62Ddjjzms5su', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(153, 'Roman Deckow', 'Ritchie', '49315480', 0, 1, 'gcorwin@example.org', NULL, '$2y$10$0iPgO13hzwZXCcyBLSpjUeRSYm88Smv51rwaBHNZTtYekfHvWUmhK', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(154, 'Dixie Ferry', 'Yost', '28457339', 1, 0, 'mclaughlin.sebastian@example.net', NULL, '$2y$10$ex7clxot.xV8a0PKRP3h0ecvEMeN8h92Gc0oJbVidZ6Ldexi3Sc4S', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(155, 'Mireille Ebert', 'Gottlieb', '30228687', 1, 0, 'bernita.lynch@example.net', NULL, '$2y$10$LU63KxV.HHVXuh4rbZg4LeW7.MG9BHa.W6fUqDWombIbTwVIf/zFq', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(156, 'Rubie Hoeger', 'Botsford', '77337540', 0, 1, 'serenity22@example.org', NULL, '$2y$10$D10y7p0Sukn.VLluaFqCIO15U4.25Vj5xgIskXForxhqe7pSNRfmW', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(157, 'Nelson Ullrich', 'Mann', '97512207', 0, 1, 'pollich.myrna@example.com', NULL, '$2y$10$wq44KKG4IKDzTIB4vvA2Ou4LXXIJE41VWTcm3o/9Qw4yfyZu8Fl8K', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(158, 'Mose Nader', 'Grady', '97014004', 1, 1, 'helen.schamberger@example.com', NULL, '$2y$10$3HVUTUj/tDSXJDn/j99mxepOL8a2kT8u7rovY1HVA7Rpsz0mH/HIu', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(159, 'Mr. Brian Schmeler', 'Murray', '58460233', 0, 1, 'orin89@example.org', NULL, '$2y$10$XHtcdpBo3OWrL0O13BuodOzfzNoGuMncF0GTGpdfgj6ZP/xLnEdom', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(160, 'Porter Fahey', 'Will', '34041090', 1, 1, 'conn.karson@example.org', NULL, '$2y$10$VCNzUFKNHMTVeWgvqVimGOgN6z.NjFMAFSz4Aktpn3CIu1Dzzb1gu', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(161, 'Else Renner', 'Mueller', '39228249', 0, 0, 'marc.walker@example.com', NULL, '$2y$10$AQqEwe7sOsoBdJipVTUR7ujKcJShWigvsvuwgIk0PHXqFfMYROuOu', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(162, 'Tressie Daniel', 'Tillman', '88289008', 1, 0, 'mante.germaine@example.com', NULL, '$2y$10$syB0sZ.W2hbdI4wWtTM9bO.gGtSl1UyupWaNiEDZLSJnGDGtsNX5y', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(163, 'Naomi Pacocha', 'Franecki', '30836413', 1, 0, 'ulices16@example.com', NULL, '$2y$10$294sg6rAXm1stmFW6Ry15e3gAXK24g17H8BOTGnz/R.u3aPkFy0DO', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(164, 'Hank Romaguera', 'Hills', '52689784', 1, 1, 'adrien.barton@example.org', NULL, '$2y$10$JJ7EV.DRcxeqCoRMOvZAI.2//Wy2C03QKANApr8uSF7RmWIL0/Td.', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(165, 'Edwin Little', 'Tremblay', '38818143', 1, 1, 'amalia68@example.org', NULL, '$2y$10$mIze.dsty6MnaB8TVaPzkOCqVJnvJcDIUO.rxZdvziU4UZGK4GC5G', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(166, 'Selmer Reinger', 'Altenwerth', '4278130', 1, 1, 'shad.hirthe@example.net', NULL, '$2y$10$6ztqzfCCBcU2zZp4be40quyQPGGMNPUuvAhAaMsjdedp/y5rvvWcS', NULL, '2023-09-20 20:53:28', '2023-09-20 20:53:28'),
(167, 'Charlotte Mills', 'VonRueden', '36610927', 0, 1, 'powlowski.marie@example.net', NULL, '$2y$10$V8wlSF8ZOO/Cr9pb8sfq7OPyHVyBsXAfNkZqO87vkuQvkSu94oCty', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(168, 'Prof. Thora Shanahan DVM', 'Wuckert', '70271311', 0, 0, 'rosalia20@example.com', NULL, '$2y$10$UPF6z6zEv6cPe73nEY7ZXuMnouFchiQFvex/kcyFqOE9LTgAAjbDq', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(169, 'Elton Harber', 'Metz', '41188429', 0, 0, 'freda.bruen@example.org', NULL, '$2y$10$iMY22b0UFs9eFzcapYz6LuyhLPKNL8sbDbp/Ac351mBuneibNEIpW', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(170, 'Eddie Christiansen', 'Pouros', '58961870', 1, 0, 'lakin.julien@example.org', NULL, '$2y$10$bcg0g6EykROljvOph7oT8eJKTnrK9Z63PGc0XWWSP45TfXYrfxAtC', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(171, 'Kurt Anderson', 'Nienow', '38681827', 0, 0, 'gulgowski.durward@example.com', NULL, '$2y$10$r2eg6b4XBPE5wkTsiyNYyOvUEI81etCmyVphuz7cOE8hyXbjDZFLC', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(172, 'Kaitlin Hahn', 'Herzog', '79918244', 1, 0, 'etha08@example.net', NULL, '$2y$10$Z/n7tunjKSBgefQgNRgrOeTpQmNQjHFAb/clw9I2/JmWO1XWooYE2', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(173, 'Tanner O\'Connell II', 'Morar', '924432', 1, 1, 'douglas.harmony@example.com', NULL, '$2y$10$AKyioUoFkjE60gckXpGZBuDsneRpFoZHttxCG29fib.iks2B1ThLO', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(174, 'Bennett Bailey', 'Bechtelar', '25848831', 0, 0, 'alexandre62@example.net', NULL, '$2y$10$ti9Hn2lyt1XAypOrTNUagOkzOdVBoUFFff3XEaGHZ0vQltCFJdacu', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(175, 'Derrick Farrell', 'Price', '69994632', 1, 1, 'schneider.darrin@example.org', NULL, '$2y$10$x88E8Z/UFl1Yan6miWBIe.5xqMm2hdEbH9v0y2M7Mb5.LJFd4wFdq', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(176, 'Dr. Tyreek Friesen I', 'Wolff', '77988507', 0, 0, 'aurore.leuschke@example.net', NULL, '$2y$10$VIRMVsgZa5TWDt7icaGGfOZPDyaIPaXFG7Ubd8dlWYQ..5TjLdafC', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(177, 'Jovan Corkery', 'Treutel', '47890998', 0, 0, 'keeley15@example.org', NULL, '$2y$10$ah8OW9soVhv5IGyEoXUzAOEeZzU5Coallbn7.ZKtWzP/O471.y7tu', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(178, 'Eldridge Quigley', 'Ruecker', '54624314', 0, 1, 'juston20@example.org', NULL, '$2y$10$KjGYHKdQNgTM7tt1gWBPZebouzpq5N1TDmHnu/IF/jCpGmLxfFUNm', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(179, 'Peggie Rohan', 'Ritchie', '6200188', 0, 0, 'wnicolas@example.com', NULL, '$2y$10$E62.zjP/ihxfMWl5SmuyFe.z1fYtME.BdOtW.bwag5d6NfM.icfci', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(180, 'Melissa Cruickshank Sr.', 'Emmerich', '90117726', 1, 1, 'utorp@example.net', NULL, '$2y$10$SF.pLUMOK.uvAwQ3DuzWsO3ZhtDMVemOzsPls7FEIDjXy0iD8zhAG', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(181, 'Darrion O\'Connell', 'Crooks', '76140872', 1, 0, 'kautzer.iliana@example.net', NULL, '$2y$10$dghMny14xcTR3URcXw4pfOuueyLpkYCpc8SlJwPr47hkthAkWPvF6', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(182, 'Mr. Grover Turner DVM', 'Schoen', '26006577', 0, 0, 'runolfsdottir.marianne@example.com', NULL, '$2y$10$VDfN.fbdCT2fviNs2sXSvOLsQVNA9lfnWcY5hUYWY17mcKBUhcWw2', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(183, 'Mr. Johan Beer DDS', 'Kautzer', '7444454', 0, 0, 'uhahn@example.net', NULL, '$2y$10$ZmzAP5.8smrszs.7/1FHMOpAyUS178om2fWIvaxHTgy9hBhcM.YTi', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(184, 'Dorothea Bogisich', 'Auer', '82232736', 0, 1, 'susie90@example.com', NULL, '$2y$10$nQaMYy50e9gCnWtRTDQJHegkEq.QIZBwXiSr2ytwf1tA3gP9aJZUC', NULL, '2023-09-20 20:53:29', '2023-09-20 20:53:29'),
(185, 'Mr. Donald Schultz', 'Johns', '93081409', 1, 1, 'jaron45@example.com', NULL, '$2y$10$9PnbLg0Xls/R3K7dFCsMl.ec/Kfefdk/D4Qv0iTtbgdVXk4xVBTQG', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(186, 'Marcelina Heaney', 'Schaefer', '16676449', 1, 0, 'mayert.lawrence@example.org', NULL, '$2y$10$iFCItspuh0PpQ3KdNPfjAONX9HXNBuCLdYMkmgp7dWF/9VxloQ1W.', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(187, 'Russell Hermann Sr.', 'Schaden', '21388190', 1, 1, 'tyrel67@example.net', NULL, '$2y$10$GS.6LTexhpz.AfgExj.uUett7LHzPMpQg9xFuvHe.eHhjbn.XiohG', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(188, 'Jannie Runolfsson', 'Goldner', '74427014', 1, 1, 'lbartell@example.com', NULL, '$2y$10$0j3zm0o1P/mSiIomFJSQDOuuMWOpaGNFBYGLYwJVAa9ZNkN5sFk6m', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(189, 'Earnest Roberts DDS', 'Turner', '82015696', 0, 0, 'williamson.alec@example.net', NULL, '$2y$10$qOvgDhmSh52IeO4NWbLUYO4rebW6uZoHiNc4LT59U.u4FzOjVQLLS', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(190, 'Frida Flatley', 'Considine', '94311546', 0, 0, 'lewis.howe@example.com', NULL, '$2y$10$L6stEWLsh9JTqdZRncnGIe2HNB6.9DOaDhm0YFbZtDwkfj0krreKS', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(191, 'Dr. Vaughn Hintz', 'Kub', '71088908', 0, 1, 'keon79@example.org', NULL, '$2y$10$sW5mif/WAxSL9CLa4tDXheLnNpoin9qhtBNIxyXktYoyaStGehoiW', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(192, 'Colby Pacocha Sr.', 'Ryan', '60687307', 0, 1, 'myles.graham@example.net', NULL, '$2y$10$gsTGkPEFjusDliYBDwJINeU11dbfRaCGOIEiH3VWcBgB3UIlzyVoS', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(193, 'Chandler Ebert', 'Wisozk', '22408641', 1, 1, 'vanderson@example.com', NULL, '$2y$10$V8v57.9m/Y7ELHapsFzY8uh.n0x6NN6jhtHsfjzlFZqRFOHDf9kSm', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(194, 'Trudie Dare', 'Nolan', '72551291', 1, 0, 'xmcclure@example.com', NULL, '$2y$10$jyar32ybT5VHddCIFs/Poe8x6vYDTG8sAhzQH/k2tGjMYN9QXde4.', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(195, 'Judah Dickinson DVM', 'Macejkovic', '52580891', 0, 0, 'henderson33@example.net', NULL, '$2y$10$b41myG/ygjdRLuuEpQ.nKe/fYcnBvt4q/hvXAbhXzAu2i4Zmnu5U6', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(196, 'Mr. Jasper Okuneva MD', 'Johnson', '53826103', 1, 1, 'jedediah.thiel@example.com', NULL, '$2y$10$8DTsVdpGQ5.L1O/mxnJXqOL0gDnnvs0Mwg0m611wKgfcAJy8xhZt2', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(197, 'Koby Hegmann', 'Lemke', '71826491', 0, 0, 'quinn.harber@example.org', NULL, '$2y$10$I3XzXeD.IkPGWvsG8NBMLeQzPr6FSJ6dlVINRvzoEPpRjKskCljeu', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(198, 'Prof. Faustino Bernhard', 'Muller', '6926301', 0, 0, 'hayes.hazel@example.org', NULL, '$2y$10$o.7o63IDpAKVWdW0W6IOy.z75FqFRmLUW8fb4fVgzWmXG6BzFsMcS', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(199, 'Major Keeling', 'Beer', '93140187', 1, 0, 'lgreenholt@example.com', NULL, '$2y$10$AfCCmL8FyqfUjn6JVtdycuXXW2P9BcgL3INeB3XvyHtJz07oBkYua', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30'),
(200, 'Dejah Lockman', 'Abernathy', '54402461', 0, 1, 'gupton@example.org', NULL, '$2y$10$zxurCjK5qxe9E68fvmL.SerjK/TJ0SUcvHBGpb41pV4FzI1yQ0owe', NULL, '2023-09-20 20:53:30', '2023-09-20 20:53:30');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cierres`
--
ALTER TABLE `cierres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_cierres`
--
ALTER TABLE `detalle_cierres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_cierres_cierre_id_foreign` (`cierre_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_card_id_unique` (`card_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cierres`
--
ALTER TABLE `cierres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_cierres`
--
ALTER TABLE `detalle_cierres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_cierres`
--
ALTER TABLE `detalle_cierres`
  ADD CONSTRAINT `detalle_cierres_cierre_id_foreign` FOREIGN KEY (`cierre_id`) REFERENCES `cierres` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
