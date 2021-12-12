-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cs157ateam13project
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accountID` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (101,'jwinger','abc123abc'),(102,'bperry','x8nw9n1!!@'),(103,'aedison','password'),(104,'tbarnes','troy_and_abed'),(105,'anadir','in-the-MORNING'),(106,'sbennett','GodsPlan'),(107,'phawthorne','streets_ahead005'),(108,'bchang','elTigreChino1212'),(109,'asantiago','binders_are_cool'),(110,'rholt','MAX_SECURITY!'),(111,'rdiaz','A0p39JKkl'),(112,'tjeffords','yogurt-yogurt-77'),(113,'cboyle','jakejakejake'),(114,'jperalta','noice_toit'),(115,'glinetti','5555'),(116,'admin1','7sc7SkFG'),(117,'admin2','aLemJV59'),(118,'admin3','tCzGAGFB'),(119,'admin4','rUYnE4zR'),(120,'admin5','64e8TyQ6'),(121,'admin6','czkkMrQ2'),(122,'admin6','F7JSQPP6'),(123,'admin7','24ypUXra'),(124,'admin8','bnzXgPVE'),(125,'m_admin1','YGd7pANx'),(126,'m_admin2','yVrPAY89'),(127,'m_admin3','dVAQgDGX'),(128,'m_admin4','gaxfyreh'),(129,'h_admin1','FUdKNmqT'),(130,'h_admin2','hmcWL7p4'),(131,'testuser','123'),(132,'abc','123'),(133,'barna','123');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminaccount`
--

