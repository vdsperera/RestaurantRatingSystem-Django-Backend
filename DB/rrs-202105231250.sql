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
INSERT INTO `added_dish_rating` VALUES (1,NULL,NULL,NULL,2,'#34A4345',1),(2,NULL,NULL,NULL,2,'#34A4345',1),(3,NULL,NULL,NULL,2,'#34A4345',1),(4,NULL,NULL,NULL,2,'#34A4345',1),(5,NULL,NULL,NULL,2,'#34A4343',1),(6,NULL,NULL,NULL,4,'#34A4343',1),(7,NULL,NULL,NULL,4,'#34A4343',1),(8,NULL,NULL,NULL,4,'#34A4343',1),(9,NULL,NULL,NULL,4,'#34A4343',1),(10,NULL,NULL,NULL,4,'#34A4343',1),(11,NULL,NULL,NULL,4,'#34A4344',1),(12,NULL,NULL,NULL,4,'#34A4344',1),(13,NULL,NULL,NULL,4,'#34A4344',1),(14,NULL,NULL,NULL,4,'#34A4344',1),(15,NULL,NULL,NULL,3,'#34A4344',1),(16,NULL,NULL,NULL,3,'#34A4344',1),(17,NULL,NULL,NULL,3,'#34A4344',1),(29,NULL,NULL,NULL,2,'#34A4344',1),(30,NULL,NULL,NULL,2,'#34A4344',1),(32,NULL,NULL,NULL,3,NULL,1),(33,NULL,NULL,NULL,3,NULL,1),(34,NULL,NULL,NULL,3,NULL,1),(35,NULL,NULL,NULL,3,NULL,1),(36,NULL,NULL,NULL,3,NULL,1),(37,NULL,NULL,NULL,3,NULL,1),(38,NULL,NULL,NULL,3,NULL,1),(39,NULL,NULL,NULL,3,NULL,1),(40,NULL,NULL,NULL,1,NULL,1),(41,NULL,NULL,NULL,2,NULL,1),(42,NULL,NULL,NULL,1,NULL,1),(43,NULL,NULL,NULL,3,NULL,1),(46,NULL,NULL,NULL,2,NULL,1),(47,NULL,NULL,NULL,3,NULL,1),(53,NULL,NULL,NULL,3,NULL,1),(55,NULL,NULL,NULL,4,NULL,3),(56,NULL,NULL,NULL,1,NULL,3),(58,NULL,NULL,NULL,1,NULL,4),(60,NULL,NULL,NULL,2,NULL,4),(61,NULL,NULL,NULL,1,NULL,4),(62,NULL,NULL,NULL,1,NULL,4),(63,NULL,NULL,NULL,2,NULL,1),(64,NULL,NULL,NULL,2,NULL,1),(66,NULL,NULL,NULL,4,NULL,1),(68,NULL,NULL,NULL,4,NULL,3),(69,NULL,NULL,NULL,4,NULL,3),(70,NULL,NULL,NULL,2,NULL,3),(72,NULL,NULL,NULL,8,NULL,3),(74,NULL,NULL,NULL,2,NULL,3),(75,NULL,NULL,NULL,2,NULL,3),(76,NULL,NULL,NULL,2,NULL,3),(77,NULL,NULL,NULL,2,NULL,3),(78,NULL,NULL,NULL,2,NULL,3),(79,NULL,NULL,NULL,2,NULL,3),(80,NULL,NULL,NULL,2,NULL,1),(89,NULL,NULL,NULL,3,'ECJD4GLN70',3),(90,NULL,NULL,NULL,2,'6TIFQHMLS4',3),(91,NULL,NULL,NULL,1,'9JWQN32IET',3),(92,NULL,NULL,NULL,3,NULL,3),(94,NULL,NULL,NULL,2,NULL,3),(96,NULL,NULL,NULL,3,NULL,3),(97,NULL,NULL,NULL,1,'VYAPBLP91W',3),(99,NULL,NULL,NULL,1,NULL,3),(101,NULL,NULL,NULL,1,NULL,3),(102,NULL,NULL,NULL,17,'8HAQZDBZ2R',3),(103,NULL,NULL,NULL,17,'BY29RPPL7C',3),(104,NULL,NULL,NULL,1,NULL,3),(111,NULL,NULL,NULL,1,NULL,3),(112,NULL,NULL,NULL,3,NULL,3),(114,NULL,NULL,NULL,4,NULL,3),(117,NULL,NULL,NULL,8,NULL,3);
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
INSERT INTO `added_rating` VALUES (18,NULL,NULL,'2020-11-03 11:24:43.903574','#34A4344',1),(19,NULL,NULL,'2020-11-03 11:24:52.362288','#34A4344',1),(20,NULL,NULL,'2020-11-03 11:26:14.621281','#34A4344',1),(21,NULL,NULL,'2020-11-03 11:26:20.442554','#34A4344',1),(22,NULL,NULL,'2020-11-03 11:26:52.037940','#34A4345',1),(23,NULL,NULL,'2020-11-03 11:26:58.715077','#34A4345',1),(24,NULL,NULL,'2020-11-03 11:27:04.052532','#34A4345',1),(25,NULL,NULL,'2020-11-03 11:27:32.992988','#34A4343',1),(26,NULL,NULL,'2020-11-03 11:27:38.242515','#34A4343',1),(27,NULL,NULL,'2020-11-03 11:27:44.566420','#34A4343',1),(28,NULL,NULL,'2020-11-03 11:27:49.658577','#34A4343',1),(31,NULL,NULL,'2020-11-07 05:21:25.129935','#34A4344',1),(44,NULL,NULL,'2020-11-14 10:56:45.756171','#34A4344',1),(45,NULL,NULL,'2020-11-14 10:59:00.920074',NULL,1),(48,NULL,NULL,'2020-11-18 07:32:12.659348','VSJEGHQR1W',1),(49,NULL,NULL,'2020-11-18 07:35:30.839221','UO0PM7G2NB',1),(50,NULL,NULL,'2020-11-30 06:09:06.794342',NULL,1),(51,NULL,NULL,'2020-11-30 06:10:43.928557',NULL,1),(52,NULL,NULL,'2020-11-30 06:14:03.969182',NULL,1),(54,NULL,NULL,'2020-11-30 06:31:29.031435',NULL,3),(57,NULL,NULL,'2020-11-30 06:41:12.377223',NULL,4),(59,NULL,NULL,'2020-11-30 06:41:37.404012',NULL,4),(65,NULL,NULL,'2020-12-19 13:28:22.647180',NULL,1),(67,NULL,NULL,'2020-12-20 07:49:32.417362',NULL,3),(71,NULL,NULL,'2020-12-20 07:53:40.072117',NULL,3),(73,NULL,NULL,'2020-12-25 09:01:33.333983',NULL,3),(81,NULL,NULL,'2020-12-27 07:04:46.417349',NULL,3),(82,NULL,NULL,'2020-12-27 07:06:12.556606',NULL,3),(83,NULL,NULL,'2020-12-27 07:06:24.127659',NULL,3),(84,NULL,NULL,'2020-12-27 07:07:28.173257',NULL,3),(85,NULL,NULL,'2020-12-27 07:09:36.545555',NULL,3),(86,NULL,NULL,'2020-12-27 07:12:02.688063',NULL,3),(87,NULL,NULL,'2020-12-27 07:57:09.608697',NULL,3),(88,NULL,NULL,'2020-12-27 08:18:35.797769',NULL,3),(93,NULL,NULL,'2021-01-01 09:27:49.978204',NULL,3),(95,NULL,NULL,'2021-01-08 11:30:21.320265',NULL,3),(98,NULL,NULL,'2021-01-11 10:39:47.126810',NULL,3),(100,NULL,NULL,'2021-01-17 07:01:55.600497',NULL,3),(105,NULL,NULL,'2021-01-26 09:58:22.238037',NULL,3),(106,NULL,NULL,'2021-01-26 09:58:40.493985',NULL,3),(107,NULL,NULL,'2021-01-26 10:12:19.384607',NULL,3),(108,NULL,NULL,'2021-01-26 10:12:42.037097',NULL,3),(109,NULL,NULL,'2021-01-26 10:13:41.820018',NULL,3),(110,NULL,NULL,'2021-01-26 10:38:29.247989',NULL,3),(113,NULL,NULL,'2021-02-07 18:19:26.554053',NULL,3),(115,NULL,NULL,'2021-02-07 18:23:03.857590',NULL,3),(116,NULL,NULL,'2021-02-25 05:56:48.141694',NULL,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,54),(54,1,55),(55,1,56),(56,1,58),(57,1,59),(58,1,60),(59,1,61),(60,1,62),(61,1,63),(62,1,64),(63,1,65),(64,1,66),(65,1,67),(66,1,68),(67,1,69),(68,1,70),(69,1,71),(70,1,72),(71,1,73),(72,1,74),(73,1,75),(74,1,76),(75,1,77),(76,1,78),(77,1,79),(78,1,80),(79,1,81),(80,1,82),(81,1,83),(82,1,84),(83,1,85),(84,1,86),(85,1,87),(86,1,88),(87,1,89),(88,1,90),(89,1,91),(90,1,92),(91,1,93),(92,1,94),(93,1,95),(94,1,96),(95,1,97),(96,1,98),(97,1,99),(98,1,100),(99,1,101),(100,1,102),(101,1,103),(102,1,104),(103,1,105),(104,1,106),(105,1,107),(106,1,108),(107,1,109),(108,1,110),(109,1,111),(110,1,112),(111,1,113),(112,1,114),(113,1,115),(114,1,116),(115,1,117),(116,1,118),(117,1,119),(118,1,120),(119,1,121),(120,1,122),(121,1,123),(122,1,124),(123,1,125),(124,1,126),(125,1,127),(126,1,128),(127,1,129),(128,1,130),(129,1,131),(130,1,132),(131,1,133),(132,1,134),(133,1,135),(134,1,136),(135,1,137),(136,1,138),(137,1,139),(138,1,140),(139,1,141),(140,1,142),(141,1,143),(142,1,144),(143,1,145),(144,1,146),(145,1,147),(146,1,148);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$gqV9cfCGBWv3$1x6RNppIUioALPvaIQOCmNMmDnXKahx8guNTtMF+udY=','2021-01-26 10:32:28.115958',1,'vidumini','','','heartyvds@gmail.com',1,1,'2020-11-03 08:42:17.561793'),(2,'pbkdf2_sha256$180000$GUmkMvebSOgT$JXsXt9g5rTAzL+ico/4+jfiRuB4Sn1wJRHuU9/19nGw=',NULL,0,'dilshan','','','',0,1,'2020-11-03 08:44:04.624386'),(3,'pbkdf2_sha256$180000$AbKMtP3MPr2e$HxCsdjBgygxT0WkyxZr2wFkQTqzmPoyWz2dysYKb9M8=',NULL,0,'asanka','','','',0,1,'2020-11-03 08:44:40.088031'),(4,'pbkdf2_sha256$180000$OiE1it8Tku88$H+lZTgH8ZVk6dtWc0IXcxAbx/v5d0mDCkSpXQVFa9Qw=',NULL,0,'numin','','','',0,1,'2020-11-03 08:44:52.696353'),(5,'pbkdf2_sha256$180000$l3O1DTqdaA6V$ASZXpyeKrH16HWvjip/jWHJv29PX3R8Ynydiaw18PGs=',NULL,0,'user1','','','',0,1,'2020-12-11 10:44:50.204317'),(6,'pbkdf2_sha256$180000$HnsAWJEk4cvS$BJc22nbioB9XwQXDbtqAoVipwONm9pxToGQ5e5TjWts=',NULL,0,'user2','','','',0,1,'2020-12-11 10:45:04.428827'),(7,'pbkdf2_sha256$180000$2f9QKsIomnXb$2/sQS+9Z7tCdOVDwT3u6jlqKlAt+gd994jQvfifrBD8=',NULL,0,'user3','','','',0,1,'2020-12-11 10:45:18.426688'),(8,'pbkdf2_sha256$180000$SRI0rOYT7T2C$Fdffm4Mf6xl6UGkw05htzs7C5HGinIsSPG4y/htgwyk=',NULL,0,'user4','','','',0,1,'2020-12-11 10:45:33.633521'),(9,'pbkdf2_sha256$180000$kHRVMycVxXjw$EOkDsbxXpPt1zSAPHiACle2kQzxAqqoIvrPfxSVNXOY=',NULL,0,'user5','','','',0,1,'2020-12-11 10:45:50.512222'),(10,'pbkdf2_sha256$180000$nTRdYnNXBnn7$q5cA5ve99/4g0efnIL2iyxGOVaYk814xFYZGJ/oMnag=',NULL,0,'user6','','','',0,1,'2020-12-11 10:46:04.466307'),(11,'pbkdf2_sha256$180000$9nvneinTBlYw$dzD5d2q7ptlKKDHdwXziDXhEizGMh7KNj1LFY2d9z4k=',NULL,0,'user7','','','',0,1,'2020-12-12 07:01:16.485760'),(12,'pbkdf2_sha256$180000$UymQlbdrMD9m$UHkiQJ84cs0iAcdSQa6N00rI2KoumiDrieUB47INHlM=',NULL,0,'user8','','','',0,1,'2020-12-12 07:01:28.827724');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(2,3,2),(3,4,2),(4,5,2),(5,6,2),(6,7,2),(7,8,2),(8,9,2),(9,10,2),(10,11,1),(11,12,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribution`
--

