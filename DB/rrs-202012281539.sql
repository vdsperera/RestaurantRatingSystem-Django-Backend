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
INSERT INTO `added_dish_rating` VALUES (77,NULL,NULL,NULL,2,21,'#34A4343',1),(78,NULL,NULL,NULL,2,22,'#34A4344',1),(81,NULL,NULL,NULL,2,22,'#34A4344',1),(82,NULL,NULL,NULL,2,22,'#34A4344',1),(86,NULL,NULL,NULL,2,23,'#34A4345',1),(87,NULL,NULL,NULL,2,23,'#34A4345',1),(88,NULL,NULL,NULL,2,23,'#34A4345',1),(94,NULL,NULL,NULL,2,21,'#34A4343',1),(95,NULL,NULL,NULL,2,21,'#34A4343',1),(96,NULL,NULL,NULL,2,21,'#34A4343',1),(97,NULL,NULL,NULL,2,21,'#34A4343',1),(102,NULL,NULL,NULL,2,22,'#34A4344',1),(103,NULL,NULL,NULL,2,22,'#34A4344',1),(104,NULL,NULL,NULL,2,22,'#34A4344',1),(110,NULL,NULL,NULL,2,23,'#34A4345',1),(111,NULL,NULL,NULL,2,23,'#34A4345',1),(112,NULL,NULL,NULL,3,23,'#34A4345',1),(113,NULL,NULL,NULL,3,23,'#34A4345',1),(114,NULL,NULL,NULL,3,23,'#34A4345',1),(115,NULL,NULL,NULL,3,22,'#34A4344',1),(116,NULL,NULL,NULL,4,22,'#34A4344',1),(117,NULL,NULL,NULL,4,22,'#34A4344',1),(118,NULL,NULL,NULL,2,22,'#34A4344',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'customer'),(1,'owner');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user role',7,'add_userrole'),(26,'Can change user role',7,'change_userrole'),(27,'Can delete user role',7,'delete_userrole'),(28,'Can view user role',7,'view_userrole'),(29,'Can add check in',8,'add_checkin'),(30,'Can change check in',8,'change_checkin'),(31,'Can delete check in',8,'delete_checkin'),(32,'Can view check in',8,'view_checkin'),(33,'Can add dish',9,'add_dish'),(34,'Can change dish',9,'change_dish'),(35,'Can delete dish',9,'delete_dish'),(36,'Can view dish',9,'view_dish'),(37,'Can add edit component',10,'add_editcomponent'),(38,'Can change edit component',10,'change_editcomponent'),(39,'Can delete edit component',10,'delete_editcomponent'),(40,'Can view edit component',10,'view_editcomponent'),(41,'Can add edit history',11,'add_edithistory'),(42,'Can change edit history',11,'change_edithistory'),(43,'Can delete edit history',11,'delete_edithistory'),(44,'Can view edit history',11,'view_edithistory'),(45,'Can add meal',12,'add_meal'),(46,'Can change meal',12,'change_meal'),(47,'Can delete meal',12,'delete_meal'),(48,'Can view meal',12,'view_meal'),(49,'Can add rating',13,'add_rating'),(50,'Can change rating',13,'change_rating'),(51,'Can delete rating',13,'delete_rating'),(52,'Can view rating',13,'view_rating'),(53,'Can add reporting',14,'add_reporting'),(54,'Can change reporting',14,'change_reporting'),(55,'Can delete reporting',14,'delete_reporting'),(56,'Can view reporting',14,'view_reporting'),(57,'Can add restaurant',15,'add_restaurant'),(58,'Can change restaurant',15,'change_restaurant'),(59,'Can delete restaurant',15,'delete_restaurant'),(60,'Can view restaurant',15,'view_restaurant'),(61,'Can add added dish rating',16,'add_addeddishrating'),(62,'Can change added dish rating',16,'change_addeddishrating'),(63,'Can delete added dish rating',16,'delete_addeddishrating'),(64,'Can view added dish rating',16,'view_addeddishrating'),(65,'Can add added rating',17,'add_addedrating'),(66,'Can change added rating',17,'change_addedrating'),(67,'Can delete added rating',17,'delete_addedrating'),(68,'Can view added rating',17,'view_addedrating'),(69,'Can add customer check in',18,'add_customercheckin'),(70,'Can change customer check in',18,'change_customercheckin'),(71,'Can delete customer check in',18,'delete_customercheckin'),(72,'Can view customer check in',18,'view_customercheckin'),(73,'Can add restaurant component reporting',19,'add_restaurantcomponentreporting'),(74,'Can change restaurant component reporting',19,'change_restaurantcomponentreporting'),(75,'Can delete restaurant component reporting',19,'delete_restaurantcomponentreporting'),(76,'Can view restaurant component reporting',19,'view_restaurantcomponentreporting'),(77,'Can add restaurant reporting',20,'add_restaurantreporting'),(78,'Can change restaurant reporting',20,'change_restaurantreporting'),(79,'Can delete restaurant reporting',20,'delete_restaurantreporting'),(80,'Can view restaurant reporting',20,'view_restaurantreporting'),(81,'Can add review',21,'add_review'),(82,'Can change review',21,'change_review'),(83,'Can delete review',21,'delete_review'),(84,'Can view review',21,'view_review'),(85,'Can add review reply reporting',22,'add_reviewreplyreporting'),(86,'Can change review reply reporting',22,'change_reviewreplyreporting'),(87,'Can delete review reply reporting',22,'delete_reviewreplyreporting'),(88,'Can view review reply reporting',22,'view_reviewreplyreporting'),(89,'Can add review reporting',23,'add_reviewreporting'),(90,'Can change review reporting',23,'change_reviewreporting'),(91,'Can delete review reporting',23,'delete_reviewreporting'),(92,'Can view review reporting',23,'view_reviewreporting'),(93,'Can add warning level',24,'add_warninglevel'),(94,'Can change warning level',24,'change_warninglevel'),(95,'Can delete warning level',24,'delete_warninglevel'),(96,'Can view warning level',24,'view_warninglevel'),(97,'Can add warning',25,'add_warning'),(98,'Can change warning',25,'change_warning'),(99,'Can delete warning',25,'delete_warning'),(100,'Can view warning',25,'view_warning'),(101,'Can add user level',26,'add_userlevel'),(102,'Can change user level',26,'change_userlevel'),(103,'Can delete user level',26,'delete_userlevel'),(104,'Can view user level',26,'view_userlevel'),(105,'Can add user edit history confirmation',27,'add_useredithistoryconfirmation'),(106,'Can change user edit history confirmation',27,'change_useredithistoryconfirmation'),(107,'Can delete user edit history confirmation',27,'delete_useredithistoryconfirmation'),(108,'Can view user edit history confirmation',27,'view_useredithistoryconfirmation'),(109,'Can add user edit history component',28,'add_useredithistorycomponent'),(110,'Can change user edit history component',28,'change_useredithistorycomponent'),(111,'Can delete user edit history component',28,'delete_useredithistorycomponent'),(112,'Can view user edit history component',28,'view_useredithistorycomponent'),(113,'Can add token',29,'add_token'),(114,'Can change token',29,'change_token'),(115,'Can delete token',29,'delete_token'),(116,'Can view token',29,'view_token'),(117,'Can add restaurant meal',30,'add_restaurantmeal'),(118,'Can change restaurant meal',30,'change_restaurantmeal'),(119,'Can delete restaurant meal',30,'delete_restaurantmeal'),(120,'Can view restaurant meal',30,'view_restaurantmeal'),(121,'Can add restaurant dish',31,'add_restaurantdish'),(122,'Can change restaurant dish',31,'change_restaurantdish'),(123,'Can delete restaurant dish',31,'delete_restaurantdish'),(124,'Can view restaurant dish',31,'view_restaurantdish'),(125,'Can add reporting type',32,'add_reportingtype'),(126,'Can change reporting type',32,'change_reportingtype'),(127,'Can delete reporting type',32,'delete_reportingtype'),(128,'Can view reporting type',32,'view_reportingtype'),(129,'Can add reply',33,'add_reply'),(130,'Can change reply',33,'change_reply'),(131,'Can delete reply',33,'delete_reply'),(132,'Can view reply',33,'view_reply'),(133,'Can add custom user',34,'add_customuser'),(134,'Can change custom user',34,'change_customuser'),(135,'Can delete custom user',34,'delete_customuser'),(136,'Can view custom user',34,'view_customuser'),(137,'Can add contribution type',35,'add_contributiontype'),(138,'Can change contribution type',35,'change_contributiontype'),(139,'Can delete contribution type',35,'delete_contributiontype'),(140,'Can view contribution type',35,'view_contributiontype'),(141,'Can add contribution',36,'add_contribution'),(142,'Can change contribution',36,'change_contribution'),(143,'Can delete contribution',36,'delete_contribution'),(144,'Can view contribution',36,'view_contribution'),(145,'Can add user reporting',37,'add_userreporting'),(146,'Can change user reporting',37,'change_userreporting'),(147,'Can delete user reporting',37,'delete_userreporting'),(148,'Can view user reporting',37,'view_userreporting');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$IDqnxAkUiaKP$Y5Rvl0Zyvj6e5sCKqRv7ZkPevtW+2/qYQOvF0FJ7TEo=','2020-08-07 02:31:32.908541',1,'vidumini','','','heartyvds@gmail.com',1,1,'2020-07-24 11:34:03.745993'),(2,'pbkdf2_sha256$180000$cA2JiZ7EknjE$504yfucGk1hNK6OXihSE9zS/ivNEVTpCt2mhQ6fkZCI=','2020-08-07 02:32:58.266544',0,'dilshan','','','',0,1,'2020-07-27 06:47:04.000000'),(3,'pbkdf2_sha256$180000$nFBkmaq7Abnm$80H6lVM/ENyQHLKo5APhVnv9MS/LS0IOadVUpS8Xnpc=',NULL,0,'asanka','','','',0,1,'2020-07-27 06:47:16.000000'),(4,'pbkdf2_sha256$180000$nWfLOynTvmV1$uH+xxcZqRo6QlDyJz/KSiA+cU/ODoF1lCkhAe+5vGUQ=',NULL,0,'numin','','','',0,1,'2020-07-27 06:47:52.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (3,2,2),(1,3,1),(2,4,2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribution_type`
--

LOCK TABLES `contribution_type` WRITE;
/*!40000 ALTER TABLE `contribution_type` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user`
--

LOCK TABLES `custom_user` WRITE;
/*!40000 ALTER TABLE `custom_user` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Dish 01',1,'2020-09-25 00:00:00.000000',NULL,2,NULL),(2,'Dish 02',1,'2020-09-20 00:00:00.000000',NULL,1,NULL),(3,'Dish 03',1,'2020-08-20 00:00:00.000000',NULL,1,NULL),(4,'Dish 04',1,'2020-09-10 00:00:00.000000',NULL,3,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-07-27 06:47:04.726079','2','dilshan',1,'[{\"added\": {}}]',4,1),(2,'2020-07-27 06:47:16.696930','3','asanka',1,'[{\"added\": {}}]',4,1),(3,'2020-07-27 06:47:52.982545','4','numin',1,'[{\"added\": {}}]',4,1),(4,'2020-07-27 06:49:05.148019','1','owner',1,'[{\"added\": {}}]',3,1),(5,'2020-07-27 06:49:14.478068','2','customer',1,'[{\"added\": {}}]',3,1),(6,'2020-07-27 06:49:49.535142','3','asanka',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(7,'2020-07-27 06:50:26.735494','4','numin',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(8,'2020-07-27 06:50:44.497691','2','dilshan',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(9,'2020-08-07 02:32:31.658263','2','dilshan',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(16,'restaurantratingapi','addeddishrating'),(17,'restaurantratingapi','addedrating'),(8,'restaurantratingapi','checkin'),(36,'restaurantratingapi','contribution'),(35,'restaurantratingapi','contributiontype'),(18,'restaurantratingapi','customercheckin'),(34,'restaurantratingapi','customuser'),(9,'restaurantratingapi','dish'),(10,'restaurantratingapi','editcomponent'),(11,'restaurantratingapi','edithistory'),(12,'restaurantratingapi','meal'),(13,'restaurantratingapi','rating'),(33,'restaurantratingapi','reply'),(14,'restaurantratingapi','reporting'),(32,'restaurantratingapi','reportingtype'),(15,'restaurantratingapi','restaurant'),(19,'restaurantratingapi','restaurantcomponentreporting'),(31,'restaurantratingapi','restaurantdish'),(30,'restaurantratingapi','restaurantmeal'),(20,'restaurantratingapi','restaurantreporting'),(21,'restaurantratingapi','review'),(22,'restaurantratingapi','reviewreplyreporting'),(23,'restaurantratingapi','reviewreporting'),(29,'restaurantratingapi','token'),(28,'restaurantratingapi','useredithistorycomponent'),(27,'restaurantratingapi','useredithistoryconfirmation'),(26,'restaurantratingapi','userlevel'),(37,'restaurantratingapi','userreporting'),(7,'restaurantratingapi','userrole'),(25,'restaurantratingapi','warning'),(24,'restaurantratingapi','warninglevel'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-07-07 11:53:07.475380'),(2,'auth','0001_initial','2020-07-07 11:53:11.051366'),(3,'admin','0001_initial','2020-07-07 11:53:22.504541'),(4,'admin','0002_logentry_remove_auto_add','2020-07-07 11:53:25.250729'),(5,'admin','0003_logentry_add_action_flag_choices','2020-07-07 11:53:25.326554'),(6,'contenttypes','0002_remove_content_type_name','2020-07-07 11:53:28.075226'),(7,'auth','0002_alter_permission_name_max_length','2020-07-07 11:53:30.191263'),(8,'auth','0003_alter_user_email_max_length','2020-07-07 11:53:31.566297'),(9,'auth','0004_alter_user_username_opts','2020-07-07 11:53:31.678238'),(10,'auth','0005_alter_user_last_login_null','2020-07-07 11:53:32.825710'),(11,'auth','0006_require_contenttypes_0002','2020-07-07 11:53:32.920996'),(12,'auth','0007_alter_validators_add_error_messages','2020-07-07 11:53:33.035049'),(13,'auth','0008_alter_user_username_max_length','2020-07-07 11:53:34.449018'),(14,'auth','0009_alter_user_last_name_max_length','2020-07-07 11:53:35.793582'),(15,'auth','0010_alter_group_name_max_length','2020-07-07 11:53:37.131666'),(16,'auth','0011_update_proxy_permissions','2020-07-07 11:53:37.231825'),(17,'sessions','0001_initial','2020-07-07 11:53:37.884234'),(18,'restaurantratingapi','0001_initial','2020-07-07 11:58:08.940947'),(19,'restaurantratingapi','0002_auto_20200707_1200','2020-07-07 12:01:15.410350'),(20,'restaurantratingapi','0003_auto_20200801_0420','2020-08-01 04:22:27.888110');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('l1y2ndux7aw5hisznw1tmp2kskgqgkgn','NjE3ZThiN2VjNTEwZDczNzc5M2UyYTJmMmExZDQ2OTMzOGNjNDQ1Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZDVkMmZmYWZhNmY4ODk2NjUyOGEzNmQ1MWM5NjVlOTE3ZmJlODkxIn0=','2020-08-10 06:45:53.887257');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (77,5,4,5,1,'2020-10-21 08:15:40.886342','2020-10-21 08:15:40.886484'),(78,5,4,5,1,'2020-10-21 08:16:41.014752','2020-10-21 08:16:41.014814'),(79,5,4,5,1,'2020-10-21 08:19:20.277572','2020-10-21 08:19:20.277647'),(80,5,3,5,1,'2020-10-21 08:19:56.341047','2020-10-21 08:19:56.341108'),(81,5,5,5,1,'2020-10-21 08:20:16.739383','2020-10-21 08:20:16.739443'),(82,5,5,3,1,'2020-10-21 08:20:32.705495','2020-10-21 08:20:32.705565'),(83,4,4,3,1,'2020-10-21 08:20:50.667203','2020-10-21 08:20:50.667269'),(84,4,4,3,1,'2020-10-21 08:21:04.799941','2020-10-21 08:21:04.800011'),(85,5,4,3,1,'2020-10-21 08:21:10.987509','2020-10-21 08:21:10.987569'),(86,5,4,4,1,'2020-10-21 08:21:18.383503','2020-10-21 08:21:18.383566'),(87,4,4,4,1,'2020-10-21 08:21:25.472808','2020-10-21 08:21:25.472884'),(88,4,3,4,1,'2020-10-21 08:21:30.921382','2020-10-21 08:21:30.921442'),(89,4,3,4,1,'2020-10-21 08:21:37.061486','2020-10-21 08:21:37.061549'),(90,4,5,4,1,'2020-10-21 08:21:43.107214','2020-10-21 08:21:43.107275'),(91,4,5,4,1,'2020-10-21 08:21:57.759842','2020-10-21 08:21:57.759902'),(92,4,4,4,1,'2020-10-21 08:22:02.922778','2020-10-21 08:22:02.922845'),(93,4,4,5,1,'2020-10-21 08:22:09.274031','2020-10-21 08:22:09.274089'),(94,4,4,5,1,'2020-10-21 08:22:15.157070','2020-10-21 08:22:15.157199'),(95,3,4,5,1,'2020-10-21 08:22:19.699653','2020-10-21 08:22:19.699939'),(96,3,3,5,1,'2020-10-21 08:22:27.454439','2020-10-21 08:22:27.454503'),(97,3,3,4,1,'2020-10-21 08:22:36.065812','2020-10-21 08:22:36.065867'),(98,3,2,4,1,'2020-10-21 08:22:45.711231','2020-10-21 08:22:45.711273'),(99,5,2,4,1,'2020-10-21 08:22:50.738474','2020-10-21 08:22:50.738535'),(100,5,4,4,1,'2020-10-21 08:23:12.069630','2020-10-21 08:23:12.069676'),(101,5,4,5,1,'2020-10-21 08:23:18.586166','2020-10-21 08:23:18.586230'),(102,5,5,5,1,'2020-10-21 08:23:25.468310','2020-10-21 08:23:25.468370'),(103,4,5,4,1,'2020-10-21 08:23:35.392708','2020-10-21 08:23:35.392769'),(104,4,3,4,1,'2020-10-21 08:23:40.828060','2020-10-21 08:23:40.828122'),(105,4,4,4,1,'2020-10-21 08:23:50.248841','2020-10-21 08:23:50.248937'),(106,4,3,4,1,'2020-10-21 08:23:55.665414','2020-10-21 08:23:55.665477'),(107,3,3,4,1,'2020-10-21 08:24:09.917283','2020-10-21 08:24:09.917343'),(108,3,3,2,1,'2020-10-21 08:24:17.559978','2020-10-21 08:24:17.560047'),(109,4,3,2,1,'2020-10-21 08:24:24.537724','2020-10-21 08:24:24.537786'),(110,4,4,2,1,'2020-10-21 08:24:31.141603','2020-10-21 08:24:31.141661'),(111,4,4,4,1,'2020-10-21 08:24:36.390433','2020-10-21 08:24:36.390502'),(112,4,4,4,1,'2020-10-26 09:46:53.955090','2020-10-26 09:46:53.955135'),(113,5,4,4,1,'2020-10-26 09:47:03.461247','2020-10-26 09:47:03.461310'),(114,5,4,3,1,'2020-10-26 09:47:10.491764','2020-10-26 09:47:10.491828'),(115,5,5,3,1,'2020-10-26 09:47:39.045924','2020-10-26 09:47:39.045991'),(116,5,5,3,1,'2020-10-26 09:47:52.254399','2020-10-26 09:47:52.254455'),(117,5,4,3,1,'2020-10-26 09:48:00.332270','2020-10-26 09:48:00.332329'),(118,5,4,3,1,'2020-10-26 09:48:07.119027','2020-10-26 09:48:07.119087');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
-- Dumping events for database 'rrs'
--

--
-- Dumping routines for database 'rrs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-28 15:39:51
