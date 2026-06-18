-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smartfactory
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alerta`
--

DROP TABLE IF EXISTS `alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta` (
  `id_alerta` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_alerta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta`
--

LOCK TABLES `alerta` WRITE;
/*!40000 ALTER TABLE `alerta` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento` (
  `id_equipamento` int NOT NULL AUTO_INCREMENT,
  `nome_equipamento` varchar(50) NOT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `fk_setor` int DEFAULT NULL,
  `status_equipamento` varchar(50) NOT NULL,
  PRIMARY KEY (`id_equipamento`),
  KEY `fk_setor` (`fk_setor`),
  CONSTRAINT `fk_setor` FOREIGN KEY (`fk_setor`) REFERENCES `setor` (`id_setor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitura`
--

DROP TABLE IF EXISTS `leitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitura` (
  `id_leitura` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_leitura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura`
--

LOCK TABLES `leitura` WRITE;
/*!40000 ALTER TABLE `leitura` DISABLE KEYS */;
/*!40000 ALTER TABLE `leitura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensor` (
  `id_sensor` int NOT NULL AUTO_INCREMENT,
  `limite_minimo` int NOT NULL,
  `limite_maximo` int NOT NULL,
  `fk_tipo` int DEFAULT NULL,
  `fk_equipamento` int DEFAULT NULL,
  PRIMARY KEY (`id_sensor`),
  KEY `fk_tipo` (`fk_tipo`),
  KEY `fk_equipamento` (`fk_equipamento`),
  CONSTRAINT `fk_equipamento` FOREIGN KEY (`fk_equipamento`) REFERENCES `equipamento` (`id_equipamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo` FOREIGN KEY (`fk_tipo`) REFERENCES `tipo_sensor` (`id_tipo_sensor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setor` (
  `id_setor` int NOT NULL AUTO_INCREMENT,
  `nome_setor` varchar(50) NOT NULL,
  PRIMARY KEY (`id_setor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_smartfactory`
--

DROP TABLE IF EXISTS `tb_smartfactory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_smartfactory` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `data_leitura` date DEFAULT NULL,
  `equipamento` varchar(50) DEFAULT NULL,
  `setor` varchar(50) DEFAULT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `tipo_sensor` varchar(20) DEFAULT NULL,
  `codigo_sensor` char(8) DEFAULT NULL,
  `varlor_leitura` int DEFAULT NULL,
  `limite_min` int DEFAULT NULL,
  `limite_max` int DEFAULT NULL,
  `nivel_alerta` varchar(10) DEFAULT NULL,
  `status_equipamento` varchar(15) DEFAULT NULL,
  `alerta_gerado` varchar(10) DEFAULT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  `horario_leitura` time DEFAULT NULL,
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_smartfactory`
--

LOCK TABLES `tb_smartfactory` WRITE;
/*!40000 ALTER TABLE `tb_smartfactory` DISABLE KEYS */;
INSERT INTO `tb_smartfactory` VALUES (2,'2025-03-20','Pensa Hidraulica','Montagem ','','Temperatura','SEN-7881',350,20,80,'Medio','Ativo','Nao','','21:53:00'),(4,'2025-05-02','Torno CNC','Montagem ','','Temperatura','SEN-3035',350,20,80,'Medio','Inativo','Sim','','06:31:00'),(8,'2025-06-30','Torno CNC','Montagem ','','Temperatura','SEN-6858',200,20,80,'Critico','Inativo','Nao','','18:10:00'),(10,'2025-03-07','Torno CNC','Usinagem','','Temperatura','SEN-6374',-20,20,80,'Baixo','Ativo','Sim','','10:15:00'),(12,'2025-02-01','Torno CNC','Montagem ','','Temperatura ','SEN-8054',200,20,80,'Medio','Inativo','Nao','','00:25:00'),(14,'2025-05-24','Torno CNC','Usinagem','','Temperatura','SEN-3466',350,20,80,'Baixo','Inativo','Sim','','06:42:00'),(16,'2025-06-29','Torno CNC','Montagem ','','Temperatura ','SEN-4448',200,20,80,'Alto','Ativo','Nao','','07:02:00'),(17,'2025-04-28','Torno CNC','Montagem ','','Temperatura','SEN-4020',-20,20,80,'Baixo','Ativo','Nao','','21:40:00'),(18,'2025-02-13','Torno CNC','Montagem ','','Temperatura','SEN-2270',-20,20,80,'Critico','Inativo','Sim','','23:42:00'),(21,'2025-06-08','Torno CNC','Usinagem','','Temperatura','SEN-6625',200,20,80,'Alto','Inativo','Nao','','19:13:00'),(23,'2025-04-29','Torno CNC','Montagem ','','Vibracao','SEN-7004',350,20,80,'Alto','Inativo','Sim','','13:03:00'),(25,'2025-01-24','Torno CNC','Montagem ','','Temperatura','SEN-2644',200,20,80,'Critico','Ativo','Sim','','05:54:00'),(35,'2025-02-22','Pensa Hidraulica','Montagem ','','Vibracao','SEN-7322',350,20,80,'Alto','Ativo','Sim','','13:02:00'),(40,'2025-04-09','Centro de Usinagem','Montagem ','','Vibracao','SEN-2636',200,20,80,'Critico','Manutencao','Sim','','00:40:00'),(44,'2025-03-31','Soldadora','Montagem ','','Temperatura','SEN-7219',350,20,80,'Baixo','Inativo','Sim','','09:16:00'),(47,'2025-03-29','Injetora 01','Usinagem','','Temperatura','SEN-4439',350,20,80,'Alto','Inativo','Sim','','13:28:00'),(49,'2025-01-25','Injetora 01','Usinagem','','Vibracao','SEN-9773',350,20,80,'Baixo','Ativo','Nao','','03:41:00'),(50,'2025-06-02','Injetora 01','Usinagem','','Temperatura ','SEN-3600',200,20,80,'Baixo','Ativo','Nao','','07:11:00'),(58,'2025-06-21','Pensa Hidraulica','Usinagem','','Temperatura ','SEN-4386',350,20,80,'Medio','Inativo','Sim','','20:34:00'),(60,'2025-01-23','Injetora 02','Montagem ','','Vibracao','SEN-5042',-20,20,80,'Baixo','Ativo','Sim','','16:50:00'),(65,'2025-01-22','Centro de Usinagem','Usinagem','','Temperatura','SEN-7796',350,20,80,'Medio','Inativo','Nao','','18:22:00'),(67,'2025-01-13','Soldadora','Montagem ','','Temperatura','SEN-8782',-20,20,80,'Alto','Inativo','Sim','','12:48:00'),(68,'2025-02-07','Caldeira','Montagem ','','Vibracao','SEN-2805',200,20,80,'Alto','Ativo','Nao','','19:51:00'),(73,'2025-04-23','Torno CNC','Usinagem','','Temperatura ','SEN-3768',-20,20,80,'Baixo','Manutencao','Sim','','02:29:00'),(78,'2025-03-19','Compressor 01','Montagem ','','Vibracao','SEN-4137',-20,20,80,'Critico','Manutencao','Sim','','04:51:00'),(84,'2025-02-15','Injetora 02','Usinagem','','Temperatura ','SEN-5202',200,20,80,'Baixo','Manutencao','Sim','','13:16:00'),(85,'2025-05-30','Compressor 02','Usinagem','','Temperatura','SEN-1449',350,20,80,'Alto','Manutencao','Nao','','23:19:00'),(86,'2025-04-19','Injetora 01','Montagem ','','Temperatura ','SEN-9812',350,20,80,'Medio','Inativo','Nao','','03:13:00'),(88,'2025-05-04','Torno CNC','Montagem ','','Vibracao','SEN-2964',200,20,80,'Alto','Ativo','Nao','','10:42:00'),(93,'2025-01-05','Esteira Principal','Usinagem','','Temperatura','SEN-3677',350,20,80,'Alto','Manutencao','Nao','','09:19:00'),(98,'2025-06-22','Caldeira','Usinagem','','Temperatura','SEN-2062',-20,20,80,'Medio','Ativo','Sim','','09:34:00'),(99,'2025-03-30','Centro de Usinagem','Usinagem','','Vibracao','SEN-1207',-20,20,80,'Alto','Manutencao','Nao','','10:23:00'),(106,'2025-01-14','Esteira Principal','Montagem ','','Temperatura','SEN-9314',-20,20,80,'Baixo','Inativo','Nao','','14:01:00'),(107,'2025-02-13','Compressor 02','Montagem ','','Vibracao','SEN-5305',-20,20,80,'Baixo','Ativo','Sim','','05:17:00'),(108,'2025-01-07','Esteira Principal','Montagem ','','Temperatura ','SEN-8237',350,20,80,'Baixo','Manutencao','Sim','','18:34:00'),(109,'2025-02-18','Esteira Principal','Montagem ','','Temperatura','SEN-6468',350,20,80,'Baixo','Manutencao','Sim','','19:32:00'),(110,'2025-05-02','Compressor 01','Montagem ','','Temperatura ','SEN-7163',350,20,80,'Medio','Inativo','Nao','','03:26:00'),(116,'2025-03-16','Compressor 02','Montagem ','','Temperatura ','SEN-4120',-20,20,80,'Baixo','Inativo','Sim','','16:31:00'),(117,'2025-03-01','Caldeira','Montagem ','','Vibracao','SEN-3522',200,20,80,'Critico','Ativo','Sim','','19:26:00'),(119,'2025-05-27','Centro de Usinagem','Usinagem','','Temperatura','SEN-6437',350,20,80,'Alto','Ativo','Nao','','13:42:00'),(120,'2025-06-05','Compressor 02','Usinagem','','Vibracao','SEN-4233',350,20,80,'Baixo','Manutencao','Nao','','00:03:00'),(121,'2025-06-23','Esteira Principal','Montagem ','','Temperatura','SEN-9292',350,20,80,'Critico','Ativo','Nao','','12:57:00'),(122,'2025-04-23','Compressor 01','Usinagem','','Temperatura ','SEN-6475',-20,20,80,'Critico','Inativo','Nao','','22:00:00'),(124,'2025-03-23','Compressor 01','Montagem ','','Vibracao','SEN-1160',350,20,80,'Critico','Ativo','Nao','','14:25:00'),(125,'2025-06-02','Compressor 02','Montagem ','','Vibracao','SEN-4740',200,20,80,'Alto','Inativo','Sim','','03:41:00'),(126,'2025-05-10','Torno CNC','Usinagem','','Temperatura','SEN-1010',-20,20,80,'Alto','Inativo','Sim','','14:18:00'),(128,'2025-03-25','Compressor 01','Montagem ','','Temperatura','SEN-1104',350,20,80,'Baixo','Inativo','Sim','','04:42:00'),(129,'2025-06-06','Injetora 02','Montagem ','','Temperatura','SEN-2198',-20,20,80,'Medio','Inativo','Nao','','22:22:00'),(131,'2025-06-13','Injetora 01','Usinagem','','Temperatura','SEN-6644',200,20,80,'Alto','Manutencao','Nao','','23:42:00'),(132,'2025-02-22','Caldeira','Montagem ','','Temperatura ','SEN-7347',350,20,80,'Medio','Ativo','Sim','','01:18:00'),(133,'2025-02-15','Compressor 02','Usinagem','','Temperatura ','SEN-5954',350,20,80,'Medio','Inativo','Nao','','18:14:00'),(134,'2025-02-10','Centro de Usinagem','Montagem ','','Temperatura ','SEN-3384',200,20,80,'Baixo','Inativo','Sim','','21:22:00'),(140,'2025-05-31','Esteira Principal','Usinagem','','Temperatura ','SEN-9375',-20,20,80,'Alto','Ativo','Nao','','00:26:00'),(143,'2025-05-11','Injetora 02','Montagem ','','Temperatura ','SEN-9293',-20,20,80,'Critico','Inativo','Nao','','23:22:00'),(149,'2025-04-14','Injetora 02','Montagem ','','Temperatura','SEN-9501',200,20,80,'Medio','Manutencao','Sim','','06:29:00'),(151,'2025-03-09','Compressor 01','Montagem ','','Temperatura','SEN-2297',350,20,80,'Alto','Ativo','Sim','','18:34:00'),(162,'2025-02-17','Centro de Usinagem','Montagem ','','Vibracao','SEN-4778',-20,20,80,'Critico','Manutencao','Nao','','16:10:00'),(163,'2025-01-19','Injetora 01','Usinagem','','Vibracao','SEN-7637',200,20,80,'Alto','Ativo','Nao','','23:20:00'),(164,'2025-05-30','Pensa Hidraulica','Montagem ','','Temperatura ','SEN-2193',200,20,80,'Baixo','Inativo','Nao','','23:09:00'),(166,'2025-01-14','Caldeira','Montagem ','','Temperatura','SEN-2706',-20,20,80,'Critico','Ativo','Sim','','12:07:00'),(167,'2025-06-08','Soldadora','Montagem ','','Vibracao','SEN-2406',350,20,80,'Alto','Inativo','Sim','','21:36:00'),(176,'2025-03-05','Caldeira','Montagem ','','Temperatura','SEN-7227',200,20,80,'Baixo','Inativo','Sim','','03:32:00'),(177,'2025-01-31','Torno CNC','Montagem ','','Vibracao','SEN-6814',350,20,80,'Critico','Manutencao','Sim','','15:24:00'),(179,'2025-05-02','Compressor 02','Usinagem','','Vibracao','SEN-5140',350,20,80,'Medio','Inativo','Nao','','07:18:00'),(180,'2025-04-19','Centro de Usinagem','Usinagem','','Vibracao','SEN-5235',350,20,80,'Critico','Ativo','Nao','','22:26:00'),(187,'2025-03-18','Compressor 01','Montagem ','','Vibracao','SEN-1491',350,20,80,'Baixo','Manutencao','Sim','','23:23:00'),(194,'2025-04-21','Compressor 01','Usinagem','','Temperatura','SEN-9893',350,20,80,'Alto','Ativo','Sim','','15:52:00'),(200,'2025-01-05','Injetora 02','Usinagem','','Temperatura ','SEN-3961',-20,20,80,'Medio','Ativo','Nao','','01:49:00'),(202,'2025-04-01','Compressor 01','Montagem ','','Temperatura ','SEN-4500',350,20,80,'Alto','Inativo','Nao','','17:06:00'),(203,'2025-04-07','Esteira Principal','Montagem ','','Temperatura','SEN-9661',-20,20,80,'Baixo','Inativo','Nao','','19:59:00'),(204,'2025-01-26','Soldadora','Usinagem','','Vibracao','SEN-9363',-20,20,80,'Baixo','Ativo','Sim','','07:08:00'),(206,'2025-06-17','Esteira Principal','Montagem ','','Temperatura','SEN-7751',350,20,80,'Medio','Manutencao','Nao','','23:13:00'),(210,'2025-02-12','Centro de Usinagem','Montagem ','','Temperatura','SEN-2477',350,20,80,'Baixo','Manutencao','Nao','','19:35:00'),(213,'2025-06-12','Injetora 02','Montagem ','','Temperatura ','SEN-9504',200,20,80,'Medio','Manutencao','Nao','','14:21:00'),(223,'2025-05-03','Soldadora','Montagem ','','Vibracao','SEN-5638',200,20,80,'Critico','Ativo','Sim','','16:20:00'),(224,'2025-03-09','Injetora 01','Usinagem','','Temperatura ','SEN-5142',350,20,80,'Medio','Manutencao','Sim','','05:57:00'),(225,'2025-04-09','Injetora 01','Usinagem','','Temperatura','SEN-2314',350,20,80,'Medio','Ativo','Sim','','06:24:00'),(229,'2025-05-22','Centro de Usinagem','Usinagem','','Vibracao','SEN-7363',200,20,80,'Critico','Ativo','Sim','','02:11:00'),(230,'2025-06-29','Torno CNC','Montagem ','','Temperatura','SEN-9071',200,20,80,'Alto','Manutencao','Sim','','08:47:00'),(232,'2025-05-12','Centro de Usinagem','Usinagem','','Vibracao','SEN-4606',200,20,80,'Critico','Ativo','Nao','','09:07:00'),(235,'2025-05-27','Pensa Hidraulica','Montagem ','','Temperatura ','SEN-3459',-20,20,80,'Critico','Manutencao','Sim','','06:31:00'),(245,'2025-06-26','Torno CNC','Usinagem','','Temperatura','SEN-9352',200,20,80,'Critico','Ativo','Nao','','06:55:00'),(249,'2025-06-24','Pensa Hidraulica','Montagem ','','Temperatura','SEN-2085',-20,20,80,'Baixo','Inativo','Sim','','05:54:00'),(250,'2025-05-31','Compressor 02','Usinagem','','Temperatura','SEN-1968',-20,20,80,'Baixo','Manutencao','Nao','','20:46:00'),(251,'2025-06-01','Soldadora','Usinagem','','Vibracao','SEN-7907',-20,20,80,'Medio','Inativo','Sim','','12:47:00'),(253,'2025-03-07','Compressor 01','Usinagem','','Vibracao','SEN-6833',200,20,80,'Alto','Manutencao','Sim','','01:40:00'),(255,'2025-02-25','Esteira Principal','Montagem ','','Temperatura ','SEN-9321',350,20,80,'Medio','Inativo','Nao','','08:34:00'),(259,'2025-01-13','Centro de Usinagem','Usinagem','','Vibracao','SEN-1358',-20,20,80,'Medio','Inativo','Sim','','18:05:00'),(271,'2025-04-30','Soldadora','Usinagem','','Temperatura','SEN-2777',-20,20,80,'Baixo','Inativo','Nao','','15:08:00'),(272,'2025-01-26','Pensa Hidraulica','Usinagem','','Temperatura','SEN-9176',-20,20,80,'Baixo','Manutencao','Nao','','13:00:00'),(275,'2025-01-11','Centro de Usinagem','Montagem ','','Vibracao','SEN-2468',-20,20,80,'Critico','Ativo','Sim','','18:59:00'),(281,'2025-06-13','Injetora 02','Montagem ','','Temperatura','SEN-3418',200,20,80,'Medio','Inativo','Sim','','14:58:00'),(282,'2025-02-18','Torno CNC','Usinagem','','Vibracao','SEN-7279',-20,20,80,'Medio','Inativo','Sim','','10:21:00'),(283,'2025-05-22','Injetora 02','Montagem ','','Temperatura ','SEN-5204',-20,20,80,'Critico','Manutencao','Nao','','06:46:00'),(284,'2025-02-15','Injetora 02','Usinagem','','Temperatura ','SEN-5963',350,20,80,'Medio','Inativo','Sim','','01:31:00'),(297,'2025-01-08','Soldadora','Usinagem','','Vibracao','SEN-9896',350,20,80,'Medio','Inativo','Sim','','16:56:00');
/*!40000 ALTER TABLE `tb_smartfactory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sensor`
--

DROP TABLE IF EXISTS `tipo_sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_sensor` (
  `id_tipo_sensor` int NOT NULL AUTO_INCREMENT,
  `nome_tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_sensor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sensor`
--

LOCK TABLES `tipo_sensor` WRITE;
/*!40000 ALTER TABLE `tipo_sensor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_sensor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-03 11:30:48