LOCK TABLES `contribution` WRITE;
/*!40000 ALTER TABLE `contribution` DISABLE KEYS */;
INSERT INTO `contribution` VALUES (1,'2020-11-30 06:06:47.463606',1,1),(2,'2020-11-30 06:09:06.859953',2,1),(3,'2020-11-30 06:10:44.005745',2,1),(4,'2020-11-30 06:14:04.055772',3,1),(5,'2020-11-30 06:14:31.802516',5,1),(6,'2020-11-30 06:31:29.120967',3,3),(7,'2020-11-30 06:32:03.753699',5,3),(8,'2020-11-30 06:33:17.549899',2,1),(9,'2020-11-30 06:35:02.124832',2,3),(10,'2020-11-30 06:35:45.125378',5,3),(11,'2020-11-30 06:41:12.465567',3,4),(12,'2020-11-30 06:41:19.621798',5,4),(13,'2020-11-30 06:41:37.503876',3,4),(14,'2020-11-30 06:45:29.524073',5,4),(15,'2020-11-30 06:45:35.767598',5,4),(16,'2020-11-30 06:46:24.866530',2,4),(17,'2020-11-30 10:21:03.979045',5,4),(18,'2020-12-18 03:18:18.274087',5,1),(19,'2020-12-18 03:18:39.069576',5,1),(20,'2020-12-19 13:28:22.735867',3,1),(21,'2020-12-19 13:29:07.281840',5,1),(22,'2020-12-20 07:49:32.481811',3,3),(23,'2020-12-20 07:49:52.689478',5,3),(24,'2020-12-20 07:50:07.625348',5,3),(25,'2020-12-20 07:50:18.244587',5,3),(26,'2020-12-20 07:52:21.982763',2,3),(27,'2020-12-20 07:53:40.151973',3,3),(28,'2020-12-21 09:30:47.146638',2,1),(29,'2020-12-21 09:39:59.402919',2,1),(30,'2020-12-21 09:40:08.969048',2,1),(31,'2020-12-21 09:40:34.032466',2,1),(32,'2020-12-21 09:44:46.336728',2,1),(33,'2020-12-21 09:46:22.174368',2,1),(34,'2020-12-21 09:46:33.329365',2,1),(35,'2020-12-21 09:49:00.540000',2,1),(36,'2020-12-21 09:56:14.703367',2,4),(37,'2020-12-21 09:56:36.393193',2,4),(38,'2020-12-21 09:56:45.220467',2,4),(39,'2020-12-21 09:57:49.562820',2,4),(40,'2020-12-21 09:58:26.191681',2,4),(41,'2020-12-21 10:09:56.545631',2,4),(42,'2020-12-21 10:10:53.356910',2,4),(43,'2020-12-21 10:13:14.053136',2,4),(44,'2020-12-21 10:13:14.255293',7,4),(45,'2020-12-21 10:14:11.857640',2,4),(46,'2020-12-21 10:14:12.266443',7,4),(47,'2020-12-21 10:14:12.456497',7,4),(48,'2020-12-21 10:24:08.646158',2,4),(49,'2020-12-21 10:24:08.936287',7,4),(50,'2020-12-21 10:24:09.525142',7,4),(51,'2020-12-21 10:39:19.445817',5,3),(52,'2020-12-22 09:07:23.586400',2,4),(53,'2020-12-22 09:07:32.573779',2,4),(54,'2020-12-22 09:10:27.157983',2,4),(55,'2020-12-22 09:11:23.851385',2,4),(56,'2020-12-22 09:11:32.450607',2,4),(57,'2020-12-22 09:11:42.871946',2,4),(58,'2020-12-22 09:12:26.211370',2,4),(59,'2020-12-22 09:12:34.157562',2,4),(60,'2020-12-22 10:50:09.700423',2,3),(61,'2020-12-22 10:51:08.103967',2,3),(62,'2020-12-22 10:51:53.051338',2,3),(63,'2020-12-22 11:03:37.410319',2,3),(64,'2020-12-22 11:03:53.859959',2,3),(65,'2020-12-22 11:04:58.587060',2,3),(66,'2020-12-22 11:06:29.373868',2,3),(67,'2020-12-22 11:22:00.855992',2,3),(68,'2020-12-22 11:22:44.354967',2,3),(69,'2020-12-22 11:22:59.722853',2,3),(70,'2020-12-22 11:23:44.128723',2,3),(71,'2020-12-22 11:23:44.771541',7,3),(72,'2020-12-22 11:23:44.971611',7,3),(73,'2020-12-22 11:26:15.983806',2,3),(74,'2020-12-22 11:26:16.238954',7,3),(75,'2020-12-22 11:26:16.606617',7,3),(76,'2020-12-22 11:26:16.785322',7,3),(77,'2020-12-25 09:01:33.500926',3,3),(78,'2020-12-25 10:33:51.417549',5,3),(79,'2020-12-25 10:34:17.669219',5,3),(80,'2020-12-25 10:34:34.865000',5,3),(81,'2020-12-25 10:36:07.003111',5,3),(82,'2020-12-25 10:36:07.225369',5,3),(83,'2020-12-25 10:36:12.998599',5,3),(84,'2020-12-27 06:08:50.144733',5,1),(85,'2020-12-27 07:04:46.574344',3,3),(86,'2020-12-27 07:06:12.634575',3,3),(87,'2020-12-27 07:06:24.250267',3,3),(88,'2020-12-27 07:07:28.286382',3,3),(89,'2020-12-27 07:09:36.611714',3,3),(90,'2020-12-27 07:12:02.786835',3,3),(91,'2020-12-27 07:57:09.700144',3,3),(92,'2020-12-27 08:18:35.897022',3,3),(93,'2020-12-28 06:51:45.143803',7,12),(94,'2020-12-28 06:52:21.212863',7,4),(95,'2020-12-28 07:38:57.197307',2,3),(96,'2020-12-28 07:38:57.398697',7,3),(97,'2020-12-28 07:38:57.686721',7,3),(98,'2020-12-28 07:41:19.468992',6,3),(99,'2020-12-29 07:18:18.556983',2,4),(100,'2020-12-29 07:18:19.086019',7,4),(101,'2020-12-29 07:18:19.290902',7,4),(102,'2020-12-29 07:20:22.470342',2,12),(103,'2020-12-29 07:35:50.091755',7,12),(104,'2020-12-29 08:50:25.458824',2,3),(105,'2020-12-29 08:50:25.648852',7,3),(106,'2020-12-29 08:50:25.858859',7,3),(107,'2020-12-29 08:53:54.512601',7,4),(108,'2020-12-29 09:02:52.284126',6,3),(109,'2020-12-30 06:51:26.118110',7,4),(110,'2020-12-31 05:03:16.515689',7,4),(111,'2020-12-31 05:10:01.985125',7,4),(112,'2020-12-31 05:16:05.646931',7,4),(113,'2020-12-31 05:19:12.348112',7,4),(114,'2020-12-31 05:19:36.076496',7,4),(115,'2020-12-31 05:20:23.035130',7,4),(116,'2020-12-31 05:20:53.804950',7,4),(117,'2020-12-31 05:21:22.356970',7,4),(118,'2021-01-01 09:12:53.888233',2,3),(119,'2021-01-01 09:12:54.337869',7,3),(120,'2021-01-01 09:12:54.709916',7,3),(121,'2021-01-01 09:22:16.590794',6,3),(122,'2021-01-01 09:23:33.523369',5,3),(123,'2021-01-01 09:27:50.066704',3,3),(124,'2021-01-03 14:27:48.326476',5,3),(125,'2021-01-08 11:30:21.476840',3,3),(126,'2021-01-11 10:12:59.052062',2,3),(127,'2021-01-11 10:12:59.768964',7,3),(128,'2021-01-11 10:12:59.993430',7,3),(129,'2021-01-11 10:16:20.994118',7,4),(130,'2021-01-11 10:22:20.965924',7,4),(131,'2021-01-11 10:23:50.020542',7,4),(132,'2021-01-11 10:31:38.469694',7,4),(133,'2021-01-11 10:37:31.606884',5,3),(134,'2021-01-11 10:39:11.545413',6,3),(135,'2021-01-11 10:39:47.237766',3,3),(136,'2021-01-11 10:47:29.993575',7,4),(137,'2021-01-11 10:50:30.454772',7,4),(138,'2021-01-11 10:52:41.633885',2,3),(139,'2021-01-11 10:53:07.253704',7,4),(140,'2021-01-12 07:57:35.286008',5,3),(141,'2021-01-12 09:41:40.640756',7,4),(142,'2021-01-12 10:31:26.070798',7,4),(143,'2021-01-17 06:52:31.701468',2,3),(144,'2021-01-17 06:52:32.147229',7,3),(145,'2021-01-17 06:52:32.367655',7,3),(146,'2021-01-17 06:54:33.259586',7,4),(147,'2021-01-17 07:01:55.699490',3,3),(148,'2021-01-17 07:02:12.759984',5,3),(149,'2021-01-17 07:03:41.181426',6,3),(150,'2021-01-17 07:04:02.613425',6,3),(151,'2021-01-17 07:06:48.318658',5,3),(152,'2021-01-26 09:58:22.490250',3,3),(153,'2021-01-26 09:58:40.582892',3,3),(154,'2021-01-26 10:12:19.486118',3,3),(155,'2021-01-26 10:12:42.203861',3,3),(156,'2021-01-26 10:13:41.934008',3,3),(157,'2021-01-26 10:38:29.349099',3,3),(158,'2021-01-27 11:49:09.021061',2,3),(159,'2021-01-27 11:49:09.319841',7,3),(160,'2021-01-27 11:50:24.173318',5,3),(161,'2021-01-27 11:59:51.966350',5,3),(162,'2021-02-07 18:19:26.835078',3,3),(163,'2021-02-07 18:21:15.208246',5,3),(164,'2021-02-07 18:23:03.957309',3,3),(165,'2021-02-25 05:56:48.305368',3,3),(166,'2021-02-25 05:57:56.703868',5,3);
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
INSERT INTO `custom_user` VALUES (1,1,'#3456',1,'1996-01-11',0,'Ampegama','0770273653',NULL,NULL,0,3,NULL),(2,1,'@4578',1,'1993-02-05',0,'Hikkaduwa','0718812099',NULL,NULL,1,1,NULL),(3,1,'#4589',1,'1993-04-20',0,'Mitiyagoda','0715634785',NULL,NULL,1,2,NULL),(4,1,'@4568',1,'1993-05-03',0,'Batapola','0717852635',NULL,NULL,2,2,NULL),(5,1,'@3245',1,'1992-06-09',0,'Baddegama','0714562535',NULL,NULL,2,2,NULL),(6,1,'@4354',1,'1993-08-07',0,'Batapola','0714893562',NULL,NULL,2,2,NULL),(7,1,'@5487',1,'1993-02-03',0,'Hikkaduwa','0725689752',NULL,NULL,2,2,NULL),(8,1,'@3444',1,'1995-02-12',0,'Panadura','0715678952',NULL,NULL,1,2,NULL),(9,1,'@6745',1,'1994-06-15',0,'Gampaha','0725876953',NULL,NULL,1,2,NULL),(10,1,'@2222',1,'1996-02-19',0,'Kalutara','0728952423',NULL,NULL,1,2,NULL),(11,1,'@5678',1,'1996-08-08',0,'Wadduwa','0715647382',NULL,NULL,1,1,NULL),(12,1,'@3452',1,'1995-06-23',0,'Baddegama','0714858549',NULL,NULL,1,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Dish 01',2,'2020-09-25 00:00:00.000000',NULL,2,NULL),(2,'Dish 02',2,'2020-09-20 00:00:00.000000',NULL,1,NULL),(3,'Dish 03',2,'2020-08-20 00:00:00.000000',NULL,1,NULL),(4,'Dish 04',2,'2020-09-10 00:00:00.000000',NULL,3,NULL),(5,'Dish 07',1,'2020-11-14 15:46:17.780882','2020-11-14 15:46:17.781331',1,NULL),(6,'Dish 08',2,'2020-11-18 13:18:47.373097','2020-11-18 13:18:47.373178',2,NULL),(7,'Dish 09',2,'2020-11-18 13:19:45.923076','2020-11-18 13:19:45.923177',2,NULL),(8,'Dish 10',2,'2020-11-18 00:00:00.000000',NULL,2,NULL),(9,'Dish 11',1,'2021-01-11 10:16:56.768283','2021-01-11 10:16:56.768340',4,NULL),(10,'Dish 12',1,'2021-01-11 10:22:20.621883','2021-01-11 10:22:20.621951',4,NULL),(11,'Dish 13',1,'2021-01-11 10:23:49.799375','2021-01-11 10:23:49.799436',4,NULL),(12,'Dish 14',1,'2021-01-11 10:47:29.704264','2021-01-11 10:47:29.704345',4,NULL),(13,'Dish 15',1,'2021-01-11 10:50:30.192394','2021-01-11 10:50:30.192470',4,NULL),(14,'Dish 16',1,'2021-01-11 10:53:06.966179','2021-01-11 10:53:06.966240',4,NULL),(16,'Dish 17',2,'2021-01-12 10:31:25.620462','2021-01-12 10:31:25.620523',4,NULL),(17,'Dish 23',2,'2021-01-17 06:54:32.929617','2021-01-17 06:54:32.929709',4,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-11-03 08:44:04.803530','2','dilshan',1,'[{\"added\": {}}]',3,1),(2,'2020-11-03 08:44:40.278904','3','asanka',1,'[{\"added\": {}}]',3,1),(3,'2020-11-03 08:44:52.906856','4','numin',1,'[{\"added\": {}}]',3,1),(4,'2020-11-03 08:45:30.270385','1','customer',1,'[{\"added\": {}}]',2,1),(5,'2020-11-03 08:45:42.502752','2','owner',1,'[{\"added\": {}}]',2,1),(6,'2020-12-11 10:44:50.388671','5','user1',1,'[{\"added\": {}}]',3,1),(7,'2020-12-11 10:45:04.612489','6','user2',1,'[{\"added\": {}}]',3,1),(8,'2020-12-11 10:45:18.640743','7','user3',1,'[{\"added\": {}}]',3,1),(9,'2020-12-11 10:45:33.823418','8','user4',1,'[{\"added\": {}}]',3,1),(10,'2020-12-11 10:45:50.691974','9','user5',1,'[{\"added\": {}}]',3,1),(11,'2020-12-11 10:46:04.658168','10','user6',1,'[{\"added\": {}}]',3,1),(12,'2020-12-12 07:01:16.677077','11','user7',1,'[{\"added\": {}}]',3,1),(13,'2020-12-12 07:01:29.022041','12','user8',1,'[{\"added\": {}}]',3,1),(14,'2021-01-26 10:37:34.649867','1','owner',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',2,1);
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
INSERT INTO `django_session` VALUES ('8qk522lnq1y08vlcrg7ba33ay4cz3zg1','ZDY1M2UwMjBlMDg4YjNiMjFmMjQzMmRiYWQ4MmRlOGYzZTkxZjE5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDdlZTQ0NjMwNjNjMTRmYzc1ZGJkNjY0ODYxMGI2NDNiOTg3MTIzIn0=','2021-02-09 10:32:28.244767'),('e5yo56qdlph0z97fb5i639pi8s20o6nz','ZDY1M2UwMjBlMDg4YjNiMjFmMjQzMmRiYWQ4MmRlOGYzZTkxZjE5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDdlZTQ0NjMwNjNjMTRmYzc1ZGJkNjY0ODYxMGI2NDNiOTg3MTIzIn0=','2020-11-17 08:43:30.290143'),('nkm595v4pn6dq4j8qensfd7gm40uagqw','ZDY1M2UwMjBlMDg4YjNiMjFmMjQzMmRiYWQ4MmRlOGYzZTkxZjE5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDdlZTQ0NjMwNjNjMTRmYzc1ZGJkNjY0ODYxMGI2NDNiOTg3MTIzIn0=','2020-12-26 07:00:44.289718'),('x36yctke1i3zrse3hk7ep4ktguysq324','ZDY1M2UwMjBlMDg4YjNiMjFmMjQzMmRiYWQ4MmRlOGYzZTkxZjE5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDdlZTQ0NjMwNjNjMTRmYzc1ZGJkNjY0ODYxMGI2NDNiOTg3MTIzIn0=','2020-12-25 10:44:19.820221');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_component`
--

LOCK TABLES `edit_component` WRITE;
/*!40000 ALTER TABLE `edit_component` DISABLE KEYS */;
INSERT INTO `edit_component` VALUES (1,'restaurant name',50),(2,'restaurant phone number',300),(3,'restaurant website',200),(4,'restaurant email',400),(5,'restaurant address',500),(6,'restaurant location',500);
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_history`
--

LOCK TABLES `edit_history` WRITE;
/*!40000 ALTER TABLE `edit_history` DISABLE KEYS */;
INSERT INTO `edit_history` VALUES (1,'ab','ds',1,'2020-12-06 06:18:32.757931','2020-12-06 06:18:32.758006',2),(2,'ab','ds',1,'2020-12-09 09:52:49.543648','2020-12-09 09:52:49.543694',3),(3,'ab','ds',1,'2020-12-09 09:55:35.755691','2020-12-09 09:55:35.755756',3),(6,'ab','ds',2,'2020-12-09 10:13:24.505794','2020-12-09 10:13:24.505875',3),(19,'ab','ds',2,'2020-12-09 10:23:34.498726','2020-12-09 10:23:34.498775',3),(20,'ab','new_ds',2,'2020-12-10 10:10:02.121947','2020-12-10 10:10:02.122159',3),(21,'ab','ds_new_2',1,'2020-12-11 07:44:39.891623','2020-12-11 07:44:39.891672',3),(22,'ab','ds_new_2',2,'2020-12-11 07:45:41.769124','2020-12-11 07:45:41.769188',3),(23,'ab','ds_new_3',1,'2020-12-11 07:47:58.477587','2020-12-16 13:17:16.124093',3),(33,'ab','DS Leega',2,'2020-12-26 11:16:21.557463','2020-12-26 11:16:21.557533',3),(34,'ab','DS Lee',2,'2020-12-26 11:16:31.794463','2020-12-26 11:16:31.794520',3),(35,'ds_new_3','DS New_3',2,'2020-12-28 09:15:35.712490','2020-12-28 09:15:35.712567',2),(36,'Levonra','Levonro',2,'2020-12-29 08:55:35.205469','2020-12-29 08:55:35.205516',3),(37,'Levonro','Levonra',1,'2020-12-29 08:58:24.604633','2020-12-29 08:58:24.604676',3),(38,'Levonro','Levonra',2,'2020-12-29 08:58:57.407956','2020-12-29 08:58:57.407999',12),(39,'Levonra','Levonro',2,'2020-12-30 06:38:33.213598','2020-12-30 06:38:33.213642',12),(40,'Levonro','Levonra',2,'2020-12-30 06:40:55.867569','2020-12-30 06:42:06.007763',10),(41,'Lumino','Lumia',2,'2021-01-01 09:17:45.866420','2021-01-01 09:19:43.886499',10),(42,'Amrith','Amrithaa',2,'2021-01-11 10:35:33.769760','2021-01-11 10:36:16.126411',10),(43,'Amrith','Amrithaa',2,'2021-01-11 10:36:22.102325','2021-01-11 10:36:43.639949',10),(44,'Pedlar Street, Galle','Red Rose Street, Galle',1,'2021-01-17 06:58:50.424830','2021-01-17 06:58:50.424978',4),(45,'Pedlar Street, Galle','Savick',2,'2021-01-17 07:00:52.457978','2021-01-17 07:01:07.552464',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,4,4,4,1,'2020-11-03 11:20:36.106063','2020-11-03 11:20:36.106106',23),(2,3,4,4,1,'2020-11-03 11:22:10.398559','2020-11-03 11:22:10.398618',23),(3,3,5,4,1,'2020-11-03 11:22:15.886712','2020-11-03 11:22:15.886779',23),(4,3,5,5,1,'2020-11-03 11:22:21.065307','2020-11-03 11:22:21.065368',23),(5,3,5,5,1,'2020-11-03 11:22:56.385389','2020-11-03 11:22:56.385434',21),(6,3,5,5,1,'2020-11-03 11:23:06.642665','2020-11-03 11:23:06.642736',21),(7,5,5,5,1,'2020-11-03 11:23:13.175456','2020-11-03 11:23:13.175527',21),(8,5,4,5,1,'2020-11-03 11:23:17.045802','2020-11-03 11:23:17.045873',21),(9,5,4,4,1,'2020-11-03 11:23:21.860139','2020-11-03 11:23:21.860220',21),(10,4,4,4,1,'2020-11-03 11:23:26.452858','2020-11-03 11:23:26.452926',21),(11,4,4,4,1,'2020-11-03 11:23:41.816643','2020-11-03 11:23:41.816686',22),(12,5,4,4,1,'2020-11-03 11:23:47.345648','2020-11-03 11:23:47.345708',22),(13,5,4,5,1,'2020-11-03 11:23:51.889255','2020-11-03 11:23:51.889324',22),(14,5,5,5,1,'2020-11-03 11:23:57.445968','2020-11-03 11:23:57.446012',22),(15,5,5,5,1,'2020-11-03 11:24:03.153511','2020-11-03 11:24:03.153573',22),(16,4,5,5,1,'2020-11-03 11:24:13.952213','2020-11-03 11:24:13.952276',22),(17,4,5,4,1,'2020-11-03 11:24:19.136286','2020-11-03 11:24:19.136346',22),(18,4,5,4,1,'2020-11-03 11:24:43.727007','2020-11-03 11:24:43.727050',22),(19,4,4,4,1,'2020-11-03 11:24:52.174292','2020-11-03 11:24:52.174350',22),(20,3,4,5,1,'2020-11-03 11:26:14.428942','2020-11-03 11:26:14.429000',22),(21,3,3,5,1,'2020-11-03 11:26:20.351317','2020-11-03 11:26:20.351386',22),(22,3,3,5,1,'2020-11-03 11:26:51.894398','2020-11-03 11:26:51.894463',23),(23,3,3,3,1,'2020-11-03 11:26:58.575715','2020-11-03 11:26:58.575774',23),(24,3,4,3,1,'2020-11-03 11:27:03.898585','2020-11-03 11:27:03.898630',23),(25,2,4,3,1,'2020-11-03 11:27:32.853304','2020-11-03 11:27:32.853360',21),(26,2,2,3,1,'2020-11-03 11:27:38.121003','2020-11-03 11:27:38.121076',21),(27,2,2,3,1,'2020-11-03 11:27:44.495887','2020-11-03 11:27:44.495951',21),(28,2,4,3,1,'2020-11-03 11:27:49.541177','2020-11-03 11:27:49.541219',21),(29,4,4,3,1,'2020-11-05 11:24:15.675372','2020-11-05 11:24:15.675415',22),(30,3,3,3,1,'2020-11-07 05:19:43.521024','2020-11-07 05:19:43.521121',22),(31,2,3,3,1,'2020-11-07 05:21:24.895263','2020-11-07 05:21:24.895334',22),(32,2,3,4,0,'2020-11-11 13:23:37.506163','2020-11-11 13:23:37.506204',23),(33,4,5,4,0,'2020-11-11 13:24:39.109212','2020-11-11 13:24:39.109252',23),(34,2,4,5,0,'2020-11-11 13:25:07.063976','2020-11-11 13:25:07.064014',23),(35,2,5,2,0,'2020-11-11 13:25:38.158656','2020-11-11 13:25:38.158694',23),(36,2,2,3,0,'2020-11-11 13:25:55.722282','2020-11-11 13:25:55.722322',23),(37,5,5,5,0,'2020-11-11 13:26:31.564839','2020-11-11 13:26:31.564898',23),(38,5,5,5,0,'2020-11-11 13:27:00.323876','2020-11-11 13:27:00.323931',23),(39,4,5,5,0,'2020-11-11 13:27:12.344917','2020-11-11 13:27:12.344958',23),(40,4,5,4,0,'2020-11-11 13:27:46.156917','2020-11-11 13:27:46.156978',1),(41,2,2,2,0,'2020-11-12 10:31:51.023006','2020-11-12 10:31:51.023392',2),(42,2,3,4,0,'2020-11-12 17:50:06.171162','2020-11-12 17:50:06.171203',1),(43,5,5,5,0,'2020-11-13 16:09:52.306703','2020-11-13 16:09:52.306748',79),(44,3,3,3,1,'2020-11-14 10:56:45.568831','2020-11-14 10:56:45.568871',22),(45,2,3,3,0,'2020-11-14 10:59:00.838826','2020-11-14 10:59:00.838866',22),(46,5,5,5,0,'2020-11-14 10:59:57.673184','2020-11-14 10:59:57.673242',21),(47,5,5,5,0,'2020-11-14 15:59:10.459793','2020-11-14 15:59:10.459831',3),(48,2,3,3,1,'2020-11-18 07:32:12.571992','2020-11-18 07:32:12.572055',3),(49,3,5,5,1,'2020-11-18 07:35:30.760989','2020-11-18 07:35:30.761029',3),(50,2,3,3,0,'2020-11-30 06:09:06.731140','2020-11-30 06:09:06.731180',79),(51,3,3,3,0,'2020-11-30 06:10:43.853888','2020-11-30 06:10:43.853929',79),(52,3,3,3,0,'2020-11-30 06:14:03.891270','2020-11-30 06:14:03.891349',79),(53,3,4,3,0,'2020-11-30 06:14:31.633367','2020-11-30 06:14:31.633409',79),(54,5,4,5,0,'2020-11-30 06:31:28.936429','2020-11-30 06:31:28.936481',21),(55,5,4,4,0,'2020-11-30 06:32:03.549811','2020-11-30 06:32:03.549850',21),(56,5,4,5,0,'2020-11-30 06:35:44.904812','2020-11-30 06:35:44.904851',22),(57,2,4,3,0,'2020-11-30 06:41:12.289253','2020-11-30 06:41:12.289301',22),(58,4,4,5,0,'2020-11-30 06:41:19.446294','2020-11-30 06:41:19.446357',22),(59,3,4,5,0,'2020-11-30 06:41:37.314809','2020-11-30 06:41:37.314869',23),(60,3,4,4,0,'2020-11-30 06:45:29.382484','2020-11-30 06:45:29.382554',23),(61,3,4,2,0,'2020-11-30 06:45:35.615685','2020-11-30 06:45:35.615726',23),(62,3,4,3,0,'2020-11-30 10:21:03.809135','2020-11-30 10:21:03.809201',9),(63,5,5,5,0,'2020-12-18 03:18:18.008312','2020-12-18 03:18:18.008358',22),(64,1,1,1,0,'2020-12-18 03:18:38.899940','2020-12-18 03:18:38.900001',22),(65,3,4,3,0,'2020-12-19 13:28:22.392397','2020-12-19 13:28:22.392461',21),(66,3,4,4,0,'2020-12-19 13:29:06.940267','2020-12-19 13:29:06.940312',21),(67,2,4,4,0,'2020-12-20 07:49:32.358120','2020-12-20 07:49:32.358176',21),(68,2,4,4,0,'2020-12-20 07:49:52.465359','2020-12-20 07:49:52.465400',21),(69,2,2,4,0,'2020-12-20 07:50:07.342185','2020-12-20 07:50:07.342223',21),(70,3,2,4,0,'2020-12-20 07:50:18.087413','2020-12-20 07:50:18.087470',21),(71,5,5,5,0,'2020-12-20 07:53:40.005958','2020-12-20 07:53:40.006021',87),(72,4,3,5,0,'2020-12-21 10:39:19.233681','2020-12-21 10:39:19.233722',92),(73,2,4,2,0,'2020-12-25 09:01:33.243115','2020-12-25 09:01:33.243158',87),(74,5,4,5,0,'2020-12-25 10:33:51.225672','2020-12-25 10:33:51.225712',23),(75,5,5,5,0,'2020-12-25 10:34:17.551669','2020-12-25 10:34:17.551730',23),(76,5,5,5,0,'2020-12-25 10:34:34.693562','2020-12-25 10:34:34.693607',23),(77,5,5,5,0,'2020-12-25 10:36:06.759478','2020-12-25 10:36:06.759520',23),(78,5,5,5,0,'2020-12-25 10:36:07.024106','2020-12-25 10:36:07.024171',23),(79,5,5,5,0,'2020-12-25 10:36:12.832436','2020-12-25 10:36:12.832503',23),(80,4,4,3,0,'2020-12-27 06:08:49.495933','2020-12-27 06:08:49.495978',23),(81,2,4,3,0,'2020-12-27 07:04:46.266889','2020-12-27 07:04:46.266959',3),(82,2,5,4,0,'2020-12-27 07:06:12.486594','2020-12-27 07:06:12.486645',3),(83,2,5,4,0,'2020-12-27 07:06:24.024071','2020-12-27 07:06:24.024113',3),(84,3,4,3,0,'2020-12-27 07:07:28.088674','2020-12-27 07:07:28.088738',3),(85,2,5,4,0,'2020-12-27 07:09:36.448879','2020-12-27 07:09:36.448943',3),(86,3,3,3,0,'2020-12-27 07:12:02.599678','2020-12-27 07:12:02.599724',3),(87,2,4,3,0,'2020-12-27 07:57:09.467047','2020-12-27 07:57:09.467128',92),(88,4,3,5,0,'2020-12-27 08:18:35.735384','2020-12-27 08:18:35.735451',5),(89,3,3,4,1,'2020-12-28 07:41:19.292527','2020-12-28 07:41:19.292596',96),(90,3,3,2,1,'2020-12-29 09:02:52.091342','2020-12-29 09:02:52.091384',100),(91,3,4,5,1,'2021-01-01 09:22:16.345347','2021-01-01 09:22:16.345411',101),(92,3,4,3,0,'2021-01-01 09:23:33.328379','2021-01-01 09:23:33.328434',101),(93,2,3,4,0,'2021-01-01 09:27:49.879170','2021-01-01 09:27:49.879239',101),(94,3,4,5,0,'2021-01-03 14:27:48.093560','2021-01-03 14:27:48.093607',4),(95,3,4,4,0,'2021-01-08 11:30:21.245176','2021-01-08 11:30:21.245222',5),(96,3,4,4,0,'2021-01-11 10:37:31.334787','2021-01-11 10:37:31.334836',102),(97,4,4,3,1,'2021-01-11 10:39:11.370311','2021-01-11 10:39:11.370371',102),(98,4,4,4,0,'2021-01-11 10:39:46.997962','2021-01-11 10:39:46.998003',102),(99,3,4,4,0,'2021-01-12 07:57:35.068196','2021-01-12 07:57:35.068262',4),(100,3,4,3,0,'2021-01-17 07:01:55.512251','2021-01-17 07:01:55.512299',104),(101,3,4,4,0,'2021-01-17 07:02:12.568292','2021-01-17 07:02:12.568336',104),(102,4,4,4,1,'2021-01-17 07:03:41.034031','2021-01-17 07:03:41.034075',104),(103,4,4,4,1,'2021-01-17 07:04:02.384334','2021-01-17 07:04:02.384378',104),(104,4,3,4,0,'2021-01-17 07:06:48.151420','2021-01-17 07:06:48.151464',104),(105,3,3,3,0,'2021-01-26 09:58:22.103945','2021-01-26 09:58:22.104006',5),(106,3,3,3,0,'2021-01-26 09:58:40.401998','2021-01-26 09:58:40.402061',5),(107,3,3,3,0,'2021-01-26 10:12:19.279312','2021-01-26 10:12:19.279382',5),(108,3,3,3,0,'2021-01-26 10:12:41.872783','2021-01-26 10:12:41.872823',5),(109,3,3,3,0,'2021-01-26 10:13:41.716140','2021-01-26 10:13:41.716183',5),(110,3,3,3,0,'2021-01-26 10:38:29.163999','2021-01-26 10:38:29.164043',4),(111,3,4,3,0,'2021-01-27 11:50:24.025436','2021-01-27 11:50:24.025477',105),(112,4,4,4,0,'2021-01-27 11:59:51.802205','2021-01-27 11:59:51.802266',102),(113,3,3,3,0,'2021-02-07 18:19:26.202048','2021-02-07 18:19:26.202120',92),(114,4,4,4,0,'2021-02-07 18:21:15.010220','2021-02-07 18:21:15.010266',92),(115,3,3,3,0,'2021-02-07 18:23:03.776820','2021-02-07 18:23:03.776889',92),(116,3,4,4,0,'2021-02-25 05:56:48.031731','2021-02-25 05:56:48.031801',87),(117,4,4,4,0,'2021-02-25 05:57:56.550009','2021-02-25 05:57:56.550053',87);
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Unifolanka','Hikkaduwa',123451.1232,434543.5444,'0710273653',0,'8Qb49dLiDgp8O8ju6lsN','2020-07-30 02:42:17.431580','2020-07-30 02:42:17.431656',NULL,1,NULL),(2,'Ted Red','Hikkaduwa',434543.5444,434543.5444,'0710273653',0,'tTGCacqjgLuEEvuWssuu','2020-08-01 02:33:38.225415','2020-08-01 02:33:38.225474',NULL,1,NULL),(3,'Peblo','Ahangama',53.5444,37.5444,'0770273653',0,'6iaKkJwaIX2j6elnlrAd','2020-08-10 14:32:21.658392','2020-08-10 14:32:21.658456',NULL,1,NULL),(4,'Happy H','Galle',33.5444,37.5444,'0770273653',0,'No8oviPG6KjEwWOHvbAJ','2020-08-10 14:35:01.323349','2020-08-10 14:35:01.323442',NULL,1,NULL),(5,'Sithru','Koggala',33.5444,37.5444,'0770273653',1,'CtQGezbVk7Z8IUkX66qY','2020-08-10 14:35:39.393765','2020-12-29 07:10:43.551202',2,1,NULL),(6,'Lenny Bros','Rathgama',23.5444,77.5444,'0770273653',0,'7wDCf0rRrQnwmIcOEQNn','2020-08-10 14:36:57.467450','2020-08-10 14:36:57.467542',NULL,1,NULL),(7,'Raveena','Unawatuna',23.5444,77.5444,'0770273653',0,'PBkfoIQxU2FSt2RG2s8l','2020-08-19 13:53:42.998373','2020-08-19 13:53:42.998474',NULL,1,NULL),(8,'Test100','baddegama',23.5444,77.5444,'+94718812099',0,'ONEG5eNLwOL9aiP8TveT','2020-10-07 07:55:33.967546','2020-10-07 07:55:33.967660',NULL,1,NULL),(9,'Test400','Hikkaduva',23.5444,77.5444,'+94718812086',0,'oJM8J70ohCx2wA7iwb7z','2020-10-10 18:27:54.920637','2020-10-10 18:27:54.920736',NULL,1,NULL),(10,'test1','Kevin Street, Baddegama',23.5444,77.5444,'0770273653',0,'PE8FrTNTk9VfgPkASQoY','2020-11-03 11:12:32.206410','2020-11-03 11:12:32.206516',NULL,1,NULL),(11,'test2','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'uXRLjkI0qGwqsjqG6Yzj','2020-11-03 11:12:38.269829','2020-11-03 11:12:38.269882',NULL,1,NULL),(12,'test3','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'VfPYyz3wyXbWwCMMqwE1','2020-11-03 11:12:42.963279','2020-11-03 11:12:42.963372',NULL,1,NULL),(13,'test4','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'SIOj4pGiqlqMmZthh64R','2020-11-03 11:12:48.861539','2020-11-03 11:12:48.861624',NULL,1,NULL),(14,'test5','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'nXhJKMXMLOXJG9zSHTtG','2020-11-03 11:12:53.679697','2020-11-03 11:12:53.679754',NULL,1,NULL),(15,'test6','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'FxAnYhANX53BFJymc5S0','2020-11-03 11:12:58.172097','2020-11-03 11:12:58.172182',NULL,1,NULL),(16,'test7','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'7dkNMKsWFL8gj1R0R9Qy','2020-11-03 11:13:02.874810','2020-11-03 11:13:02.874870',NULL,1,NULL),(17,'test8','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'MTo6IyLBaHtp84HgwWJ2','2020-11-03 11:13:07.462744','2020-11-03 11:13:07.462831',NULL,1,NULL),(18,'test9','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'GSIrYnt65kyrPXRNWLVT','2020-11-03 11:13:13.139884','2020-11-03 11:13:13.139963',NULL,1,NULL),(19,'test10','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'4SI7sXkG5pGPZ597ZkZN','2020-11-03 11:13:18.552140','2020-11-03 11:13:18.552197',NULL,1,NULL),(20,'test11','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'BvJY02cpgzyDUHykcqdM','2020-11-03 11:13:22.791468','2020-11-03 11:13:22.791557',NULL,1,NULL),(21,'ds_new_2','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'FDHf7HuELA0x0HkOO9GL','2020-11-03 11:13:27.298192','2020-12-11 07:45:41.777154',NULL,1,NULL),(22,'Bengo','Downhill, Rathgama',23.5444,77.5444,'0770273653',2,'Sx3ehIZtTKPYrzTFKTMr','2020-11-03 11:13:31.616922','2020-12-30 06:57:34.167908',12,1,NULL),(23,'DS New_3','Downhill, Rathgama',6.19343,80.14379,'0770273653',2,'N4Ncmv0SdwtFoZIOQaYG','2020-11-03 11:15:09.819584','2020-12-28 09:15:35.818772',2,1,NULL),(24,'DS Lee','Downhill, Rathgama',6.1688,80.1794,'0770273653',0,'NpH5us3RtlkAOQ48EbeL','2020-11-03 11:15:13.979459','2020-12-26 11:16:31.803008',NULL,1,NULL),(25,'test16','Downhill, Rathgama',23.5444,77.5444,'0770273653',0,'Hxvh0bcTXwY5BCNuQrAu','2020-11-03 11:15:17.892139','2020-11-03 11:15:17.892229',NULL,1,NULL),(79,'Test_new_01','Batapola',23.5444,77.5444,'0770273653',0,'Fdhvlb1Dj5as5ognAym4','2020-11-13 16:09:21.751998','2020-11-13 16:09:21.752111',NULL,1,NULL),(80,'Roma ','2 Ley, Baddegama',23.5444,77.5444,'0718812088',0,'3JJ7YxPDT3TW7r9CwAbB','2020-11-30 06:02:11.681437','2020-11-30 06:02:11.681504',NULL,1,NULL),(81,'Alga','2 Ley, Baddegama',23.5444,77.5444,'0718812088',0,'YidPFLmxqex4WNJNQe8O','2020-11-30 06:03:41.550675','2020-11-30 06:03:41.550739',NULL,1,NULL),(82,'Algaro','2 Ley, Baddegama',23.5444,77.5444,'0718812088',0,'cCca3cpV7i5bEMuDN46G','2020-11-30 06:06:00.854348','2020-11-30 06:06:00.854431',NULL,1,NULL),(83,'Telda','2 Ley, Baddegama',23.5444,77.5444,'0718812088',0,'Cm4hmasiTa5ZPKSKQ7w5','2020-11-30 06:06:47.291701','2020-11-30 06:06:47.291760',NULL,1,NULL),(84,'Trendo','peter, Batapola',23.5444,77.5444,'0715689745',0,'Ku4Kj8R2grcoP1EazPTH','2020-11-30 06:33:17.369802','2020-11-30 06:33:17.369863',NULL,1,NULL),(85,'Amrit','Tel, Batapola',23.5444,77.5444,'0725869785',0,'8cBfLZCUpHeIUSd2Hppq','2020-11-30 06:35:01.948150','2020-11-30 06:35:01.948210',NULL,3,NULL),(86,'Bingo','4th st, Galle',23.5444,77.5444,'0715896434',0,'lmaznWZoBNEq8talnWDN','2020-11-30 06:46:24.710767','2020-11-30 06:46:24.710852',NULL,4,NULL),(87,'Amingo','2nd Lanen Street, Baddegama',23.5444,77.5444,'0718795632',2,'zyt7kSspxtKrG5755F0f','2020-12-20 07:52:21.905286','2020-12-28 06:44:07.515713',12,3,NULL),(88,'test_01_17','Merit Street, Rathgama',23.5444,77.5444,'0770273653',2,'gVJ0e3wQ4gW3QGHcks32','2020-12-21 10:09:56.388786','2020-12-28 06:48:13.435506',12,4,NULL),(89,'test_01_18','Merit Street, Rathgama',23.5444,77.5444,'0770273653',0,'AHUbGjWVR1v5wM72NNhZ','2020-12-21 10:10:53.211230','2020-12-21 10:10:53.211333',NULL,4,NULL),(90,'test_01_19','Merit Street, Rathgama',23.5444,77.5444,'0770273653',0,'VamFuttf4fLyspII0yPq','2020-12-21 10:13:13.920693','2020-12-21 10:13:13.920750',NULL,4,NULL),(91,'test_01_20','Merit Street, Rathgama',23.5444,77.5444,'0770273653',0,'PB0npcQ6EiaC0oWGj0lS','2020-12-21 10:14:11.622298','2020-12-21 10:14:11.622381',NULL,4,NULL),(92,'test_01_21','Merit Street, Rathgama',23.5444,77.5444,'0770273653',0,'H63R1LrjVOJpBSow7u7y','2020-12-21 10:24:08.515443','2020-12-21 10:24:08.515533',NULL,4,NULL),(93,'vffdfsd','dsd, vfvf',23.5444,77.5444,'0718812088',0,'O8jNNYBYef0zKsSCmflY','2020-12-22 11:04:58.415267','2020-12-22 11:04:58.415323',NULL,3,NULL),(94,'jljkjk','jhkhjk, jk',23.5444,77.5444,'0770273653',0,'YjtsfOWqZQWpQfrd5TEB','2020-12-22 11:23:44.006403','2020-12-22 11:23:44.006496',NULL,3,NULL),(95,'jljkkl','jhkhjk, jk',23.5444,77.5444,'0770273653',0,'SWb2Tre22DBU4NfKI2g6','2020-12-22 11:26:15.880995','2020-12-22 11:26:15.881071',NULL,3,NULL),(96,'Two Wave','Pedla steet, Galle',23.5444,77.5444,'+94718825365',0,'mYyUjhW1P7BwvxOmeEMx','2020-12-28 07:38:56.953153','2020-12-28 07:38:56.953290',NULL,3,NULL),(97,'Lion Lanka','Viskan Road, Galle',6.0442,80.2112,'0770575653',0,'wO6IAzdYnB2ouHtZkSBC','2020-12-29 07:18:18.379178','2020-12-29 07:18:18.379285',NULL,4,NULL),(98,'Luudo','2nd Lane, Galwadugoda, Galle',6.0442,80.2112,'0770575253',0,'WjfTo6kl2L6AkFl4R0MZ','2020-12-29 07:20:22.307095','2020-12-29 07:20:22.307184',NULL,12,NULL),(99,'Red Rose','2nd Lane, Galwadugoda, Galle',6.0442,80.2112,'0770575253',2,'sUDHkegvwv7RSFSB7NrB','2020-12-29 07:35:49.659799','2020-12-29 07:37:18.434475',12,12,NULL),(100,'Levonra','2nd Lane, Asiri Street, Koggala',6.0007,77.5444,'+94765476506',2,'WC9VmaICo4pMLGjrdO8B','2020-12-29 08:50:25.256648','2020-12-30 06:42:06.005001',12,3,NULL),(101,'Lumia','PedlaStreet, Galle',6.0007,80.3352,'+94772345854',2,'vy7b7ajIBS3Nkl6a0Rn7','2021-01-01 09:12:53.744454','2021-01-01 09:19:43.882568',12,3,NULL),(102,'Amrithaa','20/10B Amal Road, Batapola',6.0007,80.3352,'+94714587956',2,'BJjfeM0KgVwTkhuPfa2w','2021-01-11 10:12:58.494026','2021-01-11 10:36:43.637201',12,3,NULL),(103,'Alandino','Ped Steet, Galle',6.0007,80.3352,'+94785426532',0,'VhfruaRBiyeDd1MAWt68','2021-01-11 10:52:41.487476','2021-01-11 10:52:41.487559',NULL,3,NULL),(104,'Savick','Pedlar Street, Galle',6.0007,80.3352,'+94785256842',2,'lBY58azJjpehBZliv95g','2021-01-17 06:52:31.511443','2021-01-17 07:01:07.549526',2,3,NULL),(105,'Hochua','Pedla steet, Galle',6.0007,80.3352,'+94715588698',0,'wfyzgAEDyXrFAmRCcFI1','2021-01-27 11:49:08.849943','2021-01-27 11:49:08.849999',NULL,3,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_dish`
--

LOCK TABLES `restaurant_dish` WRITE;
/*!40000 ALTER TABLE `restaurant_dish` DISABLE KEYS */;
INSERT INTO `restaurant_dish` VALUES (19,2,'2020-09-26 00:00:00.000000',NULL,NULL,1,8,NULL),(20,2,'2020-09-26 00:00:00.000000',NULL,NULL,2,8,NULL),(21,2,'2020-09-26 00:00:00.000000',NULL,NULL,3,8,NULL),(22,2,'2020-09-26 00:00:00.000000',NULL,NULL,4,8,NULL),(23,2,'2020-09-26 00:00:00.000000',NULL,NULL,1,9,NULL),(24,2,'2020-09-26 00:00:00.000000',NULL,NULL,2,9,NULL),(25,2,'2020-11-14 00:00:00.000000',NULL,1,2,22,NULL),(26,2,'2020-11-14 00:00:00.000000',NULL,1,1,22,NULL),(27,2,'2020-11-14 00:00:00.000000',NULL,1,3,22,NULL),(28,2,'2020-11-14 00:00:00.000000',NULL,1,4,22,NULL),(29,2,'2020-11-14 00:00:00.000000',NULL,1,1,23,NULL),(30,1,'2020-11-14 00:00:00.000000',NULL,1,2,23,NULL),(31,2,'2020-11-14 00:00:00.000000',NULL,1,2,21,NULL),(32,2,'2020-11-14 00:00:00.000000',NULL,1,4,21,NULL),(33,2,'2020-11-14 00:00:00.000000',NULL,1,3,21,NULL),(34,2,'2020-11-14 00:00:00.000000',NULL,1,3,23,NULL),(35,2,'2020-11-14 00:00:00.000000',NULL,1,1,1,NULL),(36,2,'2020-11-14 00:00:00.000000',NULL,1,2,2,NULL),(37,2,'2020-11-14 00:00:00.000000',NULL,1,3,79,NULL),(39,1,'2020-11-14 15:20:48.024712','2020-11-14 15:20:48.024752',1,2,4,NULL),(41,1,'2020-11-14 15:21:39.951657','2020-11-14 15:21:39.951712',1,1,4,NULL),(43,1,'2020-11-14 15:23:05.931236','2020-11-14 15:23:05.931301',1,3,4,NULL),(53,1,'2020-11-14 15:46:18.031158','2020-11-14 15:46:18.031295',1,5,4,NULL),(54,1,'2020-11-14 15:58:36.757094','2020-11-14 15:58:36.757162',1,3,3,NULL),(55,2,'2020-11-18 13:27:30.432200','2020-11-18 13:27:30.432266',2,7,23,NULL),(56,2,'2020-11-18 13:32:22.346164','2020-11-18 13:32:22.346213',2,8,23,NULL),(57,1,'2020-12-21 10:13:14.175376','2020-12-21 10:13:14.175418',4,8,90,NULL),(58,1,'2020-12-21 10:14:12.122124','2020-12-21 10:14:12.122165',4,8,91,NULL),(59,1,'2020-12-21 10:14:12.369582','2020-12-21 10:14:12.369642',4,4,91,NULL),(60,2,'2020-12-21 10:24:08.812438','2020-12-21 10:24:08.812476',4,8,92,NULL),(61,2,'2020-12-21 10:24:09.126530','2020-12-21 10:24:09.126594',4,4,92,NULL),(62,2,'2020-12-22 11:23:44.673513','2020-12-22 11:23:44.673577',3,1,94,NULL),(63,2,'2020-12-22 11:23:44.889141','2020-12-22 11:23:44.889206',3,2,94,NULL),(64,2,'2020-12-22 11:26:16.108749','2020-12-22 11:26:16.108798',3,1,95,NULL),(65,2,'2020-12-22 11:26:16.471249','2020-12-22 11:26:16.471291',3,2,95,NULL),(66,2,'2020-12-22 11:26:16.704933','2020-12-22 11:26:16.704971',3,6,95,NULL),(67,2,'2020-12-28 06:51:44.953267','2020-12-28 06:51:44.953307',12,8,87,NULL),(68,1,'2020-12-28 06:52:21.072636','2020-12-28 06:52:21.072700',4,7,87,NULL),(69,2,'2020-12-28 07:38:57.317027','2020-12-28 07:38:57.317102',3,3,96,NULL),(70,2,'2020-12-28 07:38:57.552003','2020-12-28 07:38:57.552041',3,4,96,NULL),(71,2,'2020-12-29 07:18:18.920812','2020-12-29 07:18:18.920865',4,8,97,NULL),(72,2,'2020-12-29 07:18:19.201066','2020-12-29 07:18:19.201106',4,4,97,NULL),(73,2,'2020-12-29 07:35:49.942098','2020-12-29 07:35:49.942139',12,8,99,NULL),(74,2,'2020-12-29 08:50:25.561613','2020-12-29 08:50:25.561656',3,1,100,NULL),(75,2,'2020-12-29 08:50:25.766939','2020-12-29 08:50:25.766977',3,2,100,NULL),(76,2,'2020-12-29 08:53:54.350243','2020-12-29 08:53:54.350286',4,7,100,NULL),(77,1,'2020-12-30 06:51:25.939898','2020-12-30 06:51:25.939946',4,8,100,NULL),(78,1,'2020-12-31 05:03:16.325235','2020-12-31 05:03:16.325295',4,4,100,NULL),(80,1,'2020-12-31 05:20:53.615725','2020-12-31 05:20:53.615767',4,3,100,NULL),(81,2,'2020-12-31 05:21:22.238849','2020-12-31 05:21:22.238889',4,4,3,NULL),(82,2,'2021-01-01 09:12:54.239008','2021-01-01 09:12:54.239071',3,1,101,NULL),(83,2,'2021-01-01 09:12:54.517245','2021-01-01 09:12:54.517291',3,3,101,NULL),(84,2,'2021-01-11 10:12:59.634522','2021-01-11 10:12:59.634604',3,3,102,NULL),(85,2,'2021-01-11 10:12:59.892851','2021-01-11 10:12:59.892889',3,4,102,NULL),(86,2,'2021-01-11 10:16:20.909910','2021-01-11 10:16:20.909977',4,1,3,NULL),(87,2,'2021-01-11 10:22:20.831055','2021-01-11 10:22:20.831115',4,10,3,NULL),(88,2,'2021-01-11 10:23:49.950698','2021-01-11 10:23:49.950821',4,11,3,NULL),(89,2,'2021-01-11 10:31:38.272440','2021-01-11 10:31:38.272499',4,1,102,NULL),(90,1,'2021-01-11 10:47:29.823076','2021-01-11 10:47:29.823137',4,12,102,NULL),(91,2,'2021-01-11 10:50:30.332330','2021-01-11 10:50:30.332398',4,13,3,NULL),(92,2,'2021-01-11 10:53:07.106036','2021-01-11 10:53:07.106092',4,14,103,NULL),(94,2,'2021-01-12 10:31:25.920751','2021-01-12 10:31:25.920802',4,16,3,NULL),(95,2,'2021-01-17 06:52:32.042956','2021-01-17 06:52:32.042999',3,1,104,NULL),(96,2,'2021-01-17 06:52:32.233030','2021-01-17 06:52:32.233070',3,2,104,NULL),(97,2,'2021-01-17 06:54:33.057672','2021-01-17 06:54:33.057756',4,17,104,NULL),(98,2,'2021-01-27 11:49:09.216655','2021-01-27 11:49:09.216696',3,1,105,NULL);
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
INSERT INTO `review` VALUES (80,'Good experience','',0,0,'2020-12-27 06:08:49.558135',NULL),(81,'Good experience','',0,0,'2020-12-27 07:04:46.269496',NULL),(82,'Good experience','',0,0,'2020-12-27 07:06:12.489790',NULL),(83,'Good experience','',0,0,'2020-12-27 07:06:24.026572',NULL),(84,'I will come here again..','',0,0,'2020-12-27 07:07:28.091613',NULL),(85,'poor experience','',0,0,'2020-12-27 07:09:36.452584',NULL),(86,'','',0,0,'2020-12-27 07:12:02.601969',NULL),(87,'','',0,0,'2020-12-27 07:57:09.470388',NULL),(88,'Good service','',0,0,'2020-12-27 08:18:35.737929',NULL),(89,'Awesome','',0,0,'2020-12-28 07:41:19.294882',NULL),(90,'Nothing much','',0,0,'2020-12-29 09:02:52.093819',NULL),(91,'Awesome','',0,0,'2021-01-01 09:22:16.348427',NULL),(92,'Good experience','',0,0,'2021-01-01 09:23:33.330743',NULL),(93,'Good','',0,0,'2021-01-01 09:27:49.882983',NULL),(94,'','',0,0,'2021-01-03 14:27:48.096412',NULL),(95,'Good','',0,0,'2021-01-08 11:30:21.248136',NULL),(96,'Really enjoyed','',0,0,'2021-01-11 10:37:31.337839',NULL),(97,'Good','',0,0,'2021-01-11 10:39:11.373476',NULL),(98,'','',0,0,'2021-01-11 10:39:46.999973',NULL),(99,'','',0,0,'2021-01-12 07:57:35.071956',NULL),(100,'','',0,0,'2021-01-17 07:01:55.515783',NULL),(101,'','',0,0,'2021-01-17 07:02:12.570983',NULL),(102,'Awesome','',0,0,'2021-01-17 07:03:41.037373',NULL),(103,'Awesome','',0,0,'2021-01-17 07:04:02.386717',NULL),(104,'','',0,0,'2021-01-17 07:06:48.153573',NULL),(105,'','',0,0,'2021-01-26 09:58:22.107474',NULL),(106,'','',0,0,'2021-01-26 09:58:40.405243',NULL),(107,'','',0,0,'2021-01-26 10:12:19.282518',NULL),(108,'','',0,0,'2021-01-26 10:12:41.875108',NULL),(109,'','',0,0,'2021-01-26 10:13:41.718491',NULL),(110,'','',0,0,'2021-01-26 10:38:29.166148',NULL),(111,'Awesome','',0,0,'2021-01-27 11:50:24.028151',NULL),(112,'','',0,0,'2021-01-27 11:59:51.805160',NULL),(113,'','',0,0,'2021-02-07 18:19:26.393639',NULL),(114,'','',0,0,'2021-02-07 18:21:15.012710',NULL),(115,'','',0,0,'2021-02-07 18:23:03.780512',NULL),(116,'','',0,0,'2021-02-25 05:56:48.035859',NULL),(117,'','',0,0,'2021-02-25 05:57:56.552664',NULL);
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
INSERT INTO `token` VALUES ('#34A4343','2020-09-30 00:00:00.000000',2,21),('#34A4344','2020-10-20 00:00:00.000000',2,22),('#34A4345','2020-10-20 00:00:00.000000',2,23),('1OBX0QGGPQ','2021-01-01 09:21:07.567777',1,101),('3TF0DDQERE','2021-01-01 09:21:06.849659',1,101),('6NIZHSYSPT','2021-01-17 07:03:07.135919',1,104),('6TIFQHMLS4','2020-12-29 09:00:48.710133',1,100),('76IZS9B0CJ','2021-01-01 09:21:07.009592',1,101),('78TKQRGT8J','2021-01-01 09:21:07.317703',1,101),('7GS38FRXTD','2020-12-30 06:59:15.585869',1,22),('7LU28EDIOX','2021-01-01 09:21:07.416768',1,101),('8HAQZDBZ2R','2021-01-17 07:03:05.760310',1,104),('8YZII9Q7PD','2020-12-29 09:00:49.512694',1,100),('9IMKGWVWYL','2021-01-17 07:03:06.492164',1,104),('9JWQN32IET','2021-01-01 09:21:06.363150',1,101),('A1RM7WKRJK','2021-01-01 09:21:06.770599',1,101),('A98KSYDX8X','2021-01-11 10:38:26.667824',1,102),('ANJNTVKKL8','2021-01-17 07:03:07.058146',1,104),('BP56CJ5KTC','2021-01-17 07:03:06.326773',1,104),('BY29RPPL7C','2021-01-17 07:03:05.862225',1,104),('C1LA29F3DK','2021-01-17 07:03:06.412054',1,104),('C758IQNX25','2020-12-29 09:00:49.368069',1,100),('CK2PODZWPT','2020-12-29 09:00:48.422470',1,100),('CR0N78IZKJ','2020-12-30 06:59:14.919874',1,22),('D273RKWDQ2','2021-01-11 10:38:26.929716',1,102),('ECJD4GLN70','2020-12-28 07:40:40.659104',1,96),('EDLHE0NYCQ','2020-12-29 09:00:48.610285',1,100),('FDPBJYVOKT','2020-12-29 09:00:49.194692',1,100),('FVRUDUL5XM','2021-01-17 07:03:07.225524',1,104),('H2CF93EYF3','2021-01-11 10:38:27.142473',1,102),('H5Z9ZEJZT8','2021-01-11 10:38:26.288909',1,102),('HAZPGXLAUJ','2020-12-30 06:59:15.672069',1,22),('HT21JBWT1W','2021-01-17 07:03:07.411878',1,104),('I2L9ZIVNEC','2020-12-29 09:00:49.431391',1,100),('JQHTXYMUCG','2020-12-30 06:59:15.014382',1,22),('JY0MZ1FBNR','2020-12-29 09:00:49.089539',1,100),('K5S9D26FM6','2020-12-30 06:59:15.209738',1,22),('KXDP3SVFT9','2020-12-30 06:59:14.712984',1,22),('LHR6Q6CY4A','2020-12-29 09:00:49.718992',1,100),('LXJXMIO6H3','2020-12-30 06:59:14.839559',1,22),('M2XAWIA9B4','2021-01-17 07:03:07.312709',1,104),('O2YZ49YJVK','2021-01-17 07:03:06.989414',1,104),('O727RPW3A1','2021-01-17 07:03:07.512297',1,104),('OCXHZZ9Z2T','2021-01-17 07:03:06.191963',1,104),('P7ZVH6L00E','2021-01-01 09:21:07.128915',1,101),('PHK9V9F9Q0','2021-01-17 07:03:06.060458',1,104),('POOJQHQTQH','2020-12-30 06:59:15.112473',1,22),('PVZ9XE8EQR','2021-01-17 07:03:07.625590',1,104),('R9TZMON4Z4','2021-01-17 07:03:05.959774',1,104),('RE77NA9QVC','2021-01-11 10:38:26.173224',1,102),('RFOVU13PBB','2020-12-28 07:40:40.821887',1,96),('RGNWWV0FSI','2021-01-17 07:03:07.725012',1,104),('RSEK5CSD1Z','2021-01-11 10:38:26.530640',1,102),('STB68ROCMO','2020-12-30 06:59:15.794655',1,22),('SZ0PAP91KM','2021-01-01 09:21:06.559595',1,101),('TH6ZZZH5K7','2021-01-11 10:38:26.376671',1,102),('TZHNBHSZXG','2020-12-29 09:00:49.612473',1,100),('UNAQYR4N1U','2021-01-11 10:38:25.919365',1,102),('UNQHE4JNIN','2020-12-30 06:59:15.876002',1,22),('UO0PM7G2NB','2020-11-18 07:31:52.830759',1,3),('VSJEGHQR1W','2020-11-18 07:31:52.687713',1,3),('VYAPBLP91W','2021-01-11 10:38:26.066276',1,102),('W2E5VFABKX','2021-01-17 07:03:05.627475',1,104),('YDJPJGPTNW','2021-01-11 10:38:27.043574',1,102),('YGD5OFT7EL','2021-01-01 09:21:07.216903',1,101),('Z1358JQJZH','2021-01-17 07:03:06.567847',1,104),('ZYAAEQS86P','2021-01-17 07:03:06.846026',1,104);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_edit_history_component`
--

LOCK TABLES `user_edit_history_component` WRITE;
/*!40000 ALTER TABLE `user_edit_history_component` DISABLE KEYS */;
INSERT INTO `user_edit_history_component` VALUES (1,'2020-12-06 06:18:32.875000','2020-12-06 06:18:32.875040',2,1,23,2),(2,'2020-12-09 09:52:49.678718','2020-12-09 09:52:49.678782',2,2,23,3),(3,'2020-12-09 09:55:35.764531','2020-12-09 09:55:35.764591',2,3,23,3),(4,'2020-12-09 10:13:24.509364','2020-12-09 10:13:24.509436',2,6,22,3),(17,'2020-12-09 10:23:34.501017','2020-12-09 10:23:34.501077',1,19,22,3),(18,'2020-12-10 10:10:02.123567','2020-12-10 10:10:02.123611',1,20,23,3),(19,'2020-12-11 07:44:39.892878','2020-12-11 07:44:39.892920',1,21,23,3),(20,'2020-12-11 07:45:41.771977','2020-12-11 07:45:41.772022',1,22,21,3),(21,'2020-12-11 07:47:58.480804','2020-12-11 07:47:58.480984',1,23,23,3),(31,'2020-12-26 11:16:21.558996','2020-12-26 11:16:21.559058',1,33,24,3),(32,'2020-12-26 11:16:31.796730','2020-12-26 11:16:31.796789',1,34,24,3),(33,'2020-12-28 09:15:35.714263','2020-12-28 09:15:35.714331',1,35,23,2),(34,'2020-12-29 08:55:35.207469','2020-12-29 08:55:35.207533',1,36,100,3),(35,'2020-12-29 08:58:24.606366','2020-12-29 08:58:24.606488',1,37,100,3),(36,'2020-12-29 08:58:57.409334','2020-12-29 08:58:57.409391',1,38,100,12),(37,'2020-12-30 06:38:33.286656','2020-12-30 06:38:33.286698',1,39,100,12),(38,'2020-12-30 06:40:55.869117','2020-12-30 06:40:55.869178',1,40,100,10),(39,'2021-01-01 09:17:45.923047','2021-01-01 09:17:45.923090',1,41,101,10),(40,'2021-01-11 10:35:33.836138','2021-01-11 10:35:33.836237',1,42,102,10),(41,'2021-01-11 10:36:22.103580','2021-01-11 10:36:22.103623',1,43,102,10),(42,'2021-01-17 06:58:50.560689','2021-01-17 06:58:50.560796',1,44,104,4),(43,'2021-01-17 07:00:52.458904','2021-01-17 07:00:52.458941',1,45,104,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_edit_history_confirmation`
--

LOCK TABLES `user_edit_history_confirmation` WRITE;
/*!40000 ALTER TABLE `user_edit_history_confirmation` DISABLE KEYS */;
INSERT INTO `user_edit_history_confirmation` VALUES (1,15,'2020-12-06 06:18:32.993416',1,2),(2,20,'2020-12-09 09:52:49.777904',2,3),(3,20,'2020-12-09 09:55:35.766275',3,3),(4,15,'2020-12-09 10:13:24.511324',6,3),(17,30,'2020-12-09 10:23:34.502400',19,3),(22,30,'2020-12-10 10:54:05.749972',19,4),(25,20,'2020-12-10 10:57:21.738086',20,3),(29,30,'2020-12-10 11:02:05.498055',20,4),(30,20,'2020-12-11 07:44:39.894033',21,3),(31,50,'2020-12-11 07:45:41.773174',22,3),(32,-30,'2020-12-11 07:46:21.718057',21,4),(33,20,'2020-12-11 07:47:58.482753',23,3),(34,-30,'2020-12-11 07:48:43.867587',23,4),(58,-30,'2020-12-11 11:48:46.739039',23,7),(77,50,'2020-12-26 11:16:21.560051',33,3),(78,50,'2020-12-26 11:16:31.799157',34,3),(79,50,'2020-12-28 09:15:35.716026',35,2),(80,50,'2020-12-29 08:55:35.209111',36,3),(81,20,'2020-12-29 08:58:24.608437',37,3),(82,50,'2020-12-29 08:58:57.410504',38,12),(83,50,'2020-12-30 06:38:33.380494',39,12),(84,20,'2020-12-30 06:40:55.871356',40,10),(85,30,'2020-12-30 06:42:05.993398',40,4),(86,20,'2021-01-01 09:17:45.924556',41,10),(87,30,'2021-01-01 09:19:43.856055',41,4),(88,20,'2021-01-11 10:35:33.838406',42,10),(89,30,'2021-01-11 10:36:16.074881',42,4),(90,20,'2021-01-11 10:36:22.104649',43,10),(91,30,'2021-01-11 10:36:43.621343',43,4),(92,30,'2021-01-17 06:58:50.563518',44,4),(93,20,'2021-01-17 07:00:52.459717',45,3),(94,30,'2021-01-17 07:01:07.513510',45,6);
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
INSERT INTO `user_level` VALUES (0,50,10,'2020-11-18 00:00:00.000000',NULL,NULL,NULL),(1,100,20,'2020-12-06 00:00:00.000000',NULL,NULL,NULL),(2,200,30,'2020-12-06 00:00:00.000000',NULL,NULL,NULL),(3,400,40,'2020-12-06 00:00:00.000000',NULL,NULL,NULL);
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
-- Dumping events for database 'rrs2'
--

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

-- Dump completed on 2021-05-23 12:50:36