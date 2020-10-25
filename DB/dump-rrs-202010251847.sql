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
-- Table structure for table `restaurant_dish`
--

DROP TABLE IF EXISTS `restaurant_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int unsigned NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `dish_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_restaurant_dish` (`dish_id`,`restaurant_id`,`added_by`),
  KEY `restaurant_dish_added_by_93f715ab_fk_auth_user_id` (`added_by`),
  KEY `restaurant_dish_restaurant_id_580e7052_fk_restauran` (`restaurant_id`),
  KEY `restaurant_dish_updated_by_01ecbaf8_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `restaurant_dish_added_by_93f715ab_fk_auth_user_id` FOREIGN KEY (`added_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `restaurant_dish_dish_id_1c4b823f_fk_dish_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`),
  CONSTRAINT `restaurant_dish_restaurant_id_580e7052_fk_restauran` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `restaurant_dish_updated_by_01ecbaf8_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `restaurant_dish_chk_1` CHECK ((`status` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_dish`
--

LOCK TABLES `restaurant_dish` WRITE;
/*!40000 ALTER TABLE `restaurant_dish` DISABLE KEYS */;
INSERT INTO `restaurant_dish` VALUES (1,1,'2020-09-26 00:00:00.000000',NULL,NULL,1,8,NULL),(2,1,'2020-09-26 00:00:00.000000',NULL,NULL,2,8,NULL),(3,1,'2020-09-26 00:00:00.000000',NULL,NULL,3,8,NULL),(4,1,'2020-09-26 00:00:00.000000',NULL,NULL,4,8,NULL),(5,1,'2020-09-26 00:00:00.000000',NULL,NULL,1,9,NULL),(6,1,'2020-09-26 00:00:00.000000',NULL,NULL,2,9,NULL);
/*!40000 ALTER TABLE `restaurant_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `token_number` varchar(10) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `created_by` int NOT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`token_number`),
  KEY `token_created_by_50851c03_fk_auth_user_id` (`created_by`),
  KEY `token_restaurant_id_345ad1c2_fk_restaurant_restaurant_id` (`restaurant_id`),
  CONSTRAINT `token_created_by_50851c03_fk_auth_user_id` FOREIGN KEY (`created_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `token_restaurant_id_345ad1c2_fk_restaurant_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES ('#34A4343','2020-09-30 00:00:00.000000',2,21),('#34A4344','2020-10-20 00:00:00.000000',2,22),('#34A4345','2020-10-20 00:00:00.000000',2,23);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `rating_id` bigint NOT NULL,
  `message` longtext,
  `attachment` varchar(100) DEFAULT NULL,
  `upvote_count` int unsigned NOT NULL,
  `report count` int unsigned NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `review_updated_by_c71b2d92_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `review_rating_id_d0274ede_fk_rating_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`),
  CONSTRAINT `review_updated_by_c71b2d92_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `review_chk_1` CHECK ((`upvote_count` >= 0)),
  CONSTRAINT `review_chk_2` CHECK ((`report count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_level`
--

DROP TABLE IF EXISTS `user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_level` (
  `level_number` smallint unsigned NOT NULL,
  `points_level` int unsigned NOT NULL,
  `allocated_comfirmation_points` int unsigned NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`level_number`),
  KEY `user_level_created_by_a7a12d30_fk_auth_user_id` (`created_by`),
  KEY `user_level_updated_by_33070f0f_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `user_level_created_by_a7a12d30_fk_auth_user_id` FOREIGN KEY (`created_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_level_updated_by_33070f0f_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_level_chk_1` CHECK ((`level_number` >= 0)),
  CONSTRAINT `user_level_chk_2` CHECK ((`points_level` >= 0)),
  CONSTRAINT `user_level_chk_3` CHECK ((`allocated_comfirmation_points` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_level`
--

LOCK TABLES `user_level` WRITE;
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warning_level`
--

DROP TABLE IF EXISTS `warning_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warning_level` (
  `warning_level` int NOT NULL AUTO_INCREMENT,
  `warning_level_name` varchar(50) NOT NULL,
  `allocated_points` int unsigned NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`warning_level`),
  KEY `warning_level_created_by_4f815bc3_fk_auth_user_id` (`created_by`),
  KEY `warning_level_updated_by_a76f4d64_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `warning_level_created_by_4f815bc3_fk_auth_user_id` FOREIGN KEY (`created_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `warning_level_updated_by_a76f4d64_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `warning_level_chk_1` CHECK ((`allocated_points` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warning_level`
--

LOCK TABLES `warning_level` WRITE;
/*!40000 ALTER TABLE `warning_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `warning_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `meal_id` int NOT NULL AUTO_INCREMENT,
  `meal_name` varchar(50) NOT NULL,
  PRIMARY KEY (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `dish_id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(50) NOT NULL,
  `status` int unsigned NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`dish_id`),
  KEY `dish_created_by_17ddc19b_fk_auth_user_id` (`created_by`),
  KEY `dish_updated_by_2727d672_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `dish_created_by_17ddc19b_fk_auth_user_id` FOREIGN KEY (`created_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dish_updated_by_2727d672_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dish_chk_1` CHECK ((`status` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Biriyani',1,'2020-09-25 00:00:00.000000',NULL,2,NULL),(2,'Seafood rice',1,'2020-09-20 00:00:00.000000',NULL,1,NULL),(3,'Seafood kottu',1,'2020-08-20 00:00:00.000000',NULL,1,NULL),(4,'Vegetable chop suey',1,'2020-09-10 00:00:00.000000',NULL,3,NULL);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `rating_id` bigint NOT NULL AUTO_INCREMENT,
  `dish_rating` int unsigned DEFAULT NULL,
  `price_rating` int unsigned DEFAULT NULL,
  `service_rating` int unsigned DEFAULT NULL,
  `verified` int unsigned NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`rating_id`),
  CONSTRAINT `rating_chk_1` CHECK ((`dish_rating` >= 0)),
  CONSTRAINT `rating_chk_2` CHECK ((`price_rating` >= 0)),
  CONSTRAINT `rating_chk_3` CHECK ((`service_rating` >= 0)),
  CONSTRAINT `rating_chk_4` CHECK ((`verified` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (77,5,4,5,1,'2020-10-21 08:15:40.886342','2020-10-21 08:15:40.886484'),(78,5,4,5,1,'2020-10-21 08:16:41.014752','2020-10-21 08:16:41.014814'),(79,5,4,5,1,'2020-10-21 08:19:20.277572','2020-10-21 08:19:20.277647'),(80,5,3,5,1,'2020-10-21 08:19:56.341047','2020-10-21 08:19:56.341108'),(81,5,5,5,1,'2020-10-21 08:20:16.739383','2020-10-21 08:20:16.739443'),(82,5,5,3,1,'2020-10-21 08:20:32.705495','2020-10-21 08:20:32.705565'),(83,4,4,3,1,'2020-10-21 08:20:50.667203','2020-10-21 08:20:50.667269'),(84,4,4,3,1,'2020-10-21 08:21:04.799941','2020-10-21 08:21:04.800011'),(85,5,4,3,1,'2020-10-21 08:21:10.987509','2020-10-21 08:21:10.987569'),(86,5,4,4,1,'2020-10-21 08:21:18.383503','2020-10-21 08:21:18.383566'),(87,4,4,4,1,'2020-10-21 08:21:25.472808','2020-10-21 08:21:25.472884'),(88,4,3,4,1,'2020-10-21 08:21:30.921382','2020-10-21 08:21:30.921442'),(89,4,3,4,1,'2020-10-21 08:21:37.061486','2020-10-21 08:21:37.061549'),(90,4,5,4,1,'2020-10-21 08:21:43.107214','2020-10-21 08:21:43.107275'),(91,4,5,4,1,'2020-10-21 08:21:57.759842','2020-10-21 08:21:57.759902'),(92,4,4,4,1,'2020-10-21 08:22:02.922778','2020-10-21 08:22:02.922845'),(93,4,4,5,1,'2020-10-21 08:22:09.274031','2020-10-21 08:22:09.274089'),(94,4,4,5,1,'2020-10-21 08:22:15.157070','2020-10-21 08:22:15.157199'),(95,3,4,5,1,'2020-10-21 08:22:19.699653','2020-10-21 08:22:19.699939'),(96,3,3,5,1,'2020-10-21 08:22:27.454439','2020-10-21 08:22:27.454503'),(97,3,3,4,1,'2020-10-21 08:22:36.065812','2020-10-21 08:22:36.065867'),(98,3,2,4,1,'2020-10-21 08:22:45.711231','2020-10-21 08:22:45.711273'),(99,5,2,4,1,'2020-10-21 08:22:50.738474','2020-10-21 08:22:50.738535'),(100,5,4,4,1,'2020-10-21 08:23:12.069630','2020-10-21 08:23:12.069676'),(101,5,4,5,1,'2020-10-21 08:23:18.586166','2020-10-21 08:23:18.586230'),(102,5,5,5,1,'2020-10-21 08:23:25.468310','2020-10-21 08:23:25.468370'),(103,4,5,4,1,'2020-10-21 08:23:35.392708','2020-10-21 08:23:35.392769'),(104,4,3,4,1,'2020-10-21 08:23:40.828060','2020-10-21 08:23:40.828122'),(105,4,4,4,1,'2020-10-21 08:23:50.248841','2020-10-21 08:23:50.248937'),(106,4,3,4,1,'2020-10-21 08:23:55.665414','2020-10-21 08:23:55.665477'),(107,3,3,4,1,'2020-10-21 08:24:09.917283','2020-10-21 08:24:09.917343'),(108,3,3,2,1,'2020-10-21 08:24:17.559978','2020-10-21 08:24:17.560047'),(109,4,3,2,1,'2020-10-21 08:24:24.537724','2020-10-21 08:24:24.537786'),(110,4,4,2,1,'2020-10-21 08:24:31.141603','2020-10-21 08:24:31.141661'),(111,4,4,4,1,'2020-10-21 08:24:36.390433','2020-10-21 08:24:36.390502');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_reporting`
--

DROP TABLE IF EXISTS `user_reporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_reporting` (
  `reporting_id` int NOT NULL,
  `reporte_id` int NOT NULL,
  PRIMARY KEY (`reporting_id`),
  KEY `user_reporting_reporte_id_c3c09165_fk_auth_user_id` (`reporte_id`),
  CONSTRAINT `user_reporting_reporte_id_c3c09165_fk_auth_user_id` FOREIGN KEY (`reporte_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_reporting_reporting_id_c261add9_fk_reporting_reporting_id` FOREIGN KEY (`reporting_id`) REFERENCES `reporting` (`reporting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reporting`
--

LOCK TABLES `user_reporting` WRITE;
/*!40000 ALTER TABLE `user_reporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_reporting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warning`
--

DROP TABLE IF EXISTS `warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warning` (
  `warning_id` int NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `warning_level` int NOT NULL,
  PRIMARY KEY (`warning_id`),
  KEY `warning_created_by_8b6324c8_fk_auth_user_id` (`created_by`),
  KEY `warning_updated_by_a2801954_fk_auth_user_id` (`updated_by`),
  KEY `warning_warning_level_b856a4e0_fk_warning_level_warning_level` (`warning_level`),
  CONSTRAINT `warning_created_by_8b6324c8_fk_auth_user_id` FOREIGN KEY (`created_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `warning_updated_by_a2801954_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `warning_warning_level_b856a4e0_fk_warning_level_warning_level` FOREIGN KEY (`warning_level`) REFERENCES `warning_level` (`warning_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warning`
--

LOCK TABLES `warning` WRITE;
/*!40000 ALTER TABLE `warning` DISABLE KEYS */;
/*!40000 ALTER TABLE `warning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `added_dish_rating`
--

DROP TABLE IF EXISTS `added_dish_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `added_dish_rating` (
  `rating_id` bigint NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `dish_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `token_number` varchar(10) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `added_dish_rating_dish_id_cdaf5d1c_fk_dish_dish_id` (`dish_id`),
  KEY `added_dish_rating_restaurant_id_2174d2d8_fk_restauran` (`restaurant_id`),
  KEY `added_dish_rating_token_number_9d641d46_fk_token_token_number` (`token_number`),
  KEY `added_dish_rating_user_id_f55db552_fk_auth_user_id` (`user_id`),
  CONSTRAINT `added_dish_rating_dish_id_cdaf5d1c_fk_dish_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`),
  CONSTRAINT `added_dish_rating_rating_id_02ef83ca_fk_rating_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`),
  CONSTRAINT `added_dish_rating_restaurant_id_2174d2d8_fk_restauran` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `added_dish_rating_token_number_9d641d46_fk_token_token_number` FOREIGN KEY (`token_number`) REFERENCES `token` (`token_number`),
  CONSTRAINT `added_dish_rating_user_id_f55db552_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `added_dish_rating`
--

LOCK TABLES `added_dish_rating` WRITE;
/*!40000 ALTER TABLE `added_dish_rating` DISABLE KEYS */;
INSERT INTO `added_dish_rating` VALUES (77,NULL,NULL,NULL,2,21,'#34A4343',1),(78,NULL,NULL,NULL,2,22,'#34A4344',1),(81,NULL,NULL,NULL,2,22,'#34A4344',1),(82,NULL,NULL,NULL,2,22,'#34A4344',1),(86,NULL,NULL,NULL,2,23,'#34A4345',1),(87,NULL,NULL,NULL,2,23,'#34A4345',1),(88,NULL,NULL,NULL,2,23,'#34A4345',1),(94,NULL,NULL,NULL,2,21,'#34A4343',1),(95,NULL,NULL,NULL,2,21,'#34A4343',1),(96,NULL,NULL,NULL,2,21,'#34A4343',1),(97,NULL,NULL,NULL,2,21,'#34A4343',1),(102,NULL,NULL,NULL,2,22,'#34A4344',1),(103,NULL,NULL,NULL,2,22,'#34A4344',1),(104,NULL,NULL,NULL,2,22,'#34A4344',1),(110,NULL,NULL,NULL,2,23,'#34A4345',1),(111,NULL,NULL,NULL,2,23,'#34A4345',1);
/*!40000 ALTER TABLE `added_dish_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `added_rating`
--

DROP TABLE IF EXISTS `added_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `added_rating` (
  `rating_id` bigint NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `restaurant_id` int NOT NULL,
  `token_number` varchar(10) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `added_rating_restaurant_id_3e12a0a6_fk_restaurant_restaurant_id` (`restaurant_id`),
  KEY `added_rating_token_number_44359d58_fk_token_token_number` (`token_number`),
  KEY `added_rating_user_id_ee0c2a9a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `added_rating_rating_id_d0765b24_fk_rating_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`),
  CONSTRAINT `added_rating_restaurant_id_3e12a0a6_fk_restaurant_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `added_rating_token_number_44359d58_fk_token_token_number` FOREIGN KEY (`token_number`) REFERENCES `token` (`token_number`),
  CONSTRAINT `added_rating_user_id_ee0c2a9a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `added_rating`
--

LOCK TABLES `added_rating` WRITE;
/*!40000 ALTER TABLE `added_rating` DISABLE KEYS */;
INSERT INTO `added_rating` VALUES (79,NULL,NULL,'2020-10-21 08:19:20.452410',22,'#34A4344',1),(80,NULL,NULL,'2020-10-21 08:19:56.499896',22,'#34A4344',1),(83,NULL,NULL,'2020-10-21 08:20:50.788488',22,'#34A4344',1),(84,NULL,NULL,'2020-10-21 08:21:04.941995',23,'#34A4345',1),(85,NULL,NULL,'2020-10-21 08:21:11.163028',23,'#34A4345',1),(89,NULL,NULL,'2020-10-21 08:21:37.374980',23,'#34A4345',1),(90,NULL,NULL,'2020-10-21 08:21:43.263759',23,'#34A4345',1),(91,NULL,NULL,'2020-10-21 08:21:57.850267',21,'#34A4343',1),(92,NULL,NULL,'2020-10-21 08:22:03.057365',21,'#34A4343',1),(93,NULL,NULL,'2020-10-21 08:22:09.416990',21,'#34A4343',1),(98,NULL,NULL,'2020-10-21 08:22:45.875119',21,'#34A4343',1),(99,NULL,NULL,'2020-10-21 08:22:50.827006',21,'#34A4343',1),(100,NULL,NULL,'2020-10-21 08:23:12.164307',22,'#34A4344',1),(101,NULL,NULL,'2020-10-21 08:23:18.765849',22,'#34A4344',1),(105,NULL,NULL,'2020-10-21 08:23:50.457106',22,'#34A4344',1),(106,NULL,NULL,'2020-10-21 08:23:55.801254',22,'#34A4344',1),(107,NULL,NULL,'2020-10-21 08:24:10.058011',23,'#34A4345',1),(108,NULL,NULL,'2020-10-21 08:24:17.680569',23,'#34A4345',1),(109,NULL,NULL,'2020-10-21 08:24:24.664331',23,'#34A4345',1);
/*!40000 ALTER TABLE `added_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_meal`
--

DROP TABLE IF EXISTS `restaurant_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_meal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `created_by` int NOT NULL,
  `meal_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meal_id` (`meal_id`),
  UNIQUE KEY `unique_restaurant_meal` (`meal_id`,`restaurant_id`),
  KEY `restaurant_meal_created_by_0f9b535b_fk_auth_user_id` (`created_by`),
  KEY `restaurant_meal_restaurant_id_4c6789b8_fk_restauran` (`restaurant_id`),
  KEY `restaurant_meal_updated_by_a0ea5a9b_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `restaurant_meal_created_by_0f9b535b_fk_auth_user_id` FOREIGN KEY (`created_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `restaurant_meal_meal_id_daf1f031_fk_meal_meal_id` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`meal_id`),
  CONSTRAINT `restaurant_meal_restaurant_id_4c6789b8_fk_restauran` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `restaurant_meal_updated_by_a0ea5a9b_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_meal`
--

LOCK TABLES `restaurant_meal` WRITE;
/*!40000 ALTER TABLE `restaurant_meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'owner'),(2,'customer'),(3,'admin');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `claimed` int unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `claimed_by` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`),
  UNIQUE KEY `unique_restaurant_name` (`name`),
  KEY `restaurant_claimed_by_37de9b07_fk_auth_user_id` (`claimed_by`),
  KEY `restaurant_created_by_1863374f_fk_auth_user_id` (`created_by`),
  KEY `restaurant_updated_by_7c35a9e3_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `restaurant_claimed_by_37de9b07_fk_auth_user_id` FOREIGN KEY (`claimed_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `restaurant_created_by_1863374f_fk_auth_user_id` FOREIGN KEY (`created_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `restaurant_updated_by_7c35a9e3_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `restaurant_chk_1` CHECK ((`claimed` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (8,'Unifolanka','Hikkaduwa',123451.1232,434543.5444,'0710273653',0,'8Qb49dLiDgp8O8ju6lsN','2020-07-30 02:42:17.431580','2020-07-30 02:42:17.431656',NULL,1,NULL),(9,'Ted Red','Ambalangoda',434543.5444,434543.5444,'0710273653',0,'tTGCacqjgLuEEvuWssuu','2020-08-01 02:33:38.225415','2020-08-01 02:33:38.225474',NULL,1,NULL),(19,'Peblo','Ahangama',53.5444,37.5444,'0770273653',0,'6iaKkJwaIX2j6elnlrAd','2020-08-10 14:32:21.658392','2020-08-10 14:32:21.658456',NULL,1,NULL),(20,'Happy H','Galle',33.5444,37.5444,'0770273653',0,'No8oviPG6KjEwWOHvbAJ','2020-08-10 14:35:01.323349','2020-08-10 14:35:01.323442',NULL,1,NULL),(21,'Sithru','Koggala',33.5444,37.5444,'0770273653',0,'CtQGezbVk7Z8IUkX66qY','2020-08-10 14:35:39.393765','2020-08-10 14:35:39.393853',NULL,1,NULL),(22,'Lenny Bros','Rathgama',23.5444,77.5444,'0770273653',0,'7wDCf0rRrQnwmIcOEQNn','2020-08-10 14:36:57.467450','2020-08-10 14:36:57.467542',NULL,1,NULL),(23,'Raveena','Unawatuna',23.5444,77.5444,'0770273653',0,'PBkfoIQxU2FSt2RG2s8l','2020-08-19 13:53:42.998373','2020-08-19 13:53:42.998474',NULL,1,NULL),(28,'Test100','baddegama',23.5444,77.5444,'+94718812099',0,'ONEG5eNLwOL9aiP8TveT','2020-10-07 07:55:33.967546','2020-10-07 07:55:33.967660',NULL,1,NULL),(29,'Test400','Hikkaduva',23.5444,77.5444,'+94718812086',0,'oJM8J70ohCx2wA7iwb7z','2020-10-10 18:27:54.920637','2020-10-10 18:27:54.920736',NULL,1,NULL);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-25 18:47:31
