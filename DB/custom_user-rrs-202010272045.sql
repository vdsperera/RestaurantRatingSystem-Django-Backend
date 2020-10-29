-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: rrs
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `custom_user`
--

DROP TABLE IF EXISTS `custom_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user` (
  `user_id` int NOT NULL,
  `account_status` smallint unsigned NOT NULL,
  `email_code` varchar(255) NOT NULL,
  `email_verified` smallint unsigned NOT NULL,
  `birthday` date NOT NULL,
  `gender` smallint unsigned NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `level_number` smallint unsigned NOT NULL,
  `role_id` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `custom_user_level_number_dfc16bd4_fk_user_level_level_number` (`level_number`),
  KEY `custom_user_role_id_1a25bfbc_fk_user_role_role_id` (`role_id`),
  KEY `custom_user_updated_by_f12a158a_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `custom_user_level_number_dfc16bd4_fk_user_level_level_number` FOREIGN KEY (`level_number`) REFERENCES `user_level` (`level_number`),
  CONSTRAINT `custom_user_role_id_1a25bfbc_fk_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`),
  CONSTRAINT `custom_user_updated_by_f12a158a_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `custom_user_user_id_f9f6bec8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `custom_user_chk_1` CHECK ((`account_status` >= 0)),
  CONSTRAINT `custom_user_chk_2` CHECK ((`email_verified` >= 0)),
  CONSTRAINT `custom_user_chk_3` CHECK ((`gender` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user`
--

LOCK TABLES `custom_user` WRITE;
/*!40000 ALTER TABLE `custom_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-27 20:45:58
