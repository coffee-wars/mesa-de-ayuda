-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2021 a las 23:00:38
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mesa_ayuda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `IDAREA` varchar(10) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `FKEMPLE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`IDAREA`, `NOMBRE`, `FKEMPLE`) VALUES
('1', 'Nómina', NULL),
('2', 'Cartera', NULL),
('3', 'Mantenimiento', NULL),
('4', 'Informática', NULL),
('5', 'Gestión de Tecnología', NULL),
('6', 'Gestión Humana', NULL),
('7', 'Gestión financiera ', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `IDCARGO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_por_empleado`
--

CREATE TABLE `cargo_por_empleado` (
  `FKCARGO` int(11) NOT NULL,
  `FKEMPLE` varchar(20) NOT NULL,
  `FECHAINI` date NOT NULL,
  `FECHAFIN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallereq`
--

CREATE TABLE `detallereq` (
  `IDDETALLE` int(11) NOT NULL,
  `FECHA` datetime NOT NULL,
  `OBSERVACION` varchar(4000) NOT NULL,
  `FKREQ` int(11) NOT NULL,
  `FKESTADO` varchar(1) NOT NULL,
  `FKEMPLE` varchar(20) NOT NULL,
  `FKEMPLEASIGNADO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `IDEMPLEADO` varchar(20) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `FOTO` varchar(200) DEFAULT NULL,
  `HOJAVIDA` varchar(200) DEFAULT NULL,
  `TELEFONO` varchar(15) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  `X` double DEFAULT NULL,
  `Y` double DEFAULT NULL,
  `fkEMPLE_JEFE` varchar(20) DEFAULT NULL,
  `fkAREA` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `IDESTADO` varchar(1) NOT NULL,
  `NOMBRE` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`IDESTADO`, `NOMBRE`) VALUES
('1', 'Radicado'),
('2', 'Asignado'),
('3', ' Solucionado Par'),
('4', 'Solucionado Tota'),
('5', 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(7, '2021_04_08_011443_create_database', 1),
(8, '2014_10_12_100000_create_password_resets_table', 2),
(11, '2014_10_12_000000_create_users_table', 3),
(12, '2019_08_19_000000_create_failed_jobs_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimiento`
--

CREATE TABLE `requerimiento` (
  `IDREQ` int(11) NOT NULL,
  `FKAREA` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`IDAREA`),
  ADD KEY `CONS_FKEMPLE` (`FKEMPLE`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IDCARGO`);

--
-- Indices de la tabla `cargo_por_empleado`
--
ALTER TABLE `cargo_por_empleado`
  ADD PRIMARY KEY (`FKCARGO`,`FKEMPLE`),
  ADD KEY `CONS_FKEMPLE3` (`FKEMPLE`);

--
-- Indices de la tabla `detallereq`
--
ALTER TABLE `detallereq`
  ADD PRIMARY KEY (`IDDETALLE`),
  ADD KEY `CONS_FKEMPLE2` (`FKEMPLE`),
  ADD KEY `CONS_FKREQ` (`FKREQ`),
  ADD KEY `CONS_ESTADO` (`FKESTADO`),
  ADD KEY `CONS_FKEMPLEASIG` (`FKEMPLEASIGNADO`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IDEMPLEADO`),
  ADD KEY `CONS_FKAREA` (`fkAREA`),
  ADD KEY `CONS_FKEMPLE1` (`fkEMPLE_JEFE`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`IDESTADO`);

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
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  ADD PRIMARY KEY (`IDREQ`),
  ADD KEY `CONS_FKAREA1` (`FKAREA`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `IDCARGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cargo_por_empleado`
--
ALTER TABLE `cargo_por_empleado`
  MODIFY `FKCARGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detallereq`
--
ALTER TABLE `detallereq`
  MODIFY `IDDETALLE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  MODIFY `IDREQ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `CONS_FKEMPLE` FOREIGN KEY (`FKEMPLE`) REFERENCES `empleado` (`IDEMPLEADO`);

--
-- Filtros para la tabla `cargo_por_empleado`
--
ALTER TABLE `cargo_por_empleado`
  ADD CONSTRAINT `CONS_FKCARGO` FOREIGN KEY (`FKCARGO`) REFERENCES `cargo` (`IDCARGO`),
  ADD CONSTRAINT `CONS_FKEMPLE3` FOREIGN KEY (`FKEMPLE`) REFERENCES `empleado` (`IDEMPLEADO`);

--
-- Filtros para la tabla `detallereq`
--
ALTER TABLE `detallereq`
  ADD CONSTRAINT `CONS_ESTADO` FOREIGN KEY (`FKESTADO`) REFERENCES `estado` (`IDESTADO`),
  ADD CONSTRAINT `CONS_FKEMPLE2` FOREIGN KEY (`FKEMPLE`) REFERENCES `empleado` (`IDEMPLEADO`),
  ADD CONSTRAINT `CONS_FKEMPLEASIG` FOREIGN KEY (`FKEMPLEASIGNADO`) REFERENCES `empleado` (`IDEMPLEADO`),
  ADD CONSTRAINT `CONS_FKREQ` FOREIGN KEY (`FKREQ`) REFERENCES `requerimiento` (`IDREQ`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `CONS_FKAREA` FOREIGN KEY (`fkAREA`) REFERENCES `area` (`IDAREA`),
  ADD CONSTRAINT `CONS_FKEMPLE1` FOREIGN KEY (`fkEMPLE_JEFE`) REFERENCES `empleado` (`IDEMPLEADO`);

--
-- Filtros para la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  ADD CONSTRAINT `CONS_FKAREA1` FOREIGN KEY (`FKAREA`) REFERENCES `area` (`IDAREA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
