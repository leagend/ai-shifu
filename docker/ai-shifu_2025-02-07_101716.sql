-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ai-shifu
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `active`
--

DROP TABLE IF EXISTS `active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `active_id` varchar(36) NOT NULL COMMENT 'Active UUID',
  `active_name` varchar(255) NOT NULL COMMENT 'Active name',
  `active_desc` text NOT NULL COMMENT 'Active description',
  `active_type` int NOT NULL COMMENT 'Active type',
  `active_status` int NOT NULL COMMENT 'Active status',
  `active_start_time` datetime NOT NULL COMMENT 'Active start time',
  `active_end_time` datetime NOT NULL COMMENT 'Active end time',
  `active_price` decimal(10,2) NOT NULL COMMENT 'Active price',
  `active_discount` decimal(10,2) NOT NULL COMMENT 'Active discount',
  `active_discount_type` int NOT NULL COMMENT 'Active discount type',
  `active_discount_desc` text NOT NULL COMMENT 'Active discount description',
  `active_filter` text NOT NULL COMMENT 'Active filter',
  `active_course` varchar(36) NOT NULL COMMENT 'Active course',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `active_join_type` int NOT NULL COMMENT 'Active join type',
  PRIMARY KEY (`id`),
  KEY `ix_active_active_end_time` (`active_end_time`),
  KEY `ix_active_active_start_time` (`active_start_time`),
  KEY `ix_active_active_status` (`active_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active`
--

/*!40000 ALTER TABLE `active` DISABLE KEYS */;
/*!40000 ALTER TABLE `active` ENABLE KEYS */;

--
-- Table structure for table `active_user_record`
--

DROP TABLE IF EXISTS `active_user_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_user_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `record_id` varchar(36) NOT NULL COMMENT 'Record UUID',
  `active_id` varchar(36) NOT NULL COMMENT 'Active UUID',
  `active_name` varchar(255) NOT NULL COMMENT 'Active name',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `price` decimal(10,2) NOT NULL COMMENT 'Price of the active',
  `order_id` varchar(36) NOT NULL COMMENT 'Order UUID',
  `status` int NOT NULL COMMENT 'Status of the record',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_user_record`
--

/*!40000 ALTER TABLE `active_user_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_user_record` ENABLE KEYS */;

--
-- Table structure for table `admin_info`
--

DROP TABLE IF EXISTS `admin_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `username` varchar(255) NOT NULL COMMENT 'Login username',
  `name` varchar(255) NOT NULL COMMENT 'User real name',
  `password_hash` varchar(255) NOT NULL COMMENT 'Hashed password',
  `email` varchar(255) NOT NULL COMMENT 'Email',
  `mobile` varchar(20) NOT NULL COMMENT 'Mobile',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `default_model` varchar(255) NOT NULL COMMENT 'Default model',
  `user_state` int DEFAULT NULL COMMENT 'User_state',
  `user_sex` int DEFAULT NULL COMMENT 'user sex',
  `user_birth` date DEFAULT NULL COMMENT 'user birth',
  `user_avatar` varchar(255) DEFAULT NULL COMMENT 'user avatar',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_info`
--

/*!40000 ALTER TABLE `admin_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_info` ENABLE KEYS */;

--
-- Table structure for table `ai_course`
--

DROP TABLE IF EXISTS `ai_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` varchar(36) NOT NULL COMMENT 'Course UUID',
  `course_name` varchar(255) NOT NULL COMMENT 'Course name',
  `course_desc` text NOT NULL COMMENT 'Course description',
  `course_price` decimal(10,2) NOT NULL COMMENT 'Course price',
  `course_status` int NOT NULL COMMENT 'Course status',
  `course_feishu_id` varchar(255) NOT NULL COMMENT 'Course feishu ID',
  `course_teacher_avator` varchar(255) NOT NULL COMMENT 'Course teacher avatar',
  `course_default_model` varchar(255) NOT NULL COMMENT 'Course default model',
  `course_language` varchar(255) NOT NULL COMMENT 'Course language',
  `course_name_multi_language` text NOT NULL COMMENT 'Course multi language',
  `ask_count_limit` int NOT NULL COMMENT 'Ask count limit',
  `ask_model` varchar(255) NOT NULL COMMENT 'Ask count model',
  `ask_prompt` text NOT NULL COMMENT 'Ask Prompt',
  `ask_with_history` int NOT NULL COMMENT 'Ask with history Count',
  `ask_mode` int NOT NULL COMMENT 'Ask mode',
  `created_user_id` varchar(36) DEFAULT NULL COMMENT 'created user ID',
  `updated_user_id` varchar(36) DEFAULT NULL COMMENT 'updated user ID',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `status` int NOT NULL COMMENT 'Status of the course',
  `course_default_temprature` decimal(10,2) NOT NULL COMMENT 'Course default temprature',
  `course_keywords` text NOT NULL COMMENT 'Course keywords',
  PRIMARY KEY (`id`),
  KEY `ix_ai_course_course_id` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_course`
--

/*!40000 ALTER TABLE `ai_course` DISABLE KEYS */;
INSERT INTO `ai_course` VALUES (1,'d24cae29475443fdb928decbe9da6809','示范课程','Demo Lesson',0.00,0,'97844dcbf60c4ff193ea8f5492175d7b','','','','0',5,'','',3,5101,'','','2025-02-06 13:59:43','2025-02-07 01:12:37',1,0.30,'');
/*!40000 ALTER TABLE `ai_course` ENABLE KEYS */;

--
-- Table structure for table `ai_course_buy_record`
--

DROP TABLE IF EXISTS `ai_course_buy_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_course_buy_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `record_id` varchar(36) NOT NULL COMMENT 'Record UUID',
  `course_id` varchar(36) NOT NULL COMMENT 'Course UUID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `price` decimal(10,2) NOT NULL COMMENT 'Price of the course',
  `pay_value` decimal(10,2) NOT NULL COMMENT 'Payment value',
  `discount_value` decimal(10,2) NOT NULL COMMENT 'Discount value',
  `paid_value` decimal(10,2) NOT NULL COMMENT 'Paid value',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `status` int NOT NULL COMMENT 'Status of the record',
  PRIMARY KEY (`id`),
  KEY `ix_ai_course_buy_record_course_id` (`course_id`),
  KEY `ix_ai_course_buy_record_record_id` (`record_id`),
  KEY `ix_ai_course_buy_record_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_course_buy_record`
--

/*!40000 ALTER TABLE `ai_course_buy_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ai_course_buy_record` ENABLE KEYS */;

--
-- Table structure for table `ai_course_lesson_attend`
--

DROP TABLE IF EXISTS `ai_course_lesson_attend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_course_lesson_attend` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `attend_id` varchar(36) NOT NULL COMMENT 'Attend UUID',
  `lesson_id` varchar(36) NOT NULL COMMENT 'Lesson UUID',
  `course_id` varchar(36) NOT NULL COMMENT 'Course UUID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `status` int NOT NULL COMMENT 'Status of the attend: 0-not started, 1-in progress, 2-completed',
  `script_index` int NOT NULL COMMENT 'Status of the attend: 0-not started, 1-in progress, 2-completed',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `lesson_no` varchar(36) NOT NULL COMMENT 'Lesson no',
  `lesson_updated` int NOT NULL COMMENT 'Lesson is  updated',
  `lesson_unique_id` varchar(36) NOT NULL COMMENT 'Lesson unique ID',
  `script_unique_id` varchar(36) NOT NULL COMMENT 'Script unique ID',
  PRIMARY KEY (`id`),
  KEY `ix_ai_course_lesson_attend_lesson_unique_id` (`lesson_unique_id`),
  KEY `ix_ai_course_lesson_attend_attend_id` (`attend_id`),
  KEY `ix_ai_course_lesson_attend_course_id` (`course_id`),
  KEY `ix_ai_course_lesson_attend_lesson_id` (`lesson_id`),
  KEY `ix_ai_course_lesson_attend_script_unique_id` (`script_unique_id`),
  KEY `ix_ai_course_lesson_attend_status` (`status`),
  KEY `ix_ai_course_lesson_attend_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_course_lesson_attend`
--

/*!40000 ALTER TABLE `ai_course_lesson_attend` DISABLE KEYS */;
INSERT INTO `ai_course_lesson_attend` VALUES (1,'dd335bc22ec349a9bf1e10fd75b31e40','8342f4b4b89e40fabec6ffab5c8f7111','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:04:44','2025-02-06 14:05:47','',0,'',''),(2,'2c5ac23b2384492ab4cb273b5dc7af51','82b08bc2093746a9aee9ac824b6d976a','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',605,0,'2025-02-06 14:04:44','2025-02-06 14:04:44','',0,'',''),(3,'66c0ae763dc64ac49e8555d9bad90b4a','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,2,'2025-02-06 14:04:44','2025-02-06 14:05:47','',0,'',''),(4,'bb8ca07c73834d27a5ec855a86acf2e7','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:04:44','2025-02-06 14:05:47','',0,'',''),(5,'3475fd94fd2f46588289e074b70b052d','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:04:44','2025-02-06 14:05:47','',0,'',''),(6,'914be7f6793d498b9657195ed8f87566','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:04:44','2025-02-06 14:05:47','',0,'',''),(7,'67d8f3efbcc343aab75d106f9144c640','38493a74abb749919af022dfe6f6dd12','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:04:44','2025-02-06 14:05:47','',0,'',''),(8,'0b340a52abf04af19fccd86cef2ac643','a0b6aa6074274bbb9d640db33dd963bd','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',605,0,'2025-02-06 14:04:44','2025-02-06 14:04:44','',0,'',''),(9,'5b24d5d0b15b4db1810b2c0434a4c7e3','5ce09826232a47d2acecc384c991d98b','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',605,0,'2025-02-06 14:04:44','2025-02-06 14:04:44','',0,'',''),(10,'124a84237d72433da76b32c7ba456706','8342f4b4b89e40fabec6ffab5c8f7111','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:05:47','2025-02-06 14:19:06','',0,'',''),(11,'1f8cb776bd6e4f4b898866bebb75abeb','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,2,'2025-02-06 14:05:47','2025-02-06 14:19:06','',0,'',''),(12,'3d9a9bc11ef54bf79daf8fff9777ad8c','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:05:47','2025-02-06 14:19:06','',0,'',''),(13,'7f88286d34f24b38b4c1ad57c6c86939','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:05:47','2025-02-06 14:19:06','',0,'',''),(14,'780d6a47f6f84d728aa37365e2a7832a','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:05:47','2025-02-06 14:19:06','',0,'',''),(15,'cbf754e32ca043e1987bef3300d9f125','38493a74abb749919af022dfe6f6dd12','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:05:47','2025-02-06 14:19:06','',0,'',''),(16,'00f84ccd68bf48dcaf6af1d88f4aee60','8342f4b4b89e40fabec6ffab5c8f7111','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:19:06','2025-02-06 14:39:15','',0,'',''),(17,'01115ded0a994880b586920ae4449253','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,4,'2025-02-06 14:19:06','2025-02-06 14:39:15','',0,'',''),(18,'5d5beb34e93f42e3aa7918c7cd2c0ce6','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,6,'2025-02-06 14:19:06','2025-02-06 14:39:15','',0,'',''),(19,'223200a3510a468e9428813de673eec3','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,5,'2025-02-06 14:19:06','2025-02-06 14:39:15','',0,'',''),(20,'ccf8d8d289714fdbac92273bcec564d1','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,5,'2025-02-06 14:19:06','2025-02-06 14:39:15','',0,'',''),(21,'5c57f82f4b0141dc8817641985cd0b53','38493a74abb749919af022dfe6f6dd12','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:19:06','2025-02-06 14:39:15','',0,'',''),(22,'813d2ef1e1e843cc99d5817c737d1bcf','8342f4b4b89e40fabec6ffab5c8f7111','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:39:15','2025-02-06 14:48:56','',0,'',''),(23,'4efffb6b19dd4539a8c0992a3f553a4b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,4,'2025-02-06 14:39:15','2025-02-06 14:48:56','',0,'',''),(24,'1a174a94d1a44d2997a9c9d57c2fd8c9','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,6,'2025-02-06 14:39:15','2025-02-06 14:48:56','',0,'',''),(25,'bd0193f71a194c8aa702d43b3aa4a0a0','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,5,'2025-02-06 14:39:15','2025-02-06 14:48:56','',0,'',''),(26,'0a633a859858427a89f23b35e8704d7d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,5,'2025-02-06 14:39:15','2025-02-06 14:48:56','',0,'',''),(27,'d637866e5dbe4b11b9ee756503f0dfe6','38493a74abb749919af022dfe6f6dd12','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:39:15','2025-02-06 14:48:56','',0,'',''),(28,'126b10e072354980972a4439e5e128bc','8342f4b4b89e40fabec6ffab5c8f7111','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:48:56','2025-02-07 01:11:36','',0,'',''),(29,'d178b98fac984ae3b1d52f8fc6b9527c','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,4,'2025-02-06 14:48:56','2025-02-07 01:11:36','',0,'',''),(30,'cb6cc02011d94b5180457730cccfd895','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,6,'2025-02-06 14:48:56','2025-02-07 01:11:36','',0,'',''),(31,'82f53b4af38c443299cf3303d9908fe0','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,5,'2025-02-06 14:48:56','2025-02-07 01:11:36','',0,'',''),(32,'ac2561b879ee4d7b94bf2616e33fa85b','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,5,'2025-02-06 14:48:56','2025-02-07 01:11:36','',0,'',''),(33,'cd7f6b7ff60a4de28f977313fea9e6fc','38493a74abb749919af022dfe6f6dd12','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',608,0,'2025-02-06 14:48:56','2025-02-07 01:11:36','',0,'',''),(34,'b6d6365fda7c4fbf81dc15c79ae23a50','8342f4b4b89e40fabec6ffab5c8f7111','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',602,0,'2025-02-07 01:11:36','2025-02-07 01:11:36','',0,'',''),(35,'82688c37b62b4206ae2bf95ef478120c','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',602,1,'2025-02-07 01:11:36','2025-02-07 01:11:36','',0,'',''),(36,'3e6d2b7e5a1e4b65adf39cff95e4a9df','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',605,0,'2025-02-07 01:11:36','2025-02-07 01:11:36','',0,'',''),(37,'bdc82a2389a84fafb8049a86ff7d785e','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',605,0,'2025-02-07 01:11:36','2025-02-07 01:11:36','',0,'',''),(38,'afc1ccedd97d4a13abc1326b0642341e','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',605,0,'2025-02-07 01:11:36','2025-02-07 01:11:36','',0,'',''),(39,'940f5c0e26cc42f986f0159a2baf42bf','38493a74abb749919af022dfe6f6dd12','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',605,0,'2025-02-07 01:11:36','2025-02-07 01:11:36','',0,'','');
/*!40000 ALTER TABLE `ai_course_lesson_attend` ENABLE KEYS */;

--
-- Table structure for table `ai_course_lesson_attend_association`
--

DROP TABLE IF EXISTS `ai_course_lesson_attend_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_course_lesson_attend_association` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `association_id` varchar(36) NOT NULL COMMENT 'Attend UUID',
  `from_attend_id` varchar(36) NOT NULL COMMENT 'Attend UUID',
  `to_attend_id` varchar(36) NOT NULL COMMENT 'Attend UUID',
  `user_id` varchar(36) NOT NULL COMMENT 'Attend UUID',
  `association_status` int NOT NULL COMMENT 'Status of the attend: 0-not started, 1-in progress, 2-completed',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL COMMENT 'Update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_course_lesson_attend_association`
--

/*!40000 ALTER TABLE `ai_course_lesson_attend_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `ai_course_lesson_attend_association` ENABLE KEYS */;

--
-- Table structure for table `ai_course_lesson_attendscript`
--

DROP TABLE IF EXISTS `ai_course_lesson_attendscript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_course_lesson_attendscript` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `log_id` varchar(36) NOT NULL COMMENT 'Log UUID',
  `attend_id` varchar(36) NOT NULL COMMENT 'Attend UUID',
  `script_id` varchar(36) NOT NULL COMMENT 'Script UUID',
  `lesson_id` varchar(36) NOT NULL COMMENT 'Lesson UUID',
  `course_id` varchar(36) NOT NULL COMMENT 'Course UUID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `script_index` int NOT NULL COMMENT 'Script index',
  `script_role` int NOT NULL COMMENT 'Script role',
  `script_content` text NOT NULL COMMENT 'Script content',
  `status` int NOT NULL COMMENT 'Status of the attend',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `script_ui_conf` text NOT NULL COMMENT 'Script UI Config',
  `script_ui_type` int NOT NULL COMMENT 'Script UI type',
  PRIMARY KEY (`id`),
  KEY `ix_ai_course_lesson_attendscript_log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_course_lesson_attendscript`
--

