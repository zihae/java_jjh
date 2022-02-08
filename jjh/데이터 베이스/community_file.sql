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
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `fi_num` int(11) NOT NULL AUTO_INCREMENT,
  `fi_ori_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fi_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fi_bd_num` int(11) NOT NULL,
  `fi_del` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `fi_del_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fi_num`),
  KEY `FK_board_TO_file_1` (`fi_bd_num`),
  CONSTRAINT `FK_board_TO_file_1` FOREIGN KEY (`fi_bd_num`) REFERENCES `board` (`bd_num`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'?? ?? 001.jpg','/2022/01/14/1ddb9edc-48a9-4d39-8a9c-5ab0b8a4d468_?? ?? 001.jpg',9,NULL,NULL),(2,'001.jpg','/2022/01/14/5203ed04-f2c7-43d9-a0de-52b7e7e42abf_001.jpg',10,NULL,NULL),(3,'008.jpg','/2022/01/17/3293a8af-8478-42e6-89a2-83c912bdf7a9_008.jpg',13,NULL,NULL),(4,'008.jpg','/2022/01/17/a2d05213-052a-43c8-be36-56b0f2f9f0ad_008.jpg',14,'Y','2022-01-17 16:17:11'),(5,'001.jpg','/2022/01/17/b038a70e-5f9a-426d-bae7-5b365d048bc8_001.jpg',14,'Y','2022-01-17 16:17:11'),(6,'001.jpg','/2022/01/17/a5cede10-3c4c-433a-9cdf-caaff90faf1a_001.jpg',14,NULL,NULL),(7,'001.jpg','/2022/01/17/f068e779-f370-4725-bd6f-25f24c143bc0_001.jpg',15,NULL,NULL),(8,'008.jpg','/2022/01/17/da46ed5c-ec6f-4125-99a7-e6310d74a64c_008.jpg',15,NULL,NULL),(9,'001.jpg','/2022/01/17/f912995a-c1bc-439c-a11b-2737baf85557_001.jpg',16,NULL,NULL),(10,'007.jpg','/2022/01/17/e9f9ea5e-36bc-401b-a0a7-5658613b032c_007.jpg',17,'Y','2022-01-17 17:22:42'),(11,'001.jpg','/2022/01/17/1d0eae2b-9102-4456-896b-7fc83e8af0ce_001.jpg',17,'Y','2022-01-18 09:48:44'),(12,'008.jpg','/2022/01/18/8b40a2f9-85db-4f65-ab87-c7dccaba1e49_008.jpg',17,'Y','2022-01-18 09:48:44'),(13,'010.jpg','/2022/01/18/d0e4f40c-bb66-4b4f-8e94-ba918b295e85_010.jpg',18,'Y','2022-01-18 09:50:30'),(14,'001.jpg','/2022/01/18/873c5cc7-e2d5-42df-8707-64931023eb89_001.jpg',20,NULL,NULL),(15,'001.jpg','/2022/01/19/1900abff-c112-4cd5-bc81-c9350538a1cb_001.jpg',31,NULL,NULL),(16,'001.jpg','/2022/01/19/501b8c5c-00a6-4cd7-ad7e-b22348a86d5e_001.jpg',34,'Y','2022-01-19 17:11:51'),(17,'007.jpg','/2022/01/19/5547071a-e0fe-44e6-84bd-a6cbfcf2905c_007.jpg',34,'Y','2022-01-19 17:02:48'),(18,'008.jpg','/2022/01/19/3c2f3428-2ad1-4714-84e6-89df1dd1fe01_008.jpg',34,NULL,NULL),(19,'008.jpg','/2022/01/20/9e3c65a1-f2b3-4996-97c2-01dcb1a8292e_008.jpg',35,'Y','2022-01-20 09:42:47'),(20,'007.jpg','/2022/01/20/10258883-ecba-41be-976b-fbcb43835a99_007.jpg',36,'Y','2022-01-20 16:25:16');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-08 11:49:28
