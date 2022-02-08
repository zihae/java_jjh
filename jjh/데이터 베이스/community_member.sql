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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `me_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `me_pw` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `me_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `me_gender` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `me_birth` date DEFAULT NULL,
  `me_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `me_phone` varchar(13) COLLATE utf8_bin DEFAULT NULL,
  `me_authority` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'member',
  `me_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `me_session_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `me_session_limit` datetime DEFAULT NULL,
  PRIMARY KEY (`me_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('asd','$2a$10$XETUqf88HunRnDhbXVdBleI1PGIt87izJeH7C0JuAt1vHHoJcfwSy','asdname2','Female','2022-01-21','[object HTMLInputElement]','123-4565-7895','member','wlgp5442@naver.com',NULL,NULL),('qw','$2a$10$amE/s4kKWF6WFkcMdQotYOj.zzU3zc1uJDszu6oJjxEgXEsYEtT.2','name','Male','2022-01-01','[object HTMLInputElement]','123-4565-7891','super admin','wlgp5442@naver.com','none','2022-02-07 16:38:21'),('qwe','$2a$10$a1M8dcSxGs.UfdPeJhBgxOHvbPlNmSd4uD7MzdcVE3XUgGx92SBo2','n','Male','2022-01-08','Seoul,Korea ','123-4565-7895','admin','wlgp5442@naver.com',NULL,NULL),('qwe123','$2a$10$L50GZFE/2K05x6WWvCxsruI8KVqm7gj0cNAFqb5BSaFocIGFv/M2W','qwe1234','Female','2022-01-08','[object HTMLInputElement]','123-4565-7891','member','wlgp5442@naver.com',NULL,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-08 11:49:25
