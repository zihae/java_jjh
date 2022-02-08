-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: community
-- ------------------------------------------------------
-- Server version	5.7.36-log

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `co_num` int(11) NOT NULL AUTO_INCREMENT,
  `co_bd_num` int(11) NOT NULL,
  `co_me_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `co_reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co_del` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `co_ori_num` int(11) NOT NULL,
  `co_contents` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`co_num`),
  KEY `co_bd_num_idx` (`co_bd_num`),
  KEY `co_me_id_idx` (`co_me_id`),
  CONSTRAINT `co_bd_num` FOREIGN KEY (`co_bd_num`) REFERENCES `board` (`bd_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `co_me_id` FOREIGN KEY (`co_me_id`) REFERENCES `member` (`me_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,48,'qw','2022-01-24 11:07:00','Y',1,'??? : comment test1 '),(3,48,'qw','2022-01-24 11:08:59','N',3,'comment test3'),(4,48,'qw','2022-01-24 12:51:22','N',4,'test4'),(5,48,'qw','2022-01-24 12:58:03','N',5,''),(6,48,'qw','2022-01-24 12:58:19','N',6,''),(7,48,'qw','2022-01-24 14:19:16','N',7,'test 1.23'),(8,48,'qw','2022-01-24 14:42:12','N',8,'e'),(9,48,'qw','2022-01-24 15:48:52','N',9,'qwe'),(10,48,'qw','2022-01-24 16:19:28','Y',10,'3'),(11,48,'qw','2022-01-25 11:02:43','Y',11,'test1.25'),(12,48,'qw','2022-01-25 15:33:59','Y',3,'??? reply modify'),(13,48,'qw','2022-01-25 15:41:24','N',4,'  reply modify'),(14,48,'qw','2022-01-25 16:24:55','N',14,'dddd'),(15,48,'qw','2022-01-25 16:24:56','N',15,'dddd 6'),(16,48,'qw','2022-01-25 16:25:10','N',3,'dddddd'),(17,48,'qw','2022-01-25 16:54:07','N',4,'ff'),(18,48,'qw','2022-01-26 15:09:10','Y',18,'board num 48'),(19,48,'qw','2022-01-27 12:53:22','Y',19,'1.27'),(20,48,'qw','2022-02-03 14:42:00','N',14,'reply');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-08 11:49:27
