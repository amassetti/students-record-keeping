CREATE DATABASE  IF NOT EXISTS `gti_record_keeping_v2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gti_record_keeping_v2`;
-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: gti_record_keeping_v2
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `address_line_1` varchar(100) DEFAULT NULL,
  `address_line_2` varchar(100) DEFAULT NULL,
  `eir_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_city_idx` (`city_id`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'63 Shantalla Road','Galway','H91YQF7'),(2,2,'1 Dublin road','Dublin','H77H91'),(3,3,'1 Dublin road','Sligo','H66H91'),(4,4,'10 Some road','Mayo','H55H91'),(5,1,'1 Shantalla road','Galway','H91YEF1'),(6,2,'70 Shantalla road','Galway','H91YEF9'),(7,1,'1 galway road','Galway','H91YEF1'),(8,1,'2 galway road','Galway','H91YED1'),(9,1,'5 galway road','Galway','H91YEF5'),(10,1,'9 Galway road','Galway','H91TR7'),(12,5,'2 asdas','asdasd','H81YS2'),(13,1,'1 galway','Galway','H91YEF4'),(14,1,'50 Shantalla road','Galway','H91YEF5'),(15,1,'8 galway street','Galway','H91ERF8'),(16,1,'Galway 123','Galway','H91YEF9'),(17,3,'123 Sligo','Sligo','Y54YED3'),(18,1,'Galway 123','Galway','H91YED2'),(19,1,'Line 1','Line 2','H87YEF6'),(20,2,'asd','asd','asd'),(21,1,'10 Tuam road','Galway','H91YEF1'),(22,1,'74 Shantalla road','Galway','H91YEF3');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `address_id` int NOT NULL,
  `gender_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ppsn` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `fk_admin_address1_idx` (`address_id`),
  KEY `fk_admin_gender1_idx` (`gender_id`),
  CONSTRAINT `fk_admin_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_admin_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,3,2,'Ariel','Massetti','amassetti@xmail.com','9352617AB'),(2,4,1,'Paula','Mantel','pmantel@xmail.com','9112223AB');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) DEFAULT NULL,
  `county` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Galway','Galway'),(2,'Dublin','Dublin'),(3,'Sligo','Sligo'),(4,'Mayo','Mayo'),(5,'Foxford','Mayo'),(6,'Oranmore','Galway'),(7,'Cushendall','Antrim'),(8,'Armagh','Armagh');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL,
  `course_type_id` int NOT NULL,
  `course_code` varchar(45) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `certification` int DEFAULT NULL,
  `fee` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `fk_course_course_category1_idx` (`department_id`),
  KEY `fk_course_course_type1_idx` (`course_type_id`),
  CONSTRAINT `fk_course_course_type1` FOREIGN KEY (`course_type_id`) REFERENCES `course_type` (`course_type_id`),
  CONSTRAINT `fk_course_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,1,1,'6M0691','Advanced Certificate in Software Development','asd desc',6,NULL),(2,1,1,'5M0529','Programming and Software Development with Cyber Security','Programming and Software Development with Cyber Security  desc',5,NULL),(4,3,1,'ASD','ASD','ASD',5,NULL),(5,5,1,'5M5146','Sports and Physical Therapy','This one-year Sports and Physical Therapy course equips students with a range of ',5,NULL),(6,6,1,'5M18519','Film & TV','Film and TV description',5,NULL),(7,2,1,'6M5153','Advanced Certificate in Animal Science','Advanced Certificate in Animal Science',5,NULL),(9,2,1,'5M4468','Emergency Care Services','Emergency Care Services',5,NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_type`
--

DROP TABLE IF EXISTS `course_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_type` (
  `course_type_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Course Type:\nPart time\nFull time';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_type`
--

LOCK TABLES `course_type` WRITE;
/*!40000 ALTER TABLE `course_type` DISABLE KEYS */;
INSERT INTO `course_type` VALUES (1,'Full Time'),(2,'Part Time');
/*!40000 ALTER TABLE `course_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Department:\n- Sports\n- IT & Computing\n- Media\n- Fashion\netc etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'IT & Computing','IT & Computing related stuff'),(2,'Applied Health Sciences','Applied Health Sciences description'),(3,'Art & Design','Art & Design description'),(5,'Sports','Sports description'),(6,'Media','Media'),(7,'Business','Business description');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `gender_id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Female'),(2,'Male'),(3,'Other');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `assesment_1` decimal(4,2) DEFAULT NULL,
  `assesment_2` decimal(4,2) DEFAULT NULL,
  `assesment_3` decimal(4,2) DEFAULT NULL,
  `final_exam` decimal(4,2) DEFAULT NULL,
  `overall` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`subject_id`),
  KEY `fk_assesment_result_student1_idx` (`student_id`),
  KEY `fk_assesment_result_subject1_idx` (`subject_id`),
  CONSTRAINT `fk_assesment_result_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `fk_assesment_result_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,3,1.10,2.20,3.30,4.80,NULL),(1,6,0.00,0.00,0.00,0.00,NULL),(1,10,1.00,0.00,0.00,30.00,NULL),(2,3,0.01,0.01,0.01,50.01,NULL),(2,6,0.00,0.00,0.00,0.00,NULL),(2,10,0.00,0.00,0.00,0.00,NULL),(3,3,9.01,9.01,9.01,9.01,NULL),(3,6,0.00,30.00,0.00,0.00,NULL),(3,10,0.00,0.00,0.00,0.00,NULL),(4,3,0.01,0.01,0.01,0.01,NULL),(4,4,1.00,2.00,3.00,4.00,NULL),(4,6,0.00,0.00,0.00,0.00,NULL),(4,10,0.00,0.00,30.00,10.00,NULL),(5,3,0.01,0.01,0.01,0.05,NULL),(5,6,0.00,0.00,0.00,0.00,NULL),(5,10,0.00,0.00,0.00,20.00,NULL),(8,3,1.20,2.20,3.30,54.70,NULL),(8,6,0.00,0.00,0.00,0.00,NULL),(8,10,10.00,10.00,10.00,0.00,NULL),(9,3,9.20,8.00,7.00,6.00,NULL),(9,4,4.40,3.30,2.20,1.10,NULL),(9,6,10.00,10.00,10.00,10.00,NULL),(9,10,0.00,0.00,0.00,30.00,NULL),(10,3,1.50,2.02,33.30,54.40,NULL),(10,6,0.00,0.00,0.00,0.00,NULL),(10,10,10.00,9.00,8.00,0.00,NULL),(11,1,1.10,2.20,3.30,4.40,NULL),(12,3,10.00,10.00,10.00,10.00,NULL),(12,10,11.00,11.50,9.00,9.00,NULL);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_code` varchar(45) DEFAULT NULL,
  `role_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN','Administrator'),(2,'ROLE_TEACHER','Teacher');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `address_id` int NOT NULL,
  `gender_id` int NOT NULL,
  `student_code` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ppsn` varchar(20) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `date_of_birth` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_code_UNIQUE` (`student_code`),
  KEY `fk_student_address1_idx` (`address_id`),
  KEY `fk_student_gender1_idx` (`gender_id`),
  CONSTRAINT `fk_student_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_student_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,6,2,NULL,'Ariel','Massetti','amassetti@gmail.com','1234567BA',NULL,NULL),(2,7,2,NULL,'Caglar','Cetinceviz','cc@gti.com','23412231T',NULL,NULL),(3,8,2,NULL,'Dmytro','Ovcharenko','dovcharenko@gti.com','343143234U',NULL,NULL),(4,9,2,NULL,'Sean','Mitchell','smitchell@gti.com','3421321A',NULL,NULL),(5,10,2,NULL,'Gavin','Goldrick','ggoldrick@gti.com','34234231A',NULL,NULL),(7,12,1,NULL,'Juan','Perez','jperez@gti.com','4324232s',NULL,NULL),(8,13,1,NULL,'Olufemi','Adegboruwa','olufemiAdegboruwa@gti.com','23423421F',NULL,NULL),(9,18,2,NULL,'Akif','Mehmet','amehmet@gti.com','23423223AK',NULL,NULL),(10,19,2,NULL,'Liam','Brady','lbrady@gti.com','23423423Y',NULL,NULL),(11,20,2,NULL,'John','Smith','jsmith@xmail.com','123123',NULL,NULL),(12,22,2,NULL,'Patrick','Feeney','pfeeney@gti.com','23423423',NULL,NULL),(14,10,2,NULL,'Ermengarde','Devoy','edevoy0@dmoz.org','6HH3UK9DJ86',NULL,NULL),(16,6,1,NULL,'Teodora','Sterricks','tsterricks1@bandcamp.com','2DD2VX9TU74',NULL,NULL),(17,9,1,NULL,'Liv','McCullouch','lmccullouch2@tmall.com','7E70JY9VF81',NULL,NULL),(18,10,1,NULL,'Mendie','Cathee','mcathee3@odnoklassniki.ru','6PH5TQ9FQ14',NULL,NULL),(19,10,1,NULL,'Gav','Simner','gsimner4@issuu.com','8CN6U10RP22',NULL,NULL),(20,10,1,NULL,'Birgit','Thal','bthal5@jalbum.net','6D16JH6HM84',NULL,NULL),(21,8,1,NULL,'Laurie','Beardon','lbeardon6@wikispaces.com','9G53K06TE72',NULL,NULL),(22,6,1,NULL,'Luz','Roper','lroper7@gov.uk','7PA9AR9WM83',NULL,NULL),(23,7,1,NULL,'Piggy','Prenty','pprenty8@wired.com','7M24N07VD60',NULL,NULL),(25,9,1,NULL,'Winne','Baroche','wbarochea@blogs.com','7W11RT4EU31',NULL,NULL),(26,10,1,NULL,'Carmita','Runnicles','crunniclesb@epa.gov','5X42JK7VR51',NULL,NULL),(27,9,1,NULL,'Hilliard','Nowill','hnowillc@icio.us','3AM0H51JM85',NULL,NULL),(28,10,2,NULL,'Emalia','Jaquemar','ejaquemard@vk.com','6KD9QF6YQ87',NULL,NULL),(29,7,1,NULL,'Gwendolin','Josselson','gjosselsone@rambler.ru','4F15FF9WU41',NULL,NULL),(30,10,2,NULL,'Nydia','Zannuto','nzannutof@economist.com','9JN6RE2RH05',NULL,NULL),(31,8,2,NULL,'Venus','Sulter','vsulterg@simplemachines.org','5MG1F28CK18',NULL,NULL),(32,8,1,NULL,'Sissie','Millward','smillwardh@dropbox.com','7MN5VG8CV65',NULL,NULL),(33,10,1,NULL,'Sander','Airdrie','sairdriei@msn.com','3EQ4Y23AH14',NULL,NULL),(34,8,1,NULL,'Ashly','Pleasants','apleasantsj@alexa.com','3H35H95TC51',NULL,NULL),(35,10,2,NULL,'Hatti','Nann','hnannk@yandex.ru','6PV5N27XK86',NULL,NULL),(36,10,2,NULL,'Nadean','Dassindale','ndassindalel@google.es','3V66YY1YW16',NULL,NULL),(37,7,2,NULL,'Gothart','Glison','gglisonm@miibeian.gov.cn','1CG8WJ6FJ95',NULL,NULL),(38,8,1,NULL,'Waldemar','Pitherick','wpitherickn@hp.com','3AM4RP5FU58',NULL,NULL),(39,7,2,NULL,'Amitie','Thairs','athairso@ameblo.jp','4XU6AE4WD44',NULL,NULL),(40,6,1,NULL,'Jeniece','Millom','jmillomp@biglobe.ne.jp','3KE2YQ0QM05',NULL,NULL),(41,10,1,NULL,'Ricky','Basham','rbashamq@delicious.com','9PA9JK0FE90',NULL,NULL),(42,9,2,NULL,'Georgetta','Booth','gboothr@blogs.com','5K64GY3DC98',NULL,NULL),(43,10,2,NULL,'Storm','Fane','sfanes@nps.gov','8YP0KE1RN86',NULL,NULL),(44,7,1,NULL,'Harald','Coats','hcoatst@spiegel.de','9J25EM4WW13',NULL,NULL),(45,10,2,NULL,'Zarah','Colnett','zcolnettu@bloglines.com','9NN9QA2JN90',NULL,NULL),(46,8,2,NULL,'Pauly','Ferrarin','pferrarinv@techcrunch.com','6WG7EC6XU43',NULL,NULL),(47,7,1,NULL,'Ann','Stockport','astockportw@bing.com','9P13V61MD45',NULL,NULL),(48,9,1,NULL,'Lelia','Dombrell','ldombrellx@google.de','7T57MT4PU35',NULL,NULL),(49,9,1,NULL,'Leyla','Wharin','lwhariny@blogspot.com','4TJ3HQ4KY85',NULL,NULL),(50,6,2,NULL,'Salli','Sanpere','ssanperez@ft.com','2RW8H64AJ87',NULL,NULL),(51,6,2,NULL,'Linea','Maybury','lmaybury10@edublogs.org','7U80FD9QV89',NULL,NULL),(52,7,2,NULL,'Iris','Cowcha','icowcha11@hp.com','5RW4DK3PR73',NULL,NULL),(53,6,2,NULL,'Tildie','Croal','tcroal12@prnewswire.com','9R79T41KM79',NULL,NULL),(54,7,1,NULL,'Mattie','Raphael','mraphael13@boston.com','1Q66VW7MD81',NULL,NULL),(55,8,1,NULL,'Tova','Rayer','trayer14@omniture.com','2P53CD8XJ56',NULL,NULL),(56,9,1,NULL,'Nicola','Kilmaster','nkilmaster15@artisteer.com','1U11VC0JE08',NULL,NULL),(57,6,1,NULL,'Dael','Feakins','dfeakins16@dyndns.org','4DM2YV0CM25',NULL,NULL),(58,9,1,NULL,'Malinde','Tredgold','mtredgold17@ehow.com','1DH7JJ0KF76',NULL,NULL),(59,7,2,NULL,'Brady','Chismon','bchismon18@shutterfly.com','8E27MC8FD22',NULL,NULL),(60,10,2,NULL,'Margarita','Rizzelli','mrizzelli19@techcrunch.com','6G61VU4FQ26',NULL,NULL),(61,8,2,NULL,'Ilyse','Farny','ifarny1a@macromedia.com','2MT1TT5CE91',NULL,NULL),(62,6,1,NULL,'Garvin','Bernardeschi','gbernardeschi1b@e-recht24.de','8YF4QR8AY31',NULL,NULL),(63,9,2,NULL,'Rosalind','Bousquet','rbousquet1c@globo.com','4EP4Y39CW48',NULL,NULL),(64,7,1,NULL,'Thorpe','Comfort','tcomfort1d@ft.com','4DN3QK8MM12',NULL,NULL),(65,9,2,NULL,'Nada','Coumbe','ncoumbe1e@craigslist.org','6TN1XP9FP99',NULL,NULL),(66,7,1,NULL,'Renard','Mennear','rmennear1f@rambler.ru','7JT4AP5VP88',NULL,NULL),(67,7,2,NULL,'Moreen','Tollfree','mtollfree1g@delicious.com','3VF1Y20QF92',NULL,NULL),(68,10,2,NULL,'Tarrance','Carty','tcarty1h@netscape.com','1PG1U48NJ92',NULL,NULL),(69,10,1,NULL,'Ondrea','Pow','opow1i@nifty.com','2F17YE7JQ87',NULL,NULL),(70,9,2,NULL,'Augustus','Gall','agall1j@telegraph.co.uk','8AE4U44KQ80',NULL,NULL),(71,6,2,NULL,'Kennedy','Concannon','kconcannon1k@abc.net.au','7NG0A41PU91',NULL,NULL),(72,6,2,NULL,'Cherri','Amber','camber1l@foxnews.com','2HN9GU9MH49',NULL,NULL),(73,10,1,NULL,'Spense','Beaney','sbeaney1m@dropbox.com','2PD6DR8PH81',NULL,NULL),(74,8,2,NULL,'Vincent','Sawers','vsawers1n@businessweek.com','5TX1FE8MQ26',NULL,NULL),(75,6,2,NULL,'Henrieta','Largen','hlargen1o@odnoklassniki.ru','8Y44T14DE47',NULL,NULL),(76,8,1,NULL,'Hilario','Jarrad','hjarrad1p@xing.com','3AP3HA1FE24',NULL,NULL),(77,7,1,NULL,'Leonie','Shoosmith','lshoosmith1q@examiner.com','8TK3ME1ME51',NULL,NULL),(78,8,2,NULL,'Anita','Hutson','ahutson1r@phpbb.com','5EQ0K31DD93',NULL,NULL),(79,10,1,NULL,'Cherri','Kendle','ckendle1s@google.fr','6NQ1CF9AK33',NULL,NULL),(80,8,2,NULL,'Clerissa','Plumm','cplumm1t@toplist.cz','8X03WU7DN96',NULL,NULL),(81,8,1,NULL,'Damon','Paolozzi','dpaolozzi1u@behance.net','9C21H05ME60',NULL,NULL),(82,7,2,NULL,'Lenna','Megainey','lmegainey1v@sitemeter.com','6XC4YE7WK40',NULL,NULL),(83,9,2,NULL,'Kristian','Balsdon','kbalsdon1w@usda.gov','3KE0V03EH73',NULL,NULL),(84,8,1,NULL,'Darn','Sauvage','dsauvage1x@fema.gov','5AV4T66TQ28',NULL,NULL),(85,6,2,NULL,'Orran','Crowche','ocrowche1y@wiley.com','3GR8FQ1YC16',NULL,NULL),(86,7,2,NULL,'Ibbie','Huey','ihuey1z@github.io','9GC5MK3QA87',NULL,NULL),(87,6,1,NULL,'Chancey','Salomon','csalomon20@prlog.org','1KA8AK3YX56',NULL,NULL),(88,7,2,NULL,'Skelly','Corringham','scorringham21@aboutads.info','8GR4EM4RY49',NULL,NULL),(89,7,2,NULL,'Ervin','Behrens','ebehrens22@illinois.edu','8R18JH6FP16',NULL,NULL),(90,8,2,NULL,'Neile','Hubbuck','nhubbuck23@wikipedia.org','9KD7ET7WG61',NULL,NULL),(91,7,2,NULL,'Lissie','Ludlom','lludlom24@godaddy.com','3RX6WX8QD53',NULL,NULL),(92,6,2,NULL,'Elisa','Menaul','emenaul25@cbslocal.com','3P12UH8AU88',NULL,NULL),(93,9,2,NULL,'Shalne','Goudman','sgoudman26@craigslist.org','7CT9YT8QV56',NULL,NULL),(94,6,2,NULL,'Licha','Lightman','llightman27@goo.gl','6M07JX8TH74',NULL,NULL),(95,8,2,NULL,'Willow','Mayhou','wmayhou28@pcworld.com','5JG6ME4XR27',NULL,NULL),(96,8,2,NULL,'Genvieve','Orans','gorans29@google.ca','6YM7CW0RK57',NULL,NULL),(97,7,1,NULL,'Konstance','Wileman','kwileman2a@barnesandnoble.com','4X48U14QN68',NULL,NULL),(98,6,2,NULL,'Kata','Geekin','kgeekin2b@bigcartel.com','4WE0PG3GY65',NULL,NULL),(99,8,1,NULL,'Junie','Abramson','jabramson2c@mail.ru','1EQ4KN5WN54',NULL,NULL),(100,10,2,NULL,'Esmaria','Frays','efrays2d@1688.com','5U48UM9QF59',NULL,NULL),(101,6,1,NULL,'Munroe','Pignon','mpignon2e@businessinsider.com','9WJ5QW1VE05',NULL,NULL),(102,7,1,NULL,'Dallon','Brackley','dbrackley2f@stumbleupon.com','6JJ1T67HH77',NULL,NULL),(103,7,1,NULL,'Fionna','Coaten','fcoaten2g@chronoengine.com','9DW0UG6DD41',NULL,NULL),(104,9,1,NULL,'North','Firebrace','nfirebrace2h@pen.io','7R52J42PJ49',NULL,NULL),(105,6,2,NULL,'Zonnya','Carvilla','zcarvilla2i@ehow.com','3FK2H41PK37',NULL,NULL),(106,7,1,NULL,'Rog','Chatt','rchatt2j@comcast.net','9N98NX2TE57',NULL,NULL),(107,6,2,NULL,'Juanita','Bertin','jbertin2k@storify.com','4E43DR2CN47',NULL,NULL),(108,7,1,NULL,'Giralda','Toomey','gtoomey2l@tinyurl.com','2MU7MH5JX04',NULL,NULL),(109,8,1,NULL,'Gawain','Jemison','gjemison2m@cargocollective.com','9A75Y60FR12',NULL,NULL),(110,10,1,NULL,'Sauncho','Turbard','sturbard2n@businessinsider.com','5WJ8P35YJ71',NULL,NULL),(111,8,1,NULL,'Percy','Caudrelier','pcaudrelier2o@rambler.ru','7M74Y38VT37',NULL,NULL),(112,7,1,NULL,'Bret','Michelin','bmichelin2p@patch.com','1H29C03MC60',NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course` (
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `registration_id` int DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `payment_ok` tinyint DEFAULT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `fk_student_has_course_course1_idx` (`course_id`),
  KEY `fk_student_has_course_student1_idx` (`student_id`),
  CONSTRAINT `fk_student_has_course_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `fk_student_has_course_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES (1,1,1,'2025-03-04 00:00:00',0),(2,1,2512,'2025-03-04 00:00:00',0),(3,1,2513,'2025-03-14 00:00:00',0),(4,1,2514,'2025-03-14 00:00:00',0),(5,1,2515,'2025-03-14 00:00:00',0),(7,2,2527,'2025-03-04 00:00:00',0),(8,1,2518,'2025-03-14 00:00:00',0),(9,1,2519,'2025-03-25 00:00:00',0),(10,1,25110,'2025-03-26 00:00:00',0),(11,6,25611,'2025-04-02 00:00:00',0),(12,1,25112,'2025-04-28 00:00:00',0);
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(40) DEFAULT NULL,
  `subject_name` varchar(80) DEFAULT NULL,
  `subject_description` varchar(100) DEFAULT NULL,
  `nfq_level` int DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'5N4975','Renewable Energy Systems','Renewable Energy Systems',5),(2,'5N1604','Computer Aided Design','Computer Aided Design',5),(3,'6N4090','Project Management','Project Management 6N4090',6),(4,'6N2108','Object Oriented Programming','Object Oriented Programming ',6),(5,'6N1449','Software Architecture','Software Architecture',6),(6,'6N0736','Graphical User Interface Programming','Graphical User Interface Programming',6),(7,'6N2191','Leadership','Leadership',6),(8,'6N1946','Work Experience','Work Experience',6),(9,'6N3395','Mathematics','Mathematics',6),(10,'6N4785','Relational Database','Relational Database',6),(11,'6N0734','Mobile Technologies','Mobile Technologies',6),(13,'testte','test','test',5);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_course`
--

DROP TABLE IF EXISTS `subject_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_course` (
  `subject_id` int NOT NULL,
  `course_id` int NOT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`subject_id`,`course_id`),
  KEY `fk_subject_has_course_course1_idx` (`course_id`),
  KEY `fk_subject_has_course_subject1_idx` (`subject_id`),
  CONSTRAINT `fk_subject_has_course_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `fk_subject_has_course_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_course`
--

LOCK TABLES `subject_course` WRITE;
/*!40000 ALTER TABLE `subject_course` DISABLE KEYS */;
INSERT INTO `subject_course` VALUES (1,1,'2025-03-05'),(1,2,'2025-03-05'),(1,6,'2025-04-02'),(2,1,'2025-03-31'),(2,2,'2025-03-05'),(2,6,'2025-04-02'),(3,1,'2025-03-05'),(4,1,'2025-03-05'),(5,1,'2025-03-05'),(6,1,'2025-03-05'),(7,1,'2025-03-05'),(8,1,'2025-03-05'),(9,1,'2025-03-05'),(10,1,'2025-03-05'),(11,1,'2025-03-05'),(13,2,'2025-03-31');
/*!40000 ALTER TABLE `subject_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `address_id` int NOT NULL,
  `gender_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ppsn` varchar(20) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `date_of_birth` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `fk_teacher_address1_idx` (`address_id`),
  KEY `fk_teacher_gender1_idx` (`gender_id`),
  CONSTRAINT `fk_teacher_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_teacher_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,5,2,'Johnn','Feeney','jfeeney@gti.com','3211238AB',NULL,NULL),(2,14,2,'Mark','Shaw','mshaw@gti.com','43242143M',NULL,NULL),(3,15,1,'Una','Keary','ukeary@gti.com','21312323G',NULL,NULL),(4,16,1,'Fiona','Holden','fholden@gti.com','234234F',NULL,NULL),(5,17,2,'Declan','Doherty','ddoherty@gti.com','34242342',NULL,NULL),(6,21,2,'Patrick','O\'Hare','pohare@gti.com','23142342',NULL,NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_subject`
--

DROP TABLE IF EXISTS `teacher_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_subject` (
  `teacher_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `registration_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`,`subject_id`),
  KEY `fk_teacher_has_subject_subject1_idx` (`subject_id`),
  KEY `fk_teacher_has_subject_teacher1_idx` (`teacher_id`),
  CONSTRAINT `fk_teacher_has_subject_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `fk_teacher_has_subject_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_subject`
--

LOCK TABLES `teacher_subject` WRITE;
/*!40000 ALTER TABLE `teacher_subject` DISABLE KEYS */;
INSERT INTO `teacher_subject` VALUES (1,9,'2025-03-10'),(2,2,'2025-03-10'),(2,5,'2025-03-10'),(2,11,'2025-03-10'),(3,3,'2025-03-10'),(3,4,'2025-03-10'),(3,6,'2025-03-10'),(3,10,'2025-03-10'),(4,7,'2025-03-10'),(5,8,'2025-03-10'),(6,1,'2025-04-02'),(6,2,'2025-04-02');
/*!40000 ALTER TABLE `teacher_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `teacher_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_teacher1_idx` (`teacher_id`),
  KEY `fk_user_student1_idx` (`student_id`),
  KEY `fk_user_role1_idx` (`role_id`),
  KEY `fk_user_admin1_idx` (`admin_id`),
  CONSTRAINT `fk_user_admin1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_user_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `fk_user_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'admin@x.com','asd',NULL,NULL,1),(2,2,'john','john',1,NULL,NULL),(4,2,'una','una',3,NULL,NULL),(5,2,'mark','mark',2,NULL,NULL),(6,2,'fiona','fiona',4,NULL,NULL),(7,1,'admin','admin',NULL,NULL,2),(8,2,'patrick@atu.com','patrick',6,NULL,NULL),(9,2,'una@gti.com','una',3,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gti_record_keeping_v2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-17 14:45:06
