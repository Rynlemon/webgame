-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: webgame
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

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
-- Current Database: `webgame`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `webgame` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `webgame`;

--
-- Table structure for table `Balanceball`
--

DROP TABLE IF EXISTS `Balanceball`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Balanceball` (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score` int NOT NULL,
  `ba_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ba_id`) USING BTREE,
  KEY `Balanceball_rank` (`score` DESC),
  KEY `balanceball` (`username`),
  CONSTRAINT `balanceball` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Balanceball`
--

LOCK TABLES `Balanceball` WRITE;
/*!40000 ALTER TABLE `Balanceball` DISABLE KEYS */;
INSERT INTO `Balanceball` VALUES ('111',90,1),('111',30,2),('zhanghaokun',120,3),('1',60,4);
/*!40000 ALTER TABLE `Balanceball` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fangkuai`
--

DROP TABLE IF EXISTS `fangkuai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fangkuai` (
  `username` varchar(255) NOT NULL,
  `score` int NOT NULL,
  `fangkuai_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fangkuai_id`) USING BTREE,
  KEY `fangkuai_rank` (`score` DESC),
  KEY `fangkuai` (`username`),
  CONSTRAINT `fangkuai` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fangkuai`
--

LOCK TABLES `fangkuai` WRITE;
/*!40000 ALTER TABLE `fangkuai` DISABLE KEYS */;
INSERT INTO `fangkuai` VALUES ('111',90,1),('111',30,2),('张浩坤',120,3),('1',60,4),('444',40,5);
/*!40000 ALTER TABLE `fangkuai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_logs`
--

DROP TABLE IF EXISTS `login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `login_time` datetime NOT NULL,
  `browser_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_log` (`username`),
  CONSTRAINT `user_log` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_logs`
--

LOCK TABLES `login_logs` WRITE;
/*!40000 ALTER TABLE `login_logs` DISABLE KEYS */;
INSERT INTO `login_logs` VALUES (8,'444','2a09:bac1:3b40:10::16:223','2025-03-21 08:59:42','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(9,'111','240e:440:250e:287c:f094:94b0:f3f8:7f5d','2025-03-21 09:01:55','Mozilla/5.0 (iPhone; CPU iPhone OS 16_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1'),(10,'444','2a09:bac1:3b40:10::16:223','2025-03-21 09:03:09','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(11,'444','2a09:bac1:3b40:10::16:223','2025-03-21 09:03:55','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(12,'444','2a09:bac1:3b40:10::16:223','2025-03-21 09:06:16','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(13,'111','240e:440:250e:287c:bcf7:9b5c:568d:11c9','2025-03-21 09:08:30','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(14,'444','2a09:bac1:3b40:10::16:223','2025-03-21 09:11:35','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(15,'111','2a09:bac1:3b40:10::16:223','2025-03-21 09:18:04','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(16,'111','2a09:bac1:3b40:10::16:223','2025-03-21 09:21:12','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(17,'444','2a09:bac1:3b40:10::16:223','2025-03-21 09:22:04','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(18,'111','2a09:bac1:3b40:10::16:223','2025-03-21 09:23:33','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(19,'111','2409:8907:c412:6f37:4012:37ff:fe5d:78a','2025-03-21 09:28:07','Mozilla/5.0 (Linux; Android 11; Hebe-BD00; HMSCore 6.15.0.302) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.196 HuaweiBrowser/15.0.10.302 Mobile Safari/537.36'),(20,'111','2a09:bac1:3b40:10::16:223','2025-03-21 22:14:15','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(21,'111','123.181.202.187','2025-03-22 13:55:46','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(22,'111','123.181.202.187','2025-03-22 13:55:53','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(23,'111','123.181.202.187','2025-03-22 13:55:53','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(24,'111','123.181.202.187','2025-03-22 13:55:53','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(25,'111','123.181.202.187','2025-03-22 13:55:53','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(26,'111','123.181.202.187','2025-03-22 13:55:53','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(27,'111','123.181.202.187','2025-03-22 13:55:53','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(28,'111','123.181.202.187','2025-03-22 13:55:54','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(29,'111','123.181.202.187','2025-03-22 13:55:54','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(30,'111','123.181.202.187','2025-03-22 13:55:54','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(31,'111','123.181.202.187','2025-03-22 13:55:54','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(32,'111','123.181.202.187','2025-03-22 13:55:54','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(33,'111','123.181.202.187','2025-03-22 13:55:55','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(34,'111','123.181.202.187','2025-03-22 13:55:55','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(35,'111','123.181.202.187','2025-03-22 13:55:55','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(36,'111','123.181.202.187','2025-03-22 13:55:55','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(37,'111','123.181.202.187','2025-03-22 13:55:55','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(38,'111','123.181.202.187','2025-03-22 13:55:55','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(39,'111','123.181.202.187','2025-03-22 13:55:55','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(40,'111','240e:441:2514:bc4d:850e:dc4f:fd79:ca3f','2025-03-22 19:40:34','Mozilla/5.0 (iPhone; CPU iPhone OS 16_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1'),(41,'111','123.181.202.187','2025-03-22 22:13:24','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(42,'111','123.181.204.143','2025-03-24 16:00:06','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(43,'111','123.181.204.143','2025-03-24 16:00:06','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(44,'123','123.181.204.143','2025-03-24 16:00:56','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(45,'ssy','120.6.45.122','2025-03-27 13:54:25','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(46,'123','211.81.255.2','2025-03-27 14:52:56','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(47,'123456','211.81.255.2','2025-03-27 14:58:50','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0'),(48,'123','211.81.255.2','2025-03-27 15:03:52','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(49,'123456','211.81.255.2','2025-03-27 15:04:05','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0'),(50,'123456','2408:841c:2530:cb5a:41c7:13be:e4f5:586d','2025-03-27 15:11:12','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0'),(51,'123456','211.81.255.2','2025-03-27 15:14:27','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0'),(52,'123456','2407:cdc0:96fa:cfa4:b0af:7da6:1576:921a','2025-03-27 15:38:24','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0'),(53,'ssy','120.6.45.122','2025-03-27 15:39:08','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(54,'123456','211.81.255.2','2025-03-27 15:41:56','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0'),(55,'111','2400:8902::f03c:95ff:fecd:1992','2025-03-27 16:08:52','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(56,'111','2400:8902::f03c:95ff:fecd:1992','2025-03-27 23:44:53','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'),(57,'111','211.81.255.5','2025-03-28 08:14:28','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(58,'111','106.9.73.73','2025-03-28 09:48:10','Mozilla/5.0 (iPhone; CPU iPhone OS 16_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1');
/*!40000 ALTER TABLE `login_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_login` BEFORE INSERT ON `login_logs` FOR EACH ROW BEGIN
    SET NEW.login_time = DATE_ADD(NEW.login_time, INTERVAL 8 HOUR);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `saolei`
--

DROP TABLE IF EXISTS `saolei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saolei` (
  `username` varchar(255) NOT NULL,
  `score` int NOT NULL,
  `saolei_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`saolei_id`) USING BTREE,
  KEY `saolei_rank` (`score` DESC),
  KEY `saolei` (`username`),
  KEY `saolei_asc` (`score`),
  CONSTRAINT `saolei` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saolei`
--

LOCK TABLES `saolei` WRITE;
/*!40000 ALTER TABLE `saolei` DISABLE KEYS */;
INSERT INTO `saolei` VALUES ('张浩坤',120,3),('1',60,4),('444',74,5);
/*!40000 ALTER TABLE `saolei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoot`
--

DROP TABLE IF EXISTS `shoot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoot` (
  `username` varchar(255) NOT NULL,
  `score` int NOT NULL,
  `shoot_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`shoot_id`),
  KEY `shoot_rank` (`score` DESC),
  KEY `shoot` (`username`),
  CONSTRAINT `shoot` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoot`
--

LOCK TABLES `shoot` WRITE;
/*!40000 ALTER TABLE `shoot` DISABLE KEYS */;
INSERT INTO `shoot` VALUES ('111',90,1),('111',30,2),('zhanghaokun',120,3),('1',60,4),('444',10,5),('123',73,6),('123456',37,7);
/*!40000 ALTER TABLE `shoot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snake`
--

DROP TABLE IF EXISTS `snake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snake` (
  `username` varchar(255) NOT NULL,
  `score` int NOT NULL,
  `snake_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`snake_id`) USING BTREE,
  KEY `snake` (`username`),
  KEY `snake_rank` (`score` DESC),
  CONSTRAINT `snake` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snake`
--

LOCK TABLES `snake` WRITE;
/*!40000 ALTER TABLE `snake` DISABLE KEYS */;
INSERT INTO `snake` VALUES ('111',30,2),('111',30,5),('111',20,8),('444',20,9),('444',10,11),('444',20,12),('444',130,13),('ssy',260,14),('123456',50,15),('123',10,16),('123',10,17),('123',50,18),('123456',30,19),('123456',20,20),('123',70,21),('123456',10,22),('123456',30,23),('123456',120,24),('123456',0,25),('123456',60,26),('123456',0,27),('123456',50,28),('123456',10,29),('123456',10,30),('123456',180,31),('123456',60,32),('123456',180,33),('123456',280,34),('123456',80,35),('123456',60,36),('123456',280,37),('123456',280,38),('123456',0,39),('123456',160,40),('123456',40,41),('123456',40,42),('123456',60,43),('123456',540,44);
/*!40000 ALTER TABLE `snake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','1','a@mail.com'),('111','111','111'),('122','122','1559554923'),('123','123','123'),('123456','123456','2826382180@qq.com'),('444','444','444@xn--1nr'),('qwe','qwe','qwe@qq'),('ssy','ssy','123@qq.com'),('zhanghaokun','111','1@163.com'),('张浩坤','111','123@');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-28 12:04:10
