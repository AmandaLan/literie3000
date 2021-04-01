-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: literie3000
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dimensions`
--

DROP TABLE IF EXISTS `dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimensions` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `mesure` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimensions`
--

LOCK TABLES `dimensions` WRITE;
/*!40000 ALTER TABLE `dimensions` DISABLE KEYS */;
INSERT INTO `dimensions` VALUES (1,'90x190'),(2,'140x190'),(3,'160x200'),(4,'180x200'),(5,'200x200');
/*!40000 ALTER TABLE `dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matelas`
--

DROP TABLE IF EXISTS `matelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matelas` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `marque` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prix` int(11) NOT NULL,
  `reduction` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matelas`
--

LOCK TABLES `matelas` WRITE;
/*!40000 ALTER TABLE `matelas` DISABLE KEYS */;
INSERT INTO `matelas` VALUES (1,'Epeda','Matelas Tamoul',759,529,'https://www.leroidumatelas.fr/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/e/heris_1.jpg'),(2,'Dreamway','Matelas Waldorf',809,709,'https://www.leroidumatelas.fr/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/a/d/aden_cirse-deco-ashgrey_140x190_1.jpg'),(3,'Bultex','Matelas Joris',759,529,'https://www.leroidumatelas.fr/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/M/A/MAT-MINT_01.jpg'),(4,'Epeda','Matelas Melon',1019,509,'https://www.leroidumatelas.lu/media/catalog/product/cache/4/thumbnail/9df78eab33525d08d6e5fb8d27136e95/M/A/MAT-ACAJOU_01_9.jpg'),(5,'Dorsoline','Matelas Lavande',495,299,'https://www.leroidumatelas.fr/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/m/a/matelas_dreamway_lavande_carre-1-min.jpg'),(7,'Bultex','muche',122,100,'https://www.leroidumatelas.fr/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/M/A/MAT-MINT_01.jpg');
/*!40000 ALTER TABLE `matelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matelas_dimensions`
--

DROP TABLE IF EXISTS `matelas_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matelas_dimensions` (
  `matela_id` tinyint(4) NOT NULL,
  `dimension_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`matela_id`,`dimension_id`),
  KEY `dimension_id` (`dimension_id`),
  CONSTRAINT `matelas_dimensions_ibfk_1` FOREIGN KEY (`matela_id`) REFERENCES `matelas` (`id`),
  CONSTRAINT `matelas_dimensions_ibfk_2` FOREIGN KEY (`dimension_id`) REFERENCES `dimensions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matelas_dimensions`
--

LOCK TABLES `matelas_dimensions` WRITE;
/*!40000 ALTER TABLE `matelas_dimensions` DISABLE KEYS */;
INSERT INTO `matelas_dimensions` VALUES (1,1),(2,1),(3,2),(4,3);
/*!40000 ALTER TABLE `matelas_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'literie3000'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-01 16:50:48
