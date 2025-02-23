CREATE DATABASE  IF NOT EXISTS `gradebook` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gradebook`;
-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: localhost    Database: gradebook
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ClassName` char(45) NOT NULL,
  `Semester` char(10) NOT NULL,
  `Year` int NOT NULL,
  `Days` char(10) NOT NULL,
  `Time` char(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (200,'ISQS 3346','Spring',2025,'MWF','11:00'),(201,'ISQS 3348','Spring',2025,'MWF','1:00');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirement` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RequirementName` char(45) NOT NULL,
  `DueDate` date DEFAULT NULL,
  `Percentage` decimal(6,2) DEFAULT NULL,
  `class_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_requirement_class1_idx` (`class_ID`),
  CONSTRAINT `fk_requirement_class1` FOREIGN KEY (`class_ID`) REFERENCES `class` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` VALUES (300,'Assignment 1',NULL,15.00,200),(301,'Assignment 2',NULL,15.00,200),(302,'Exam 1',NULL,35.00,200),(303,'Exam 2',NULL,35.00,200),(310,'Hw 1',NULL,10.00,201),(311,'Hw 2',NULL,10.00,201),(312,'Quiz 1',NULL,20.00,201),(313,'Quiz 2',NULL,20.00,201),(314,'Final',NULL,40.00,201);
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LastName` char(45) NOT NULL,
  `FirstName` char(45) NOT NULL,
  `Email` char(70) NOT NULL,
  `Password` char(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (100,'Adeleke','Hanmi','hadeleke@ttu.edu','password'),(101,'Smith','Alex','asmith@ttu.edu','password'),(102,'Hamilton','John','jhamilton@ttu.edu','password'),(103,'Collins','Pete','pcollins@ttu.edu','password');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_class`
--

DROP TABLE IF EXISTS `student_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_class` (
  `student_ID` int NOT NULL,
  `class_ID` int NOT NULL,
  `FinalGrade` char(1) DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`class_ID`),
  KEY `fk_student_class_class1_idx` (`class_ID`),
  KEY `fk_student_class_student_idx` (`student_ID`),
  CONSTRAINT `fk_student_class_class1` FOREIGN KEY (`class_ID`) REFERENCES `class` (`ID`),
  CONSTRAINT `fk_student_class_student` FOREIGN KEY (`student_ID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class`
--

LOCK TABLES `student_class` WRITE;
/*!40000 ALTER TABLE `student_class` DISABLE KEYS */;
INSERT INTO `student_class` VALUES (100,200,NULL),(100,201,NULL),(101,200,NULL),(101,201,NULL),(102,200,NULL),(102,201,NULL),(103,200,NULL),(103,201,NULL);
/*!40000 ALTER TABLE `student_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_requirement`
--

DROP TABLE IF EXISTS `student_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_requirement` (
  `student_ID` int NOT NULL,
  `requirement_ID` int NOT NULL,
  `Grade` int DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`requirement_ID`),
  KEY `fk_student_requirement_requirement1_idx` (`requirement_ID`),
  KEY `fk_student_requirement_student1_idx` (`student_ID`),
  CONSTRAINT `fk_student_requirement_requirement1` FOREIGN KEY (`requirement_ID`) REFERENCES `requirement` (`ID`),
  CONSTRAINT `fk_student_requirement_student1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_requirement`
--

LOCK TABLES `student_requirement` WRITE;
/*!40000 ALTER TABLE `student_requirement` DISABLE KEYS */;
INSERT INTO `student_requirement` VALUES (100,300,90),(100,301,90),(100,302,85),(100,303,85),(100,310,80),(100,311,80),(100,312,85),(100,313,85),(100,314,90),(101,300,80),(101,301,80),(101,302,70),(101,303,70),(101,310,85),(101,311,85),(101,312,70),(101,313,70),(101,314,75),(102,300,70),(102,301,70),(102,302,80),(102,303,80),(102,310,90),(102,311,70),(102,312,80),(102,313,80),(102,314,75),(103,300,80),(103,301,70),(103,302,90),(103,303,90),(103,310,70),(103,311,85),(103,312,80),(103,313,70),(103,314,95);
/*!40000 ALTER TABLE `student_requirement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-17 20:17:58
