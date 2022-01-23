-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Mazad
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `ADS`
--

DROP TABLE IF EXISTS `ADS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADS` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `initial_price` double DEFAULT NULL,
  `ad_description` varchar(5000) DEFAULT NULL,
  `last_price` double DEFAULT NULL,
  `last_buyer_user_id` int DEFAULT NULL,
  `type_id` int NOT NULL,
  `ad_owner_user_id` int NOT NULL,
  `is_active` bit(1) NOT NULL,
  `country` varchar(20) NOT NULL DEFAULT ' ',
  `city` varchar(20) NOT NULL DEFAULT ' ',
  `ad_address_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADS_ad_id_uindex` (`id`),
  KEY `ADS_USERS_user_id_fk` (`ad_owner_user_id`),
  KEY `ADS_USERS_user_id_fk_2` (`last_buyer_user_id`),
  KEY `ADS_ADD_TYPES_type_id_fk` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADS`
--

LOCK TABLES `ADS` WRITE;
/*!40000 ALTER TABLE `ADS` DISABLE KEYS */;
INSERT INTO `ADS` VALUES (1,'ffffffffffffffffffff',0,'sssssssssssss',0,NULL,3,1,_binary '','Jordan','location.city.0',NULL),(4,'eeeeeeeeeeeeee',1,'eeeeeeeeeee',1,NULL,2,1,_binary '','Jordan','location.city.1',NULL),(6,'ccccccccc',1,'swsdad d',1,NULL,1,1,_binary '','Jordan','Jerash',NULL),(8,'sdsd',1,'sdsds',1,NULL,4,1,_binary '','Jordan','location.city.3',NULL),(9,'ttttttttt t tttttttttttttttt t ttttttttttttt',9999,'5555a sd d s',900000,1,5,1,_binary '','Jordan','location.city.1',NULL);
/*!40000 ALTER TABLE `ADS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-23 21:12:06
