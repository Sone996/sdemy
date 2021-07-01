-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: fww3_db
-- ------------------------------------------------------
-- Server version	8.0.25

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

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('85c9079c644b');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `con_user_course`
--

DROP TABLE IF EXISTS `con_user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `con_user_course` (
  `user_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `con_user_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `con_user_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `tbl_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `con_user_course`
--

LOCK TABLES `con_user_course` WRITE;
/*!40000 ALTER TABLE `con_user_course` DISABLE KEYS */;
INSERT INTO `con_user_course` VALUES (5,2),(5,4),(1,1),(1,28);
/*!40000 ALTER TABLE `con_user_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_course`
--

DROP TABLE IF EXISTS `tbl_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_course` (
  `teacher_id` int DEFAULT NULL,
  `name` varchar(120) NOT NULL,
  `price` int NOT NULL,
  `average_mark` float DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_of_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_of_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `tbl_course_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `tbl_course_chk_1` CHECK ((`deleted` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_course`
--

LOCK TABLES `tbl_course` WRITE;
/*!40000 ALTER TABLE `tbl_course` DISABLE KEYS */;
INSERT INTO `tbl_course` VALUES (1,'Python',1000,3,1,'2021-06-17 10:58:11','2021-06-21 11:40:56',NULL,0),(1,'Java',500,0,2,'2021-06-17 10:58:42','2021-06-17 10:58:42',NULL,0),(1,'Java Script',3000,3.5,3,'2021-06-17 10:58:51','2021-06-21 11:36:52',NULL,0),(1,'HTML',15000,3,4,'2021-06-17 10:59:01','2021-06-21 11:41:53',NULL,0),(1,'JS',3000,3,5,'2021-06-17 14:02:38','2021-06-21 10:56:22',NULL,0),(1,'JS advance',5000,0,6,'2021-06-17 14:07:58','2021-06-17 14:07:58',NULL,0),(1,'VUE2',3000,0,7,'2021-06-17 14:09:26','2021-06-17 14:09:26',NULL,0),(1,'VUE3',4000,0,8,'2021-06-17 14:16:31','2021-06-17 14:16:31',NULL,0),(1,'Flask',4000,0,9,'2021-06-17 14:37:57','2021-06-17 14:37:57',NULL,0),(1,'test',2000,0,10,'2021-06-17 14:38:30','2021-06-17 14:38:30',NULL,0),(1,'test2',2000,0,11,'2021-06-17 14:39:55','2021-06-17 14:39:55',NULL,0),(1,'test3',2000,0,12,'2021-06-17 14:41:35','2021-06-17 14:41:35',NULL,0),(1,'test4',3000,0,13,'2021-06-17 14:42:19','2021-06-17 14:42:19',NULL,0),(1,'test5',4000,0,14,'2021-06-17 14:42:42','2021-06-17 14:42:42',NULL,0),(1,'test6',3000,0,15,'2021-06-17 14:43:48','2021-06-17 14:43:48',NULL,0),(1,'test7',4000,0,16,'2021-06-17 14:49:27','2021-06-17 14:49:27',NULL,0),(1,'test8',5000,0,17,'2021-06-17 14:50:41','2021-06-17 14:50:41',NULL,0),(5,'Vue.js',100000,0,18,'2021-06-17 14:54:02','2021-06-17 14:54:02',NULL,0),(1,'Chemistry',4500,0,19,'2021-06-18 11:21:34','2021-06-18 11:21:34',NULL,0),(1,'Vue',3000,0,20,'2021-06-18 12:21:02','2021-06-18 12:21:02',NULL,0),(1,'Test',2000,0,21,'2021-06-18 13:26:28','2021-06-18 13:26:28','\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lobortis elementum faucibus. Aliquam purus massa, posuere quis lectus et, tempor eleifend turpis. Aliquam erat volutpat. Donec quis porttitor diam, sit amet mattis tortor. Maecenas sit amet finibus elit, sed varius dui. Aliquam nisi nibh, elementum sed sollicitudin sit amet, faucibus ac justo. Integer mollis accumsan dui ac molestie. Curabitur varius eros neque, a bibendum turpis hendrerit sit amet. Vestibulum pellentesque, diam eu rhoncus iaculis, velit mauris pulvinar nisi, id varius lorem ante in ipsum. Morbi accumsan, quam ac feugiat mattis, turpis dui scelerisque magna, eget cursus est nunc quis urna. Morbi euismod tincidunt nisi vel vulputate.\n\nAenean at lacus eu dolor gravida dictum. Vivamus eu congue ex. Donec a ex ac magna blandit maximus sit amet et ligula. Maecenas at malesuada felis. Donec lobortis, risus id iaculis fermentum, sem risus placerat lacus, sodales sollicitudin ante eros eget ex. Sed placerat dictum mauris vitae consectetur. Maecenas et tortor id sapien vestibulum aliquet accumsan eu nibh. Mauris dictum nisi vitae sem lacinia, a consectetur nisl vulputate. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi interdum lobortis enim, quis blandit magna facilisis non. Vestibulum malesuada sagittis posuere. Sed at dignissim erat. Ut condimentum scelerisque euismod. Donec vestibulum aliquet tellus vel venenatis.\n\nIn condimentum lobortis velit ut rhoncus. Sed congue elementum semper. Sed ornare magna et sodales pulvinar. Donec sit amet nibh felis. Phasellus cursus ac lorem nec convallis. Donec lacinia elementum odio vel blandit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum ut pellentesque sapien, pulvinar scelerisque dui. Curabitur porta nibh sed odio interdum sagittis. Proin porttitor non sem tincidunt semper. Etiam gravida lorem massa, cursus accumsan risus mattis at. Etiam dapibus sem ut metus sollicitudin aliquet. Nulla ultricies fringilla elementum.',0),(1,'Brackets',3000,0,22,'2021-06-22 15:36:39','2021-06-22 15:36:39',NULL,0),(1,'Brackets',3000,0,23,'2021-06-22 15:37:11','2021-06-22 15:37:11',NULL,0),(1,'Brackets',3000,0,24,'2021-06-22 15:37:45','2021-06-22 15:37:45',NULL,0),(1,'Brackets',3000,0,25,'2021-06-22 15:38:17','2021-06-22 15:38:17',NULL,0),(1,'Brackets',3000,0,26,'2021-06-22 15:42:05','2021-06-22 15:42:05',NULL,0),(1,'Brackets 2',300,0,27,'2021-06-22 15:43:27','2021-06-24 10:15:34',NULL,0),(1,'Brackets',3000,0,28,'2021-06-22 15:45:22','2021-06-24 10:10:40',NULL,0);
/*!40000 ALTER TABLE `tbl_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_student_course`
--

DROP TABLE IF EXISTS `tbl_student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_student_course` (
  `course_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `complete` tinyint(1) DEFAULT '0',
  `comment` text,
  `mark` int DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `id` int NOT NULL AUTO_INCREMENT,
  `date_of_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_of_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `tbl_student_course_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_course` (`id`),
  CONSTRAINT `tbl_student_course_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `tbl_student_course_chk_1` CHECK ((`complete` in (0,1))),
  CONSTRAINT `tbl_student_course_chk_2` CHECK ((`active` in (0,1))),
  CONSTRAINT `tbl_student_course_chk_3` CHECK ((`deleted` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_student_course`
--

LOCK TABLES `tbl_student_course` WRITE;
/*!40000 ALTER TABLE `tbl_student_course` DISABLE KEYS */;
INSERT INTO `tbl_student_course` VALUES (1,2,0,'this course was meh',3,1,1,'2021-06-17 11:40:00','2021-06-21 11:40:56',0),(3,2,0,'this course was meh',3,1,2,'2021-06-17 11:40:13','2021-06-21 11:36:52',0),(4,3,0,'this course was meh',3,1,3,'2021-06-17 13:42:27','2021-06-21 11:41:53',0),(4,4,0,'this course was meh',0,1,4,'2021-06-17 13:42:52','2021-06-21 11:00:40',0),(3,4,0,'this course was meh',3,1,5,'2021-06-21 10:55:05','2021-06-21 11:01:02',0),(1,3,0,'Please add me to this course, I am a nerd',0,1,6,'2021-06-24 10:42:46','2021-06-24 10:42:46',0),(28,3,0,NULL,0,1,7,'2021-06-24 11:56:29','2021-06-24 11:56:29',0),(28,3,0,NULL,0,1,8,'2021-06-24 11:57:22','2021-06-24 11:57:22',0),(28,3,0,NULL,0,1,9,'2021-06-24 11:58:20','2021-06-24 11:58:20',0);
/*!40000 ALTER TABLE `tbl_student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_student_course_request`
--

DROP TABLE IF EXISTS `tbl_student_course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_student_course_request` (
  `course_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `comment` text,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_of_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_of_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0',
  `accepted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `tbl_student_course_request_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_course` (`id`),
  CONSTRAINT `tbl_student_course_request_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `tbl_student_course_request_chk_1` CHECK ((`deleted` in (0,1))),
  CONSTRAINT `tbl_student_course_request_chk_2` CHECK ((`accepted` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_student_course_request`
--

LOCK TABLES `tbl_student_course_request` WRITE;
/*!40000 ALTER TABLE `tbl_student_course_request` DISABLE KEYS */;
INSERT INTO `tbl_student_course_request` VALUES (1,3,1,'Please add me to this course, I am a nerd',1,'2021-06-24 10:43:30','2021-06-24 12:02:17',0,1),(28,3,1,'Please add me to this course, I am a nerd',2,'2021-06-24 11:04:08','2021-06-24 12:01:10',0,1);
/*!40000 ALTER TABLE `tbl_student_course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `email` varchar(120) NOT NULL,
  `password` text,
  `name` varchar(120) NOT NULL,
  `surname` varchar(120) NOT NULL,
  `role` enum('teacher','student') NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_of_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_of_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `tbl_user_chk_1` CHECK ((`deleted` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES ('jason.statham@gmail.com','ba50e0617ff9a500e871e68a9d756d755ee400c0bb9ca4fa429f5a785a3d9be2daccb13ceebb1fa16aa3717d04374ad60dabc3f4f6a1dd11f86241ac4a544444','Jason','Statham','teacher',1,'2021-06-17 10:16:42','2021-06-17 13:41:10',0),('elena.lemonis@gmail.com','81f3b05dea8be2216a3ac5aec17aa6a5cf5ced5e9e04f738076e277d0a2f7205d1132b66ec16f70912c734e4546f22c70103e8ea01007e24a9218881dcf7fca5','Elena','Lemonis','student',2,'2021-06-17 10:17:28','2021-06-17 10:17:28',0),('cookie.lemonis@gmail.com','791369f275ddcc64695526bf5faf7a504f24dfcb19829df467f9bd48f46516a53e597ef6a4245395d870de51c37a216b11bc47747754fe240732cfcd27af5543','Cookie','Lemonis','student',3,'2021-06-17 13:35:19','2021-06-17 13:35:19',0),('stafan.the.king@gmail.com','f0d44d07c5f85b9ea62400206765204162befbb007d38206881cf2434f18e62eacef4f0b0f141983cb894ee074f449472248481e56fb86c462275333d08adcb0','Stefan','Car','student',4,'2021-06-17 13:36:02','2021-06-17 13:36:02',0),('medeni.milos@gmail.com','e89721fdb89182ea23be42ca7f7c95a21a4c61fa96e67c6a945c33e136efc46aee3a8b2651987001aaed25ccd29118ef132f5ff9b8681f6ac97bae189b6b0fa7','Milos','Medan','teacher',5,'2021-06-17 13:37:25','2021-06-17 13:40:11',0);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_session`
--

DROP TABLE IF EXISTS `tbl_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_session` (
  `user_id` int NOT NULL,
  `session_id` varchar(150) NOT NULL,
  `session_date` date DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_of_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_of_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_user_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `tbl_user_session_chk_1` CHECK ((`deleted` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_session`
--

LOCK TABLES `tbl_user_session` WRITE;
/*!40000 ALTER TABLE `tbl_user_session` DISABLE KEYS */;
INSERT INTO `tbl_user_session` VALUES (1,'sess:1:631145dcaabd91f4cb81474f7caedc62240d29b38b8b169bc1bf5e827255c10d0548aa0c35cf62f1217dc2e4adea320e8a6d8bb0f67ff764a7c2b0ae430ca0b3','2021-06-17',1,'2021-06-24 09:30:00','2021-06-17 10:21:16',0),(1,'sess:1:d7c0be6fb2e325b5e9209cd194ba213257eb830d1301f6b8e9ca0e4245c4f0736aa9afe7a4a5a70056eb1b47cdd1ad5a1c67f15ce77df8771f67061560da577f','2021-06-17',2,'2021-06-24 09:30:00','2021-06-17 10:21:43',0),(1,'sess:1:600aefb90d4d2419c995fe76689a78a792f9fdd7f13663b01a745f3a2e5227d62477fc1686e0f82a2086f4678d3e950006ad7a2be093755cdbea91ed05f778fb','2021-06-17',3,'2021-06-24 09:30:00','2021-06-17 11:23:10',0),(1,'sess:1:647002cf533ae57ed38fb81aca68cfa5c341d49f0dec7f0db7517dbfff6092ecea887c29b63f0a98e5a84611796e93f2bb08b486713b17927a0070c97671a68d','2021-06-17',4,'2021-06-24 09:30:00','2021-06-17 11:25:02',0),(1,'sess:1:28f45bc6d59457f3a099be6778ac6998fba428eabefd36530d5812226b154139e8db07ca1e1b3b27790f87196c8ebdcbe1622da59d7927c7766a01a4e9227e95','2021-06-17',5,'2021-06-24 09:30:00','2021-06-17 11:40:29',0),(1,'sess:1:8a4ce1adc8f43c982bee2a05ec7699606df243f7ba5e755985f13842a1d7b97591c53b645fb16ee2efb3e1f17056276226db63b2ee4bf6e3b0c81352377c31b1','2021-06-17',6,'2021-06-24 09:30:00','2021-06-17 11:41:52',0),(1,'sess:1:baa4f2f338b3632f4708c1861e7a249d29676ff759693337bf17906590cd8816f17c1bdf7865cf6d303791341a65b8891880e8dcf77d9e7c723d9a463946bfbb','2021-06-17',7,'2021-06-24 09:30:00','2021-06-17 11:43:56',0),(1,'sess:1:349b1f279f5d421c05257b894ed80293d8621000a8499f7b214b80da2f3b0a3dcd7f2871e497978c4a909ae67ac0b88aa28cf47387d2c83de08d88265394c5d6','2021-06-17',8,'2021-06-24 09:30:00','2021-06-17 11:45:42',0),(1,'sess:1:a7ad75f9a70eec750c85522d9aeaa170fcae49ed18ba7a88e0ab9f16a9d7b85c28832767d23969066d20fdb0e27882465e475ea8bc98bb453b960439f94957d6','2021-06-17',9,'2021-06-24 09:30:00','2021-06-17 11:47:14',0),(1,'sess:1:8723566f828061009981d8d302473873b53f790c77e1f8972e5f574853834b3f1e38be2d31b42cd4141b1de7232b2dfea1ac65f06dbb3a0055ed97133c82d56b','2021-06-17',10,'2021-06-24 09:30:00','2021-06-17 11:49:03',0),(1,'sess:1:f7b0154449db82a207c5ba6392870337fb68a38b7723344158b1d69d417a31844b2277907711879cdfbcaea3963d9fc20012c93455741be4b9d6e0c6dbaeacca','2021-06-17',11,'2021-06-24 09:30:00','2021-06-17 11:50:27',0),(1,'sess:1:37a8530531808f29d165dad0158a67130922a79fc4c8b675f41cb458f217bd1deecf29baea92bcf8e48e7fc996a98501f709b38a93041d92d906b7eb21fd09a3','2021-06-17',12,'2021-06-24 09:30:00','2021-06-17 11:51:20',0),(1,'sess:1:59165f22c7d6ad6d5caaf5898d7bde1279d0894fc9920eadfc36f36629a65fb7fb521a7b04ae19a51ab4ea3babc8abf6e5c309c2a205ebf333d64ebc3bdebdf3','2021-06-17',13,'2021-06-24 09:30:00','2021-06-17 11:53:59',0),(1,'sess:1:5d36081fbbae7cf3f46a74f5b0dee7bd013300d9c018eeab15086b5a1a88e7e44bb3214da1a79528a3be303e82162db4cf95beb4db6217f8b96dd1f8fe2230cd','2021-06-17',14,'2021-06-24 09:30:00','2021-06-17 11:57:19',0),(1,'sess:1:0eb73f897eecc5764ef5c19d5338ee2093f7b057bface99e7afd53164815ea63ab16287766942d164de4c0926b39c299b685a6eba0beccf4d656328e734d3f35','2021-06-17',15,'2021-06-24 09:30:00','2021-06-17 11:57:44',0),(1,'sess:1:7cc99f7717c30951fa04824fc949e1c9b72e3aab44a699ee84c938f6c8e77ba9caf48af5a4f5011553286f6b7c0a4afffe14728b3f453d03c655301b44527e47','2021-06-17',16,'2021-06-24 09:30:00','2021-06-17 12:05:26',0),(1,'sess:1:d83b4227699509f6187ae2be20ad257e97bf3e4aeabf019ea2bf9935e879908886500535ad8608fb27263ee991b31ab9158e8a3341b1c5b437490354650ca035','2021-06-17',17,'2021-06-24 09:30:00','2021-06-17 12:07:47',0),(1,'sess:1:fc56614a4ccd9e9e78b80c2c425c904c4e7608afa5750e8c879dea33a3a455e88b1cfac6770ab51ca1ad884d023ed8320d5a565260116a65d77c88874e947822','2021-06-17',18,'2021-06-24 09:30:00','2021-06-17 12:14:25',0),(1,'sess:1:4e9599d7dc6a0116029b98530cecebfc9398a5685e5e8e862bcf9c499ffc663b69da155981898d55b916d27698908212e7ee56c81ab7c445dd1fcd0ac71b12a0','2021-06-17',19,'2021-06-24 09:30:00','2021-06-17 12:14:59',0),(1,'sess:1:9bda8533a87af0d8f811fc66f5229f3fcff25314f9a7d51d50506ca3b3c6782abd151dee438d05d948c02c093f16df68269781953dcd6eadf5796f68fe42e2dc','2021-06-17',20,'2021-06-24 09:30:00','2021-06-17 12:16:08',0),(1,'sess:1:b09296624829ec0093d960d1c1d9810a2936406fa24fe0c9089435fba9ff07fa7325c8cc13c097c3bacf812d234d89d1e3603514641ce54dd8cb6c3ccdbf7d55','2021-06-17',21,'2021-06-24 09:30:00','2021-06-17 12:16:49',0),(1,'sess:1:c31e6de5238b89f9df7be030df40bf6294e2fbf98f8046a942508cd0d503674c07e3b47d973f15028f6c3f043b73e11639c6f28a539b991ed6e04fc0e1ea6c45','2021-06-17',22,'2021-06-24 09:30:00','2021-06-17 13:34:46',0),(3,'sess:3:269f44edfa2f80cf5a2bbc4e53e83575f0ebfdadaf2999b054e05e2b5249bc4535329489d34e7bc19f431c378299ead0422ec203d0057aadda54e832003353f0','2021-06-17',23,'2021-06-24 09:30:00','2021-06-17 13:35:19',0),(4,'sess:4:3d663781b1fff97f65e8f48a44ce59ab5fc5e077fc3cd556898714f932bd5b371b23e7539a75791057ff393288aae944a5c420a4fcfa1f97e4df469a91cdaebf','2021-06-17',24,'2021-06-24 09:30:00','2021-06-17 13:36:02',0),(5,'sess:5:102c93deb87b19ffa20812ee845f3cbb220b90f0f22e52071e6f04e4201b6c452f955456b1f6e355d18f8a58d1d47f02c657c7927131818f69485648e0770018','2021-06-17',25,'2021-06-24 09:30:00','2021-06-17 13:37:25',0),(5,'sess:5:5c427b85bf84a961dc8a0ca18be6f52f54e53ac9ee53413c809453fc55ddece6df5a224fd5a19ad8a73fd8d7894a0a059922fb54f6b61b4ac017d0f5fd1b0cd5','2021-06-17',26,'2021-06-24 09:30:00','2021-06-17 14:53:41',0),(1,'sess:1:b81ccd6b46b38a96a4a56d61336b58524e127a739cc0bf21935dab0383f6d8ecc29faec9b3f733efe06853693d21555f85ac845bef054ea4ffe9269754daf042','2021-06-18',27,'2021-06-24 09:30:00','2021-06-18 09:46:51',0),(1,'sess:1:bfaaaabfbe851849fc35d177411add1e69ab9e361d6523dd30b1fda694cbfa889ff9faf03a921b99ff54538b7e2e89e925255f881ef234a255d8bdb853671b07','2021-06-18',28,'2021-06-24 09:30:00','2021-06-18 10:52:49',0),(1,'sess:1:350445bb3ffe93b4ec96b321daf22ca3a4b24e7448431715ecb9ef17f75e253c731620b6eb55ba966f43d813f6762a9c9b6ac13a89c42a28637e4ec9e3904492','2021-06-18',29,'2021-06-24 09:30:00','2021-06-18 10:55:48',0),(1,'sess:1:d740c5fa8d6a4f88dd2058129544f864b5f311839c43abfde44d7d9b3520ffe7cf4c0e53f85ba1338b5759c0280a2735be2caed3d0a23159cb514af26c8eeee3','2021-06-18',30,'2021-06-24 09:30:00','2021-06-18 11:17:12',0),(2,'sess:2:cc48f2da6fcacd1410a283c454d2038a39f8f13636771f62d4332bcfea70720fee3dab99add0d5c54d727432dd2f327bfa017b1f9aa5d011293726fc213b92c4','2021-06-18',31,'2021-06-24 09:30:00','2021-06-18 11:27:39',0),(1,'sess:1:270379743cbf48741ab206d3b24b1f62677cd09828573fe710e90778b42d2cb849948d581a4d4886be742cef01acea33d0af37a145da64d84f943cc57271fd7a','2021-06-18',32,'2021-06-24 09:30:00','2021-06-18 11:29:10',0),(2,'sess:2:0649a12851871bc21ec258e08d2b3ee80b8f24ca8a1dfdb38105c6930f4d7cf1c05932b592d6e1b0c78b68253f38468f423cb3b614968b151bb5f9983e358aac','2021-06-18',33,'2021-06-24 09:30:00','2021-06-18 12:15:46',0),(1,'sess:1:7eb910dff07a569d58a4aa6dbb1443e85e14088842c30903b45e820b6e456571ccef9599af849b1ed114badb48c4b3d90cc5c036c6003a0eb3020cd7e7222ba2','2021-06-18',34,'2021-06-24 09:30:00','2021-06-18 12:20:48',0),(1,'sess:1:3b02ec3d7c933b18068007bba4572541660c9e5e49219dfb9ecd485906e9c383e004aad941c14a1c27fc6cd2a4dc3f796f7263ec0cf002efcb8ee276072c1a6e','2021-06-18',35,'2021-06-24 09:30:00','2021-06-18 13:30:30',0),(1,'sess:1:e8309c70afce95f9b81f4e7279982e1b4498759792b8124890ab2f6fa84860c6acbc482d8ecd7dd6393b3d67547a2dfa5367c1a60193facf94e0fd6783d6e75a','2021-06-18',36,'2021-06-24 09:30:00','2021-06-18 13:30:42',0),(1,'sess:1:a8b866e33a9cd8d643241f99791057327f90124deaeef392a5de74e515c00558775a7701c3173811104139f92e9c43143c26bd0ab21b287d3c63d3b57091beaf','2021-06-18',37,'2021-06-24 09:30:00','2021-06-18 13:38:27',0),(1,'sess:1:e4804547bc76c70fbe9543e6fc77433a681e7c1f4947f1cc2a88d0e4245d760389bb17a37121d5c4f2a431eb5dbb7ab477a6b6a5d4921810bd601bce975fa887','2021-06-21',38,'2021-06-24 09:30:00','2021-06-21 12:31:09',0),(1,'sess:1:a848176d66c23ed6ced30ffa21b7afb4bd9fe4648f9da80e57c3cc6cd6ad60674663f3b233c2515466786f00bb667fc0392198babd0cfbdcbf210fda8ae9972f','2021-06-21',39,'2021-06-24 09:30:00','2021-06-21 12:36:15',0),(1,'sess:1:a7b70b34fe054fb1fd31d6e222bc5195c09dff89c8ad0cb1d63b14b1d493588a8b4093f18e6d181da2a3ee32b3c2d00b2373561a7875f292350527100c19ab2c','2021-06-21',40,'2021-06-24 09:30:00','2021-06-21 12:37:39',0),(1,'sess:1:81912790330c3c0917bfbc110fd47b79b2fd3b648ce6a816037155c14e8b34c5486fd851259564fd68d8f2c552fd4ad9783f199ffa7352a23cbd79309c483662','2021-06-21',41,'2021-06-24 09:30:00','2021-06-21 12:44:13',0),(1,'sess:1:aa67c217dbd170afe8b898f00b6d57db2fb5bdf7fa6eb062a569e16ba62e0f2e55c484c223cecb36a8b8bfe07c9de951f1c6f052d62f8f34ae8fdafaee64f272','2021-06-22',42,'2021-06-24 09:30:00','2021-06-22 15:25:16',0);
/*!40000 ALTER TABLE `tbl_user_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-24 12:16:45
