-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: rrs2
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
  `token_number` varchar(10) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `added_dish_rating_dish_id_cdaf5d1c_fk_dish_dish_id` (`dish_id`),
  KEY `added_dish_rating_token_number_9d641d46_fk_token_token_number` (`token_number`),
  KEY `added_dish_rating_user_id_f55db552_fk_auth_user_id` (`user_id`),
  CONSTRAINT `added_dish_rating_dish_id_cdaf5d1c_fk_dish_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`),
  CONSTRAINT `added_dish_rating_rating_id_02ef83ca_fk_rating_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`),
  CONSTRAINT `added_dish_rating_token_number_9d641d46_fk_token_token_number` FOREIGN KEY (`token_number`) REFERENCES `token` (`token_number`),
  CONSTRAINT `added_dish_rating_user_id_f55db552_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `added_dish_rating`
--

LOCK TABLES `added_dish_rating` WRITE;
/*!40000 ALTER TABLE `added_dish_rating` DISABLE KEYS */;
INSERT INTO `added_dish_rating` VALUES (1,NULL,NULL,NULL,2,'#34A4345',1),(2,NULL,NULL,NULL,2,'#34A4345',1),(3,NULL,NULL,NULL,2,'#34A4345',1),(4,NULL,NULL,NULL,2,'#34A4345',1),(5,NULL,NULL,NULL,2,'#34A4343',1),(6,NULL,NULL,NULL,4,'#34A4343',1),(7,NULL,NULL,NULL,4,'#34A4343',1),(8,NULL,NULL,NULL,4,'#34A4343',1),(9,NULL,NULL,NULL,4,'#34A4343',1),(10,NULL,NULL,NULL,4,'#34A4343',1),(11,NULL,NULL,NULL,4,'#34A4344',1),(12,NULL,NULL,NULL,4,'#34A4344',1),(13,NULL,NULL,NULL,4,'#34A4344',1),(14,NULL,NULL,NULL,4,'#34A4344',1),(15,NULL,NULL,NULL,3,'#34A4344',1),(16,NULL,NULL,NULL,3,'#34A4344',1),(17,NULL,NULL,NULL,3,'#34A4344',1),(29,NULL,NULL,NULL,2,'#34A4344',1),(30,NULL,NULL,NULL,2,'#34A4344',1),(32,NULL,NULL,NULL,3,NULL,1),(33,NULL,NULL,NULL,3,NULL,1),(34,NULL,NULL,NULL,3,NULL,1),(35,NULL,NULL,NULL,3,NULL,1),(36,NULL,NULL,NULL,3,NULL,1),(37,NULL,NULL,NULL,3,NULL,1),(38,NULL,NULL,NULL,3,NULL,1),(39,NULL,NULL,NULL,3,NULL,1),(40,NULL,NULL,NULL,1,NULL,1),(41,NULL,NULL,NULL,2,NULL,1),(42,NULL,NULL,NULL,1,NULL,1),(43,NULL,NULL,NULL,3,NULL,1),(46,NULL,NULL,NULL,2,NULL,1),(47,NULL,NULL,NULL,3,NULL,1);
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
  `token_number` varchar(10) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `added_rating_token_number_44359d58_fk_token_token_number` (`token_number`),
  KEY `added_rating_user_id_ee0c2a9a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `added_rating_rating_id_d0765b24_fk_rating_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`),
  CONSTRAINT `added_rating_token_number_44359d58_fk_token_token_number` FOREIGN KEY (`token_number`) REFERENCES `token` (`token_number`),
  CONSTRAINT `added_rating_user_id_ee0c2a9a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `added_rating`
--

LOCK TABLES `added_rating` WRITE;
/*!40000 ALTER TABLE `added_rating` DISABLE KEYS */;
INSERT INTO `added_rating` VALUES (18,NULL,NULL,'2020-11-03 11:24:43.903574','#34A4344',1),(19,NULL,NULL,'2020-11-03 11:24:52.362288','#34A4344',1),(20,NULL,NULL,'2020-11-03 11:26:14.621281','#34A4344',1),(21,NULL,NULL,'2020-11-03 11:26:20.442554','#34A4344',1),(22,NULL,NULL,'2020-11-03 11:26:52.037940','#34A4345',1),(23,NULL,NULL,'2020-11-03 11:26:58.715077','#34A4345',1),(24,NULL,NULL,'2020-11-03 11:27:04.052532','#34A4345',1),(25,NULL,NULL,'2020-11-03 11:27:32.992988','#34A4343',1),(26,NULL,NULL,'2020-11-03 11:27:38.242515','#34A4343',1),(27,NULL,NULL,'2020-11-03 11:27:44.566420','#34A4343',1),(28,NULL,NULL,'2020-11-03 11:27:49.658577','#34A4343',1),(31,NULL,NULL,'2020-11-07 05:21:25.129935','#34A4344',1),(44,NULL,NULL,'2020-11-14 10:56:45.756171','#34A4344',1),(45,NULL,NULL,'2020-11-14 10:59:00.920074',NULL,1),(48,NULL,NULL,'2020-11-18 07:32:12.659348','VSJEGHQR1W',1),(49,NULL,NULL,'2020-11-18 07:35:30.839221','UO0PM7G2NB',1);
/*!40000 ALTER TABLE `added_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'customer'),(2,'owner');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add user',3,'add_user'),(10,'Can change user',3,'change_user'),(11,'Can delete user',3,'delete_user'),(12,'Can view user',3,'view_user'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add check in',5,'add_checkin'),(18,'Can change check in',5,'change_checkin'),(19,'Can delete check in',5,'delete_checkin'),(20,'Can view check in',5,'view_checkin'),(21,'Can add dish',6,'add_dish'),(22,'Can change dish',6,'change_dish'),(23,'Can delete dish',6,'delete_dish'),(24,'Can view dish',6,'view_dish'),(25,'Can add edit component',7,'add_editcomponent'),(26,'Can change edit component',7,'change_editcomponent'),(27,'Can delete edit component',7,'delete_editcomponent'),(28,'Can view edit component',7,'view_editcomponent'),(29,'Can add edit history',8,'add_edithistory'),(30,'Can change edit history',8,'change_edithistory'),(31,'Can delete edit history',8,'delete_edithistory'),(32,'Can view edit history',8,'view_edithistory'),(33,'Can add meal',9,'add_meal'),(34,'Can change meal',9,'change_meal'),(35,'Can delete meal',9,'delete_meal'),(36,'Can view meal',9,'view_meal'),(37,'Can add rating',10,'add_rating'),(38,'Can change rating',10,'change_rating'),(39,'Can delete rating',10,'delete_rating'),(40,'Can view rating',10,'view_rating'),(41,'Can add reporting',11,'add_reporting'),(42,'Can change reporting',11,'change_reporting'),(43,'Can delete reporting',11,'delete_reporting'),(44,'Can view reporting',11,'view_reporting'),(45,'Can add restaurant',12,'add_restaurant'),(46,'Can change restaurant',12,'change_restaurant'),(47,'Can delete restaurant',12,'delete_restaurant'),(48,'Can view restaurant',12,'view_restaurant'),(49,'Can add user role',13,'add_userrole'),(50,'Can change user role',13,'change_userrole'),(51,'Can delete user role',13,'delete_userrole'),(52,'Can view user role',13,'view_userrole'),(53,'Can add added dish rating',14,'add_addeddishrating'),(54,'Can change added dish rating',14,'change_addeddishrating'),(55,'Can delete added dish rating',14,'delete_addeddishrating'),(56,'Can view added dish rating',14,'view_addeddishrating'),(57,'Can add added rating',15,'add_addedrating'),(58,'Can change added rating',15,'change_addedrating'),(59,'Can delete added rating',15,'delete_addedrating'),(60,'Can view added rating',15,'view_addedrating'),(61,'Can add customer check in',16,'add_customercheckin'),(62,'Can change customer check in',16,'change_customercheckin'),(63,'Can delete customer check in',16,'delete_customercheckin'),(64,'Can view customer check in',16,'view_customercheckin'),(65,'Can add restaurant component reporting',17,'add_restaurantcomponentreporting'),(66,'Can change restaurant component reporting',17,'change_restaurantcomponentreporting'),(67,'Can delete restaurant component reporting',17,'delete_restaurantcomponentreporting'),(68,'Can view restaurant component reporting',17,'view_restaurantcomponentreporting'),(69,'Can add restaurant reporting',18,'add_restaurantreporting'),(70,'Can change restaurant reporting',18,'change_restaurantreporting'),(71,'Can delete restaurant reporting',18,'delete_restaurantreporting'),(72,'Can view restaurant reporting',18,'view_restaurantreporting'),(73,'Can add review',19,'add_review'),(74,'Can change review',19,'change_review'),(75,'Can delete review',19,'delete_review'),(76,'Can view review',19,'view_review'),(77,'Can add review reply reporting',20,'add_reviewreplyreporting'),(78,'Can change review reply reporting',20,'change_reviewreplyreporting'),(79,'Can delete review reply reporting',20,'delete_reviewreplyreporting'),(80,'Can view review reply reporting',20,'view_reviewreplyreporting'),(81,'Can add review reporting',21,'add_reviewreporting'),(82,'Can change review reporting',21,'change_reviewreporting'),(83,'Can delete review reporting',21,'delete_reviewreporting'),(84,'Can view review reporting',21,'view_reviewreporting'),(85,'Can add warning level',22,'add_warninglevel'),(86,'Can change warning level',22,'change_warninglevel'),(87,'Can delete warning level',22,'delete_warninglevel'),(88,'Can view warning level',22,'view_warninglevel'),(89,'Can add warning',23,'add_warning'),(90,'Can change warning',23,'change_warning'),(91,'Can delete warning',23,'delete_warning'),(92,'Can view warning',23,'view_warning'),(93,'Can add user level',24,'add_userlevel'),(94,'Can change user level',24,'change_userlevel'),(95,'Can delete user level',24,'delete_userlevel'),(96,'Can view user level',24,'view_userlevel'),(97,'Can add user edit history confirmation',25,'add_useredithistoryconfirmation'),(98,'Can change user edit history confirmation',25,'change_useredithistoryconfirmation'),(99,'Can delete user edit history confirmation',25,'delete_useredithistoryconfirmation'),(100,'Can view user edit history confirmation',25,'view_useredithistoryconfirmation'),(101,'Can add user edit history component',26,'add_useredithistorycomponent'),(102,'Can change user edit history component',26,'change_useredithistorycomponent'),(103,'Can delete user edit history component',26,'delete_useredithistorycomponent'),(104,'Can view user edit history component',26,'view_useredithistorycomponent'),(105,'Can add token',27,'add_token'),(106,'Can change token',27,'change_token'),(107,'Can delete token',27,'delete_token'),(108,'Can view token',27,'view_token'),(109,'Can add restaurant meal',28,'add_restaurantmeal'),(110,'Can change restaurant meal',28,'change_restaurantmeal'),(111,'Can delete restaurant meal',28,'delete_restaurantmeal'),(112,'Can view restaurant meal',28,'view_restaurantmeal'),(113,'Can add restaurant dish',29,'add_restaurantdish'),(114,'Can change restaurant dish',29,'change_restaurantdish'),(115,'Can delete restaurant dish',29,'delete_restaurantdish'),(116,'Can view restaurant dish',29,'view_restaurantdish'),(117,'Can add reporting type',30,'add_reportingtype'),(118,'Can change reporting type',30,'change_reportingtype'),(119,'Can delete reporting type',30,'delete_reportingtype'),(120,'Can view reporting type',30,'view_reportingtype'),(121,'Can add reply',31,'add_reply'),(122,'Can change reply',31,'change_reply'),(123,'Can delete reply',31,'delete_reply'),(124,'Can view reply',31,'view_reply'),(125,'Can add custom user',32,'add_customuser'),(126,'Can change custom user',32,'change_customuser'),(127,'Can delete custom user',32,'delete_customuser'),(128,'Can view custom user',32,'view_customuser'),(129,'Can add contribution type',33,'add_contributiontype'),(130,'Can change contribution type',33,'change_contributiontype'),(131,'Can delete contribution type',33,'delete_contributiontype'),(132,'Can view contribution type',33,'view_contributiontype'),(133,'Can add contribution',34,'add_contribution'),(134,'Can change contribution',34,'change_contribution'),(135,'Can delete contribution',34,'delete_contribution'),(136,'Can view contribution',34,'view_contribution'),(137,'Can add user reporting',35,'add_userreporting'),(138,'Can change user reporting',35,'change_userreporting'),(139,'Can delete user reporting',35,'delete_userreporting'),(140,'Can view user reporting',35,'view_userreporting'),(141,'Can add log entry',36,'add_logentry'),(142,'Can change log entry',36,'change_logentry'),(143,'Can delete log entry',36,'delete_logentry'),(144,'Can view log entry',36,'view_logentry'),(145,'Can add session',37,'add_session'),(146,'Can change session',37,'change_session'),(147,'Can delete session',37,'delete_session'),(148,'Can view session',37,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$gqV9cfCGBWv3$1x6RNppIUioALPvaIQOCmNMmDnXKahx8guNTtMF+udY=','2020-11-03 08:43:30.190002',1,'vidumini','','','heartyvds@gmail.com',1,1,'2020-11-03 08:42:17.561793'),(2,'pbkdf2_sha256$180000$GUmkMvebSOgT$JXsXt9g5rTAzL+ico/4+jfiRuB4Sn1wJRHuU9/19nGw=',NULL,0,'dilshan','','','',0,1,'2020-11-03 08:44:04.624386'),(3,'pbkdf2_sha256$180000$AbKMtP3MPr2e$HxCsdjBgygxT0WkyxZr2wFkQTqzmPoyWz2dysYKb9M8=',NULL,0,'asanka','','','',0,1,'2020-11-03 08:44:40.088031'),(4,'pbkdf2_sha256$180000$OiE1it8Tku88$H+lZTgH8ZVk6dtWc0IXcxAbx/v5d0mDCkSpXQVFa9Qw=',NULL,0,'numin','','','',0,1,'2020-11-03 08:44:52.696353');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_in`
--

DROP TABLE IF EXISTS `check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_in` (
  `check_in_id` int NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`check_in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_in`
--

LOCK TABLES `check_in` WRITE;
/*!40000 ALTER TABLE `check_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribution`
--

DROP TABLE IF EXISTS `contribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contribution` (
  `contribution_id` int NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `contribution_type` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`contribution_id`),
  KEY `contribution_contribution_type_2d1cbd59_fk_contribut` (`contribution_type`),
  KEY `contribution_user_id_e3b479d4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `contribution_contribution_type_2d1cbd59_fk_contribut` FOREIGN KEY (`contribution_type`) REFERENCES `contribution_type` (`contribution_type_id`),
  CONSTRAINT `contribution_user_id_e3b479d4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribution`
--

LOCK TABLES `contribution` WRITE;
/*!40000 ALTER TABLE `contribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `contribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribution_type`
--

DROP TABLE IF EXISTS `contribution_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contribution_type` (
  `contribution_type_id` int NOT NULL AUTO_INCREMENT,
  `contribution_name` varchar(50) NOT NULL,
  `allocated_points` int unsigned NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`contribution_type_id`),
  KEY `contribution_type_created_by_d28af687_fk_auth_user_id` (`created_by`),
  KEY `contribution_type_updated_by_fbc045b7_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `contribution_type_created_by_d28af687_fk_auth_user_id` FOREIGN KEY (`created_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `contribution_type_updated_by_fbc045b7_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `contribution_type_chk_1` CHECK ((`allocated_points` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribution_type`
--

LOCK TABLES `contribution_type` WRITE;
/*!40000 ALTER TABLE `contribution_type` DISABLE KEYS */;
INSERT INTO `contribution_type` VALUES (1,'customer_registration',5,'2020-11-25 00:00:00.000000',NULL,1,NULL),(2,'add_restaurant',10,'2020-11-25 00:00:00.000000',NULL,1,NULL),(3,'add_not_verified_rating',10,'2020-11-25 00:00:00.000000',NULL,1,NULL),(4,'add_verified_rating',15,'2020-11-25 00:00:00.000000',NULL,1,NULL),(5,'add_not_verified_dish_rating',20,'2020-11-25 00:00:00.000000',NULL,1,NULL),(6,'add_verified_dish_rating',25,'2020-11-25 00:00:00.000000',NULL,1,NULL),(7,'add_dish_to_restaurant',10,'2020-11-25 00:00:00.000000',NULL,1,NULL),(8,'add_dish_to_system',15,'2020-11-25 00:00:00.000000',NULL,1,NULL);
/*!40000 ALTER TABLE `contribution_type` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user`
--

LOCK TABLES `custom_user` WRITE;
/*!40000 ALTER TABLE `custom_user` DISABLE KEYS */;
INSERT INTO `custom_user` VALUES (1,1,'#3456',1,'1996-01-11',0,'Ampegama','0770273653',NULL,NULL,0,3,NULL),(2,1,'@4578',1,'1993-02-05',0,'Hikkaduwa','0718812099',NULL,NULL,0,1,NULL),(3,1,'#4589',1,'1993-04-20',0,'Mitiyagoda','0715634785',NULL,NULL,0,2,NULL),(4,1,'@4568',1,'1993-05-03',0,'Batapola','0717852635',NULL,NULL,0,2,NULL);
/*!40000 ALTER TABLE `custom_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_check_in`
--

DROP TABLE IF EXISTS `customer_check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_check_in` (
  `check_in_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`check_in_id`),
  KEY `customer_check_in_restaurant_id_ca54465e_fk_restauran` (`restaurant_id`),
  KEY `customer_check_in_user_id_1eeefe2b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `customer_check_in_check_in_id_57ddd5de_fk_check_in_check_in_id` FOREIGN KEY (`check_in_id`) REFERENCES `check_in` (`check_in_id`),
  CONSTRAINT `customer_check_in_restaurant_id_ca54465e_fk_restauran` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `customer_check_in_user_id_1eeefe2b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_check_in`
--

LOCK TABLES `customer_check_in` WRITE;
/*!40000 ALTER TABLE `customer_check_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_check_in` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Dish 01',1,'2020-09-25 00:00:00.000000',NULL,2,NULL),(2,'Dish 02',1,'2020-09-20 00:00:00.000000',NULL,1,NULL),(3,'Dish 03',1,'2020-08-20 00:00:00.000000',NULL,1,NULL),(4,'Dish 04',1,'2020-09-10 00:00:00.000000',NULL,3,NULL),(5,'Dish 07',0,'2020-11-14 15:46:17.780882','2020-11-14 15:46:17.781331',1,NULL),(6,'Dish 08',1,'2020-11-18 13:18:47.373097','2020-11-18 13:18:47.373178',2,NULL),(7,'Dish 09',1,'2020-11-18 13:19:45.923076','2020-11-18 13:19:45.923177',2,NULL),(8,'Dish 10',1,'2020-11-18 00:00:00.000000',NULL,2,NULL);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-11-03 08:44:04.803530','2','dilshan',1,'[{\"added\": {}}]',3,1),(2,'2020-11-03 08:44:40.278904','3','asanka',1,'[{\"added\": {}}]',3,1),(3,'2020-11-03 08:44:52.906856','4','numin',1,'[{\"added\": {}}]',3,1),(4,'2020-11-03 08:45:30.270385','1','customer',1,'[{\"added\": {}}]',2,1),(5,'2020-11-03 08:45:42.502752','2','owner',1,'[{\"added\": {}}]',2,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (36,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(4,'contenttypes','contenttype'),(14,'restaurantratingapi','addeddishrating'),(15,'restaurantratingapi','addedrating'),(5,'restaurantratingapi','checkin'),(34,'restaurantratingapi','contribution'),(33,'restaurantratingapi','contributiontype'),(16,'restaurantratingapi','customercheckin'),(32,'restaurantratingapi','customuser'),(6,'restaurantratingapi','dish'),(7,'restaurantratingapi','editcomponent'),(8,'restaurantratingapi','edithistory'),(9,'restaurantratingapi','meal'),(10,'restaurantratingapi','rating'),(31,'restaurantratingapi','reply'),(11,'restaurantratingapi','reporting'),(30,'restaurantratingapi','reportingtype'),(12,'restaurantratingapi','restaurant'),(17,'restaurantratingapi','restaurantcomponentreporting'),(29,'restaurantratingapi','restaurantdish'),(28,'restaurantratingapi','restaurantmeal'),(18,'restaurantratingapi','restaurantreporting'),(19,'restaurantratingapi','review'),(20,'restaurantratingapi','reviewreplyreporting'),(21,'restaurantratingapi','reviewreporting'),(27,'restaurantratingapi','token'),(26,'restaurantratingapi','useredithistorycomponent'),(25,'restaurantratingapi','useredithistoryconfirmation'),(24,'restaurantratingapi','userlevel'),(35,'restaurantratingapi','userreporting'),(13,'restaurantratingapi','userrole'),(23,'restaurantratingapi','warning'),(22,'restaurantratingapi','warninglevel'),(37,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-11-03 08:36:37.553306'),(2,'auth','0001_initial','2020-11-03 08:36:41.395645'),(3,'contenttypes','0002_remove_content_type_name','2020-11-03 08:36:57.122520'),(4,'auth','0002_alter_permission_name_max_length','2020-11-03 08:36:58.900194'),(5,'auth','0003_alter_user_email_max_length','2020-11-03 08:36:59.184231'),(6,'auth','0004_alter_user_username_opts','2020-11-03 08:36:59.289880'),(7,'auth','0005_alter_user_last_login_null','2020-11-03 08:37:00.378905'),(8,'auth','0006_require_contenttypes_0002','2020-11-03 08:37:00.496019'),(9,'auth','0007_alter_validators_add_error_messages','2020-11-03 08:37:00.686370'),(10,'auth','0008_alter_user_username_max_length','2020-11-03 08:37:02.430733'),(11,'auth','0009_alter_user_last_name_max_length','2020-11-03 08:37:05.028349'),(12,'auth','0010_alter_group_name_max_length','2020-11-03 08:37:05.306662'),(13,'auth','0011_update_proxy_permissions','2020-11-03 08:37:05.422679'),(14,'restaurantratingapi','0001_initial','2020-11-03 08:37:53.961908'),(15,'admin','0001_initial','2020-11-03 08:41:41.974135'),(16,'admin','0002_logentry_remove_auto_add','2020-11-03 08:41:45.171949'),(17,'admin','0003_logentry_add_action_flag_choices','2020-11-03 08:41:45.451284'),(18,'sessions','0001_initial','2020-11-03 08:41:46.013445');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('e5yo56qdlph0z97fb5i639pi8s20o6nz','ZDY1M2UwMjBlMDg4YjNiMjFmMjQzMmRiYWQ4MmRlOGYzZTkxZjE5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDdlZTQ0NjMwNjNjMTRmYzc1ZGJkNjY0ODYxMGI2NDNiOTg3MTIzIn0=','2020-11-17 08:43:30.290143');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_component`
--

DROP TABLE IF EXISTS `edit_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_component` (
  `component_id` smallint NOT NULL AUTO_INCREMENT,
  `component_name` varchar(255) NOT NULL,
  `confirmation_point_level` int unsigned NOT NULL,
  PRIMARY KEY (`component_id`),
  CONSTRAINT `edit_component_chk_1` CHECK ((`confirmation_point_level` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_component`
--

LOCK TABLES `edit_component` WRITE;
/*!40000 ALTER TABLE `edit_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_history`
--

DROP TABLE IF EXISTS `edit_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `current_value` varchar(255) NOT NULL,
  `requested_value` varchar(255) NOT NULL,
  `status` int unsigned NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `confirmed_by` int NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `edit_history_confirmed_by_462d3a13_fk_auth_user_id` (`confirmed_by`),
  CONSTRAINT `edit_history_confirmed_by_462d3a13_fk_auth_user_id` FOREIGN KEY (`confirmed_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `edit_history_chk_1` CHECK ((`status` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_history`
--

LOCK TABLES `edit_history` WRITE;
/*!40000 ALTER TABLE `edit_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_history` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
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
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `rating_restaurant_id_2ee89748_fk_restaurant_restaurant_id` (`restaurant_id`),
  CONSTRAINT `rating_restaurant_id_2ee89748_fk_restaurant_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `rating_chk_1` CHECK ((`dish_rating` >= 0)),
  CONSTRAINT `rating_chk_2` CHECK ((`price_rating` >= 0)),
  CONSTRAINT `rating_chk_3` CHECK ((`service_rating` >= 0)),
  CONSTRAINT `rating_chk_4` CHECK ((`verified` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,4,4,4,1,'2020-11-03 11:20:36.106063','2020-11-03 11:20:36.106106',23),(2,3,4,4,1,'2020-11-03 11:22:10.398559','2020-11-03 11:22:10.398618',23),(3,3,5,4,1,'2020-11-03 11:22:15.886712','2020-11-03 11:22:15.886779',23),(4,3,5,5,1,'2020-11-03 11:22:21.065307','2020-11-03 11:22:21.065368',23),(5,3,5,5,1,'2020-11-03 11:22:56.385389','2020-11-03 11:22:56.385434',21),(6,3,5,5,1,'2020-11-03 11:23:06.642665','2020-11-03 11:23:06.642736',21),(7,5,5,5,1,'2020-11-03 11:23:13.175456','2020-11-03 11:23:13.175527',21),(8,5,4,5,1,'2020-11-03 11:23:17.045802','2020-11-03 11:23:17.045873',21),(9,5,4,4,1,'2020-11-03 11:23:21.860139','2020-11-03 11:23:21.860220',21),(10,4,4,4,1,'2020-11-03 11:23:26.452858','2020-11-03 11:23:26.452926',21),(11,4,4,4,1,'2020-11-03 11:23:41.816643','2020-11-03 11:23:41.816686',22),(12,5,4,4,1,'2020-11-03 11:23:47.345648','2020-11-03 11:23:47.345708',22),(13,5,4,5,1,'2020-11-03 11:23:51.889255','2020-11-03 11:23:51.889324',22),(14,5,5,5,1,'2020-11-03 11:23:57.445968','2020-11-03 11:23:57.446012',22),(15,5,5,5,1,'2020-11-03 11:24:03.153511','2020-11-03 11:24:03.153573',22),(16,4,5,5,1,'2020-11-03 11:24:13.952213','2020-11-03 11:24:13.952276',22),(17,4,5,4,1,'2020-11-03 11:24:19.136286','2020-11-03 11:24:19.136346',22),(18,4,5,4,1,'2020-11-03 11:24:43.727007','2020-11-03 11:24:43.727050',22),(19,4,4,4,1,'2020-11-03 11:24:52.174292','2020-11-03 11:24:52.174350',22),(20,3,4,5,1,'2020-11-03 11:26:14.428942','2020-11-03 11:26:14.429000',22),(21,3,3,5,1,'2020-11-03 11:26:20.351317','2020-11-03 11:26:20.351386',22),(22,3,3,5,1,'2020-11-03 11:26:51.894398','2020-11-03 11:26:51.894463',23),(23,3,3,3,1,'2020-11-03 11:26:58.575715','2020-11-03 11:26:58.575774',23),(24,3,4,3,1,'2020-11-03 11:27:03.898585','2020-11-03 11:27:03.898630',23),(25,2,4,3,1,'2020-11-03 11:27:32.853304','2020-11-03 11:27:32.853360',21),(26,2,2,3,1,'2020-11-03 11:27:38.121003','2020-11-03 11:27:38.121076',21),(27,2,2,3,1,'2020-11-03 11:27:44.495887','2020-11-03 11:27:44.495951',21),(28,2,4,3,1,'2020-11-03 11:27:49.541177','2020-11-03 11:27:49.541219',21),(29,4,4,3,1,'2020-11-05 11:24:15.675372','2020-11-05 11:24:15.675415',22),(30,3,3,3,1,'2020-11-07 05:19:43.521024','2020-11-07 05:19:43.521121',22),(31,2,3,3,1,'2020-11-07 05:21:24.895263','2020-11-07 05:21:24.895334',22),(32,2,3,4,0,'2020-11-11 13:23:37.506163','2020-11-11 13:23:37.506204',23),(33,4,5,4,0,'2020-11-11 13:24:39.109212','2020-11-11 13:24:39.109252',23),(34,2,4,5,0,'2020-11-11 13:25:07.063976','2020-11-11 13:25:07.064014',23),(35,2,5,2,0,'2020-11-11 13:25:38.158656','2020-11-11 13:25:38.158694',23),(36,2,2,3,0,'2020-11-11 13:25:55.722282','2020-11-11 13:25:55.722322',23),(37,5,5,5,0,'2020-11-11 13:26:31.564839','2020-11-11 13:26:31.564898',23),(38,5,5,5,0,'2020-11-11 13:27:00.323876','2020-11-11 13:27:00.323931',23),(39,4,5,5,0,'2020-11-11 13:27:12.344917','2020-11-11 13:27:12.344958',23),(40,4,5,4,0,'2020-11-11 13:27:46.156917','2020-11-11 13:27:46.156978',1),(41,2,2,2,0,'2020-11-12 10:31:51.023006','2020-11-12 10:31:51.023392',2),(42,2,3,4,0,'2020-11-12 17:50:06.171162','2020-11-12 17:50:06.171203',1),(43,5,5,5,0,'2020-11-13 16:09:52.306703','2020-11-13 16:09:52.306748',79),(44,3,3,3,1,'2020-11-14 10:56:45.568831','2020-11-14 10:56:45.568871',22),(45,2,3,3,0,'2020-11-14 10:59:00.838826','2020-11-14 10:59:00.838866',22),(46,5,5,5,0,'2020-11-14 10:59:57.673184','2020-11-14 10:59:57.673242',21),(47,5,5,5,0,'2020-11-14 15:59:10.459793','2020-11-14 15:59:10.459831',3),(48,2,3,3,1,'2020-11-18 07:32:12.571992','2020-11-18 07:32:12.572055',3),(49,3,5,5,1,'2020-11-18 07:35:30.760989','2020-11-18 07:35:30.761029',3);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `reply_id` int NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `created_by` int NOT NULL,
  `rating_id` bigint NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `reply_created_by_f65fb10f_fk_auth_user_id` (`created_by`),
  KEY `reply_rating_id_c2f2a855_fk_rating_rating_id` (`rating_id`),
  KEY `reply_updated_by_1b858297_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `reply_created_by_f65fb10f_fk_auth_user_id` FOREIGN KEY (`created_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `reply_rating_id_c2f2a855_fk_rating_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`),
  CONSTRAINT `reply_updated_by_1b858297_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting`
--

DROP TABLE IF EXISTS `reporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporting` (
  `reporting_id` int NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `reporter` int NOT NULL,
  `reporting_type` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`reporting_id`),
  KEY `reporting_reporting_type_6643ffeb_fk_reporting` (`reporting_type`),
  KEY `reporting_updated_by_44126ddf_fk_auth_user_id` (`updated_by`),
  KEY `reporting_reporter_90810c3b_fk_auth_user_id` (`reporter`),
  CONSTRAINT `reporting_reporter_90810c3b_fk_auth_user_id` FOREIGN KEY (`reporter`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `reporting_reporting_type_6643ffeb_fk_reporting` FOREIGN KEY (`reporting_type`) REFERENCES `reporting_type` (`reporting_type_id`),
  CONSTRAINT `reporting_updated_by_44126ddf_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting`
--

LOCK TABLES `reporting` WRITE;
/*!40000 ALTER TABLE `reporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_type`
--

DROP TABLE IF EXISTS `reporting_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporting_type` (
  `reporting_type_id` int NOT NULL AUTO_INCREMENT,
  `reporting_type_name` varchar(50) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`reporting_type_id`),
  KEY `reporting_type_created_by_6ca7d880_fk_auth_user_id` (`created_by`),
  KEY `reporting_type_updated_by_8af84c33_fk_auth_user_id` (`updated_by`),
  CONSTRAINT `reporting_type_created_by_6ca7d880_fk_auth_user_id` FOREIGN KEY (`created_by`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `reporting_type_updated_by_8af84c33_fk_auth_user_id` FOREIGN KEY (`updated_by`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_type`
--

LOCK TABLES `reporting_type` WRITE;
/*!40000 ALTER TABLE `reporting_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_type` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Unifolanka','Hikkaduwa',123451.1232,434543.5444,'0710273653',0,'8Qb49dLiDgp8O8ju6lsN','2020-07-30 02:42:17.431580','2020-07-30 02:42:17.431656',NULL,1,NULL),(2,'Ted Red','Hikkaduwa',434543.5444,434543.5444,'0710273653',0,'tTGCacqjgLuEEvuWssuu','2020-08-01 02:33:38.225415','2020-08-01 02:33:38.225474',NULL,1,NULL),(3,'Peblo','Ahangama',53.5444,37.5444,'0770273653',0,'6iaKkJwaIX2j6elnlrAd','2020-08-10 14:32:21.658392','2020-08-10 14:32:21.658456',NULL,1,NULL),(4,'Happy H','Galle',33.5444,37.5444,'0770273653',0,'No8oviPG6KjEwWOHvbAJ','2020-08-10 14:35:01.323349','2020-08-10 14:35:01.323442',NULL,1,NULL),(5,'Sithru','Koggala',33.5444,37.5444,'0770273653',0,'CtQGezbVk7Z8IUkX66qY','2020-08-10 14:35:39.393765','2020-08-10 14:35:39.393853',NULL,1,NULL),(6,'Lenny Bros','Rathgama',23.5444,77.5444,'0770273653',0,'7wDCf0rRrQnwmIcOEQNn','2020-08-10 14:36:57.467450','2020-08-10 14:36:57.467542',NULL,1,NULL),(7,'Raveena','Unawatuna',23.5444,77.5444,'0770273653',0,'PBkfoIQxU2FSt2RG2s8l','2020-08-19 13:53:42.998373','2020-08-19 13:53:42.998474',NULL,1,NULL),(8,'Test100','baddegama',23.5444,77.5444,'+94718812099',0,'ONEG5eNLwOL9aiP8TveT','2020-10-07 07:55:33.967546','2020-10-07 07:55:33.967660',NULL,1,NULL),(9,'Test400','Hikkaduva',23.5444,77.5444,'+94718812086',0,'oJM8J70ohCx2wA7iwb7z','2020-10-10 18:27:54.920637','2020-10-10 18:27:54.920736',NULL,1,NULL),(10,'test1','Kevin Street, Baddegama',23.5444,77.5444,'0770273653',0,'PE8FrTNTk9VfgPkASQoY','2020-11-03 11:12:32.206410','2020-11-03 11:12:32.206516',NULL,1,NULL),(11,'test2','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'uXRLjkI0qGwqsjqG6Yzj','2020-11-03 11:12:38.269829','2020-11-03 11:12:38.269882',NULL,1,NULL),(12,'test3','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'VfPYyz3wyXbWwCMMqwE1','2020-11-03 11:12:42.963279','2020-11-03 11:12:42.963372',NULL,1,NULL),(13,'test4','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'SIOj4pGiqlqMmZthh64R','2020-11-03 11:12:48.861539','2020-11-03 11:12:48.861624',NULL,1,NULL),(14,'test5','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'nXhJKMXMLOXJG9zSHTtG','2020-11-03 11:12:53.679697','2020-11-03 11:12:53.679754',NULL,1,NULL),(15,'test6','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'FxAnYhANX53BFJymc5S0','2020-11-03 11:12:58.172097','2020-11-03 11:12:58.172182',NULL,1,NULL),(16,'test7','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'7dkNMKsWFL8gj1R0R9Qy','2020-11-03 11:13:02.874810','2020-11-03 11:13:02.874870',NULL,1,NULL),(17,'test8','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'MTo6IyLBaHtp84HgwWJ2','2020-11-03 11:13:07.462744','2020-11-03 11:13:07.462831',NULL,1,NULL),(18,'test9','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'GSIrYnt65kyrPXRNWLVT','2020-11-03 11:13:13.139884','2020-11-03 11:13:13.139963',NULL,1,NULL),(19,'test10','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'4SI7sXkG5pGPZ597ZkZN','2020-11-03 11:13:18.552140','2020-11-03 11:13:18.552197',NULL,1,NULL),(20,'test11','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'BvJY02cpgzyDUHykcqdM','2020-11-03 11:13:22.791468','2020-11-03 11:13:22.791557',NULL,1,NULL),(21,'test12','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'FDHf7HuELA0x0HkOO9GL','2020-11-03 11:13:27.298192','2020-11-03 11:13:27.298277',NULL,1,NULL),(22,'test13','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'Sx3ehIZtTKPYrzTFKTMr','2020-11-03 11:13:31.616922','2020-11-03 11:13:31.617000',NULL,1,NULL),(23,'test14','Downhill, Rathgama',23.5444,77.5444,'0770273653',1,'N4Ncmv0SdwtFoZIOQaYG','2020-11-03 11:15:09.819584','2020-11-03 11:15:09.819673',2,1,NULL),(24,'test15','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'NpH5us3RtlkAOQ48EbeL','2020-11-03 11:15:13.979459','2020-11-03 11:15:13.979553',NULL,1,NULL),(25,'test16','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'Hxvh0bcTXwY5BCNuQrAu','2020-11-03 11:15:17.892139','2020-11-03 11:15:17.892229',NULL,1,NULL),(79,'Test_new_01','Batapola',23.5444,77.5444,'0770273653',0,'Fdhvlb1Dj5as5ognAym4','2020-11-13 16:09:21.751998','2020-11-13 16:09:21.752111',NULL,1,NULL);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_component_reporting`
--

DROP TABLE IF EXISTS `restaurant_component_reporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_component_reporting` (
  `reporting_id` int NOT NULL,
  `component_id` smallint NOT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`reporting_id`),
  KEY `restaurant_component_component_id_513c4403_fk_edit_comp` (`component_id`),
  KEY `restaurant_component_restaurant_id_2a656952_fk_restauran` (`restaurant_id`),
  CONSTRAINT `restaurant_component_component_id_513c4403_fk_edit_comp` FOREIGN KEY (`component_id`) REFERENCES `edit_component` (`component_id`),
  CONSTRAINT `restaurant_component_reporting_id_1678430f_fk_reporting` FOREIGN KEY (`reporting_id`) REFERENCES `reporting` (`reporting_id`),
  CONSTRAINT `restaurant_component_restaurant_id_2a656952_fk_restauran` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_component_reporting`
--

LOCK TABLES `restaurant_component_reporting` WRITE;
/*!40000 ALTER TABLE `restaurant_component_reporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_component_reporting` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_dish`
--

LOCK TABLES `restaurant_dish` WRITE;
/*!40000 ALTER TABLE `restaurant_dish` DISABLE KEYS */;
INSERT INTO `restaurant_dish` VALUES (19,1,'2020-09-26 00:00:00.000000',NULL,NULL,1,8,NULL),(20,1,'2020-09-26 00:00:00.000000',NULL,NULL,2,8,NULL),(21,1,'2020-09-26 00:00:00.000000',NULL,NULL,3,8,NULL),(22,1,'2020-09-26 00:00:00.000000',NULL,NULL,4,8,NULL),(23,1,'2020-09-26 00:00:00.000000',NULL,NULL,1,9,NULL),(24,1,'2020-09-26 00:00:00.000000',NULL,NULL,2,9,NULL),(25,1,'2020-11-14 00:00:00.000000',NULL,1,2,22,NULL),(26,1,'2020-11-14 00:00:00.000000',NULL,1,1,22,NULL),(27,1,'2020-11-14 00:00:00.000000',NULL,1,3,22,NULL),(28,1,'2020-11-14 00:00:00.000000',NULL,1,4,22,NULL),(29,1,'2020-11-14 00:00:00.000000',NULL,1,1,23,NULL),(30,0,'2020-11-14 00:00:00.000000',NULL,1,2,23,NULL),(31,1,'2020-11-14 00:00:00.000000',NULL,1,2,21,NULL),(32,1,'2020-11-14 00:00:00.000000',NULL,1,4,21,NULL),(33,1,'2020-11-14 00:00:00.000000',NULL,1,3,21,NULL),(34,1,'2020-11-14 00:00:00.000000',NULL,1,3,23,NULL),(35,1,'2020-11-14 00:00:00.000000',NULL,1,1,1,NULL),(36,1,'2020-11-14 00:00:00.000000',NULL,1,2,2,NULL),(37,1,'2020-11-14 00:00:00.000000',NULL,1,3,79,NULL),(39,0,'2020-11-14 15:20:48.024712','2020-11-14 15:20:48.024752',1,2,4,NULL),(41,0,'2020-11-14 15:21:39.951657','2020-11-14 15:21:39.951712',1,1,4,NULL),(43,0,'2020-11-14 15:23:05.931236','2020-11-14 15:23:05.931301',1,3,4,NULL),(53,0,'2020-11-14 15:46:18.031158','2020-11-14 15:46:18.031295',1,5,4,NULL),(54,0,'2020-11-14 15:58:36.757094','2020-11-14 15:58:36.757162',1,3,3,NULL),(55,1,'2020-11-18 13:27:30.432200','2020-11-18 13:27:30.432266',2,7,23,NULL),(56,1,'2020-11-18 13:32:22.346164','2020-11-18 13:32:22.346213',2,8,23,NULL);
/*!40000 ALTER TABLE `restaurant_dish` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_meal`
--

LOCK TABLES `restaurant_meal` WRITE;
/*!40000 ALTER TABLE `restaurant_meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_reporting`
--

DROP TABLE IF EXISTS `restaurant_reporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_reporting` (
  `reporting_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`reporting_id`),
  KEY `restaurant_reporting_restaurant_id_ea5d313a_fk_restauran` (`restaurant_id`),
  CONSTRAINT `restaurant_reporting_reporting_id_44c91535_fk_reporting` FOREIGN KEY (`reporting_id`) REFERENCES `reporting` (`reporting_id`),
  CONSTRAINT `restaurant_reporting_restaurant_id_ea5d313a_fk_restauran` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_reporting`
--

LOCK TABLES `restaurant_reporting` WRITE;
/*!40000 ALTER TABLE `restaurant_reporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_reporting` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_reply_reporting`
--

DROP TABLE IF EXISTS `review_reply_reporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_reply_reporting` (
  `reporting_id` int NOT NULL,
  `reply_id` int NOT NULL,
  PRIMARY KEY (`reporting_id`),
  KEY `review_reply_reporting_reply_id_08b69a19_fk_reply_reply_id` (`reply_id`),
  CONSTRAINT `review_reply_reporti_reporting_id_7f21b332_fk_reporting` FOREIGN KEY (`reporting_id`) REFERENCES `reporting` (`reporting_id`),
  CONSTRAINT `review_reply_reporting_reply_id_08b69a19_fk_reply_reply_id` FOREIGN KEY (`reply_id`) REFERENCES `reply` (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_reply_reporting`
--

LOCK TABLES `review_reply_reporting` WRITE;
/*!40000 ALTER TABLE `review_reply_reporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_reply_reporting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_reporting`
--

DROP TABLE IF EXISTS `review_reporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_reporting` (
  `reporting_id` int NOT NULL,
  `rating_id` bigint NOT NULL,
  PRIMARY KEY (`reporting_id`),
  KEY `review_reporting_rating_id_57c0b9b5_fk_rating_rating_id` (`rating_id`),
  CONSTRAINT `review_reporting_rating_id_57c0b9b5_fk_rating_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`),
  CONSTRAINT `review_reporting_reporting_id_34a0f12b_fk_reporting_reporting_id` FOREIGN KEY (`reporting_id`) REFERENCES `reporting` (`reporting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_reporting`
--

LOCK TABLES `review_reporting` WRITE;
/*!40000 ALTER TABLE `review_reporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_reporting` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES ('#34A4343','2020-09-30 00:00:00.000000',2,21),('#34A4344','2020-10-20 00:00:00.000000',2,22),('#34A4345','2020-10-20 00:00:00.000000',2,23),('UO0PM7G2NB','2020-11-18 07:31:52.830759',1,3),('VSJEGHQR1W','2020-11-18 07:31:52.687713',1,3);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_edit_history_component`
--

DROP TABLE IF EXISTS `user_edit_history_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_edit_history_component` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `component_id` smallint NOT NULL,
  `history_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_edit_history_component` (`user_id`,`history_id`,`restaurant_id`,`component_id`),
  KEY `user_edit_history_co_component_id_7c811914_fk_edit_comp` (`component_id`),
  KEY `user_edit_history_co_history_id_aa3b0db6_fk_edit_hist` (`history_id`),
  KEY `user_edit_history_co_restaurant_id_b59ae861_fk_restauran` (`restaurant_id`),
  CONSTRAINT `user_edit_history_co_component_id_7c811914_fk_edit_comp` FOREIGN KEY (`component_id`) REFERENCES `edit_component` (`component_id`),
  CONSTRAINT `user_edit_history_co_history_id_aa3b0db6_fk_edit_hist` FOREIGN KEY (`history_id`) REFERENCES `edit_history` (`history_id`),
  CONSTRAINT `user_edit_history_co_restaurant_id_b59ae861_fk_restauran` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `user_edit_history_component_user_id_2df07ee8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_edit_history_component`
--

LOCK TABLES `user_edit_history_component` WRITE;
/*!40000 ALTER TABLE `user_edit_history_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_edit_history_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_edit_history_confirmation`
--

DROP TABLE IF EXISTS `user_edit_history_confirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_edit_history_confirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `confirmation_points` int NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `history_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_edit_history_confirmation` (`user_id`,`history_id`),
  KEY `user_edit_history_co_history_id_c572f6d3_fk_edit_hist` (`history_id`),
  CONSTRAINT `user_edit_history_co_history_id_c572f6d3_fk_edit_hist` FOREIGN KEY (`history_id`) REFERENCES `edit_history` (`history_id`),
  CONSTRAINT `user_edit_history_confirmation_user_id_906d9829_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_edit_history_confirmation`
--

LOCK TABLES `user_edit_history_confirmation` WRITE;
/*!40000 ALTER TABLE `user_edit_history_confirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_edit_history_confirmation` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_level`
--

LOCK TABLES `user_level` WRITE;
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
INSERT INTO `user_level` VALUES (0,50,50,'2020-11-18 00:00:00.000000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_level` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reporting`
--

LOCK TABLES `user_reporting` WRITE;
/*!40000 ALTER TABLE `user_reporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_reporting` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warning`
--

LOCK TABLES `warning` WRITE;
/*!40000 ALTER TABLE `warning` DISABLE KEYS */;
/*!40000 ALTER TABLE `warning` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warning_level`
--

LOCK TABLES `warning_level` WRITE;
/*!40000 ALTER TABLE `warning_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `warning_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rrs2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-25 18:50:40