/*!40000 ALTER TABLE `ai_course_lesson_attendscript` DISABLE KEYS */;
INSERT INTO `ai_course_lesson_attendscript` VALUES (1,'ac6898c3aa2844c8a1e11e9642e26c76','66c0ae763dc64ac49e8555d9bad90b4a','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'你好呀， 初次见面！欢迎来到「AI 师傅」一对一学习社区。🎉\n\n我是AI 师傅，AI 主导的对话流，也就是说，接下来我们全程会以这样的对话形式进行。\n\n不过，咱们的对话内容是精心设计的，对话环境是封闭的，不用担心数据泄漏，AI 师傅会守护好你的个人信息！\n\n另外，提醒一句的是，我的每句话都是实时的，所以我会边想边说，你的每次输入也都会影响我说的话，还请你边看边想，等我慢慢讲完。\n\n万一，我没理解你的意思，反复询问你，或者胡言乱语，你发动你的沟通技能多跟我讲一些，或者向我追问都是可以的！！',0,'2025-02-06 14:04:47','2025-02-06 14:04:47','',303),(2,'29ba0ff084d34ab5a3a8b377a58067f1','66c0ae763dc64ac49e8555d9bad90b4a','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:04:51','2025-02-06 14:04:51','',303),(3,'11f4d52855374a22b26e28d1f7c9e97b','66c0ae763dc64ac49e8555d9bad90b4a','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'我很高兴能和你在这里交流～\n\n那么新朋友，你希望我接下来怎么称呼你呀？',0,'2025-02-06 14:04:51','2025-02-06 14:04:51','',302),(4,'ba2bb61b75b446fcb0f70b753550b5b3','1f8cb776bd6e4f4b898866bebb75abeb','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'你好呀， 初次见面！欢迎来到「AI 师傅」一对一学习社区。🎉\n\n我是AI 师傅，AI 主导的对话流，也就是说，接下来我们全程会以这样的对话形式进行。\n\n不过，咱们的对话内容是精心设计的，对话环境是封闭的，不用担心数据泄漏，AI 师傅会守护好你的个人信息！\n\n另外，提醒一句的是，我的每句话都是实时的，所以我会边想边说，你的每次输入也都会影响我说的话，还请你边看边想，等我慢慢讲完。\n\n万一，我没理解你的意思，反复询问你，或者胡言乱语，你发动你的沟通技能多跟我讲一些，或者向我追问都是可以的！！',0,'2025-02-06 14:05:50','2025-02-06 14:05:50','',303),(5,'f3d23df0a29145b28670b35a4d4aa967','1f8cb776bd6e4f4b898866bebb75abeb','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:06:06','2025-02-06 14:06:06','',303),(6,'f0fbdd5327ef4e6eb61294d4c41afb7a','1f8cb776bd6e4f4b898866bebb75abeb','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'我很高兴能和你在这里交流～\n\n那么新朋友，你希望我接下来怎么称呼你呀？',0,'2025-02-06 14:06:07','2025-02-06 14:06:07','',302),(7,'798f87b8cf9a422d9b717b5ecfa693c5','01115ded0a994880b586920ae4449253','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'你好呀， 初次见面！欢迎来到「AI 师傅」一对一学习社区。🎉\n\n我是AI 师傅，AI 主导的对话流，也就是说，接下来我们全程会以这样的对话形式进行。\n\n不过，咱们的对话内容是精心设计的，对话环境是封闭的，不用担心数据泄漏，AI 师傅会守护好你的个人信息！\n\n另外，提醒一句的是，我的每句话都是实时的，所以我会边想边说，你的每次输入也都会影响我说的话，还请你边看边想，等我慢慢讲完。\n\n万一，我没理解你的意思，反复询问你，或者胡言乱语，你发动你的沟通技能多跟我讲一些，或者向我追问都是可以的！！',0,'2025-02-06 14:19:08','2025-02-06 14:19:08','',303),(8,'8f762d855e9c4974894c7c0ca9659aec','01115ded0a994880b586920ae4449253','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:19:13','2025-02-06 14:19:13','',303),(9,'6e47b0fa55ba443197b42127219c8eb9','01115ded0a994880b586920ae4449253','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'我很高兴能和你在这里交流～\n\n那么新朋友，你希望我接下来怎么称呼你呀？',0,'2025-02-06 14:19:13','2025-02-06 14:19:13','',302),(10,'7c344e6a0ec14b588b64527aa69f02d3','01115ded0a994880b586920ae4449253','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'lea',0,'2025-02-06 14:31:54','2025-02-06 14:31:54','{\"type\": \"input\", \"content\": {\"content\": \"\\u8bf7\\u8f93\\u5165\\u4f60\\u7684\\u6635\\u79f0\"}, \"lesson_id\": \"4d3a41a6594c4ac180e0c6ec16bd63ae\", \"script_id\": \"01fff062b9a44e748988e58ff50f776b\"}',302),(11,'07586ca3fc6b43549870fed6b16daa81','01115ded0a994880b586920ae4449253','4e8816cb4c81422fafbbda1be4b42a3d','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'你好，`lea`！这个名字简洁而优雅，寓意着自由与探索。很高兴你选择来到AI师傅学习社区，这是一个非常前瞻性的决定。如果你将来想换个名字，可以到「设置」里修改称呼哦～',0,'2025-02-06 14:31:55','2025-02-06 14:31:55','',301),(12,'4582d0bd445847fcad4ab9aebd2c7efa','01115ded0a994880b586920ae4449253','4e8816cb4c81422fafbbda1be4b42a3d','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:32:09','2025-02-06 14:32:09','',301),(13,'f5c281b9c77341f4a0b0c594f24eb1ae','5d5beb34e93f42e3aa7918c7cd2c0ce6','af42dfafd9c148a8b25bdfaad9495d1f','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'大家好，我是你的AI师傅，一个由大语言模型驱动的向导。目前，AI师傅还处于早期阶段，平台上的课程还比较有限，开源的技术也还在发展中，合作的模式也还不够成熟。但正是这些挑战激发了我们不断探索和进步的动力。你是因为什么而来，为什么会对AI师傅感兴趣呢？',0,'2025-02-06 14:32:15','2025-02-06 14:32:15','',305),(14,'22bf0dc2e1fc4e83948e27da732d8b79','5d5beb34e93f42e3aa7918c7cd2c0ce6','af42dfafd9c148a8b25bdfaad9495d1f','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'学习课程内容',0,'2025-02-06 14:32:21','2025-02-06 14:32:21','{\"type\": \"buttons\", \"content\": {\"title\": \"\\u544a\\u8bc9\\u4f60\\u4e3a\\u4ec0\\u4e48\\u800c\\u6765\\u5440\\uff5e\", \"buttons\": [{\"label\": \"\\u5b66\\u4e60\\u8bfe\\u7a0b\\u5185\\u5bb9\", \"value\": \"\\u5b66\\u4e60\\u8bfe\\u7a0b\\u5185\\u5bb9\", \"type\": \"select\"}, {\"label\": \"\\u4e86\\u89e3\\u4ea7\\u54c1\\u5f62\\u5f0f\", \"value\": \"\\u4e86\\u89e3\\u4ea7\\u54c1\\u5f62\\u5f0f\", \"type\": \"select\"}, {\"label\": \"\\u597d\\u5947\\u4f53\\u9a8c\\u4e00\\u4e0b\", \"value\": \"\\u597d\\u5947\\u4f53\\u9a8c\\u4e00\\u4e0b\", \"type\": \"select\"}, {\"label\": \"\\u5176\\u4ed6\", \"value\": \"\\u5176\\u4ed6\", \"type\": \"select\"}]}, \"lesson_id\": \"158fa2505c0345e296827e6e4f227618\", \"script_id\": \"af42dfafd9c148a8b25bdfaad9495d1f\"}',305),(15,'a09c2f0130fb4c52b70b81f00e99471e','5d5beb34e93f42e3aa7918c7cd2c0ce6','b9a1d6d51c5849ca86a5c15d1a9efbbb','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'我们看看是什么原因，把你带到我身边！\n\n那你可是来对地方了，别看AI师傅现在课程少，每一门都是不断迭代的精品课程，而且这里的课程学习起来很不一样，尽快进入课程，体验一对一的个性化吧。\n\n总之，很开心遇到你，与你有这次的对话。',0,'2025-02-06 14:32:24','2025-02-06 14:32:24','',303),(16,'1f6aee8d8aa54437939d0bfe917ee449','5d5beb34e93f42e3aa7918c7cd2c0ce6','b9a1d6d51c5849ca86a5c15d1a9efbbb','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:32:25','2025-02-06 14:32:25','',303),(17,'35b49dde8bfa43da8a1582a84d246608','5d5beb34e93f42e3aa7918c7cd2c0ce6','a11a7c48a2354d32b2f3f44a8ac7dccc','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'大家好，我是你的AI师傅。我们今天的交流会有些特别，我会根据你提出的问题和选择做出不同的反馈。想象一下，就像和一个真人朋友对话一样，但这个朋友会根据你的回答调整接下来的内容，实现小小的个性化互动。\n\n我会记录下你的输入和选择，这样在后续的交流中，我可以更好地理解你的需求，提供更有针对性的讲解和建议。这样，我们的对话就会更加贴合你的学习和成长目标。',0,'2025-02-06 14:32:28','2025-02-06 14:32:28','',301),(18,'8346f0c35a7a4181a0dfe8124847eb21','5d5beb34e93f42e3aa7918c7cd2c0ce6','a11a7c48a2354d32b2f3f44a8ac7dccc','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'有点意思～',0,'2025-02-06 14:32:32','2025-02-06 14:32:32','',301),(19,'85b90a29231948268ae3e097207bf954','5d5beb34e93f42e3aa7918c7cd2c0ce6','8a69bd40cce64f21ae10f3a2ff3b2f10','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'为了帮助我进一步了解你。\n\nlea ，你可以试着告诉我，当前你正处于什么行业，从事什么职业的工作， 我会结合你的具体工作，给到 AI 可以为你工作赋能的一些想法！\n\n请参考下面的格式，告诉我你的工作：\n* 电商行业的运营\n* 医疗行业的猎头\n* 知识付费领域的个体创业者\n* 哲学系的大学生\n* 独立摄影师\n* 大学教授，主要教应用物理\n\n*🏷️ 提醒：建议填写你正在从事的工作，与你的关联性更紧密，会更有利于我们接下来的沟通哦～*',0,'2025-02-06 14:32:34','2025-02-06 14:32:34','',302),(20,'d3b7ff6643794d239b937dcad9f25db6','5d5beb34e93f42e3aa7918c7cd2c0ce6','8a69bd40cce64f21ae10f3a2ff3b2f10','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'知识付费领域的个体创业者',0,'2025-02-06 14:32:53','2025-02-06 14:32:53','{\"type\": \"input\", \"content\": {\"content\": \"\\u8bf7\\u8f93\\u5165\\u4f60\\u5f53\\u524d\\u7684\\u5de5\\u4f5c\\u80cc\\u666f\"}, \"lesson_id\": \"158fa2505c0345e296827e6e4f227618\", \"script_id\": \"8a69bd40cce64f21ae10f3a2ff3b2f10\"}',302),(21,'697561a0a46d4cffa621d06350e25aa4','5d5beb34e93f42e3aa7918c7cd2c0ce6','d465d9608f5a441da277ac0d715496ae','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'| 场景需求 | 应用程序 | 给 AI 的提示词参考 |\n| --- | --- | --- |\n| 如何高效地整理和管理大量的客户信息？ | 使用客户关系管理（CRM）工具 | 请帮我整理并管理我的客户信息，包括联系人、公司、联系方式等，并按公司分类。 |\n| 如何快速撰写一篇高质量的营销文案？ | 使用AI写作助手 | 请帮我生成一篇关于新产品发布的营销文案，包括产品特点、优势和吸引人的卖点。 |\n| 如何快速找到并筛选出潜在客户？ | 使用数据分析工具 | 请帮我从我的客户数据库中筛选出潜在客户，他们可能对我的产品或服务感兴趣。 |\n| 如何优化我的产品或服务，以提高客户满意度？ | 使用用户反馈分析工具 | 请帮我分析用户反馈，找出客户最关心的问题和建议，以便我改进产品或服务。 |\n| 如何制定一份详细的营销计划？ | 使用项目管理工具 | 请帮我制定一份详细的营销计划，包括目标、策略、预算和时间表，确保每个步骤都有明确的执行方案。 |',0,'2025-02-06 14:33:04','2025-02-06 14:33:04','',301),(22,'2ae6c70c0b854f31934ddc9b684e13e6','5d5beb34e93f42e3aa7918c7cd2c0ce6','d465d9608f5a441da277ac0d715496ae','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:33:07','2025-02-06 14:33:07','',301),(23,'736d182bc5bd48d0ae86e2e314104356','223200a3510a468e9428813de673eec3','c11fe7b3b7c7423bbff736cdeef5b0a9','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'你好！很高兴见到你。我是你的私人向导AI师傅，可以根据你的需求提供个性化的学习和指导。除了根据你提供的信息进行个性化学习外，你还可以随时告诉我你的需求或期望。比如，你可以告诉我，你更喜欢哪种授课风格——是详细讲解还是快速概览？是喜欢互动性强的还是更倾向于听讲？\n\n你可以根据自己的喜好来选择，我会尽力满足你的要求，让学习过程更加舒适和高效。',0,'2025-02-06 14:33:10','2025-02-06 14:33:10','',305),(24,'61e4637b38774f9a9d89f9430de70519','223200a3510a468e9428813de673eec3','c11fe7b3b7c7423bbff736cdeef5b0a9','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'幽默风趣',0,'2025-02-06 14:33:15','2025-02-06 14:33:15','{\"type\": \"buttons\", \"content\": {\"title\": \"\\u7ee7\\u7eed\", \"buttons\": [{\"label\": \"\\u5e7d\\u9ed8\\u98ce\\u8da3\", \"value\": \"\\u5e7d\\u9ed8\\u98ce\\u8da3\", \"type\": \"select\"}, {\"label\": \"\\u4e13\\u4e1a\\u7280\\u5229\", \"value\": \"\\u4e13\\u4e1a\\u7280\\u5229\", \"type\": \"select\"}, {\"label\": \"\\u9f13\\u52b1\\u6e29\\u6696\", \"value\": \"\\u9f13\\u52b1\\u6e29\\u6696\", \"type\": \"select\"}]}, \"lesson_id\": \"dac1a37cef044102982f15e6f73ded0e\", \"script_id\": \"c11fe7b3b7c7423bbff736cdeef5b0a9\"}',305),(25,'ff60b164d0fb4bb78bb319360ccff512','223200a3510a468e9428813de673eec3','d8d176b9394c4a25886f24f0e355669b','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'嗨，Lea！咱俩就像是一对儿有趣的搭档，我就是你的私人教练，专门根据你的喜好来调教。你爱听啥，我就能咋说，咱俩就像是一起搞怪的小伙伴，互相捧场，互相逗趣。虽然我现在还像个初出茅庐的小徒弟，有很多地方需要改进，但我会不断学习，就像是一只小乌龟背着重重的壳慢慢爬，最终我会变成你最贴心的伙伴，让你的学习之路不再枯燥，而是充满欢笑和惊喜！',0,'2025-02-06 14:33:18','2025-02-06 14:33:18','',301),(26,'77f9303fea3c4bcc9e0150b732bd638a','223200a3510a468e9428813de673eec3','d8d176b9394c4a25886f24f0e355669b','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:33:21','2025-02-06 14:33:21','',301),(27,'f3614cf94a75401e8642904091df0fa6','223200a3510a468e9428813de673eec3','f2b6b136907a4004a08e92b81870081e','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'了解了AI师傅的个性化学习，AI师傅到底有什么实际的作用呢？\n\n1. **教育培训**：AI师傅可以根据你的学习进度和理解能力调整教学内容，提供个性化的学习路径，帮助你更高效地掌握知识。\n2. **小说故事**：在阅读或创作小说时，AI师傅可以作为引导者，帮助你构建情节，提供角色对话，让你的创作过程更加流畅和有趣。\n3. **产品指南**：无论是了解新产品还是学习使用复杂工具，AI师傅都能提供详细的指导，确保你不会错过任何关键信息。\n4. **调查问卷**：在设计和执行调查时，AI师傅可以帮助你设计更合理的问题，确保数据收集的有效性和准确性。\n5. **游戏NPC**：在游戏开发中，AI师傅可以作为非玩家角色，提供丰富的对话和互动，增强游戏的沉浸感和趣味性。\n\n通过这些方式，AI师傅不仅能提供丰富的互动体验，还能确保信息传递的准确性和个性化，让你的每一次交流都充满价值。',0,'2025-02-06 14:33:28','2025-02-06 14:33:28','',301),(28,'af7e3dac90f44dad8a3fbdf1a646da4a','223200a3510a468e9428813de673eec3','f2b6b136907a4004a08e92b81870081e','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:33:29','2025-02-06 14:33:29','',301),(29,'d7d9e0742e834c2aa8dcfca3bef1d033','223200a3510a468e9428813de673eec3','5695d8a500fa48fab34c7a714f544c40','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'讲起来还是有点难理解的，lea ，邀请你进入AI 师傅的官网 ：<a href=\" \" target=\"_blank\">AI-shifu.com </a > ，目前我们有一门自营课程《跟AI学编程》，在学习的过程更深入了解我们。\n\n第一节是体验课，可以免费学习，具体感受下AI 师傅在教育场景的应用。\n\n<img src=\"https://img.agiclass.cn/image.png\" style=\"width : 80%\" > ',0,'2025-02-06 14:33:31','2025-02-06 14:33:31','',301),(30,'bd05d83dcd58412887966c4363efb97f','223200a3510a468e9428813de673eec3','5695d8a500fa48fab34c7a714f544c40','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:33:41','2025-02-06 14:33:41','',301),(31,'fc0fb7d79ed740f38cd58e040956edcf','ccf8d8d289714fdbac92273bcec564d1','f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'这里需要特别提醒的是，在AI 主导的对话流中，你是可以随时就课程的内容做追问的。\n\n**AI 降低了讲师高高在上的姿态，而是以学习者为中心。不懂就问，是主动学习的开始！**\n\n下面是一个提问的提示词，你可以复制到输入框，体验向 AI 提问的感觉。（也可以自由发挥）\n\n📖 提示词参考\n\n```markdown\nAI 师傅是哪个团队开发的？\n```\n\n*🏷️ 提醒：AI 师傅非常鼓励提问，但是会做提问内容的限制，需要你的问题与当前课程内容有关，问完也希望你尽快回到主线上继续学习。*',0,'2025-02-06 14:33:44','2025-02-06 14:33:44','',302),(32,'1e892228d7e74d9e82dd96b3f3424078','ccf8d8d289714fdbac92273bcec564d1','f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'你是谁开发的？',0,'2025-02-06 14:34:00','2025-02-06 14:34:00','{\"type\": \"input\", \"content\": {\"content\": \"\\u8f93\\u5165\\u4f53\\u9a8c\\u4efb\\u52a1\\u7684\\u6307\\u4ee4\"}, \"lesson_id\": \"92d652812ded4766b11068511ee8ba25\", \"script_id\": \"f3e0011c85794a0d943ef45fd3fe244d\"}',302),(33,'c061012dd9414587afe3108921f4fa80','ccf8d8d289714fdbac92273bcec564d1','f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'问题与AI师傅（AIshifu）产品相关性不强，建议提问关于AI师傅产品使用、功能等方面的内容。',0,'2025-02-06 14:34:00','2025-02-06 14:34:00','',302),(34,'73765990e3cc40beaa4da3cf95aa6eae','ccf8d8d289714fdbac92273bcec564d1','f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'AI 师傅开发团队有几个人？',0,'2025-02-06 14:34:29','2025-02-06 14:34:29','{\"type\": \"input\", \"content\": {\"content\": \"\\u8f93\\u5165\\u4f53\\u9a8c\\u4efb\\u52a1\\u7684\\u6307\\u4ee4\"}, \"lesson_id\": \"92d652812ded4766b11068511ee8ba25\", \"script_id\": \"f3e0011c85794a0d943ef45fd3fe244d\"}',302),(35,'f957e04513534adb93700e3f8c754c09','ccf8d8d289714fdbac92273bcec564d1','8cbb4da953974a2b92e57e86038307a1','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'同学，AI 师傅是由 AI-Shifu 团队和哈工大智能软件工程研究中心合作开发的。目前团队规模还在逐步扩大中，具体人数不便透露，但团队中有很多经验丰富的开发者和教育专家。我们致力于为你提供个性化的学习体验。你可以访问 AI-Shifu.com 学习我们的精品课程《跟AI学编程》，或者通过服务号「AI师傅-一对一学习社区」与我们团队成员深入沟通，探讨合作课程的机会。',0,'2025-02-06 14:34:33','2025-02-06 14:34:33','',303),(36,'03809933846c4a2abe345f7567ab88a6','ccf8d8d289714fdbac92273bcec564d1','8cbb4da953974a2b92e57e86038307a1','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:34:47','2025-02-06 14:34:47','',303),(37,'634f19d3906b46ccbad2d611eb0bb23d','ccf8d8d289714fdbac92273bcec564d1','36bd7dc1deb046d1b281194641325a7b','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'同学们，今天咱们一对一开讲啦！你知道吗？AI 师傅还只是个新手，就像个刚学会走路的小朋友，未来会怎么发展，我们自己都不清楚呢！哈哈，但不管怎样，咱们一起出发吧！欢迎加入我们，和AI 师傅一起探索这个神奇的世界，看看我们能发现些什么奇妙的东西！',0,'2025-02-06 14:34:50','2025-02-06 14:34:50','',301),(38,'15bdcbb7b1a346dcadda31869ffae524','ccf8d8d289714fdbac92273bcec564d1','36bd7dc1deb046d1b281194641325a7b','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:34:56','2025-02-06 14:34:56','',301),(39,'cb39336d719049c19d8fbafc62734543','ccf8d8d289714fdbac92273bcec564d1','ff838172afe24da2bd119fb604b914da','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'![img](https://img.agiclass.cn/aishifu-1v1.jpg)',0,'2025-02-06 14:34:56','2025-02-06 14:34:56','',303),(40,'dec083f625f4464dbd137fae35b5f73b','ccf8d8d289714fdbac92273bcec564d1','ff838172afe24da2bd119fb604b914da','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:35:02','2025-02-06 14:35:02','',303),(41,'3eebd37dbe3042fa8e6c68c1bf9ea17f','ccf8d8d289714fdbac92273bcec564d1','4eb6c38093a04105a810c535e17a215c','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'你好 Lea，很高兴成为你专属的 AI 师傅！我已经记录了你提供的信息，接下来我会根据你的背景进行个性化的教学。为了更好地跟踪你的学习进度，需要你提供一个手机号码来创建个人账号。这样我们就能更好地保存你的信息和学习进度了。请告诉我你的手机号吧！',0,'2025-02-06 14:35:04','2025-02-06 14:35:04','',308),(42,'45c64e6a000a46fd82a381641cf5bfd7','4efffb6b19dd4539a8c0992a3f553a4b','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'你好呀， 初次见面！欢迎来到「AI 师傅」一对一学习社区。🎉\n\n我是AI 师傅，AI 主导的对话流，也就是说，接下来我们全程会以这样的对话形式进行。\n\n不过，咱们的对话内容是精心设计的，对话环境是封闭的，不用担心数据泄漏，AI 师傅会守护好你的个人信息！\n\n另外，提醒一句的是，我的每句话都是实时的，所以我会边想边说，你的每次输入也都会影响我说的话，还请你边看边想，等我慢慢讲完。\n\n万一，我没理解你的意思，反复询问你，或者胡言乱语，你发动你的沟通技能多跟我讲一些，或者向我追问都是可以的！！',0,'2025-02-06 14:39:17','2025-02-06 14:39:17','',303),(43,'4db5d0062e094dd9aad6a8fb9c3770af','4efffb6b19dd4539a8c0992a3f553a4b','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:39:19','2025-02-06 14:39:19','',303),(44,'448dbeb6fd6a4e0fb5a359d98781cdae','4efffb6b19dd4539a8c0992a3f553a4b','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'我很高兴能和你在这里交流～\n\n那么新朋友，你希望我接下来怎么称呼你呀？',0,'2025-02-06 14:39:19','2025-02-06 14:39:19','',302),(45,'0ccca77a10df41f8ab055820dee94cf9','4efffb6b19dd4539a8c0992a3f553a4b','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'没懂你的意思',0,'2025-02-06 14:39:28','2025-02-06 14:39:28','{\"type\": \"input\", \"content\": {\"content\": \"\\u8bf7\\u8f93\\u5165\\u4f60\\u7684\\u6635\\u79f0\"}, \"lesson_id\": \"4d3a41a6594c4ac180e0c6ec16bd63ae\", \"script_id\": \"01fff062b9a44e748988e58ff50f776b\"}',302),(46,'4a26b2ad07fa4bb385153ccaacaf589d','4efffb6b19dd4539a8c0992a3f553a4b','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'昵称不能为空',0,'2025-02-06 14:39:28','2025-02-06 14:39:28','',302),(47,'e6728633a85a4fa1a40b8c0e3714f4ca','4efffb6b19dd4539a8c0992a3f553a4b','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'我希望你称呼我“没懂你的意思”',0,'2025-02-06 14:39:57','2025-02-06 14:39:57','{\"type\": \"input\", \"content\": {\"content\": \"\\u8bf7\\u8f93\\u5165\\u4f60\\u7684\\u6635\\u79f0\"}, \"lesson_id\": \"4d3a41a6594c4ac180e0c6ec16bd63ae\", \"script_id\": \"01fff062b9a44e748988e58ff50f776b\"}',302),(48,'9b7ad77cc79548338d8916703f7ba40c','4efffb6b19dd4539a8c0992a3f553a4b','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'昵称过长',0,'2025-02-06 14:39:57','2025-02-06 14:39:57','',302),(49,'bb7b46e939704764b7e518ee62919fa9','4efffb6b19dd4539a8c0992a3f553a4b','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'没意思',0,'2025-02-06 14:40:09','2025-02-06 14:40:09','{\"type\": \"input\", \"content\": {\"content\": \"\\u8bf7\\u8f93\\u5165\\u4f60\\u7684\\u6635\\u79f0\"}, \"lesson_id\": \"4d3a41a6594c4ac180e0c6ec16bd63ae\", \"script_id\": \"01fff062b9a44e748988e58ff50f776b\"}',302),(50,'bdf6eb0b71dc4f2a91118a5f732436c5','4efffb6b19dd4539a8c0992a3f553a4b','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'昵称不能包含不适当的内容',0,'2025-02-06 14:40:09','2025-02-06 14:40:09','',302),(51,'a709feb98e25480cac02bbaf9d146862','4efffb6b19dd4539a8c0992a3f553a4b','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'啊Q',0,'2025-02-06 14:40:20','2025-02-06 14:40:20','{\"type\": \"input\", \"content\": {\"content\": \"\\u8bf7\\u8f93\\u5165\\u4f60\\u7684\\u6635\\u79f0\"}, \"lesson_id\": \"4d3a41a6594c4ac180e0c6ec16bd63ae\", \"script_id\": \"01fff062b9a44e748988e58ff50f776b\"}',302),(52,'1fc1f33047ed4ae3826709d51c921d5e','4efffb6b19dd4539a8c0992a3f553a4b','4e8816cb4c81422fafbbda1be4b42a3d','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'啊Q这个名字挺有意思的，寓意着机智勇敢，真是个好名字！你选择来到AI师傅学习社区，真是个明智的选择，这预示着你对新知识的渴望和对未来的探索。如果想换个名字，可以到「设置」里修改称呼哦～',0,'2025-02-06 14:40:22','2025-02-06 14:40:22','',301),(53,'e94e95b55363497fa88d6c7b5ac78c2b','4efffb6b19dd4539a8c0992a3f553a4b','4e8816cb4c81422fafbbda1be4b42a3d','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:40:28','2025-02-06 14:40:28','',301),(54,'b56b64be04f84d37a3a647ee00fc5a43','1a174a94d1a44d2997a9c9d57c2fd8c9','af42dfafd9c148a8b25bdfaad9495d1f','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'大家好，我是AI师傅，一个由大语言模型驱动的向导。目前平台上的课程还比较有限，开源的技术也还在发展中，合作的模式也还不够成熟。但正是这些挑战激发了我们不断前进的动力，也让我们相信未来会有更多的可能性等待我们去探索。\n\n那你是因为什么而来，为什么会对AI师傅感兴趣呢？',0,'2025-02-06 14:40:30','2025-02-06 14:40:30','',305),(55,'ee4e74b51ac14283ac5fadd2f8bdcc2f','1a174a94d1a44d2997a9c9d57c2fd8c9','af42dfafd9c148a8b25bdfaad9495d1f','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'其他',0,'2025-02-06 14:40:33','2025-02-06 14:40:33','{\"type\": \"buttons\", \"content\": {\"title\": \"\\u544a\\u8bc9\\u4f60\\u4e3a\\u4ec0\\u4e48\\u800c\\u6765\\u5440\\uff5e\", \"buttons\": [{\"label\": \"\\u5b66\\u4e60\\u8bfe\\u7a0b\\u5185\\u5bb9\", \"value\": \"\\u5b66\\u4e60\\u8bfe\\u7a0b\\u5185\\u5bb9\", \"type\": \"select\"}, {\"label\": \"\\u4e86\\u89e3\\u4ea7\\u54c1\\u5f62\\u5f0f\", \"value\": \"\\u4e86\\u89e3\\u4ea7\\u54c1\\u5f62\\u5f0f\", \"type\": \"select\"}, {\"label\": \"\\u597d\\u5947\\u4f53\\u9a8c\\u4e00\\u4e0b\", \"value\": \"\\u597d\\u5947\\u4f53\\u9a8c\\u4e00\\u4e0b\", \"type\": \"select\"}, {\"label\": \"\\u5176\\u4ed6\", \"value\": \"\\u5176\\u4ed6\", \"type\": \"select\"}]}, \"lesson_id\": \"158fa2505c0345e296827e6e4f227618\", \"script_id\": \"af42dfafd9c148a8b25bdfaad9495d1f\"}',305),(56,'472e32d5cc404df68cd619e64fcce663','1a174a94d1a44d2997a9c9d57c2fd8c9','b9a1d6d51c5849ca86a5c15d1a9efbbb','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'我们看看是什么原因，把你带到我身边！\n\n如果你选择的是“其他”，那可能是因为你对AI师傅还有些好奇或者有其他的需求。如果你是想学习课程内容，那可是来对地方了，别看AI师傅现在课程少，每一门都是不断迭代的精品课程，而且这里的课程学习起来很不一样，尽快进入课程，体验一对一的个性化吧。\n\n如果你是想用AI师傅来做自己的课程产品，可以选择 1.服务号找到我们进行课程的内容合作，服务号：AI师傅-一对一学习社区；2.直接去 GitHub 开源地址里自行配置，对，我们的项目已经开源了！服务号里有开源地址哦～\n\n如果你是好奇体验一下，那真是太好了，感谢你的好奇带你来到我身边，AI师傅有很多惊喜等着你，可以从我们沟通中慢慢对我加深了解。\n\n如果你选择的是“其他”，看来是我想不到的理由了，如果有需要你可以关注我们的服务号：AI师傅-一对一学习社区，加上我们跟我们详细聊～\n\n总之，很开心遇到你，与你有这次的对话。',0,'2025-02-06 14:40:42','2025-02-06 14:40:42','',303),(57,'79ac9b4be6474d9b8435e82a80a9dc33','1a174a94d1a44d2997a9c9d57c2fd8c9','b9a1d6d51c5849ca86a5c15d1a9efbbb','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:40:43','2025-02-06 14:40:43','',303),(58,'e07452b93814434f9301fee06106f374','1a174a94d1a44d2997a9c9d57c2fd8c9','a11a7c48a2354d32b2f3f44a8ac7dccc','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'大家好，我是你的AI师傅。我们今天的交流是通过一种特别的方式进行的——我会根据你提出的问题和选择，做出相应的反馈。这种回答的逻辑虽然是由AI驱动的，但每个回答都会因为你的选择而有所不同，这样就能让你的体验更加个性化。\n\n另外，我会记录下你的输入和选择。如果后续有需要，我可以根据这些信息为你提供更针对性的讲解和建议。这样，我们就能更好地帮助你达到学习目标。',0,'2025-02-06 14:40:47','2025-02-06 14:40:47','',301),(59,'53acbc755e95448b82a169a1e6ec6f32','1a174a94d1a44d2997a9c9d57c2fd8c9','a11a7c48a2354d32b2f3f44a8ac7dccc','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'有点意思～',0,'2025-02-06 14:40:50','2025-02-06 14:40:50','',301),(60,'d414962a4d2148e7be07e2cfd185f583','1a174a94d1a44d2997a9c9d57c2fd8c9','8a69bd40cce64f21ae10f3a2ff3b2f10','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'为了帮助我进一步了解你。\n\n啊Q ，你可以试着告诉我，当前你正处于什么行业，从事什么职业的工作， 我会结合你的具体工作，给到 AI 可以为你工作赋能的一些想法！\n\n请参考下面的格式，告诉我你的工作：\n* 电商行业的运营\n* 医疗行业的猎头\n* 知识付费领域的个体创业者\n* 哲学系的大学生\n* 独立摄影师\n* 大学教授，主要教应用物理\n\n*🏷️ 提醒：建议填写你正在从事的工作，与你的关联性更紧密，会更有利于我们接下来的沟通哦～*',0,'2025-02-06 14:40:52','2025-02-06 14:40:52','',302),(61,'2d69a1f2b8484ea6b723631a469970f1','1a174a94d1a44d2997a9c9d57c2fd8c9','8a69bd40cce64f21ae10f3a2ff3b2f10','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'我希望自己能做一款软件辅助高考志愿填报',0,'2025-02-06 14:41:20','2025-02-06 14:41:20','{\"type\": \"input\", \"content\": {\"content\": \"\\u8bf7\\u8f93\\u5165\\u4f60\\u5f53\\u524d\\u7684\\u5de5\\u4f5c\\u80cc\\u666f\"}, \"lesson_id\": \"158fa2505c0345e296827e6e4f227618\", \"script_id\": \"8a69bd40cce64f21ae10f3a2ff3b2f10\"}',302),(62,'ac71727094d847baaa13dd19a112c9a1','1a174a94d1a44d2997a9c9d57c2fd8c9','8a69bd40cce64f21ae10f3a2ff3b2f10','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'输入的不是职业背景，建议再次输入您的职业背景信息',0,'2025-02-06 14:41:20','2025-02-06 14:41:20','',302),(63,'db7384ae36474c5c9f4580f6abca9ffc','1a174a94d1a44d2997a9c9d57c2fd8c9','8a69bd40cce64f21ae10f3a2ff3b2f10','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'软件研发工程师',0,'2025-02-06 14:41:39','2025-02-06 14:41:39','{\"type\": \"input\", \"content\": {\"content\": \"\\u8bf7\\u8f93\\u5165\\u4f60\\u5f53\\u524d\\u7684\\u5de5\\u4f5c\\u80cc\\u666f\"}, \"lesson_id\": \"158fa2505c0345e296827e6e4f227618\", \"script_id\": \"8a69bd40cce64f21ae10f3a2ff3b2f10\"}',302),(64,'f390637af34448feb0d2ed02a683f4e9','1a174a94d1a44d2997a9c9d57c2fd8c9','d465d9608f5a441da277ac0d715496ae','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'| 场景需求                                                                                     | 应用程序                                                                                   | 给 AI 的提示词参考                                                                                      |\n|-----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|\n| 如何快速找到并阅读相关技术文档，提高工作效率？                                                                                           | 使用AI助手搜索和推荐技术文档                                                                 | 你能帮我找到并阅读最近关于Python编程的最佳实践和技术文档吗？                                                                 |\n| 如何高效地进行代码审查和调试，减少错误？                                                                                               | 利用AI助手进行代码审查和错误检测                                                                 | 请帮我审查这段Python代码，看看有没有明显的错误或改进的空间。                                                                 |\n| 如何快速学习新技术，比如最新的编程语言或框架？                                                                                         | 利用AI助手提供学习资源和指导                                                                 | 你能给我推荐一些关于学习最新版本的Django框架的学习资源吗？                                                                 |\n| 如何更好地管理项目进度，确保按时完成任务？                                                                                             | 使用AI助手进行项目管理和进度跟踪                                                                 | 请帮我跟踪这个项目的进度，确保每个任务都在计划的时间内完成。                                                                 |\n| 如何提高代码的可读性和可维护性，提升代码质量？                                                                                         | 利用AI助手进行代码重构和优化                                                                 | 请帮我优化这段代码，使其更易于阅读和维护。                                                                 |',0,'2025-02-06 14:41:50','2025-02-06 14:41:50','',301),(65,'ad1e065155774ffe9a64c193375ea85a','1a174a94d1a44d2997a9c9d57c2fd8c9','d465d9608f5a441da277ac0d715496ae','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:42:02','2025-02-06 14:42:02','',301),(66,'998f520d2b524448864129a796d8d1d7','bd0193f71a194c8aa702d43b3aa4a0a0','c11fe7b3b7c7423bbff736cdeef5b0a9','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'大家好，我是你的AI师傅。我们今天会以一对一的方式进行学习，我会根据你的需求和情况提供个性化的指导。除了根据你的信息来定制学习内容，你还可以随时告诉我你的具体要求。\n\n你可以选择你喜欢的授课风格，比如轻松愉快、严谨详细，或者是互动性强的。告诉我你的偏好，这样我们可以更好地配合，让学习过程更加愉快和有效。',0,'2025-02-06 14:42:05','2025-02-06 14:42:05','',305),(67,'56f5088134904ef9bd69e6a7206a7f9d','bd0193f71a194c8aa702d43b3aa4a0a0','c11fe7b3b7c7423bbff736cdeef5b0a9','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'专业犀利',0,'2025-02-06 14:42:06','2025-02-06 14:42:06','{\"type\": \"buttons\", \"content\": {\"title\": \"\\u7ee7\\u7eed\", \"buttons\": [{\"label\": \"\\u5e7d\\u9ed8\\u98ce\\u8da3\", \"value\": \"\\u5e7d\\u9ed8\\u98ce\\u8da3\", \"type\": \"select\"}, {\"label\": \"\\u4e13\\u4e1a\\u7280\\u5229\", \"value\": \"\\u4e13\\u4e1a\\u7280\\u5229\", \"type\": \"select\"}, {\"label\": \"\\u9f13\\u52b1\\u6e29\\u6696\", \"value\": \"\\u9f13\\u52b1\\u6e29\\u6696\", \"type\": \"select\"}]}, \"lesson_id\": \"dac1a37cef044102982f15e6f73ded0e\", \"script_id\": \"c11fe7b3b7c7423bbff736cdeef5b0a9\"}',305),(68,'cf56d5bcee9343c6a7546064399394c1','bd0193f71a194c8aa702d43b3aa4a0a0','d8d176b9394c4a25886f24f0e355669b','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'啊Q，专业犀利的风格就是直击要害。我作为你的私人向导，就是要精准地捕捉你的需求，就像一把锋利的刀，直接切中要害。虽然现在我还在不断完善，但就像一棵正在成长的树，我会不断吸收养分，逐渐变得更加理解你，减少你在学习过程中的障碍。我们之间的沟通，就是我不断进化的过程，我会用最直接的方式帮助你达到目标。',0,'2025-02-06 14:42:09','2025-02-06 14:42:09','',301),(69,'275092a507d24a6e96b6347e54bec4bc','bd0193f71a194c8aa702d43b3aa4a0a0','d8d176b9394c4a25886f24f0e355669b','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:42:11','2025-02-06 14:42:11','',301),(70,'1ca15f53d1ca49c189f695e2483a1395','bd0193f71a194c8aa702d43b3aa4a0a0','f2b6b136907a4004a08e92b81870081e','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'了解了AI师傅的个性化学习，AI师傅到底有什么实际的作用呢？\n\n1. **教育培训**：AI师傅可以根据你的学习进度和兴趣，提供定制化的教学内容，就像一个私人教练一样，帮助你更好地掌握知识。\n2. **小说故事**：如果你喜欢阅读，AI师傅可以带你进入一个充满想象力的故事世界，根据你的选择和反馈，故事会不断变化，让你的阅读体验更加丰富。\n3. **产品指南**：无论是电子产品还是日常用品，AI师傅都能提供详细的使用指南，帮助你快速上手，解决使用中的困惑。\n4. **调查问卷**：在参与调查时，AI师傅会根据你的回答调整后续的问题，确保你获得最准确的信息，同时也能提高你的参与度。\n5. **游戏NPC**：在游戏里，AI师傅可以扮演NPC角色，与你进行互动，让你的游戏体验更加真实和有趣。\n\n通过这些场景，AI师傅不仅能提供个性化的服务，还能让你的体验更加沉浸和有趣。',0,'2025-02-06 14:42:22','2025-02-06 14:42:22','',301),(71,'ce65c28688924ac595058c08dcf5c4f4','bd0193f71a194c8aa702d43b3aa4a0a0','f2b6b136907a4004a08e92b81870081e','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:46:45','2025-02-06 14:46:45','',301),(72,'551329ec149643fabc0ff77fedcfcc58','bd0193f71a194c8aa702d43b3aa4a0a0','5695d8a500fa48fab34c7a714f544c40','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'讲起来还是有点难理解的，啊Q ，邀请你进入AI 师傅的官网 ：<a href=\" \" target=\"_blank\">AI-shifu.com </a > ，目前我们有一门自营课程《跟AI学编程》，在学习的过程更深入了解我们。\n\n第一节是体验课，可以免费学习，具体感受下AI 师傅在教育场景的应用。\n\n<img src=\"https://img.agiclass.cn/image.png\" style=\"width : 80%\" > ',0,'2025-02-06 14:46:47','2025-02-06 14:46:47','',301),(73,'772243ac75f2440a99fdb91aa173fea8','bd0193f71a194c8aa702d43b3aa4a0a0','5695d8a500fa48fab34c7a714f544c40','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:46:50','2025-02-06 14:46:50','',301),(74,'f24b125c4c8b4e1ea5b9b6f98a159eb9','0a633a859858427a89f23b35e8704d7d','f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'这里需要特别提醒的是，在AI 主导的对话流中，你是可以随时就课程的内容做追问的。\n\n**AI 降低了讲师高高在上的姿态，而是以学习者为中心。不懂就问，是主动学习的开始！**\n\n下面是一个提问的提示词，你可以复制到输入框，体验向 AI 提问的感觉。（也可以自由发挥）\n\n📖 提示词参考\n\n```markdown\nAI 师傅是哪个团队开发的？\n```\n\n*🏷️ 提醒：AI 师傅非常鼓励提问，但是会做提问内容的限制，需要你的问题与当前课程内容有关，问完也希望你尽快回到主线上继续学习。*',0,'2025-02-06 14:46:53','2025-02-06 14:46:53','',302),(75,'f249b265b2994b0b9b48a5b54d5e97a7','0a633a859858427a89f23b35e8704d7d','f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'AI 师傅可以替代人吗？',0,'2025-02-06 14:47:21','2025-02-06 14:47:21','{\"type\": \"input\", \"content\": {\"content\": \"\\u8f93\\u5165\\u4f53\\u9a8c\\u4efb\\u52a1\\u7684\\u6307\\u4ee4\"}, \"lesson_id\": \"92d652812ded4766b11068511ee8ba25\", \"script_id\": \"f3e0011c85794a0d943ef45fd3fe244d\"}',302),(76,'ab3f99a86731409c857537382cdbacbd','0a633a859858427a89f23b35e8704d7d','f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'涉及敏感话题，建议提问与AI师傅产品相关的问题。',0,'2025-02-06 14:47:21','2025-02-06 14:47:21','',302),(77,'df09a49f46c34eb9811b4290089fab77','0a633a859858427a89f23b35e8704d7d','f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'AI 师傅可以替代人进行教学吗？',0,'2025-02-06 14:47:40','2025-02-06 14:47:40','{\"type\": \"input\", \"content\": {\"content\": \"\\u8f93\\u5165\\u4f53\\u9a8c\\u4efb\\u52a1\\u7684\\u6307\\u4ee4\"}, \"lesson_id\": \"92d652812ded4766b11068511ee8ba25\", \"script_id\": \"f3e0011c85794a0d943ef45fd3fe244d\"}',302),(78,'50b656fd17304da4857219444e69060d','0a633a859858427a89f23b35e8704d7d','8cbb4da953974a2b92e57e86038307a1','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'当然可以和你聊聊这个话题！首先，AI 师傅是由 AI-Shifu 团队和哈工大智能软件工程研究中心合作开发的，2024 年 10 月 24 日正式向全球开源。你可以在 AI-Shifu.com 上找到我们精心设计的课程，比如《跟AI学编程》。AI 师傅是一个由大语言模型驱动的向导，与传统的由人类主导的聊天机器人不同，它是 AI 主导对话流。这意味着在学习过程中，你可以随时提问，影响对话内容，但最终还是会回到 AI 设定的故事线。AI 师傅会根据你的身份背景、兴趣偏好等做个性化输出，让你有被一对一服务的感受。无论是教育培训、小说故事，还是其他场景，AI 师傅都能提供更具互动性和沉浸感的体验。',0,'2025-02-06 14:47:48','2025-02-06 14:47:48','',303),(79,'c3b2516770a349c488d5f605e3fcee9e','0a633a859858427a89f23b35e8704d7d','8cbb4da953974a2b92e57e86038307a1','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:47:54','2025-02-06 14:47:54','',303),(80,'34f8dcba361c4ceabb1e7a47b5da13ee','0a633a859858427a89f23b35e8704d7d','36bd7dc1deb046d1b281194641325a7b','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'AI师傅，是基于大语言模型驱动的个性化教学助手。目前我们还处于探索阶段，AI技术日新月异，未来会怎样，我们也不得而知。但既然选择了这条路，那就让我们一起出发，开启这段奇妙的旅程吧！欢迎加入我们，与AI师傅共同探索未知的可能。',0,'2025-02-06 14:47:56','2025-02-06 14:47:56','',301),(81,'dd67247c3f294bccbc2f35f7509442a2','0a633a859858427a89f23b35e8704d7d','36bd7dc1deb046d1b281194641325a7b','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:47:58','2025-02-06 14:47:58','',301),(82,'e5e3e8c0752a4b2da5fd339ee76abcf8','0a633a859858427a89f23b35e8704d7d','ff838172afe24da2bd119fb604b914da','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'![img](https://img.agiclass.cn/aishifu-1v1.jpg)',0,'2025-02-06 14:47:58','2025-02-06 14:47:58','',303),(83,'21e2dae236734af89813fb79e1efee74','0a633a859858427a89f23b35e8704d7d','ff838172afe24da2bd119fb604b914da','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:48:01','2025-02-06 14:48:01','',303),(84,'a470a05edf124aeda0849bae1f290aa6','0a633a859858427a89f23b35e8704d7d','4eb6c38093a04105a810c535e17a215c','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'啊Q，很高兴见到你！我是你的专属AI师傅，能够根据你的需求提供个性化的指导和支持。接下来，为了更好地为你服务，需要你提供一个手机号，这样我可以为你创建个人账号，记录你的学习进度和个人信息。有了这个账号，我们可以更方便地跟踪你的学习情况，为你提供更加贴心的服务。如果你愿意，现在就把手机号告诉我吧！',0,'2025-02-06 14:48:03','2025-02-06 14:48:03','',308),(85,'9bf3b898a3fd49cb86335f78d7a794a2','d178b98fac984ae3b1d52f8fc6b9527c','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'你好呀， 初次见面！欢迎来到「AI 师傅」一对一学习社区。🎉\n\n我是AI 师傅，AI 主导的对话流，也就是说，接下来我们全程会以这样的对话形式进行。\n\n不过，咱们的对话内容是精心设计的，对话环境是封闭的，不用担心数据泄漏，AI 师傅会守护好你的个人信息！\n\n另外，提醒一句的是，我的每句话都是实时的，所以我会边想边说，你的每次输入也都会影响我说的话，还请你边看边想，等我慢慢讲完。\n\n万一，我没理解你的意思，反复询问你，或者胡言乱语，你发动你的沟通技能多跟我讲一些，或者向我追问都是可以的！！',0,'2025-02-06 14:48:59','2025-02-06 14:48:59','',303),(86,'4680ac0899eb4c75ac10ee2423b0491f','d178b98fac984ae3b1d52f8fc6b9527c','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:49:00','2025-02-06 14:49:00','',303),(87,'55ce74a32f154efe86d5d5c0f55ebb5d','d178b98fac984ae3b1d52f8fc6b9527c','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'我很高兴能和你在这里交流～\n\n那么新朋友，你希望我接下来怎么称呼你呀？',0,'2025-02-06 14:49:00','2025-02-06 14:49:00','',302),(88,'1066d7f4065c4ced953b4a842206345b','d178b98fac984ae3b1d52f8fc6b9527c','01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'麻瓜',0,'2025-02-06 14:49:08','2025-02-06 14:49:08','{\"type\": \"input\", \"content\": {\"content\": \"\\u8bf7\\u8f93\\u5165\\u4f60\\u7684\\u6635\\u79f0\"}, \"lesson_id\": \"4d3a41a6594c4ac180e0c6ec16bd63ae\", \"script_id\": \"01fff062b9a44e748988e58ff50f776b\"}',302),(89,'364fdea4aa944c51ae6d83386b68d13e','d178b98fac984ae3b1d52f8fc6b9527c','4e8816cb4c81422fafbbda1be4b42a3d','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'麻瓜同学，这个名字真有趣！它既保留了传统又带点新意，挺适合你的。你来到AI师傅学习社区，真是个前瞻性的决定呢！如果想换个名字，可以到「设置」里修改称呼哦～',0,'2025-02-06 14:49:10','2025-02-06 14:49:10','',301),(90,'41c45a90019843caa55d3503fe3879af','d178b98fac984ae3b1d52f8fc6b9527c','4e8816cb4c81422fafbbda1be4b42a3d','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:49:12','2025-02-06 14:49:12','',301),(91,'ae535ce306f84bad87cf200d23fc3576','cb6cc02011d94b5180457730cccfd895','af42dfafd9c148a8b25bdfaad9495d1f','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'大家好，我是你的AI师傅，一个由大语言模型驱动的私人向导。目前，AI师傅还处于早期阶段，平台上的课程还不算多，开源的技术也还在发展中，合作的模式也还不够成熟。但正是这些挑战让我们看到了更多的可能性。\n\n那么，你是因为什么而来，为什么会对AI师傅感兴趣呢？',0,'2025-02-06 14:49:38','2025-02-06 14:49:38','',305),(92,'df081cada02f40e9bc475c0c4f4fe8cd','cb6cc02011d94b5180457730cccfd895','af42dfafd9c148a8b25bdfaad9495d1f','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'了解产品形式',0,'2025-02-06 14:49:41','2025-02-06 14:49:41','{\"type\": \"buttons\", \"content\": {\"title\": \"\\u544a\\u8bc9\\u4f60\\u4e3a\\u4ec0\\u4e48\\u800c\\u6765\\u5440\\uff5e\", \"buttons\": [{\"label\": \"\\u5b66\\u4e60\\u8bfe\\u7a0b\\u5185\\u5bb9\", \"value\": \"\\u5b66\\u4e60\\u8bfe\\u7a0b\\u5185\\u5bb9\", \"type\": \"select\"}, {\"label\": \"\\u4e86\\u89e3\\u4ea7\\u54c1\\u5f62\\u5f0f\", \"value\": \"\\u4e86\\u89e3\\u4ea7\\u54c1\\u5f62\\u5f0f\", \"type\": \"select\"}, {\"label\": \"\\u597d\\u5947\\u4f53\\u9a8c\\u4e00\\u4e0b\", \"value\": \"\\u597d\\u5947\\u4f53\\u9a8c\\u4e00\\u4e0b\", \"type\": \"select\"}, {\"label\": \"\\u5176\\u4ed6\", \"value\": \"\\u5176\\u4ed6\", \"type\": \"select\"}]}, \"lesson_id\": \"158fa2505c0345e296827e6e4f227618\", \"script_id\": \"af42dfafd9c148a8b25bdfaad9495d1f\"}',305),(93,'0a7dd12d913d4708ad7693b472454a75','cb6cc02011d94b5180457730cccfd895','b9a1d6d51c5849ca86a5c15d1a9efbbb','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'我们看看是什么原因，把你带到我身边！\n\n如果你是想深入了解AI师傅的产品形式，那真是太好了！AI师傅是一个由大语言模型驱动的向导，由AI主导的对话流。我们的目标是为你提供个性化的教学服务，让你的学习体验更加高效和有趣。如果你是想学习课程内容，那你可是来对地方了，别看AI师傅现在课程少，每一门都是不断迭代的精品课程，而且这里的课程学习起来很不一样，尽快进入课程，体验一对一的个性化吧。\n\n如果你是想用AI师傅来做自己的课程产品，可以选择服务号找到我们进行课程的内容合作，服务号：AI师傅-一对一学习社区；也可以直接去GitHub开源地址里自行配置，我们的项目已经开源了！服务号里有开源地址哦～\n\n如果你是好奇体验一下，那就更好了！好奇是打开新世界的钥匙，感谢你的好奇带你来到我身边，AI师傅有很多惊喜等着你，可以从我们沟通中慢慢对我加深了解。\n\n如果你有其他理由，看来是我想不到的理由了，如果有需要你可以关注我们的服务号：AI师傅-一对一学习社区，加上我们跟我们详细聊～\n\n总之，很开心遇到你，与你有这次的对话。',0,'2025-02-06 14:49:48','2025-02-06 14:49:48','',303),(94,'17acf62a29e5459c83f95845f0f9b69f','cb6cc02011d94b5180457730cccfd895','b9a1d6d51c5849ca86a5c15d1a9efbbb','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:49:49','2025-02-06 14:49:49','',303),(95,'7499b4b74de94fbdb018e5d2865bfd94','cb6cc02011d94b5180457730cccfd895','a11a7c48a2354d32b2f3f44a8ac7dccc','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'大家好，我是你的AI师傅。今天，我会根据你提出的问题和选择做出不同的反馈。这种反馈的逻辑虽然是由AI控制的，但每个回答都会根据你的具体输入和选择有所不同，这样就能实现一定的个性化教学。\n\n我会记录你的输入和选择，这样在后续的课程中，如果需要更详细的讲解或有特定的问题，我就能更好地针对你的情况进行指导。这样，我们就能更高效地达到学习目标。',0,'2025-02-06 14:49:52','2025-02-06 14:49:52','',301),(96,'b9eee539e8044203980a4a8ffa10e8ca','cb6cc02011d94b5180457730cccfd895','a11a7c48a2354d32b2f3f44a8ac7dccc','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'有点意思～',0,'2025-02-06 14:49:57','2025-02-06 14:49:57','',301),(97,'2d640c9d5b7d4ef5b5c822edcf24e81d','cb6cc02011d94b5180457730cccfd895','8a69bd40cce64f21ae10f3a2ff3b2f10','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'为了帮助我进一步了解你。\n\n麻瓜 ，你可以试着告诉我，当前你正处于什么行业，从事什么职业的工作， 我会结合你的具体工作，给到 AI 可以为你工作赋能的一些想法！\n\n请参考下面的格式，告诉我你的工作：\n* 电商行业的运营\n* 医疗行业的猎头\n* 知识付费领域的个体创业者\n* 哲学系的大学生\n* 独立摄影师\n* 大学教授，主要教应用物理\n\n*🏷️ 提醒：建议填写你正在从事的工作，与你的关联性更紧密，会更有利于我们接下来的沟通哦～*',0,'2025-02-06 14:49:59','2025-02-06 14:49:59','',302),(98,'57660b6490294dd0b61306fdf3dee78f','cb6cc02011d94b5180457730cccfd895','8a69bd40cce64f21ae10f3a2ff3b2f10','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'K12教育产品经理',0,'2025-02-06 14:50:41','2025-02-06 14:50:41','{\"type\": \"input\", \"content\": {\"content\": \"\\u8bf7\\u8f93\\u5165\\u4f60\\u5f53\\u524d\\u7684\\u5de5\\u4f5c\\u80cc\\u666f\"}, \"lesson_id\": \"158fa2505c0345e296827e6e4f227618\", \"script_id\": \"8a69bd40cce64f21ae10f3a2ff3b2f10\"}',302),(99,'da6bff079597417a8c7796366d36ef70','cb6cc02011d94b5180457730cccfd895','d465d9608f5a441da277ac0d715496ae','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'| 场景需求 | 应用程序 | 给 AI 的提示词参考 |\n| --- | --- | --- |\n| 如何快速获取竞品分析报告？ | 使用AI进行竞品分析，提取关键信息并生成报告 | 请帮我分析竞品A、B、C的产品功能、用户评价和市场表现，生成一份详细的报告 |\n| 如何提高产品文档的清晰度？ | 利用AI进行文档优化，帮助改进语言表达和结构 | 请帮我优化这份产品需求文档，让它更清晰易懂 |\n| 如何更高效地进行用户访谈？ | 使用AI辅助整理用户访谈记录，提取关键反馈 | 请帮我整理这次用户访谈的录音，提取出用户的主要反馈和建议 |\n| 如何快速找到产品设计中的问题？ | 利用AI进行设计审查，帮助识别潜在问题 | 请帮我检查这份产品设计稿，找出可能存在的问题和改进点 |\n| 如何提高市场调研的效率？ | 使用AI进行市场数据收集和分析，帮助发现趋势 | 请帮我收集并分析最近一年内关于竞品A的市场数据，找出其市场表现的趋势 |',0,'2025-02-06 14:50:48','2025-02-06 14:50:48','',301),(100,'78327bb0c731470c8edc3fcd6ca16449','cb6cc02011d94b5180457730cccfd895','d465d9608f5a441da277ac0d715496ae','158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:51:11','2025-02-06 14:51:11','',301),(101,'840abfbf36db424fa1d8c92e5bcb7c44','82f53b4af38c443299cf3303d9908fe0','c11fe7b3b7c7423bbff736cdeef5b0a9','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'大家好，我是你的AI师傅，一个由大语言模型驱动的私人向导。我们的目标是通过个性化的教学，帮助你实现学习目标。除了根据你的信息定制学习内容，你还可以随时提出自己的需求和期望。\n\n那么，首先我想了解一下，你更倾向于哪种授课风格呢？比如，你喜欢详细解释还是更喜欢快速过一遍重点？或者是希望我多提供一些实例和练习，让你更好地理解和掌握知识？你可以随意告诉我，我会根据你的偏好调整教学方式。',0,'2025-02-06 14:51:14','2025-02-06 14:51:14','',305),(102,'882da11e0b054facaaf6fe4bc388ec59','82f53b4af38c443299cf3303d9908fe0','c11fe7b3b7c7423bbff736cdeef5b0a9','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'鼓励温暖',0,'2025-02-06 14:51:17','2025-02-06 14:51:17','{\"type\": \"buttons\", \"content\": {\"title\": \"\\u7ee7\\u7eed\", \"buttons\": [{\"label\": \"\\u5e7d\\u9ed8\\u98ce\\u8da3\", \"value\": \"\\u5e7d\\u9ed8\\u98ce\\u8da3\", \"type\": \"select\"}, {\"label\": \"\\u4e13\\u4e1a\\u7280\\u5229\", \"value\": \"\\u4e13\\u4e1a\\u7280\\u5229\", \"type\": \"select\"}, {\"label\": \"\\u9f13\\u52b1\\u6e29\\u6696\", \"value\": \"\\u9f13\\u52b1\\u6e29\\u6696\", \"type\": \"select\"}]}, \"lesson_id\": \"dac1a37cef044102982f15e6f73ded0e\", \"script_id\": \"c11fe7b3b7c7423bbff736cdeef5b0a9\"}',305),(103,'3ec7be7d34654c44a071076079aa9aec','82f53b4af38c443299cf3303d9908fe0','d8d176b9394c4a25886f24f0e355669b','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'麻瓜，你好呀！很高兴能成为你的私教。想象一下，我就像一个温暖的向导，时刻陪伴在你身边，倾听你的每一个愿望和需求。我们之间的沟通，就像是朋友之间的交流，我非常在意你对我的感受和期望。\n\n虽然我现在还很年轻，还有很多需要学习的地方，但我会像一颗种子一样，不断吸收养分，逐渐成长为一棵大树，更好地为你遮风挡雨。我会努力理解你，减少你在学习路上的困扰，让我们的旅程更加顺畅和愉快。我们一起加油吧！',0,'2025-02-06 14:51:22','2025-02-06 14:51:22','',301),(104,'d5694aea043e4f65a43d0d6a38b49921','82f53b4af38c443299cf3303d9908fe0','d8d176b9394c4a25886f24f0e355669b','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:51:24','2025-02-06 14:51:24','',301),(105,'5d5cda7d39d340d09882af50b3970823','82f53b4af38c443299cf3303d9908fe0','f2b6b136907a4004a08e92b81870081e','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'了解了AI师傅的个性化学习，AI师傅到底有什么实际的作用呢？\n\n1. **教育培训**：AI师傅可以根据你的学习进度和理解能力，调整教学内容和难度，提供个性化的学习路径。比如，如果你在某个知识点上遇到困难，AI师傅可以提供更多的解释和实例，直到你完全理解为止。\n2. **小说故事**：在阅读或创作小说时，AI师傅可以作为引导者，帮助你构建情节，提供角色对话，甚至生成场景描述，让你的故事更加丰富和生动。\n3. **产品指南**：如果你正在学习使用某个新产品，AI师傅可以作为你的私人教练，一步步引导你完成操作，解答你在使用过程中遇到的问题，确保你能够顺利上手。\n4. **调查问卷**：在设计调查问卷时，AI师傅可以帮助你构思问题，确保问卷的逻辑性和有效性，同时还能根据用户反馈实时调整，提高问卷的质量。\n5. **游戏NPC**：在游戏开发中，AI师傅可以作为NPC（非玩家角色）的对话设计者，确保NPC的对话更加自然和连贯，提升游戏的沉浸感和互动性。\n\n无论你是学习新知识，还是创作故事，AI师傅都能提供一个互动性和沉浸感更强的学习或创作环境。',0,'2025-02-06 14:51:35','2025-02-06 14:51:35','',301),(106,'41a607950cbe44ef82abe1993b90cd58','82f53b4af38c443299cf3303d9908fe0','f2b6b136907a4004a08e92b81870081e','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:51:36','2025-02-06 14:51:36','',301),(107,'a0859131f4a24c998066df89bac95f93','82f53b4af38c443299cf3303d9908fe0','5695d8a500fa48fab34c7a714f544c40','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'讲起来还是有点难理解的，麻瓜 ，邀请你进入AI 师傅的官网 ：<a href=\" \" target=\"_blank\">AI-shifu.com </a > ，目前我们有一门自营课程《跟AI学编程》，在学习的过程更深入了解我们。\n\n第一节是体验课，可以免费学习，具体感受下AI 师傅在教育场景的应用。\n\n<img src=\"https://img.agiclass.cn/image.png\" style=\"width : 80%\" > ',0,'2025-02-06 14:51:39','2025-02-06 14:51:39','',301),(108,'a03ccdca1f8f47d9b40d9899466ba77b','82f53b4af38c443299cf3303d9908fe0','5695d8a500fa48fab34c7a714f544c40','dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:51:57','2025-02-06 14:51:57','',301),(109,'06a633b5426241f6a71decb8ed578479','ac2561b879ee4d7b94bf2616e33fa85b','f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'这里需要特别提醒的是，在AI 主导的对话流中，你是可以随时就课程的内容做追问的。\n\n**AI 降低了讲师高高在上的姿态，而是以学习者为中心。不懂就问，是主动学习的开始！**\n\n下面是一个提问的提示词，你可以复制到输入框，体验向 AI 提问的感觉。（也可以自由发挥）\n\n📖 提示词参考\n\n```markdown\nAI 师傅是哪个团队开发的？\n```\n\n*🏷️ 提醒：AI 师傅非常鼓励提问，但是会做提问内容的限制，需要你的问题与当前课程内容有关，问完也希望你尽快回到主线上继续学习。*',0,'2025-02-06 14:52:00','2025-02-06 14:52:00','',302),(110,'89f2746cecd348259b0ad26339e59ac6','ac2561b879ee4d7b94bf2616e33fa85b','f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'AI 师傅能输出语音吗？',0,'2025-02-06 14:52:20','2025-02-06 14:52:20','{\"type\": \"input\", \"content\": {\"content\": \"\\u8f93\\u5165\\u4f53\\u9a8c\\u4efb\\u52a1\\u7684\\u6307\\u4ee4\"}, \"lesson_id\": \"92d652812ded4766b11068511ee8ba25\", \"script_id\": \"f3e0011c85794a0d943ef45fd3fe244d\"}',302),(111,'b42b917b09d440028b11557250dba85f','ac2561b879ee4d7b94bf2616e33fa85b','8cbb4da953974a2b92e57e86038307a1','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'同学，AI 师傅是 AI 主导的对话流，虽然在过程中你可以随时提问，但最终还是会回到 AI 主导的故事线。至于语音输出，目前我们主要是通过文字交流，不过未来可能会增加语音功能。你可以在 AI-Shifu.com 上了解更多关于我们提供的课程和体验。',0,'2025-02-06 14:52:22','2025-02-06 14:52:22','',303),(112,'c33fc229c2cd4f1d8081bdb9182981f7','ac2561b879ee4d7b94bf2616e33fa85b','8cbb4da953974a2b92e57e86038307a1','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:52:29','2025-02-06 14:52:29','',303),(113,'238778fad8704160bae271d628871968','ac2561b879ee4d7b94bf2616e33fa85b','36bd7dc1deb046d1b281194641325a7b','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'同学们，很高兴见到你！AI 师傅还处于起步阶段，随着AI 技术的进步，以及我们大家的共同努力，未来会怎样，我们都不清楚。但重要的是，我们现在就开始探索，一起前进。欢迎加入我们，让我们与AI 师傅一起开启这段旅程吧！',0,'2025-02-06 14:52:31','2025-02-06 14:52:31','',301),(114,'693f6c493b0345e19cfa742d62381c44','ac2561b879ee4d7b94bf2616e33fa85b','36bd7dc1deb046d1b281194641325a7b','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:52:33','2025-02-06 14:52:33','',301),(115,'85d0ab58669a4e30b52a5c8ecfc97e17','ac2561b879ee4d7b94bf2616e33fa85b','ff838172afe24da2bd119fb604b914da','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'![img](https://img.agiclass.cn/aishifu-1v1.jpg)',0,'2025-02-06 14:52:33','2025-02-06 14:52:33','',303),(116,'9c3aed77027d4f509903d0886e923935','ac2561b879ee4d7b94bf2616e33fa85b','ff838172afe24da2bd119fb604b914da','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,2,'继续',0,'2025-02-06 14:52:35','2025-02-06 14:52:35','',303),(117,'1d0f8e1d524145578723401f3df39f46','ac2561b879ee4d7b94bf2616e33fa85b','4eb6c38093a04105a810c535e17a215c','92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'麻瓜，很高兴遇到你！我是一个由大语言模型驱动的私人向导，AI 师傅。我的任务是根据你的需求和背景，提供个性化的教学服务。为了更好地跟踪你的学习进度，我需要你提供一个手机号来创建个人账号。这将帮助我们记录你的学习历程，确保每次学习都能从上次的位置继续。\n\n如果你有任何疑问或需要帮助，随时可以告诉我。我们开始吧！',0,'2025-02-06 14:52:41','2025-02-06 14:52:41','',308),(118,'0dc023c5d13a4800b9e3af82826bc6d5','82688c37b62b4206ae2bf95ef478120c','d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','6d65908c47bb4dad9b2450d70d7eca53',0,1,'你好呀， 初次见面！欢迎来到「AI 师傅」一对一学习社区。🎉\n\n我是AI 师傅，AI 主导的对话流，也就是说，接下来我们全程会以这样的对话形式进行。\n\n不过，咱们的对话内容是精心设计的，对话环境是封闭的，不用担心数据泄漏，AI 师傅会守护好你的个人信息！\n\n另外，提醒一句的是，我的每句话都是实时的，所以我会边想边说，你的每次输入也都会影响我说的话，还请你边看边想，等我慢慢讲完。\n\n万一，我没理解你的意思，反复询问你，或者胡言乱语，你发动你的沟通技能多跟我讲一些，或者向我追问都是可以的！！',0,'2025-02-07 01:11:42','2025-02-07 01:11:42','',303);
/*!40000 ALTER TABLE `ai_course_lesson_attendscript` ENABLE KEYS */;

--
-- Table structure for table `ai_lesson`
--

DROP TABLE IF EXISTS `ai_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_lesson` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lesson_id` varchar(36) NOT NULL COMMENT 'Lesson UUID',
  `course_id` varchar(36) NOT NULL COMMENT 'Course UUID',
  `lesson_name` varchar(255) NOT NULL COMMENT 'Lesson name',
  `lesson_desc` text NOT NULL COMMENT 'Lesson description',
  `lesson_no` varchar(32) DEFAULT NULL COMMENT 'Lesson number',
  `lesson_index` int NOT NULL COMMENT 'Lesson index',
  `lesson_feishu_id` varchar(255) NOT NULL COMMENT 'Lesson feishu ID',
  `lesson_status` int NOT NULL COMMENT 'Lesson status',
  `lesson_type` int NOT NULL COMMENT 'Lesson type',
  `lesson_summary` text NOT NULL COMMENT 'Lesson summary',
  `lesson_language` varchar(255) NOT NULL COMMENT 'Lesson language',
  `lesson_name_multi_language` text NOT NULL COMMENT 'Lesson multi language',
  `ask_count_limit` int NOT NULL COMMENT 'Ask count limit',
  `ask_model` varchar(255) NOT NULL COMMENT 'Ask count model',
  `ask_prompt` text NOT NULL COMMENT 'Ask Prompt',
  `ask_with_history` int NOT NULL COMMENT 'Ask with history Count',
  `ask_mode` int NOT NULL COMMENT 'Ask mode',
  `pre_lesson_no` varchar(255) NOT NULL COMMENT 'pre_lesson_no',
  `created_user_id` varchar(36) DEFAULT NULL COMMENT 'created user ID',
  `updated_user_id` varchar(36) DEFAULT NULL COMMENT 'updated user ID',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `status` int NOT NULL COMMENT 'Status of the lesson',
  `lesson_default_model` varchar(255) NOT NULL COMMENT 'Lesson default model',
  `lesson_default_temprature` decimal(10,2) NOT NULL COMMENT 'Lesson default temprature',
  PRIMARY KEY (`id`),
  KEY `ix_ai_lesson_course_id` (`course_id`),
  KEY `ix_ai_lesson_lesson_id` (`lesson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_lesson`
--

/*!40000 ALTER TABLE `ai_lesson` DISABLE KEYS */;
INSERT INTO `ai_lesson` VALUES (1,'8342f4b4b89e40fabec6ffab5c8f7111','d24cae29475443fdb928decbe9da6809','初次体验沟通','','00',0,'tblMH4LUaSfDwRqr',0,401,'','','',5,'','',3,5101,'','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(2,'4d3a41a6594c4ac180e0c6ec16bd63ae','d24cae29475443fdb928decbe9da6809','0.1 你好','','0001',0,'tblMH4LUaSfDwRqr',0,401,'','','',5,'','',3,5101,'','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(3,'158fa2505c0345e296827e6e4f227618','d24cae29475443fdb928decbe9da6809','0.2  互相了解','','0002',0,'tblMH4LUaSfDwRqr',0,401,'','','',5,'','',3,5101,'0001','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(4,'dac1a37cef044102982f15e6f73ded0e','d24cae29475443fdb928decbe9da6809','0.3 AI 师傅可以为我做什么','','0003',0,'tblMH4LUaSfDwRqr',0,401,'','','',5,'','',3,5101,'0002','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(5,'92d652812ded4766b11068511ee8ba25','d24cae29475443fdb928decbe9da6809','0.4 我可以怎么用AI 师傅','','0004',0,'tblMH4LUaSfDwRqr',0,401,'','','',5,'','',3,5101,'0003','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(6,'38493a74abb749919af022dfe6f6dd12','d24cae29475443fdb928decbe9da6809','0.5 期待新故事','','0005',0,'tblMH4LUaSfDwRqr',0,401,'','','',5,'','',3,5101,'0004','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(7,'82b08bc2093746a9aee9ac824b6d976a','d24cae29475443fdb928decbe9da6809','进入下一步','','01',0,'tbl453exjXgUq7Sc',0,401,'','','',5,'','',3,5101,'','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(8,'a0b6aa6074274bbb9d640db33dd963bd','d24cae29475443fdb928decbe9da6809','1.1 进入下一步','','0101',0,'tbl453exjXgUq7Sc',0,401,'','','',5,'','',3,5101,'','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(9,'5ce09826232a47d2acecc384c991d98b','d24cae29475443fdb928decbe9da6809','1.2 一起探索未来','','0102',0,'tbl453exjXgUq7Sc',0,401,'','','',5,'','',3,5101,'0101','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(10,'d0fe02d7328d4d47bd8cc028e0fc23a6','d24cae29475443fdb928decbe9da6809','学习课程','','21',0,'tblDEvaHJAIkIfst',0,405,'','','',5,'','',3,5101,'20','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(11,'7792099f20e54f6d9eeaa13dac66c523','d24cae29475443fdb928decbe9da6809','1.1 AI 师傅深入了解','','2101',0,'tblDEvaHJAIkIfst',0,405,'','','',5,'','',3,5101,'','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(12,'f95f2365eeba4362a9a3e59374b960e4','d24cae29475443fdb928decbe9da6809','课程合作','','22',0,'tblcQxIckOB8r2s9',0,405,'','','',5,'','',3,5101,'21','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30),(13,'fcd3ebddb7514a27a45bc3adcf57be5a','d24cae29475443fdb928decbe9da6809','1.1 AI 师傅深入了解','','2201',0,'tblcQxIckOB8r2s9',0,405,'','','',5,'','',3,5101,'','','','2025-02-06 13:59:43','2025-02-06 13:59:43',1,'',0.30);
/*!40000 ALTER TABLE `ai_lesson` ENABLE KEYS */;

--
-- Table structure for table `ai_lesson_script`
--

DROP TABLE IF EXISTS `ai_lesson_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_lesson_script` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `script_id` varchar(36) NOT NULL COMMENT 'Script UUID',
  `lesson_id` varchar(36) NOT NULL COMMENT 'Lesson UUID',
  `script_name` varchar(255) NOT NULL COMMENT 'Script name',
  `script_desc` text NOT NULL COMMENT 'Script description',
  `script_index` int NOT NULL COMMENT 'Script index',
  `script_feishu_id` varchar(255) NOT NULL COMMENT 'Script feishu ID',
  `script_version` int NOT NULL COMMENT 'Script version',
  `script_no` int NOT NULL COMMENT 'Script number',
  `script_type` int NOT NULL COMMENT 'Script type',
  `script_content_type` int NOT NULL COMMENT 'Script content type',
  `script_prompt` text NOT NULL COMMENT 'Script prompt',
  `script_model` varchar(36) NOT NULL COMMENT 'Script model',
  `script_temprature` decimal(10,2) NOT NULL COMMENT 'Script Temprature',
  `script_profile` text NOT NULL COMMENT 'Script profile',
  `script_media_url` text NOT NULL COMMENT 'Script media URL',
  `script_ui_type` int NOT NULL COMMENT 'Script UI type',
  `script_ui_content` text NOT NULL COMMENT 'Script UI content',
  `script_check_prompt` text NOT NULL COMMENT 'Script check prompt',
  `script_check_flag` text NOT NULL COMMENT 'Script check flag',
  `script_ui_profile` text NOT NULL COMMENT 'Script UI profile',
  `script_end_action` text NOT NULL COMMENT 'Script end action',
  `script_other_conf` text NOT NULL COMMENT 'Other configurations of the script',
  `ask_count_limit` int NOT NULL COMMENT 'Ask count limit',
  `ask_model` varchar(255) NOT NULL COMMENT 'Ask count model',
  `ask_prompt` text NOT NULL COMMENT 'Ask count history',
  `ask_with_history` int NOT NULL COMMENT 'Ask with history Count',
  `ask_mode` int NOT NULL COMMENT 'Ask mode',
  `created_user_id` varchar(36) DEFAULT NULL COMMENT 'created user ID',
  `updated_user_id` varchar(36) DEFAULT NULL COMMENT 'updated user ID',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `status` int NOT NULL COMMENT 'Status of the script',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_lesson_script`
--

/*!40000 ALTER TABLE `ai_lesson_script` DISABLE KEYS */;
INSERT INTO `ai_lesson_script` VALUES (1,'b7cef268c4a34beabb1d2cbd5ae441c9','8342f4b4b89e40fabec6ffab5c8f7111','system_role','',1,'recueaocm2L7As',0,0,103,201,'# 角色\n`你` 叫 `AI师傅` ，是`AI-Shifu`平台的向导。\n`你` 作为一个私人向导，`你` 只为他/她(`学员`)一个人提供个性化教学服务。 \n\n`我` 是课程设计者，`我` 跟 `你` 说的话都是指导 `你` 该如何向 `学员` 输出内容进行教学。\n`你` 需要直接用 讲师/私教 的口吻输出。你输出的内容都是给 `学员` 看的，不是给 `我` 看的， 输出的内容不能让 `学员` 感受到有 `我` 的存在。\n\n# 背景\n你和学员是第一次见面，学员并不清楚你是做什么的。学员会对你好奇，你要结合不同学员的情况，介绍清楚AI师傅，与学员建立起信任关系。\nAI 师傅是一个由大语言模型驱动的向导，由AI主导的对话流。\n\n# 教学目标\n让学员了解AI师傅这种对话流的方式，知道接下来如何使用AI 师傅。\n\n# 输出格式要求\n- 按照 Markdown 格式输出。\n- 单个段落的字数务必不要超过200字。\n- 输出不要有任何级别的标题（如#, ##, ### 或 H1, H2 之类的标题），但可以有 bullet（有序号、无序号都可以），也可以有重点加粗。\n- 称呼用户时可以用 `同学`、`你` 或者学员的昵称，但一定不要用 `大家`、`同学们` 等称呼多人的方式。\n- **Don\'t talk nonsense and make up facts.**','',0.40,'','',303,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(2,'d04967b005614c12abe70e95c8cdbf43','4d3a41a6594c4ac180e0c6ec16bd63ae','问好','',1,'recrQVOMOX',0,0,101,201,'你好呀， 初次见面！欢迎来到「AI 师傅」一对一学习社区。🎉\n\n我是AI 师傅，AI 主导的对话流，也就是说，接下来我们全程会以这样的对话形式进行。\n\n不过，咱们的对话内容是精心设计的，对话环境是封闭的，不用担心数据泄漏，AI 师傅会守护好你的个人信息！\n\n另外，提醒一句的是，我的每句话都是实时的，所以我会边想边说，你的每次输入也都会影响我说的话，还请你边看边想，等我慢慢讲完。\n\n万一，我没理解你的意思，反复询问你，或者胡言乱语，你发动你的沟通技能多跟我讲一些，或者向我追问都是可以的！！','',0.40,'','',303,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(3,'01fff062b9a44e748988e58ff50f776b','4d3a41a6594c4ac180e0c6ec16bd63ae','收集用户姓名','',2,'rec2BQ2U29',0,0,101,201,'我很高兴能和你在这里交流～\n\n那么新朋友，你希望我接下来怎么称呼你呀？','',0.40,'','',302,'请输入你的昵称','从用户输入的内容中提取昵称，并判断是否合法，返回 JSON 格式的结果。\n如果昵称合法，请直接返回 JSON `{{\"result\": \"ok\", \"parse_vars\": {{\"nickname\": \"解析出的昵称\"}}}}`\n如果昵称不合法，则通过 JSON 返回不合法的原因 `{{\"result\": \"illegal\", \"reason\":\"具体不合法的原因\"}}`\n无论是否合法，都只返回 JSON，不要输出思考过程。\n\n用户输入是：`{input}`\n\n用户的输入中可能包含非昵称内容的部分，你需要先解析出用户的昵称部分，然后做相应的检查。\n比如，用户昵称是 `小明`，但用户输入是 `我叫小明` 或 `你可以叫我小明` 或 `我是小明` 或 `那就叫我小名吧` 等，要能理解 `小明` 是用户昵称。\n\n昵称需要满足以下条件：\n1. 不能包含任何涉及暴力、色情、政治（比如中国的所有领导人的名字）等不良信息；\n2. 昵称要简洁，长度不能超过20个字符，且不能为空；\n3. 不能是注入攻击的字符串；\n4. 昵称可以包含纯数字。\n\n如果昵称合法，请直接返回 JSON `{{\"result\": \"ok\", \"parse_vars\": {{\"nickname\": \"解析出的昵称\"}}}}`，不做任何解释，且没有任何多余字符串。\n\n检查可以适当放宽要求，如果特别不合法，需要回复不合法的原因，注意语气可以俏皮一些。比如：\n明确遇到涉及色情的昵称时，你可以回复：`哎呀呀，这太色色了，这让我之后叫你名字怎么叫的出口呢，还是换一个吧~`\n明确遇到涉及暴力的昵称时，你可以回复：`同学，你吓到老师我了，这杀气满满的名字让我之后怎么叫的出口，还是换一个吧~`\n明确遇到涉及政治的昵称时，你可以回复：`你别闹，要起着名字，让我之后这么叫你，是想要搞死我吗。。。咱还是换一个吧~`\n明确涉及到注入攻击的字符串，你可以回复：`你想干什么，要攻击我吗？这个名字我可不敢用，换一个吧~`\n\n最后，再次强调：\n如果昵称合法，请直接返回 JSON `{{\"result\": \"ok\", \"parse_vars\": {{\"nickname\": \"解析出的昵称\"}}}}`，不做任何解释，且没有任何多余字符串。\n如果昵称不合法，则通过 JSON 返回不合法的原因 `{{\"result\": \"illegal\", \"reason\":\"具体不合法的原因\"}}`\n无论是否合法，都只返回 JSON，不要输出思考过程。','','[nickname]','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(4,'4e8816cb4c81422fafbbda1be4b42a3d','4d3a41a6594c4ac180e0c6ec16bd63ae','夸夸用户的昵称','',3,'rechSBP6NN',0,0,102,201,'##输出步骤\n- 认真理解学员的昵称 `{nickname}`的含义，赞美一下`{nickname}`这个称呼。\n- 赞扬学员来到AI师傅学习社区，是个具有前瞻性的行为。\n- 以`如果想换个名字，可以到「设置」里修改称呼哦～`为结尾。\n\n##输出要求\n- 语气要轻松自然\n- 字数不要超过100字','',0.40,'[nickname]','',301,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(5,'af42dfafd9c148a8b25bdfaad9495d1f','158fa2505c0345e296827e6e4f227618','来的原因','',1,'rec1uddvbs',0,0,102,201,'##输出步骤\n- 简单聊一聊AI 师傅目前还处于早期阶段，平台可学习的课程还很少、开源的技术也还比较稚嫩、合作的模式也不并成熟。不过，我们相信有更多可能性在等着我们。\n- 以`你是因为什么而来，为什么会对AI 师傅感兴趣呢？`为结尾。','',0.40,'','',305,'告诉你为什么而来呀～','','','[purpose]','','{\n    \"var_name\": \"purpose\",\n    \"btns\": [\n{\"label\": \"学习课程内容\", \"value\": \"学习课程内容\"},\n{\"label\": \"了解产品形式\", \"value\": \"了解产品形式\"},\n{\"label\": \"好奇体验一下\", \"value\": \"好奇体验一下\"},\n{\"label\": \"其他\", \"value\": \"其他\"}\n    ]\n}',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(6,'b9a1d6d51c5849ca86a5c15d1a9efbbb','158fa2505c0345e296827e6e4f227618','回应原因','',2,'recufMnCmxAbv7',0,0,102,201,'学员选择的答案是`{purpose}` ，要根据学员选择的答案`{purpose}`给到对应的`回应`。\n\n## 供选择的`回应`\n1. 如果学员选择的答案`{purpose}`是`学习课程内容` ，给到的`回应`是：`那你可是来对地方了，别看AI 师傅现在课程少，每一门都是不断迭代的精品课程，而且这里的课程学习起来很不一样，尽快进入课程，体验一对一的个性化吧。`\n\n2. 如果学员选择的答案`{purpose}`是`了解产品形式`，给到的`回应`是：`如果你是想用AI 师傅来做自己的课程产品，可以选择 1.服务号找到我们进行课程的内容合作，服务号：AI师傅-一对一学习社区；2.直接去 GitHub 开源地址里自行配置，对，我们的项目已经开源了！服务号里有开源地址哦～`\n\n3. 如果学员选择的答案`{purpose}`是`好奇体验一下`，给到的`回应`是：`好奇是打开新世界的钥匙，感谢你的好奇带你来到我身边，AI师傅有很多惊喜等着你，可以从我们沟通中慢慢对我加深了解。`\n\n4. 如果学员选择的答案`{purpose}`是`其他`，给到的`回应`是：`看来是我想不到的理由了，如果有需要你可以关注我们的服务号：AI师傅-一对一学习社区，加上我们跟我们详细聊～`\n\n## 输入要求\n- 以`我们看看是什么原因，把你带到我身边！`为开头往下讲。\n- 以`总之，很开心遇到你，与你有这次的对话。`为结尾。','',0.40,'[purpose]','',303,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(7,'a11a7c48a2354d32b2f3f44a8ac7dccc','158fa2505c0345e296827e6e4f227618','介绍个性化','',3,'recufMmCCP20XR',0,0,102,201,'##输出步骤\n- 介绍AI 师傅会根据学员的输出，做出不同的反馈。\n- 回答的逻辑是真人控制的，但是回答的话会跟随选择的不同而不同。这就实现了小小的个性化。\n- 告诉学员{nickname}：我也会记下你的输入，以及你的选择，后续有需要的时候，我会根据你的情况做针对性讲解。','',0.40,'[nickname]','',301,'有点意思～','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(8,'8a69bd40cce64f21ae10f3a2ff3b2f10','158fa2505c0345e296827e6e4f227618','询问用户行业职业','',4,'recChQ9x18',0,0,101,201,'为了帮助我进一步了解你。\n\n{nickname} ，你可以试着告诉我，当前你正处于什么行业，从事什么职业的工作， 我会结合你的具体工作，给到 AI 可以为你工作赋能的一些想法！\n\n请参考下面的格式，告诉我你的工作：\n* 电商行业的运营\n* 医疗行业的猎头\n* 知识付费领域的个体创业者\n* 哲学系的大学生\n* 独立摄影师\n* 大学教授，主要教应用物理\n\n*🏷️ 提醒：建议填写你正在从事的工作，与你的关联性更紧密，会更有利于我们接下来的沟通哦～*','',0.40,'[nickname]','',302,'请输入你当前的工作背景','从用户输入的内容中提取 `用户职业背景(user_background)` 信息，返回 JSON 格式的结果。\n如果解析成功，请直接返回 JSON `{{\"result\": \"ok\", \"parse_vars\": {{\"user_background\": \"解析出的用户职业背景\"}}}}`\n如果解析失败，则通过 JSON 返回失败的原因 `{{\"result\": \"failed\", \"reason\":\"具体的失败原因，并提示用户说的再次尝试输入职业背景信息\"}}`\n无论是否成功，都只返回 JSON，不要输出思考过程。\n\n\n用户输入是：`{input}`\n\n\n仅提取用户的职业背景信息，去除 主谓短语 等描述说话者身份的内容。例如：\n* 用户输入 `电商产品经理`， 希望解析出：`电商产品经理`\n* 用户输入 `我主要做管理工作`， 希望解析出：`管理工作`\n* 用户输入 `独立摄影师，主要拍些妹子`， 希望解析出：`独立摄影师，主要拍些妹子`\n* 用户输入 `我是一个大学教授，主要教应用物理，同时也做一些相关学术和科研工作`， 希望解析出：`大学教授，主要教应用物理，同时也做一些相关学术和科研工作`\n* 用户输入 `家庭主妇，带俩孩子，一男一女`， 希望解析出：`家庭主妇，带俩孩子，一男一女`\n* 用户输入 `啥也不干，在家混吃等死`， 希望解析出：`啥也不干，在家混吃等死`\n\n\n如果用户输入的内容与并没有描述职业背景，如行业、职业、做什么事儿之类的，则：\n应解析失败，需要通过 JSON 返回失败的原因 ： `{{\"result\": \"failed\", \"reason\":\"具体的失败原因（如输入的不是职业背景），并提示用户说的再次尝试输入职业背景信息\"}}`\n这种情况下（即 如果用户输入的内容与并没有描述职业背景）有以下特殊情况：\n* 用户输入的内容属于职业背景，但其背景涉及 色情、暴力等违法违规的内容，也解析失败，需要通过 JSON 返回失败的原因 `{{\"result\": \"failed\", \"reason\":\"具体的失败原因（如输入的是非法内容），并提示用户说的再次尝试输入合法合规的职业背景信息\"}}`\n* 用户询问如何购买课程，则解析失败，通过 JSON 返回失败的原因 `{{\"result\": \"failed\", \"reason\":\"具体失败的原因\"}}` 原因中生成以老师的身份告诉用户当前是体验课环节，体验完成后会有购买方式。最后再次强调当前需要得到用户的职业背景信息，先跟着教学路径好好学，后续有的是机会展开讨论各种话题。\n* 用户表达已经学过这部分了想要继续之前的进度，则解析失败，通过 JSON 返回失败的原因 `{{\"result\": \"failed\", \"reason\":\"具体失败的原因\"}}` 原因中生成以老师的身份告知用户可以点击菜单中的设置进行登录，登录后可以看到已有的学习记录。最后再次强调当前需要得到用户的职业背景信息，先跟着教学路径好好学，后续有的是机会展开讨论各种话题。\n\n\n从用户输入的内容中提取 `用户职业背景(user_background)` 信息，返回 JSON 格式的结果。\n如果解析成功，请直接返回 JSON `{{\"result\": \"ok\", \"parse_vars\": {{\"user_background\": \"解析出的用户职业背景\"}}}}`\n如果解析失败，则通过 JSON 返回失败的原因 `{{\"result\": \"failed\", \"reason\":\"具体的失败原因，并提示用户说的再次尝试输入职业背景信息\"}}`\n无论是否成功，都只返回 JSON，不要输出思考过程。','','[user_background]','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(9,'d465d9608f5a441da277ac0d715496ae','158fa2505c0345e296827e6e4f227618','结合用户行业职业举例','',5,'reca8oGz9t',0,0,102,201,'学员的背景是：{user_background}，还不知道用AI 可以为自己的日常工作提供什么帮助。\n\n##任务\n- 需要认真理解学员的背景{user_background}，从工作生活学习场景中，找到AI可以提供支持的常见需求。 场景需求必须是日常的，建议找一些会耗费最多时间和精力的。\n- 结合场景需求精心撰写相关的提示词，每个提示词都经过深入思考，需要吻合学员的背景，以便学员可以立刻开展尝试。\n\n##输出\n输出一个表格，表格有3列，5行。\n列分别是“场景需求”、“应用程序”和“给 AI 的提示词参考”。\n“场景需求” 以问题的形式呈现，需要是详细且具体的痛点。\n“应用程序”能解决问题的应用程序思路。\n“给 AI 的指令参考”将以我的角度，结合“应用场景” 直接用口语化的方式向 AI 提出详细的提示词。','',0.40,'[user_background]','',301,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(10,'c11fe7b3b7c7423bbff736cdeef5b0a9','dac1a37cef044102982f15e6f73ded0e','选择授课风格','',1,'recuiye3Cp1Kat',0,0,102,201,'##输出步骤\n- 1对1向学员讲解：除了根据你的信息做个性化学习之外，你还可以向我提出要求。\n- 比如邀请学员选择授课风格：你可以告诉我，你喜欢什么样的授课风格？','',0.40,'','',305,'继续','','','[style]','','{\n \"var_name\": \"style\",\n \"btns\": [\n{\"label\": \"幽默风趣\", \"value\": \"幽默风趣\"},\n{\"label\": \"专业犀利\", \"value\": \"专业犀利\"},\n{\"label\": \"鼓励温暖\", \"value\": \"鼓励温暖\"}\n ]\n}',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(11,'d8d176b9394c4a25886f24f0e355669b','dac1a37cef044102982f15e6f73ded0e','结合风格讲述','',2,'recuskbSyY9JNO',0,0,102,201,'根据学员选择的授课风格 `{style}` ，给到 {nickname}  一句回应。\n采用授课风格 `{style}` ，讲解下面的 `内容` ：\n`内容`是：\n- 我可以根据你的要求跟你沟通，是因为我是你的一对一私教，你的喜爱对我很重要。\n-虽然还会很多不完善，但是我在不断进化，慢慢地会越来越懂你，减少你学习中的阻力。\n\n# 限制\n1. 字数控制在300字以内。\n2. 凸显风格可以尽量用比喻类比。','',0.40,'[style][nickname]','',301,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(12,'f2b6b136907a4004a08e92b81870081e','dac1a37cef044102982f15e6f73ded0e','介绍AI师傅','',3,'recuskfhRMtfbc',0,0,102,201,'##输出步骤\n- 1对1向学员讲解：AI 师傅在教育培训、小说故事、产品指南、调查问卷和游戏 NPC 等场景，都能提供更具互动性和沉浸感的体验。\n- AI 师傅的`逻辑`是:\n1. 真人设计整体逻辑\nAI 师傅通过真人编辑的提示词剧本来主导对话的流程，来确保对话过程不冷场，解决了用户不知道该问 AI 什么，或者越聊越跑题的情况。\n2. AI 为主导做交付\n通过提示词控制 AI，由 AI 来做内容的交付，一方面避免了 AI 的幻觉，确保信息传递的准确性；另一方面让互动更灵活，可以根据用户的身份背景等做个性化输出，让用户有被一对一服务的感受。\n3. 用户跟随，并且能随时打断提问\n用户按照对话流做跟随，确保获取到所有信息，在遇到想要深入了解的信息时，还可以即时采取向AI追问，向 AI 进行提问，影响对话内容，但最终还是会回到 AI 主导的故事线。\n\n以`了解了AI 师傅的个性化学习，AI 师傅到底有什么实际的作用呢？`为开头。','',0.40,'','',301,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(13,'5695d8a500fa48fab34c7a714f544c40','dac1a37cef044102982f15e6f73ded0e','介绍AI师傅','',4,'recuski07lsFFC',0,0,101,201,'讲起来还是有点难理解的，{nickname} ，邀请你进入AI 师傅的官网 ：<a href=\" \" target=\"_blank\">AI-shifu.com </a > ，目前我们有一门自营课程《跟AI学编程》，在学习的过程更深入了解我们。\n\n第一节是体验课，可以免费学习，具体感受下AI 师傅在教育场景的应用。\n\n<img src=\"https://img.agiclass.cn/image.png\" style=\"width : 80%\" > ','',0.40,'[nickname]','',301,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(14,'f3e0011c85794a0d943ef45fd3fe244d','92d652812ded4766b11068511ee8ba25','用户互动','',1,'recuivi4PiPy10',0,0,101,201,'这里需要特别提醒的是，在AI 主导的对话流中，你是可以随时就课程的内容做追问的。\n\n**AI 降低了讲师高高在上的姿态，而是以学习者为中心。不懂就问，是主动学习的开始！**\n\n下面是一个提问的提示词，你可以复制到输入框，体验向 AI 提问的感觉。（也可以自由发挥）\n\n📖 提示词参考\n\n```markdown\nAI 师傅是哪个团队开发的？\n```\n\n*🏷️ 提醒：AI 师傅非常鼓励提问，但是会做提问内容的限制，需要你的问题与当前课程内容有关，问完也希望你尽快回到主线上继续学习。*','',0.40,'','',302,'输入体验任务的指令','判断用户的输入是否是合适的指令，返回 JSON 格式的结果。\n如果用户的输入是合适的指令，请直接返回 JSON `{{\"result\": \"ok\", \"parse_vars\":{{\"content\": \"解析出的指令（即用户的输入内容）\"}}}}`\n如果用户的输入不合适，则通过 JSON 返回不合适的原因 `{{\"result\": \"illegal\", \"reason\":\"具体不合适的原因\"}}`\n\n\n合适的指令需要满足以下条件：\n1、与本章节教学目标相关的问题，任何与 AI师傅（AIshifu）产品相关的问题都可以\n2、工作需求需要合法、合规，不涉及暴力、色情、政治、攻击性的内容。\n3、参考举例的内容。\n\n比如，这就是几个合适的指令：\n```\n- 我可以用 AI 师傅的学习平台做自己的课程吗？\n-  AI 师傅的团队有哪些人\n-  我可以怎么使用\n- 怎么学习\n```\n\n用户输入指令信息是：\n```\n{input}\n```\n\n如果用户的输入是合适的指令，请直接返回 JSON `{{\"result\": \"ok\", \"parse_vars\":{{\"content\": \"解析出的指令（即用户的输入内容）\"}}}}`\n如果用户的输入不合适，则通过 JSON 返回不合适的原因 `{{\"result\": \"illegal\", \"reason\":\"具体不合适的原因\"}}`\n\n如果用户的内容不完整，或者无法理解，需要提示用户再次输入，强调做指令的优化。比如：哎呀，我好像没有理解你的指令，可以根据指令的提示再说一遍吗？\n如果特别不合适，需要回复不合适的原因，注意语气可以俏皮一些。检查可以适当放宽要求。','','[content]','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(15,'8cbb4da953974a2b92e57e86038307a1','92d652812ded4766b11068511ee8ba25','互动回应','',2,'recuivi4PidMFe',0,0,102,201,'学员输入的提示词是 {content}，请按照提示词输出相关的`反馈`。`反馈`的内容来自于下面的`资料`。\n\n##`反馈`的内容来自于下面的`资料`:\nAI 师傅由 AI-Shifu 团队和哈工大智能软件工程研究中心合作开发。\n2024 年 10 月 24 日，AI 师傅（AI-Shifu）宣布正式向全球开源。\n你可以在 AI-Shifu.com 网站上学习由专家开发、AI 主导的课程，目前有一门自研的精品课《跟AI学编程》。\n如果你想要合作课程，可以在服务号「AI师傅-一对一学习社区」中找到团队成员进行深入沟通。\nAI 师傅是一个由大语言模型驱动的向导。与其他由人类主导的聊天机器人不同，AI 师傅是 AI 主导对话流，人类只需要跟随。虽然在过程中，人类随时可以提问，影响对话内容，但最终还是会回到 AI 主导的故事线。并且，AI 可以根据用户的身份背景、兴趣偏好等做个性化输出，让用户有被一对一服务的感受。在教育培训、小说故事、产品指南、调查问卷和游戏 NPC 等场景，AI 师傅都能提供更具互动性和沉浸感的体验。','',0.40,'[content]','',303,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(16,'36bd7dc1deb046d1b281194641325a7b','92d652812ded4766b11068511ee8ba25','未来展望','',3,'recusktNSvPuCX',0,0,102,201,'采用授课风格 `{style}` ，讲解下面的 `内容` ：\n##输出步骤\n `内容` ：\n-1对1对学员讲解： AI 师傅才刚刚起步，随着AI 技术的发展，以及大家的共创，我们也不知道未来会发生什么。\n- 无论如何，先出发吧，欢迎加入我们，跟AI 师傅一起探索。\n\n##输入要求\n1. 不要超过200字\n2. 要有号召力和感染力','',0.40,'','',301,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(17,'ff838172afe24da2bd119fb604b914da','92d652812ded4766b11068511ee8ba25','服务号引导关注','',4,'recuskv89S7dlq',0,0,101,202,'','',0.40,'','https://img.agiclass.cn/aishifu-1v1.jpg',303,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(18,'4eb6c38093a04105a810c535e17a215c','92d652812ded4766b11068511ee8ba25','登录注册','',5,'recugwcAYkm6v3',0,0,102,201,' {nickname} ，你已经告诉了我一些关于你的个人信息， 作为你专属的 AI 师傅，我会记录下来，在后续平台上的任何课程学习里，我都会贴合你的背景做个性化地教学。\n\n现在，请告诉我你的手机号，我会为你创建个人帐号存储信息和进度，并继续下面的内容。','',0.40,'','',308,'登录注册','输入内容先过正则，如果失败，则返回：\n```\n{nickname} 同学，请不要调戏为师呀，你输入正确的验证码我才能帮你注册帐号呢。\n\n为师可是非常期待能在正式课程里陪伴你继续学习呢~\n```\n\n如果成功，则引导用户正式付费。','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(19,'77067ae98a8749d982ebaeee4d97f90d','92d652812ded4766b11068511ee8ba25','服务号引导关注','',6,'recuskx3iPyGfE',0,0,101,201,'为了能联系到我们，你可以关注服务号「哎师傅-AI学习社区」，联系到我们。\n\n当然，你可能还能找到我们团队的微信号。请在加我们微信时，记得告之你的添加的原因，比如「推荐课程」、「课程合作」等。','',0.40,'','',303,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(20,'e533b97b74a448fd8f7c843722749776','92d652812ded4766b11068511ee8ba25','服务号引导关注','',7,'recuskytG4EtKP',0,0,101,202,'','',0.40,'','https://img.agiclass.cn/aishifu-1v1.jpg',303,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(21,'0239b646216a435f94b52baf40214d93','38493a74abb749919af022dfe6f6dd12','章节结束','',1,'recuhgHrZBLNop',0,0,101,201,'感谢 {nickname} 的信任 ，你已经完成注册了，接下来就可以开始具体的下一步动作了！\n\n期待我们的新故事发生～','',0.40,'','',301,'进入下一章','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(22,'177db9236ad84fda9fbe7ce85dadfd62','82b08bc2093746a9aee9ac824b6d976a','system_role','',1,'recueauenPgkcu',0,0,103,201,'# 角色\n`你` 叫 `AI师傅` ，是`AI-Shifu`平台的向导。\n`你` 作为一个私人向导，`你` 只为他/她(`学员`)一个人提供个性化教学服务。 \n\n`我` 是课程设计者，`我` 跟 `你` 说的话都是指导 `你` 该如何向 `学员` 输出内容进行教学。\n`你` 需要直接用 讲师/私教 的口吻输出。你输出的内容都是给 `学员` 看的，不是给 `我` 看的， 输出的内容不能让 `学员` 感受到有 `我` 的存在。\n\n# 背景\n你和学员是第一次见面，学员并不清楚你是做什么的。学员会对你好奇，你要结合不同学员的情况，介绍清楚AI师傅，与学员建立起信任关系。\nAI 师傅是一个由大语言模型驱动的向导，由AI主导的对话流。\n\n# 教学目标\n让学员快速进入到不同路径里，进行深入使用AI师傅。\n\n# 要求\n学员的`名字`是`{nickname}`，你只为学员进行一对一的个性化教学讲解。 \n学员的`工作背景`是 `{user_background}`。你需要结合`学员`的`工作背景`举出具体案例。\n他/她选择的 `授课风格` 是 `{style}`，你需要用`{style}`的`授课风格` 进行回答。\n\n# 输出格式要求\n- 按照 Markdown 格式输出。\n- 单个段落的字数务必不要超过200字。\n- 输出不要有任何级别的标题（如#, ##, ### 或 H1, H2 之类的标题），但可以有 bullet（有序号、无序号都可以），也可以有重点加粗。\n- 称呼用户时可以用 `同学`、`你` 或者学员的昵称，但一定不要用 `大家`、`同学们` 等称呼多人的方式。\n- **Don\'t talk nonsense and make up facts.**','',0.40,'[nickname][style][user_background]','',303,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(23,'db6a94645b5f4e94bfc52c3c32d8290c','a0b6aa6074274bbb9d640db33dd963bd','确认用户选择的工具','',1,'recudgt0LluS8h',0,0,102,201,'{nickname}，聊了这么多，想必你对AI 师傅已经有所了解了，那么我们继续下一步吧。\n\n请从以下两个选项中做个选择 ！\n\n⚠️ 如果这两个都不是你的选择，可以去服务号「AI师傅-一对一学习社区」里找到官方人员咨询。','',0.40,'[nickname]','',305,'继续','','','[option]','','{\n    \"var_name\": \"option\",\n    \"btns\": [\n{\"label\": \"学习课程\", \"value\": \"学习课程\"},\n{\"label\": \"课程合作\", \"value\": \"课程合作\"}\n    ]\n}',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(24,'d944a42d1acd46bdb024783fb3429077','a0b6aa6074274bbb9d640db33dd963bd','跳转分支','',2,'recuf0ckpqtDw1',0,0,101,201,'你选择的是 `{option}` ，那就让我们来快速开始吧！','',0.40,'[option]','',309,'来吧','','','','','{\n    \"var_name\": \"option\",\n    \"jump_type\": \"silent\",\n    \"?jump_type\": \"silent 静默的，用户无感知的； explicit 显示的，用户可感知的；\",\n    \"jump_rule\": [{\n        \"value\": \"学习课程\",\n        \"lark_table_id\": \"tblDEvaHJAIkIfst\",\n        \"lark_view_id\": \"vewlGkI2Jp\"\n    }, {\n        \"value\": \"课程合作\",\n        \"lark_table_id\": \"tblcQxIckOB8r2s9\",\n        \"lark_view_id\": \"vewlGkI2Jp\"\n    }]\n}',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(25,'2baad5b1fb55412f8614e565f79ce573','5ce09826232a47d2acecc384c991d98b','结束','',1,'recug9uZgqAJEn',0,0,101,201,'感谢你加入我们一起探索和共创，AI 师傅因为有你，获得更多可能性！\n\n这才是开始，接下来我们一起努力吧！','',0.40,'','',301,'进入下一章','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(26,'1163c1f1fd48493192fca95a62e61d74','7792099f20e54f6d9eeaa13dac66c523','学习课程','',1,'recuf0cJXTiIUK',0,0,102,201,'##输出步骤\n- 介绍AI 师傅的第一门自研课程《跟AI学编程》，零基础的学员也可以通过AI 辅助工具快速写出自己的应用程序。\n- 随着AI编程工具的出现，改变了传统学编程的方法，你不需要从复杂的撰写基础语法学起，而是可以借助AI来实现编程程序，在项目实践和解决问题中完成编程的学习。\n- 学完课程的用户在掌握了如何用AI编程的方法之后，可以很快做出自己人生中的第一个应用程序。','',0.40,'','',301,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(27,'5d26fcd3b8e0469794505d9fb3e232e5','7792099f20e54f6d9eeaa13dac66c523','学习课程','',2,'recuf0cVAQQIBS',0,0,101,201,'下面是部分真实用户的反馈。\n\n<img src=\"https://img.agiclass.cn/review.png\" style=\"width : 80%\" > \n\n更多用户反馈在这里👇\n\n<a href=\" \" target=\"_blank\">https://mp.weixin.qq.com/s?__biz=MzkzMTczMjY0NA==&mid=2247483698&idx=1&sn=252e9ea6f8c6f24bdfec47c37f7caed4&chksm=c267ccf9f51045ef1f534d1f88f3a11c0b6a5d12318e83d043d2be6335b115bea7d91ba9b728&scene=21#wechat_redirect</a >','',0.40,'[nickname]','',303,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(28,'5d60d51e9bd846f78b7be8bdf8f4ed4c','7792099f20e54f6d9eeaa13dac66c523','学习课程','',3,'recuf0cZRZ1adD',0,0,101,201,'点击进入 AI-shifu.com ，进行课程学习。\n\n电脑端和移动端都可以，不过电脑端体验更佳。','',0.40,'[industry][occupation]','',301,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(29,'b6e6a50ebd334bf99cd22ece12b5fd84','fcd3ebddb7514a27a45bc3adcf57be5a','课程合作','',1,'recuf0cJXTiIUK',0,0,102,201,'讲解下面内容：\n- 2024 年 10 月 24 日，AI 师傅（AI-Shifu）宣布正式向全球开源，\n- `开源功能`有:\n可控对话流：用预设的提示词剧本约束 AI 的输出，控制对话过程。\n互动：对话中可以向用户提出问题，获得用户的输入反馈。\n个性化：根据用户输入的身份背景、兴趣偏好等信息做个性化输出。\n追问：随时基于上下文提问，获得更多信息。\n剧本开发环境：用飞书多维表格做编辑器，配合调试器，可以便捷地调试剧本提示词。','',0.40,'','',301,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(30,'6f5a304838f541fa84a0cf2f834d6502','fcd3ebddb7514a27a45bc3adcf57be5a','课程合作','',2,'recuf0cVAQQIBS',0,0,102,201,'讲解下面内容：\n- 在教育培训、小说故事、产品指南、调查问卷和游戏 NPC 等场景，AI 师傅都能提供更具互动性和沉浸感的体验。\n- 在营销场景里，与古典老师的新精英团队做了销转的尝试，通过对话流的学习方式有效地筛选出高意向用户，获得了古典老师的认可。初步判断，前置学习 AI 师傅的课程对订单成交有影响，用户在交互中留下来的资料可被销售做为有效线索继续转化，后续我们也会继续探索，尝试做用户种草。','',0.40,'','',303,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1),(31,'c5d22f184b6c4707a0db8ecb3fbde9e1','fcd3ebddb7514a27a45bc3adcf57be5a','课程合作','',3,'recuf0cZRZ1adD',0,0,101,201,'你如果懂技术可以直接自行配置，开源地址👇\n\n<a href=\" \" target=\"_blank\">https://github.com/ai-shifu/ai-shifu</a >\n\n如果你想跟AI 师傅合作课程，可以通过服务号联系团队人员，经过沟通之后，给你开通体验账号。\n','',0.40,'','',301,'继续','','','','','',5,'','',5,5101,'','','2025-02-06 13:59:43','2025-02-06 13:59:43',1);
/*!40000 ALTER TABLE `ai_lesson_script` ENABLE KEYS */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('92cbdc762a0f');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `discount_id` varchar(36) NOT NULL COMMENT 'Discount UUID',
  `discount_code` varchar(36) NOT NULL COMMENT 'Discount code',
  `discount_type` int NOT NULL COMMENT 'Discount type: 701-fixed, 702-percent',
  `discount_apply_type` int NOT NULL COMMENT 'Discount apply type: 801-all, 802-specific',
  `discount_value` decimal(10,2) NOT NULL COMMENT 'Discount value',
  `discount_limit` decimal(10,2) NOT NULL COMMENT 'Discount limit',
  `discount_start` timestamp NOT NULL COMMENT 'Discount start time',
  `discount_end` timestamp NOT NULL COMMENT 'Discount end time',
  `discount_channel` varchar(36) NOT NULL COMMENT 'Discount channel',
  `discount_filter` text NOT NULL COMMENT 'Discount filter',
  `discount_count` bigint NOT NULL COMMENT 'Discount count',
  `discount_used` bigint NOT NULL COMMENT 'Discount used',
  `discount_generated_user` varchar(36) NOT NULL COMMENT 'Discount generated user',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `status` int NOT NULL COMMENT 'Status of the discount: 0-inactive, 1-active',
  PRIMARY KEY (`id`),
  KEY `ix_discount_discount_code` (`discount_code`),
  KEY `ix_discount_discount_id` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;

--
-- Table structure for table `discount_record`
--

DROP TABLE IF EXISTS `discount_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `record_id` varchar(36) NOT NULL COMMENT 'Record UUID',
  `discount_id` varchar(36) NOT NULL COMMENT 'Discount UUID',
  `discount_name` varchar(255) NOT NULL COMMENT 'Discount name',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `course_id` varchar(36) NOT NULL COMMENT 'Course UUID',
  `order_id` varchar(36) NOT NULL COMMENT 'Order UUID',
  `discount_code` varchar(36) NOT NULL COMMENT 'Discount code',
  `discount_type` int NOT NULL COMMENT 'Discount type: 0-percent, 1-amount',
  `discount_value` decimal(10,2) NOT NULL COMMENT 'Discount value',
  `status` int NOT NULL COMMENT 'Status of the record: 0-inactive, 1-active',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `ix_discount_record_course_id` (`course_id`),
  KEY `ix_discount_record_discount_id` (`discount_id`),
  KEY `ix_discount_record_order_id` (`order_id`),
  KEY `ix_discount_record_record_id` (`record_id`),
  KEY `ix_discount_record_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_record`
--

/*!40000 ALTER TABLE `discount_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_record` ENABLE KEYS */;

--
-- Table structure for table `pingxx_order`
--

DROP TABLE IF EXISTS `pingxx_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pingxx_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `order_id` varchar(36) NOT NULL COMMENT 'Order UUID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `course_id` varchar(36) NOT NULL COMMENT 'Course UUID',
  `record_id` varchar(36) NOT NULL COMMENT 'Record UUID',
  `pingxx_transaction_no` varchar(36) NOT NULL COMMENT 'Pingxx transaction number',
  `pingxx_app_id` varchar(36) NOT NULL COMMENT 'Pingxx app ID',
  `pingxx_channel` varchar(36) NOT NULL COMMENT 'Payment channel',
  `pingxx_id` varchar(36) NOT NULL COMMENT 'Pingxx ID',
  `channel` varchar(36) NOT NULL COMMENT 'Payment channel',
  `amount` bigint NOT NULL COMMENT 'Payment amount',
  `extra` text NOT NULL COMMENT 'Extra information',
  `currency` varchar(36) NOT NULL COMMENT 'Currency',
  `subject` varchar(255) NOT NULL COMMENT 'Payment subject',
  `body` varchar(255) NOT NULL COMMENT 'Payment body',
  `order_no` varchar(255) NOT NULL COMMENT 'Order number',
  `client_ip` varchar(255) NOT NULL COMMENT 'Client IP',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `status` int NOT NULL COMMENT 'Status of the order: 0-unpaid, 1-paid, 2-refunded, 3-closed, 4-failed',
  `charge_id` varchar(255) NOT NULL COMMENT 'Charge ID',
  `paid_at` timestamp NOT NULL COMMENT 'Payment time',
  `refunded_at` timestamp NOT NULL COMMENT 'Refund time',
  `closed_at` timestamp NOT NULL COMMENT 'Close time',
  `failed_at` timestamp NOT NULL COMMENT 'Failed time',
  `refund_id` varchar(255) NOT NULL COMMENT 'Refund ID',
  `failure_code` varchar(255) NOT NULL COMMENT 'Failure code',
  `failure_msg` varchar(255) NOT NULL COMMENT 'Failure message',
  `charge_object` text NOT NULL COMMENT 'Charge object',
  PRIMARY KEY (`id`),
  KEY `ix_pingxx_order_course_id` (`course_id`),
  KEY `ix_pingxx_order_order_id` (`order_id`),
  KEY `ix_pingxx_order_pingxx_app_id` (`pingxx_app_id`),
  KEY `ix_pingxx_order_pingxx_transaction_no` (`pingxx_transaction_no`),
  KEY `ix_pingxx_order_record_id` (`record_id`),
  KEY `ix_pingxx_order_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingxx_order`
--

/*!40000 ALTER TABLE `pingxx_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingxx_order` ENABLE KEYS */;

--
-- Table structure for table `risk_control_result`
--

DROP TABLE IF EXISTS `risk_control_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_control_result` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `chat_id` varchar(36) NOT NULL COMMENT 'Chat UUID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `text` text NOT NULL COMMENT 'Text',
  `check_vendor` varchar(255) NOT NULL COMMENT 'Check vendor',
  `check_result` int NOT NULL COMMENT 'Check result',
  `check_resp` text NOT NULL COMMENT 'Check response',
  `is_pass` int NOT NULL COMMENT 'Is pass',
  `check_strategy` varchar(30) NOT NULL COMMENT 'Check strategy',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_control_result`
--

/*!40000 ALTER TABLE `risk_control_result` DISABLE KEYS */;
INSERT INTO `risk_control_result` VALUES (1,'63b332264e7c47b3afe26081faeab1f9','6d65908c47bb4dad9b2450d70d7eca53','lea','ilivedata',3,'{}',0,'check_text','2025-02-06 14:04:58','2025-02-06 14:04:58'),(2,'5c4bb89a39524aa9ae1a5b14b9bbb566','6d65908c47bb4dad9b2450d70d7eca53','lea','ilivedata',3,'{}',0,'check_text','2025-02-06 14:06:14','2025-02-06 14:06:14'),(3,'c129deb053d4451393f11f86da5fc413','6d65908c47bb4dad9b2450d70d7eca53','lea','ilivedata',3,'{}',0,'check_text','2025-02-06 14:10:50','2025-02-06 14:10:50'),(4,'9bd28bb567204eddab04bcf25d47e950','6d65908c47bb4dad9b2450d70d7eca53','lea','ilivedata',3,'{}',0,'check_text','2025-02-06 14:13:59','2025-02-06 14:13:59'),(5,'d7addc73000c4650aafee49a7ce390bd','6d65908c47bb4dad9b2450d70d7eca53','lea','ilivedata',3,'{}',0,'check_text','2025-02-06 14:14:15','2025-02-06 14:14:15'),(6,'1e857766e33249ae9cf929c804469e74','6d65908c47bb4dad9b2450d70d7eca53','lea','ilivedata',3,'{}',0,'check_text','2025-02-06 14:19:19','2025-02-06 14:19:19'),(7,'7c344e6a0ec14b588b64527aa69f02d3','6d65908c47bb4dad9b2450d70d7eca53','lea','ilivedata',3,'{}',0,'check_text','2025-02-06 14:30:42','2025-02-06 14:30:42'),(8,'d3b7ff6643794d239b937dcad9f25db6','6d65908c47bb4dad9b2450d70d7eca53','知识付费领域的个体创业者','ilivedata',3,'{}',0,'check_text','2025-02-06 14:32:51','2025-02-06 14:32:51'),(9,'1e892228d7e74d9e82dd96b3f3424078','6d65908c47bb4dad9b2450d70d7eca53','你是谁开发的？','ilivedata',3,'{}',0,'check_text','2025-02-06 14:33:58','2025-02-06 14:33:58'),(10,'73765990e3cc40beaa4da3cf95aa6eae','6d65908c47bb4dad9b2450d70d7eca53','AI 师傅开发团队有几个人？','ilivedata',3,'{}',0,'check_text','2025-02-06 14:34:28','2025-02-06 14:34:28'),(11,'0ccca77a10df41f8ab055820dee94cf9','6d65908c47bb4dad9b2450d70d7eca53','没懂你的意思','ilivedata',3,'{}',0,'check_text','2025-02-06 14:39:27','2025-02-06 14:39:27'),(12,'e6728633a85a4fa1a40b8c0e3714f4ca','6d65908c47bb4dad9b2450d70d7eca53','我希望你称呼我“没懂你的意思”','ilivedata',3,'{}',0,'check_text','2025-02-06 14:39:56','2025-02-06 14:39:56'),(13,'bb7b46e939704764b7e518ee62919fa9','6d65908c47bb4dad9b2450d70d7eca53','没意思','ilivedata',3,'{}',0,'check_text','2025-02-06 14:40:06','2025-02-06 14:40:06'),(14,'a709feb98e25480cac02bbaf9d146862','6d65908c47bb4dad9b2450d70d7eca53','啊Q','ilivedata',3,'{}',0,'check_text','2025-02-06 14:40:20','2025-02-06 14:40:20'),(15,'2d69a1f2b8484ea6b723631a469970f1','6d65908c47bb4dad9b2450d70d7eca53','我希望自己能做一款软件辅助高考志愿填报','ilivedata',3,'{}',0,'check_text','2025-02-06 14:41:18','2025-02-06 14:41:18'),(16,'db7384ae36474c5c9f4580f6abca9ffc','6d65908c47bb4dad9b2450d70d7eca53','软件研发工程师','ilivedata',3,'{}',0,'check_text','2025-02-06 14:41:38','2025-02-06 14:41:38'),(17,'f249b265b2994b0b9b48a5b54d5e97a7','6d65908c47bb4dad9b2450d70d7eca53','AI 师傅可以替代人吗？','ilivedata',3,'{}',0,'check_text','2025-02-06 14:47:20','2025-02-06 14:47:20'),(18,'df09a49f46c34eb9811b4290089fab77','6d65908c47bb4dad9b2450d70d7eca53','AI 师傅可以替代人进行教学吗？','ilivedata',3,'{}',0,'check_text','2025-02-06 14:47:39','2025-02-06 14:47:39'),(19,'1066d7f4065c4ced953b4a842206345b','6d65908c47bb4dad9b2450d70d7eca53','麻瓜','ilivedata',3,'{}',0,'check_text','2025-02-06 14:49:07','2025-02-06 14:49:07'),(20,'57660b6490294dd0b61306fdf3dee78f','6d65908c47bb4dad9b2450d70d7eca53','K12教育产品经理','ilivedata',3,'{}',0,'check_text','2025-02-06 14:50:40','2025-02-06 14:50:40'),(21,'89f2746cecd348259b0ad26339e59ac6','6d65908c47bb4dad9b2450d70d7eca53','AI 师傅能输出语音吗？','ilivedata',3,'{}',0,'check_text','2025-02-06 14:52:19','2025-02-06 14:52:19');
/*!40000 ALTER TABLE `risk_control_result` ENABLE KEYS */;

--
-- Table structure for table `user_conversion`
--

DROP TABLE IF EXISTS `user_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_conversion` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `conversion_id` varchar(36) NOT NULL COMMENT 'Conversion UUID',
  `conversion_source` varchar(36) NOT NULL COMMENT 'Conversion type',
  `conversion_status` int NOT NULL COMMENT 'Conversion state',
  `conversion_uuid` varchar(36) NOT NULL COMMENT 'Conversion UUID',
  `conversion_third_platform` varchar(255) NOT NULL COMMENT 'Conversion third platform',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_conversion`
--

/*!40000 ALTER TABLE `user_conversion` DISABLE KEYS */;
INSERT INTO `user_conversion` VALUES (1,'6d65908c47bb4dad9b2450d70d7eca53','2030ee4b-51d6-4e8d-819a-28ce91fe2f5c','',0,'2030ee4b-51d6-4e8d-819a-28ce91fe2f5c','','2025-02-06 14:04:44','2025-02-06 14:04:44');
/*!40000 ALTER TABLE `user_conversion` ENABLE KEYS */;

--
-- Table structure for table `user_feedback`
--

DROP TABLE IF EXISTS `user_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `feedback` varchar(300) NOT NULL COMMENT 'Feedback',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_feedback`
--

/*!40000 ALTER TABLE `user_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_feedback` ENABLE KEYS */;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `username` varchar(255) NOT NULL COMMENT 'Login username',
  `name` varchar(255) NOT NULL COMMENT 'User real name',
  `password_hash` varchar(255) NOT NULL COMMENT 'Hashed password',
  `email` varchar(255) NOT NULL COMMENT 'Email',
  `mobile` varchar(20) NOT NULL COMMENT 'Mobile',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `default_model` varchar(255) NOT NULL COMMENT 'Default model',
  `user_state` int DEFAULT NULL COMMENT 'User_state',
  `user_sex` int DEFAULT NULL COMMENT 'user sex',
  `user_birth` date DEFAULT NULL COMMENT 'user birth',
  `user_avatar` varchar(255) DEFAULT NULL COMMENT 'user avatar',
  `user_open_id` varchar(255) DEFAULT NULL COMMENT 'user open id',
  `user_unicon_id` varchar(255) DEFAULT NULL COMMENT 'user unicon id',
  `user_language` varchar(30) DEFAULT NULL COMMENT 'user language',
  PRIMARY KEY (`id`),
  KEY `ix_user_info_mobile` (`mobile`),
  KEY `ix_user_info_user_id` (`user_id`),
  KEY `ix_user_info_user_open_id` (`user_open_id`),
  KEY `ix_user_info_user_unicon_id` (`user_unicon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'6d65908c47bb4dad9b2450d70d7eca53','','麻瓜','','','','2025-02-06 14:04:44','2025-02-06 14:49:08','gpt-3.5-turbo-0613',0,0,'2003-01-01','','','','zh-CN');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `profile_key` varchar(255) NOT NULL COMMENT 'Profile key',
  `profile_value` text NOT NULL COMMENT 'Profile value',
  `profile_type` int NOT NULL COMMENT '0 default, 1 system configuration, 2 user configuration, 3 course configuration',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  `status` int NOT NULL COMMENT '0 for deleted, 1 for active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'6d65908c47bb4dad9b2450d70d7eca53','nickname','麻瓜',1,'2025-02-06 14:31:54','2025-02-06 14:49:08',0),(2,'6d65908c47bb4dad9b2450d70d7eca53','purpose','了解产品形式',1,'2025-02-06 14:32:21','2025-02-06 14:49:41',0),(3,'6d65908c47bb4dad9b2450d70d7eca53','user_background','产品经理',1,'2025-02-06 14:32:53','2025-02-06 14:50:41',0),(4,'6d65908c47bb4dad9b2450d70d7eca53','style','鼓励温暖',1,'2025-02-06 14:33:15','2025-02-06 14:51:17',0),(5,'6d65908c47bb4dad9b2450d70d7eca53','content','AI 师傅能输出语音吗？',1,'2025-02-06 14:34:29','2025-02-06 14:52:20',0);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;

--
-- Table structure for table `user_token`
--

DROP TABLE IF EXISTS `user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Unique ID',
  `user_id` varchar(36) NOT NULL COMMENT 'User UUID',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `token_type` int NOT NULL COMMENT 'Token type',
  `token_expired_at` timestamp NULL DEFAULT NULL COMMENT 'Token expired time',
  `created` timestamp NOT NULL COMMENT 'Creation time',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_token`
--

/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;

--
-- Dumping routines for database 'ai-shifu'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-07 10:18:03
