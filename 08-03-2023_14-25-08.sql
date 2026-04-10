-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: sisparqueadero
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `sisparqueadero`
--

/*!40000 DROP DATABASE IF EXISTS `sisparqueadero`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sisparqueadero` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sisparqueadero`;

--
-- Table structure for table `datos_empresa`
--

DROP TABLE IF EXISTS `datos_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_empresa` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ruc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mensaje` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_empresa`
--

LOCK TABLES `datos_empresa` WRITE;
/*!40000 ALTER TABLE `datos_empresa` DISABLE KEYS */;
INSERT INTO `datos_empresa` VALUES (1,'RAULITO EL EXITOSO Y EMPRENDEDOR FULL POWER','9987458974857','C. LA LIBERTAD.PSJ. JIRON CUSCO Nº 324','988 000 987',NULL,'REGRESE PRONTO');
/*!40000 ALTER TABLE `datos_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_identidad`
--

DROP TABLE IF EXISTS `datos_identidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_identidad` (
  `idDatos_identidad` int NOT NULL AUTO_INCREMENT,
  `moneda` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `simbolo` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `impuesto` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `porcentaje` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_tributo` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `documento_identificacion` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idDatos_identidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_identidad`
--

LOCK TABLES `datos_identidad` WRITE;
/*!40000 ALTER TABLE `datos_identidad` DISABLE KEYS */;
INSERT INTO `datos_identidad` VALUES (3,'SOL','S/.','IGV','18','RUC','DNI');
/*!40000 ALTER TABLE `datos_identidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `IdTipoEmpleado` int DEFAULT NULL,
  `identificacion` varchar(50) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `IdTipoUsuario_idx` (`IdTipoEmpleado`) USING BTREE,
  CONSTRAINT `IdTipoUsuario` FOREIGN KEY (`IdTipoEmpleado`) REFERENCES `tipo_empleado` (`IdTipoEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,1,'78547857','ADMIN','96589655','ADMIN','ADMIN');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `espacio`
--

DROP TABLE IF EXISTS `espacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `espacio` (
  `id_espacio` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `ocupado` tinyint(1) NOT NULL,
  `id_TVehiculo` int(5) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id_espacio`),
  KEY `FK_TVehiculo` (`id_TVehiculo`),
  CONSTRAINT `FK_TVehiculo` FOREIGN KEY (`id_TVehiculo`) REFERENCES `tipo_vehiculo` (`idTipoVehiculo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espacio`
--

LOCK TABLES `espacio` WRITE;
/*!40000 ALTER TABLE `espacio` DISABLE KEYS */;
/*!40000 ALTER TABLE `espacio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logo`
--

DROP TABLE IF EXISTS `logo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logo` (
  `idlogo` int NOT NULL AUTO_INCREMENT,
  `image` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idlogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logo`
--

LOCK TABLES `logo` WRITE;
/*!40000 ALTER TABLE `logo` DISABLE KEYS */;
/*!40000 ALTER TABLE `logo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `idPlanes` int NOT NULL AUTO_INCREMENT,
  `id_tipoVehiculo` int(5) unsigned zerofill NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `duracion` double unsigned NOT NULL DEFAULT '0',
  `tipoDuracion` varchar(50) NOT NULL DEFAULT '',
  `precioPorHora` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `precioRef` decimal(20,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`idPlanes`),
  KEY `FK_idTipoVehiculo` (`id_tipoVehiculo`),
  CONSTRAINT `FK_idTipoVehiculo` FOREIGN KEY (`id_tipoVehiculo`) REFERENCES `tipo_vehiculo` (`idTipoVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `id_propietario` int NOT NULL AUTO_INCREMENT,
  `Dni` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  PRIMARY KEY (`id_propietario`),
  UNIQUE KEY `Dni` (`Dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_entrada`
--

DROP TABLE IF EXISTS `registro_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_entrada` (
  `id_entrada` int NOT NULL AUTO_INCREMENT,
  `id_espacio` int NOT NULL,
  `id_vehiculo` int NOT NULL,
  `hora_entrada` datetime NOT NULL,
  `id_plan` int NOT NULL,
  `id_empleado` int DEFAULT NULL,
  `n_ticket` varchar(20) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_entrada`),
  UNIQUE KEY `n_ticket` (`n_ticket`),
  KEY `FK_registro_entrada_espacio` (`id_espacio`),
  KEY `id_vehiculo` (`id_vehiculo`),
  KEY `FK_registro_entrada_empleado` (`id_empleado`),
  KEY `FK_registro_entrada_planes` (`id_plan`),
  CONSTRAINT `FK_registro_entrada_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `FK_registro_entrada_espacio` FOREIGN KEY (`id_espacio`) REFERENCES `espacio` (`id_espacio`),
  CONSTRAINT `FK_registro_entrada_planes` FOREIGN KEY (`id_plan`) REFERENCES `planes` (`idPlanes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_registro_entrada_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_entrada`
--

LOCK TABLES `registro_entrada` WRITE;
/*!40000 ALTER TABLE `registro_entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_entrada` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_espacios` AFTER INSERT ON `registro_entrada` FOR EACH ROW BEGIN
  UPDATE espacio
  SET espacio.ocupado = 1
  WHERE espacio.id_espacio = NEW.id_espacio;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `registro_salida`
--

DROP TABLE IF EXISTS `registro_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_salida` (
  `id_salida` int NOT NULL AUTO_INCREMENT,
  `id_entrada` int NOT NULL,
  `hora_salida` datetime NOT NULL,
  `TotalHoras` varchar(50) NOT NULL,
  `subTotal` decimal(20,6) NOT NULL,
  `IGV` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `Descuento` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `Total` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `id_espacio` int NOT NULL,
  `n_recibo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_salida`),
  UNIQUE KEY `n_recibo` (`n_recibo`),
  KEY `FK_salida` (`id_entrada`),
  CONSTRAINT `FK_salida` FOREIGN KEY (`id_entrada`) REFERENCES `registro_entrada` (`id_entrada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_salida`
--

LOCK TABLES `registro_salida` WRITE;
/*!40000 ALTER TABLE `registro_salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_salida` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizarSalida_espacios` AFTER INSERT ON `registro_salida` FOR EACH ROW BEGIN
  UPDATE espacio
  SET espacio.ocupado = 0
  WHERE espacio.id_espacio = NEW.id_espacio;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Actualizador_entrada` AFTER INSERT ON `registro_salida` FOR EACH ROW BEGIN
  UPDATE registro_entrada
  SET registro_entrada.estado = 1
  WHERE registro_entrada.id_entrada = NEW.id_entrada;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tipo_empleado`
--

DROP TABLE IF EXISTS `tipo_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_empleado` (
  `IdTipoEmpleado` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `propietario` int DEFAULT NULL,
  `tipo_vehiculo` int DEFAULT NULL,
  `vehiculo` int DEFAULT NULL,
  `espacio` int DEFAULT NULL,
  `registros` int DEFAULT NULL,
  `precios` int DEFAULT NULL,
  `configuracion` int DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  PRIMARY KEY (`IdTipoEmpleado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_empleado`
--

LOCK TABLES `tipo_empleado` WRITE;
/*!40000 ALTER TABLE `tipo_empleado` DISABLE KEYS */;
INSERT INTO `tipo_empleado` VALUES (1,'ADMINISTRADOR',1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `tipo_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculo`
--

DROP TABLE IF EXISTS `tipo_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_vehiculo` (
  `idTipoVehiculo` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombreTipoVehiculo` varchar(150) NOT NULL,
  PRIMARY KEY (`idTipoVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculo`
--

LOCK TABLES `tipo_vehiculo` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(255) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `idTipoVehiculo` int(5) unsigned zerofill NOT NULL,
  `propietario_dni` int DEFAULT NULL,
  PRIMARY KEY (`id_vehiculo`),
  UNIQUE KEY `placa` (`placa`),
  KEY `FK_TipoVehiculo` (`idTipoVehiculo`),
  KEY `FK_Propietario` (`propietario_dni`),
  CONSTRAINT `FK_Propietario` FOREIGN KEY (`propietario_dni`) REFERENCES `propietario` (`Dni`),
  CONSTRAINT `FK_TipoVehiculo` FOREIGN KEY (`idTipoVehiculo`) REFERENCES `tipo_vehiculo` (`idTipoVehiculo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistacompletaentrada`
--

DROP TABLE IF EXISTS `vistacompletaentrada`;
/*!50001 DROP VIEW IF EXISTS `vistacompletaentrada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistacompletaentrada` AS SELECT 
 1 AS `n_ticket`,
 1 AS `id_entrada`,
 1 AS `id_espacio`,
 1 AS `Dni`,
 1 AS `nombre`,
 1 AS `id_vehiculo`,
 1 AS `placa`,
 1 AS `nombreTipoVehiculo`,
 1 AS `hora_entrada`,
 1 AS `id_plan`,
 1 AS `descripcion`,
 1 AS `duracion`,
 1 AS `tipoDuracion`,
 1 AS `precioPorHora`,
 1 AS `preciototal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaespacio`
--

DROP TABLE IF EXISTS `vistaespacio`;
/*!50001 DROP VIEW IF EXISTS `vistaespacio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaespacio` AS SELECT 
 1 AS `id_espacio`,
 1 AS `numero`,
 1 AS `nombreTipoVehiculo`,
 1 AS `ocupado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaplan`
--

DROP TABLE IF EXISTS `vistaplan`;
/*!50001 DROP VIEW IF EXISTS `vistaplan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaplan` AS SELECT 
 1 AS `descripcion`,
 1 AS `n_recibo`,
 1 AS `placa`,
 1 AS `dniPropietario`,
 1 AS `nombrePropietario`,
 1 AS `hora_entrada`,
 1 AS `hora_salida`,
 1 AS `TotalHoras`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaplanesnombre`
--

DROP TABLE IF EXISTS `vistaplanesnombre`;
/*!50001 DROP VIEW IF EXISTS `vistaplanesnombre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaplanesnombre` AS SELECT 
 1 AS `idPlanes`,
 1 AS `id_tipoVehiculo`,
 1 AS `nombreTipoVehiculo`,
 1 AS `descripcion`,
 1 AS `duracion`,
 1 AS `tipoDuracion`,
 1 AS `precioPorHora`,
 1 AS `precioRef`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistarecibosalida`
--

DROP TABLE IF EXISTS `vistarecibosalida`;
/*!50001 DROP VIEW IF EXISTS `vistarecibosalida`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistarecibosalida` AS SELECT 
 1 AS `n_recibo`,
 1 AS `numero`,
 1 AS `nombreEmpleado`,
 1 AS `placa`,
 1 AS `dniPropietario`,
 1 AS `nombrePropietario`,
 1 AS `nombreTipoVehiculo`,
 1 AS `hora_entrada`,
 1 AS `hora_salida`,
 1 AS `TotalHoras`,
 1 AS `subTotal`,
 1 AS `IGV`,
 1 AS `Descuento`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistareporteentrada`
--

DROP TABLE IF EXISTS `vistareporteentrada`;
/*!50001 DROP VIEW IF EXISTS `vistareporteentrada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistareporteentrada` AS SELECT 
 1 AS `id_entrada`,
 1 AS `n_ticket`,
 1 AS `placa`,
 1 AS `nombreTipoVehiculo`,
 1 AS `hora_entrada`,
 1 AS `descripcion`,
 1 AS `duracion`,
 1 AS `tipoDuracion`,
 1 AS `minutos_transcurridos`,
 1 AS `precioPorHora`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistareportesalida`
--

DROP TABLE IF EXISTS `vistareportesalida`;
/*!50001 DROP VIEW IF EXISTS `vistareportesalida`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistareportesalida` AS SELECT 
 1 AS `id_salida`,
 1 AS `placa`,
 1 AS `hora_salida`,
 1 AS `TotalHoras`,
 1 AS `subTotal`,
 1 AS `IGV`,
 1 AS `Descuento`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistavehiculopropietario`
--

DROP TABLE IF EXISTS `vistavehiculopropietario`;
/*!50001 DROP VIEW IF EXISTS `vistavehiculopropietario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistavehiculopropietario` AS SELECT 
 1 AS `nombre`,
 1 AS `propietario_dni`,
 1 AS `placa`,
 1 AS `modelo`,
 1 AS `marca`,
 1 AS `id_vehiculo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'sisparqueadero'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_Login`(
in pusuario varchar(20), 
in pcontrasena text, 
in pdescripcion varchar(80))
BEGIN
SELECT em.id_empleado, em.identificacion, em.nombre ,em.usuario, em.contrasena,te.IdTipoEmpleado 
FROM empleado AS em INNER JOIN tipo_empleado AS te ON em.IdTipoEmpleado = te.IdTipoEmpleado WHERE em.usuario = pusuario AND
 em.contrasena = pcontrasena AND te.IdTipoEmpleado = pdescripcion;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_S_LoginPermisos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_S_LoginPermisos`(
	IN `pnombre_usuario` VARCHAR(20),
	IN `pdescripcion_tipousuario` VARCHAR(80)
)
BEGIN
SELECT te.IdTipoEmpleado,em.usuario,te.descripcion,te.propietario,te.tipo_vehiculo,te.vehiculo,te.espacio,te.registros,te.precios,te.configuracion,te.usuario 
FROM tipo_empleado AS te 
INNER JOIN empleado AS em ON te.IdTipoEmpleado = em.IdTipoEmpleado
WHERE em.usuario COLLATE utf8mb4_general_ci = pnombre_usuario AND te.descripcion COLLATE utf8mb4_general_ci = pdescripcion_tipousuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `sisparqueadero`
--

USE `sisparqueadero`;

--
-- Final view structure for view `vistacompletaentrada`
--

/*!50001 DROP VIEW IF EXISTS `vistacompletaentrada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistacompletaentrada` AS select `registro_entrada`.`n_ticket` AS `n_ticket`,`registro_entrada`.`id_entrada` AS `id_entrada`,`registro_entrada`.`id_espacio` AS `id_espacio`,`propietario`.`Dni` AS `Dni`,`propietario`.`nombre` AS `nombre`,`vehiculo`.`id_vehiculo` AS `id_vehiculo`,`vehiculo`.`placa` AS `placa`,`tipo_vehiculo`.`nombreTipoVehiculo` AS `nombreTipoVehiculo`,`registro_entrada`.`hora_entrada` AS `hora_entrada`,`registro_entrada`.`id_plan` AS `id_plan`,`planes`.`descripcion` AS `descripcion`,`planes`.`duracion` AS `duracion`,`planes`.`tipoDuracion` AS `tipoDuracion`,`planes`.`precioPorHora` AS `precioPorHora`,`planes`.`precioRef` AS `preciototal` from ((((`registro_entrada` join `vehiculo` on((`registro_entrada`.`id_vehiculo` = `vehiculo`.`id_vehiculo`))) join `tipo_vehiculo` on((`vehiculo`.`idTipoVehiculo` = `tipo_vehiculo`.`idTipoVehiculo`))) join `propietario` on((`vehiculo`.`propietario_dni` = `propietario`.`Dni`))) join `planes` on((`registro_entrada`.`id_plan` = `planes`.`idPlanes`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaespacio`
--

/*!50001 DROP VIEW IF EXISTS `vistaespacio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaespacio` AS select `espacio`.`id_espacio` AS `id_espacio`,`espacio`.`numero` AS `numero`,`tipo_vehiculo`.`nombreTipoVehiculo` AS `nombreTipoVehiculo`,`espacio`.`ocupado` AS `ocupado` from (`espacio` join `tipo_vehiculo` on((`espacio`.`id_TVehiculo` = `tipo_vehiculo`.`idTipoVehiculo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaplan`
--

/*!50001 DROP VIEW IF EXISTS `vistaplan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaplan` AS select `planes`.`descripcion` AS `descripcion`,`registro_salida`.`n_recibo` AS `n_recibo`,`vehiculo`.`placa` AS `placa`,`propietario`.`Dni` AS `dniPropietario`,`propietario`.`nombre` AS `nombrePropietario`,`registro_entrada`.`hora_entrada` AS `hora_entrada`,`registro_salida`.`hora_salida` AS `hora_salida`,`registro_salida`.`TotalHoras` AS `TotalHoras`,`registro_salida`.`Total` AS `Total` from (((((((`registro_salida` join `registro_entrada` on((`registro_salida`.`id_entrada` = `registro_entrada`.`id_entrada`))) join `espacio` on((`espacio`.`id_espacio` = `registro_entrada`.`id_espacio`))) join `vehiculo` on((`vehiculo`.`id_vehiculo` = `registro_entrada`.`id_vehiculo`))) join `tipo_vehiculo` on((`tipo_vehiculo`.`idTipoVehiculo` = `vehiculo`.`idTipoVehiculo`))) join `propietario` on((`propietario`.`Dni` = `vehiculo`.`propietario_dni`))) join `empleado` on((`empleado`.`id_empleado` = `registro_entrada`.`id_empleado`))) join `planes` on((`planes`.`idPlanes` = `registro_entrada`.`id_plan`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaplanesnombre`
--

/*!50001 DROP VIEW IF EXISTS `vistaplanesnombre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaplanesnombre` AS select `planes`.`idPlanes` AS `idPlanes`,`planes`.`id_tipoVehiculo` AS `id_tipoVehiculo`,`tipo_vehiculo`.`nombreTipoVehiculo` AS `nombreTipoVehiculo`,`planes`.`descripcion` AS `descripcion`,`planes`.`duracion` AS `duracion`,`planes`.`tipoDuracion` AS `tipoDuracion`,`planes`.`precioPorHora` AS `precioPorHora`,`planes`.`precioRef` AS `precioRef` from (`planes` join `tipo_vehiculo` on((`planes`.`id_tipoVehiculo` = `tipo_vehiculo`.`idTipoVehiculo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistarecibosalida`
--

/*!50001 DROP VIEW IF EXISTS `vistarecibosalida`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistarecibosalida` AS select `registro_salida`.`n_recibo` AS `n_recibo`,`espacio`.`numero` AS `numero`,`empleado`.`nombre` AS `nombreEmpleado`,`vehiculo`.`placa` AS `placa`,`propietario`.`Dni` AS `dniPropietario`,`propietario`.`nombre` AS `nombrePropietario`,`tipo_vehiculo`.`nombreTipoVehiculo` AS `nombreTipoVehiculo`,`registro_entrada`.`hora_entrada` AS `hora_entrada`,`registro_salida`.`hora_salida` AS `hora_salida`,`registro_salida`.`TotalHoras` AS `TotalHoras`,`registro_salida`.`subTotal` AS `subTotal`,`registro_salida`.`IGV` AS `IGV`,`registro_salida`.`Descuento` AS `Descuento`,`registro_salida`.`Total` AS `Total` from ((((((`registro_salida` join `registro_entrada` on((`registro_salida`.`id_entrada` = `registro_entrada`.`id_entrada`))) join `espacio` on((`espacio`.`id_espacio` = `registro_entrada`.`id_espacio`))) join `vehiculo` on((`vehiculo`.`id_vehiculo` = `registro_entrada`.`id_vehiculo`))) join `tipo_vehiculo` on((`tipo_vehiculo`.`idTipoVehiculo` = `vehiculo`.`idTipoVehiculo`))) join `propietario` on((`propietario`.`Dni` = `vehiculo`.`propietario_dni`))) join `empleado` on((`empleado`.`id_empleado` = `registro_entrada`.`id_empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistareporteentrada`
--

/*!50001 DROP VIEW IF EXISTS `vistareporteentrada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistareporteentrada` AS select `registro_entrada`.`id_entrada` AS `id_entrada`,`registro_entrada`.`n_ticket` AS `n_ticket`,`vehiculo`.`placa` AS `placa`,`tipo_vehiculo`.`nombreTipoVehiculo` AS `nombreTipoVehiculo`,`registro_entrada`.`hora_entrada` AS `hora_entrada`,`planes`.`descripcion` AS `descripcion`,`planes`.`duracion` AS `duracion`,`planes`.`tipoDuracion` AS `tipoDuracion`,timestampdiff(MINUTE,`registro_entrada`.`hora_entrada`,now()) AS `minutos_transcurridos`,`planes`.`precioPorHora` AS `precioPorHora` from ((((`registro_entrada` join `vehiculo` on((`registro_entrada`.`id_vehiculo` = `vehiculo`.`id_vehiculo`))) join `tipo_vehiculo` on((`vehiculo`.`idTipoVehiculo` = `tipo_vehiculo`.`idTipoVehiculo`))) join `propietario` on((`vehiculo`.`propietario_dni` = `propietario`.`Dni`))) join `planes` on((`registro_entrada`.`id_plan` = `planes`.`idPlanes`))) where (`registro_entrada`.`estado` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistareportesalida`
--

/*!50001 DROP VIEW IF EXISTS `vistareportesalida`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistareportesalida` AS select `registro_salida`.`id_salida` AS `id_salida`,`vehiculo`.`placa` AS `placa`,`registro_salida`.`hora_salida` AS `hora_salida`,`registro_salida`.`TotalHoras` AS `TotalHoras`,`registro_salida`.`subTotal` AS `subTotal`,`registro_salida`.`IGV` AS `IGV`,`registro_salida`.`Descuento` AS `Descuento`,`registro_salida`.`Total` AS `Total` from ((`registro_salida` join `registro_entrada` on((`registro_salida`.`id_entrada` = `registro_entrada`.`id_entrada`))) join `vehiculo` on((`registro_entrada`.`id_vehiculo` = `vehiculo`.`id_vehiculo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistavehiculopropietario`
--

/*!50001 DROP VIEW IF EXISTS `vistavehiculopropietario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistavehiculopropietario` AS select `propietario`.`nombre` AS `nombre`,`vehiculo`.`propietario_dni` AS `propietario_dni`,`vehiculo`.`placa` AS `placa`,`vehiculo`.`modelo` AS `modelo`,`vehiculo`.`marca` AS `marca`,`vehiculo`.`id_vehiculo` AS `id_vehiculo` from (`vehiculo` join `propietario` on((`vehiculo`.`propietario_dni` = `propietario`.`Dni`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-08 14:25:09