DROP TABLE IF EXISTS `adminaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminaccount` (
  `accountID` int NOT NULL,
  `adminLevel` varchar(45) NOT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminaccount`
--

LOCK TABLES `adminaccount` WRITE;
/*!40000 ALTER TABLE `adminaccount` DISABLE KEYS */;
INSERT INTO `adminaccount` VALUES (116,'LOW'),(117,'LOW'),(118,'LOW'),(119,'LOW'),(120,'LOW'),(121,'LOW'),(123,'LOW'),(124,'LOW'),(125,'MED'),(126,'MED'),(127,'MED'),(128,'MED'),(129,'HIGH'),(130,'HIGH');
/*!40000 ALTER TABLE `adminaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belongsto`
--

DROP TABLE IF EXISTS `belongsto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belongsto` (
  `accountID` int NOT NULL,
  `campusID` int NOT NULL,
  PRIMARY KEY (`accountID`,`campusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongsto`
--

LOCK TABLES `belongsto` WRITE;
/*!40000 ALTER TABLE `belongsto` DISABLE KEYS */;
INSERT INTO `belongsto` VALUES (101,1857),(102,1857),(103,1857),(104,1857),(105,1857),(106,1857),(107,1857),(108,1857),(109,1857),(110,1857),(111,1857),(112,1857),(113,1857),(114,1857),(115,1857),(131,1857),(132,1857),(133,1857);
/*!40000 ALTER TABLE `belongsto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campus` (
  `campusID` int NOT NULL,
  `campus_name` varchar(45) NOT NULL,
  PRIMARY KEY (`campusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` VALUES (1857,'San Jose State University'),(1858,'Stanford University'),(1859,'Santa Clara Univeristy'),(1860,'Harvard University'),(1861,'Yale University'),(1862,'Princeton University'),(1863,'Columbia Univeristy'),(1864,'University of Chicago'),(1865,'Duke University'),(1866,'Northwestern University'),(1867,'Brown University'),(1868,'Vanderbilt University'),(1869,'Cornell University'),(1870,'Rice University'),(1871,'New York University');
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseID` int NOT NULL,
  `course_name` varchar(45) NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (30151,'Data Structures'),(30152,'Object Oriented Programming'),(30153,'Computer Architecture'),(30154,'Operating Systems'),(30155,'Programming Paradigms'),(30156,'Database Management Systems'),(30157,'Discrete Math'),(30158,'Linear Algebra'),(30159,'Applied Statistics'),(30160,'Computer Graphics'),(30161,'Machine Learning'),(30162,'Artificial Intelligence'),(30163,'Data Science'),(30164,'Cryptography'),(30165,'Software Engineering');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `studentID` int NOT NULL,
  `courseID` int NOT NULL,
  `campusID` int NOT NULL,
  PRIMARY KEY (`studentID`,`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (14244230,30156,1857),(14244230,30157,1857),(14244230,30158,1857),(14244230,30161,1857),(14244231,30156,1857),(14244231,30157,1857),(14244231,30160,1857),(14244231,30163,1857),(14244231,30165,1857),(14244232,30151,1857),(14244232,30152,1857),(14244232,30155,1857),(14244232,30156,1857),(14244233,30162,1857),(14244233,30163,1857),(14244233,30164,1857),(14244233,30165,1857),(14244234,30161,1857),(14244234,30162,1857),(14244234,30163,1857),(14244234,30164,1857),(14244234,30165,1857),(14244235,30151,1857),(14244235,30153,1857),(14244235,30155,1857),(14244235,30157,1857),(14244236,30152,1857),(14244236,30154,1857),(14244236,30156,1857),(14244236,30158,1857),(14244237,30157,1857),(14244237,30159,1857),(14244237,30161,1857),(14244237,30163,1857),(14244237,30165,1857),(14356719,30156,1857),(14356719,30158,1857),(14356719,30160,1857),(14356719,30162,1857),(14356719,30164,1857),(14356720,30151,1857),(14356721,30160,1857),(14356721,30164,1857),(14356722,30160,1857),(14356723,30157,1857),(14356724,30164,1857),(14356725,30151,1857),(14356725,30164,1857),(14356726,30155,1857),(14356726,30156,1857),(14356726,30159,1857),(14356727,30153,1857),(14356727,30155,1857),(14356727,30157,1857),(14356728,30156,1857),(14356728,30157,1857),(14356728,30159,1857);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has` (
  `profileID` int NOT NULL,
  `accountID` int NOT NULL,
  PRIMARY KEY (`profileID`,`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
INSERT INTO `has` VALUES (14244230,101),(14244231,102),(14244232,103),(14244233,104),(14244234,105),(14244235,106),(14244236,107),(14244237,108),(14356719,109),(14356720,110),(14356721,111),(14356722,112),(14356723,113),(14356724,114),(14356725,115),(14356726,131),(14356727,132),(14356728,133);
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interestedin`
--

DROP TABLE IF EXISTS `interestedin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interestedin` (
  `profileID` int NOT NULL,
  `interestID` int NOT NULL,
  PRIMARY KEY (`profileID`,`interestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interestedin`
--

LOCK TABLES `interestedin` WRITE;
/*!40000 ALTER TABLE `interestedin` DISABLE KEYS */;
INSERT INTO `interestedin` VALUES (14244230,100124),(14244230,200123),(14244231,100123),(14244231,100124),(14244231,300124),(14244231,300126),(14244232,200124),(14244232,200125),(14244233,300124),(14244233,300126),(14244233,300127),(14244234,200123),(14244234,200124),(14244234,200125),(14244235,200123),(14244235,200124),(14244236,300125),(14244236,300126),(14244236,300127),(14244236,300128),(14244237,100123),(14244237,100124),(14244237,100125),(14244237,400123),(14356719,100124),(14356719,100125),(14356719,200125),(14356719,300123),(14356720,300125),(14356721,200123),(14356722,300123),(14356723,100123),(14356724,200125),(14356725,300123),(14356726,400123),(14356726,400124),(14356726,400125),(14356727,200125),(14356727,300123),(14356728,400124),(14356728,400125);
/*!40000 ALTER TABLE `interestedin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interests` (
  `interestID` int NOT NULL,
  `interest_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`interestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
INSERT INTO `interests` VALUES (100123,'Pop Music'),(100124,'Jazz Music'),(100125,'Traditional Music'),(200123,'Coffee'),(200124,'Tea'),(200125,'Boba'),(300123,'Hiking'),(300124,'Drawing'),(300125,'Scoocer'),(300126,'Football'),(300127,'Basketball'),(300128,'Baseball'),(400123,'Stream Games'),(400124,'League of Legend'),(400125,'PUBG');
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `profileID` int NOT NULL,
  `time` varchar(100) NOT NULL,
  `onlineOption` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`profileID`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (14244230,'014244230T23TH234','NO','Coffee Bar'),(14244231,'014244231M4T4F4','BOTH','StudentUnion'),(14244232,'014244232M2F2','YES','Library'),(14244233,'014244233T234F23','YES','Library'),(14244234,'014244234F4','NO','Boba Shop'),(14244235,'014244235F1234','BOTH','Library'),(14244236,'014244236M4W4','YES','StudentUnion'),(14244237,'014244237M1W1ST1234','NO','StudentUnion'),(14356719,'014356719M3W3F2ST23','YES','Library'),(14356720,'014356720T2TH2','YES',NULL),(14356721,'014356721M1W1','YES','StudentUnion'),(14356722,'014356722T2W2TH2F3','BOTH',NULL),(14356723,'014356723M1W3','YES','StudentUnion'),(14356724,'014356724F1','NO',NULL),(14356725,'014356725M1W2T2F3','BOTH',NULL),(14356726,'some time','YES','Discord'),(14356727,'some time','YES','Zoom'),(14356728,'some time','YES','Discord/Zoom');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `profileID` int NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`profileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (14244230,'I like food and coffee!'),(14244231,'Physics is my favorate subject.'),(14244232,'I listen to k-pop and my favorite band is BTS!'),(14244233,'I prefer studying with group of people and enjoying discussion.'),(14244234,'Listening to piano music help me concentrate. I\'d love to study with other with music on'),(14244235,'I live on coffee and tea. I\'m also good at organizing and making study plans! '),(14244236,'I enjoy being nerdy, welcome to discuss any science and math questions.'),(14244237,'I\'m freshman in Computer Science and want to minor in Bussness.'),(14356719,'Hi I\'d love to making new friends and I like helping people'),(14356720,'Chocolate addiction, Willing to share energy with study buddies!'),(14356721,'I\'m taking 4 upper math classes. Hope to have someone study together!'),(14356722,'Hello World! Taking Java, Python this semester.'),(14356723,'Graduating senior, feel free to ask me anything!'),(14356724,'I work full-time so I tend to study during night and early morning.'),(14356725,'Teamwork makes dream work! I like studying in groups.'),(14356726,'I love to game!'),(14356727,'I like to study'),(14356728,'I like physics');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentaccount`
--

DROP TABLE IF EXISTS `studentaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentaccount` (
  `accountID` int NOT NULL,
  `studentName` varchar(45) NOT NULL,
  `campusID` int NOT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentaccount`
--

LOCK TABLES `studentaccount` WRITE;
/*!40000 ALTER TABLE `studentaccount` DISABLE KEYS */;
INSERT INTO `studentaccount` VALUES (101,'Jeff Winger',1857),(102,'Britta Perry',1857),(103,'Annie Edison',1857),(104,'Troy Barnes',1857),(105,'Abed Nadir',1857),(106,'Shirley Bennett',1857),(107,'Pierce Hawthorne',1857),(108,'Ben Chang',1857),(109,'Amy Santiago',1857),(110,'Raymond Holt',1857),(111,'Rosa Diaz',1857),(112,'Terry Jeffords',1857),(113,'Charles Boyle',1857),(114,'Jake Peralta',1857),(115,'Gina Linetti',1857),(131,'Joe Mama',1857),(132,'Mike Joe',1857),(133,'Barnabas',1857);
/*!40000 ALTER TABLE `studentaccount` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-09 16:24:04
