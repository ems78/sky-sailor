CREATE DATABASE  IF NOT EXISTS `aviokompanija` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `aviokompanija`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 89.117.57.163    Database: aviokompanija
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.38-MariaDB-0ubuntu0.20.04.1

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
  `account_ID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwordHash` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`account_ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Ivana','Horvat','ivana.horvat@gmail.com','$2y$10$SLv9sM3bh6/UvZOBkIk/5uI/UCr/QUL70ugejlVWQ5vGQFzfdc7T2','098-765-4321'),(2,'Marko','Kovačić','marko.kovacic@gmail.com','$2y$10$wIO1yaP3NSlH5Vuwd9Vfl.pyIaNeFSf5CF6aFKfldY33qM.GW7wKy','091-234-5678');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role` (
  `adminAccount_ID` int(11) NOT NULL,
  `role_ID` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`adminAccount_ID`,`role_ID`),
  KEY `role_ID` (`role_ID`),
  CONSTRAINT `admin_role_ibfk_1` FOREIGN KEY (`adminAccount_ID`) REFERENCES `adminaccount` (`adminAccount_ID`),
  CONSTRAINT `admin_role_ibfk_2` FOREIGN KEY (`role_ID`) REFERENCES `role` (`role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
INSERT INTO `admin_role` VALUES (1,1,0);
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminaccount`
--

DROP TABLE IF EXISTS `adminaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminaccount` (
  `adminAccount_ID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwordHash` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`adminAccount_ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminaccount`
--

LOCK TABLES `adminaccount` WRITE;
/*!40000 ALTER TABLE `adminaccount` DISABLE KEYS */;
INSERT INTO `adminaccount` VALUES (1,'Franko','Cvrlje','cvrljefranko2002@gmail.com','$2y$10$R5HYtzpUPFEfUpVnIQhslumTaFAX3YZOuVARd4O2vqbUSDfHNCGN6');
/*!40000 ALTER TABLE `adminaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airport_ID` int(11) NOT NULL AUTO_INCREMENT,
  `town_ID` int(11) NOT NULL,
  PRIMARY KEY (`airport_ID`),
  KEY `town_id` (`town_ID`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`town_id`) REFERENCES `town` (`town_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Hrvatska'),(2,'Francuska'),(3,'Engleska'),(4,'Njemačka'),(5,'Brazil'),(6,'Sjedinjene Američke Države'),(7,'Ujedinjeni Arapski Emirati');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_ID` int(11) NOT NULL AUTO_INCREMENT,
  `departureTimeDate` datetime NOT NULL,
  `arrivalTimeDate` datetime NOT NULL,
  `plane_ID` int(11) NOT NULL,
  `departureAirport_ID` int(11) NOT NULL,
  `destinationAirport_ID` int(11) NOT NULL,
  `extraBaggagePrice` decimal(4,2) DEFAULT NULL,
  `flightInsurancePrice` decimal(4,2) DEFAULT NULL,
  `timezone_ID` int(11) NOT NULL,
  PRIMARY KEY (`flight_ID`),
  KEY `departureAirport_ID` (`departureAirport_ID`),
  KEY `destinationAirport_ID` (`destinationAirport_ID`),
  KEY `plane_ID` (`plane_ID`),
  KEY `timezone_ID` (`timezone_ID`),
  CONSTRAINT `flight_ibfk_10` FOREIGN KEY (`timezone_ID`) REFERENCES `timezone` (`timezone_ID`),
  CONSTRAINT `flight_ibfk_7` FOREIGN KEY (`departureAirport_ID`) REFERENCES `airport` (`airport_ID`),
  CONSTRAINT `flight_ibfk_8` FOREIGN KEY (`destinationAirport_ID`) REFERENCES `airport` (`airport_ID`),
  CONSTRAINT `flight_ibfk_9` FOREIGN KEY (`plane_ID`) REFERENCES `plane` (`plane_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (3,'2024-02-22 08:00:00','2024-02-22 12:00:00',1,3,4,30.00,15.00,4),(4,'2024-02-22 14:30:00','2024-02-22 18:30:00',2,3,4,25.00,12.50,5);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_seat`
--

DROP TABLE IF EXISTS `flight_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_seat` (
  `flight_seat_ID` int(11) NOT NULL AUTO_INCREMENT,
  `available` int(11) NOT NULL,
  `flight_ID` int(11) NOT NULL,
  `seat_ID` int(11) NOT NULL,
  PRIMARY KEY (`flight_seat_ID`),
  KEY `flight_ID` (`flight_ID`),
  KEY `seat_ID` (`seat_ID`),
  CONSTRAINT `flight_seat_ibfk_1` FOREIGN KEY (`flight_ID`) REFERENCES `flight` (`flight_ID`),
  CONSTRAINT `flight_seat_ibfk_2` FOREIGN KEY (`seat_ID`) REFERENCES `seat` (`seat_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_seat`
--

LOCK TABLES `flight_seat` WRITE;
/*!40000 ALTER TABLE `flight_seat` DISABLE KEYS */;
INSERT INTO `flight_seat` VALUES (1,1,3,1),(2,1,3,2),(3,1,3,3),(4,1,3,4),(5,1,3,5),(6,1,3,6),(7,1,3,7),(8,1,3,8),(9,1,3,9),(10,1,3,10),(11,1,3,11),(12,1,3,12),(13,1,3,13),(14,1,3,14),(15,1,3,15),(16,1,3,16),(17,1,3,17),(18,1,3,18),(19,1,3,19),(20,1,3,20),(21,1,3,21),(22,1,3,22),(23,1,3,23),(24,1,3,24),(25,1,3,25),(26,1,3,26),(27,1,3,27),(28,1,3,28),(29,1,3,29),(30,1,3,30),(31,1,3,31),(32,1,3,32),(33,1,3,33),(34,1,3,34),(35,1,3,35),(36,1,3,36),(37,1,3,37),(38,1,3,38),(39,1,3,39),(40,1,3,40),(41,1,3,41),(42,1,3,42),(43,1,3,43),(44,1,3,44),(45,1,3,45),(46,1,3,46),(47,1,3,47),(48,1,3,48),(49,1,3,49),(50,1,3,50),(51,1,3,51),(52,1,3,52),(53,1,3,53),(54,1,3,54),(55,1,3,55),(56,1,3,56),(57,1,3,57),(58,1,3,58),(59,1,3,59),(60,1,3,60),(61,1,3,61),(62,1,3,62),(63,1,3,63),(64,1,3,64),(65,1,3,65),(66,1,3,66),(67,1,3,67),(68,1,3,68),(69,1,3,69),(70,1,3,70),(71,1,3,71),(72,1,3,72),(73,1,3,73),(74,1,3,74),(75,1,3,75),(76,1,3,76),(77,1,3,77),(78,1,3,78),(79,1,3,79),(80,1,3,80),(81,1,3,81),(82,1,3,82),(83,1,3,83),(84,1,3,84),(85,1,3,85),(86,1,3,86),(87,1,3,87),(88,1,3,88),(89,1,3,89),(90,1,3,90),(91,1,3,91),(92,1,3,92),(93,1,3,93),(94,1,3,94),(95,1,3,95),(96,1,3,96),(97,1,3,97),(98,1,3,98),(99,1,3,99),(100,1,3,100),(101,1,3,101),(102,1,3,102),(103,1,3,103),(104,1,3,104),(105,1,3,105),(106,1,3,106),(107,1,3,107),(108,1,3,108),(109,1,3,109),(110,1,3,110),(111,1,3,111),(112,1,3,112),(113,1,3,113),(114,1,3,114),(115,1,3,115),(116,1,3,116),(117,1,3,117),(118,1,3,118),(119,1,3,119),(120,1,3,120),(121,1,3,121),(122,1,3,122),(123,1,3,123),(124,1,3,124),(125,1,3,125),(126,1,3,126),(127,1,3,127),(128,1,3,128),(129,1,3,129),(130,1,3,130),(131,1,3,131),(132,1,3,132),(133,1,3,133),(134,1,3,134),(135,1,3,135),(136,1,3,136),(137,1,3,137),(138,1,3,138),(139,1,3,139),(140,1,3,140),(141,1,3,141),(142,1,3,142),(143,1,3,143),(144,1,3,144),(145,1,3,145),(146,1,3,146),(147,1,3,147),(148,1,3,148),(149,1,3,149),(150,1,3,150),(256,1,4,151),(257,1,4,152),(258,1,4,153),(259,1,4,154),(260,1,4,155),(261,1,4,156),(262,1,4,157),(263,1,4,158),(264,1,4,159),(265,1,4,160),(266,1,4,161),(267,1,4,162),(268,1,4,163),(269,1,4,164),(270,1,4,165),(271,1,4,166),(272,1,4,167),(273,1,4,168),(274,1,4,169),(275,1,4,170),(276,1,4,171),(277,1,4,172),(278,1,4,173),(279,1,4,174),(280,1,4,175),(281,1,4,176),(282,1,4,177),(283,1,4,178),(284,1,4,179),(285,1,4,180),(286,1,4,181),(287,1,4,182),(288,1,4,183),(289,1,4,184),(290,1,4,185),(291,1,4,186),(292,1,4,187),(293,1,4,188),(294,1,4,189),(295,1,4,190),(296,1,4,191),(297,1,4,192),(298,1,4,193),(299,1,4,194),(300,1,4,195),(301,1,4,196),(302,1,4,197),(303,1,4,198),(304,1,4,199),(305,1,4,200),(306,1,4,201),(307,1,4,202),(308,1,4,203),(309,1,4,204),(310,1,4,205),(311,1,4,206),(312,1,4,207),(313,1,4,208),(314,1,4,209),(315,1,4,210),(316,1,4,211),(317,1,4,212),(318,1,4,213),(319,1,4,214),(320,1,4,215),(321,1,4,216),(322,1,4,217),(323,1,4,218),(324,1,4,219),(325,1,4,220),(326,1,4,221),(327,1,4,222),(328,1,4,223),(329,1,4,224),(330,1,4,225),(331,1,4,226),(332,1,4,227),(333,1,4,228),(334,1,4,229),(335,1,4,230),(336,1,4,231),(337,1,4,232),(338,1,4,233),(339,1,4,234),(340,1,4,235),(341,1,4,236),(342,1,4,237),(343,1,4,238),(344,1,4,239),(345,1,4,240),(346,1,4,241),(347,1,4,242),(348,1,4,243),(349,1,4,244),(350,1,4,245),(351,1,4,246),(352,1,4,247),(353,1,4,248),(354,1,4,249),(355,1,4,250),(356,1,4,251),(357,1,4,252),(358,1,4,253),(359,1,4,254),(360,1,4,255),(361,1,4,256),(362,1,4,257),(363,1,4,258),(364,1,4,259),(365,1,4,260),(366,1,4,261),(367,1,4,262),(368,1,4,263),(369,1,4,264),(370,1,4,265),(371,1,4,266),(372,1,4,267),(373,1,4,268),(374,1,4,269),(375,1,4,270),(376,1,4,271),(377,1,4,272),(378,1,4,273),(379,1,4,274),(380,1,4,275),(381,1,4,276),(382,1,4,277),(383,1,4,278),(384,1,4,279),(385,1,4,280),(386,1,4,281),(387,1,4,282),(388,1,4,283),(389,1,4,284),(390,1,4,285),(391,1,4,286),(392,1,4,287),(393,1,4,288),(394,1,4,289),(395,1,4,290),(396,1,4,291),(397,1,4,292),(398,1,4,293),(399,1,4,294),(400,1,4,295),(401,1,4,296),(402,1,4,297),(403,1,4,298),(404,1,4,299),(405,1,4,300),(406,1,4,301),(407,1,4,302),(408,1,4,303),(409,1,4,304),(410,1,4,305),(411,1,4,306),(412,1,4,307),(413,1,4,308),(414,1,4,309),(415,1,4,310),(416,1,4,311),(417,1,4,312),(418,1,4,313),(419,1,4,314),(420,1,4,315),(421,1,4,316),(422,1,4,317),(423,1,4,318),(424,1,4,319),(425,1,4,320),(426,1,4,321),(427,1,4,322),(428,1,4,323),(429,1,4,324),(430,1,4,325),(431,1,4,326),(432,1,4,327),(433,1,4,328),(434,1,4,329),(435,1,4,330),(436,1,4,331),(437,1,4,332),(438,1,4,333),(439,1,4,334),(440,1,4,335),(441,1,4,336),(442,1,4,337),(443,1,4,338),(444,1,4,339),(445,1,4,340),(446,1,4,341),(447,1,4,342),(448,1,4,343),(449,1,4,344),(450,1,4,345),(451,1,4,346),(452,1,4,347),(453,1,4,348),(454,1,4,349),(455,1,4,350);
/*!40000 ALTER TABLE `flight_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_travelclass`
--

DROP TABLE IF EXISTS `flight_travelclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_travelclass` (
  `flight_ID` int(11) NOT NULL,
  `travelClass_ID` int(11) NOT NULL,
  `adultSeatPrice` decimal(6,2) DEFAULT NULL,
  `childSeatPrice` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`flight_ID`,`travelClass_ID`),
  KEY `travelClass_ID` (`travelClass_ID`),
  CONSTRAINT `flight_travelclass_ibfk_1` FOREIGN KEY (`flight_ID`) REFERENCES `flight` (`flight_ID`),
  CONSTRAINT `flight_travelclass_ibfk_2` FOREIGN KEY (`travelClass_ID`) REFERENCES `travelclass` (`travelclass_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_travelclass`
--

LOCK TABLES `flight_travelclass` WRITE;
/*!40000 ALTER TABLE `flight_travelclass` DISABLE KEYS */;
INSERT INTO `flight_travelclass` VALUES (3,1,200.00,170.00),(3,2,250.00,220.00),(3,3,330.00,300.00),(4,1,230.00,190.00),(4,2,270.00,260.00),(4,3,340.00,330.00);
/*!40000 ALTER TABLE `flight_travelclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plane`
--

DROP TABLE IF EXISTS `plane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plane` (
  `plane_ID` int(11) NOT NULL AUTO_INCREMENT,
  `numberOfSeats` int(11) NOT NULL,
  PRIMARY KEY (`plane_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plane`
--

LOCK TABLES `plane` WRITE;
/*!40000 ALTER TABLE `plane` DISABLE KEYS */;
INSERT INTO `plane` VALUES (1,150),(2,200),(3,150),(4,170),(5,200),(6,180);
/*!40000 ALTER TABLE `plane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `account_ID` int(11) NOT NULL,
  `flight_ID` int(11) NOT NULL,
  `seat_ID` int(11) NOT NULL,
  `extraBaggage` tinyint(1) DEFAULT NULL,
  `flightInsurance` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`reservation_ID`),
  KEY `seat_ID` (`seat_ID`),
  KEY `flight_ID` (`flight_ID`),
  KEY `account_ID` (`account_ID`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`seat_ID`) REFERENCES `seat` (`seat_ID`),
  CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`flight_ID`) REFERENCES `flight` (`flight_ID`),
  CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`account_ID`) REFERENCES `account` (`account_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (4,1,3,1,0,1),(5,2,3,28,0,1);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Operativno osoblje'),(3,'Sigurnono osoblje'),(4,'Posada'),(5,'Komercijalno osoblje');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_ID` int(11) NOT NULL AUTO_INCREMENT,
  `travelClass_ID` int(11) NOT NULL,
  `plane_ID` int(11) NOT NULL,
  PRIMARY KEY (`seat_ID`),
  KEY `plane_ID` (`plane_ID`),
  KEY `travelClass_ID` (`travelClass_ID`),
  CONSTRAINT `seat_ibfk_2` FOREIGN KEY (`plane_ID`) REFERENCES `plane` (`plane_ID`),
  CONSTRAINT `seat_ibfk_3` FOREIGN KEY (`travelClass_ID`) REFERENCES `travelclass` (`travelclass_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1051 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(17,1,1),(18,1,1),(19,1,1),(20,1,1),(21,1,1),(22,1,1),(23,1,1),(24,1,1),(25,1,1),(26,1,1),(27,1,1),(28,1,1),(29,1,1),(30,1,1),(31,1,1),(32,1,1),(33,1,1),(34,1,1),(35,1,1),(36,1,1),(37,1,1),(38,1,1),(39,1,1),(40,1,1),(41,1,1),(42,1,1),(43,1,1),(44,1,1),(45,1,1),(46,1,1),(47,1,1),(48,1,1),(49,1,1),(50,1,1),(51,2,1),(52,2,1),(53,2,1),(54,2,1),(55,2,1),(56,2,1),(57,2,1),(58,2,1),(59,2,1),(60,2,1),(61,2,1),(62,2,1),(63,2,1),(64,2,1),(65,2,1),(66,2,1),(67,2,1),(68,2,1),(69,2,1),(70,2,1),(71,2,1),(72,2,1),(73,2,1),(74,2,1),(75,2,1),(76,2,1),(77,2,1),(78,2,1),(79,2,1),(80,2,1),(81,2,1),(82,2,1),(83,2,1),(84,2,1),(85,2,1),(86,2,1),(87,2,1),(88,2,1),(89,2,1),(90,2,1),(91,2,1),(92,2,1),(93,2,1),(94,2,1),(95,2,1),(96,2,1),(97,2,1),(98,2,1),(99,2,1),(100,2,1),(101,3,1),(102,3,1),(103,3,1),(104,3,1),(105,3,1),(106,3,1),(107,3,1),(108,3,1),(109,3,1),(110,3,1),(111,3,1),(112,3,1),(113,3,1),(114,3,1),(115,3,1),(116,3,1),(117,3,1),(118,3,1),(119,3,1),(120,3,1),(121,3,1),(122,3,1),(123,3,1),(124,3,1),(125,3,1),(126,3,1),(127,3,1),(128,3,1),(129,3,1),(130,3,1),(131,3,1),(132,3,1),(133,3,1),(134,3,1),(135,3,1),(136,3,1),(137,3,1),(138,3,1),(139,3,1),(140,3,1),(141,3,1),(142,3,1),(143,3,1),(144,3,1),(145,3,1),(146,3,1),(147,3,1),(148,3,1),(149,3,1),(150,3,1),(151,1,2),(152,1,2),(153,1,2),(154,1,2),(155,1,2),(156,1,2),(157,1,2),(158,1,2),(159,1,2),(160,1,2),(161,1,2),(162,1,2),(163,1,2),(164,1,2),(165,1,2),(166,1,2),(167,1,2),(168,1,2),(169,1,2),(170,1,2),(171,1,2),(172,1,2),(173,1,2),(174,1,2),(175,1,2),(176,1,2),(177,1,2),(178,1,2),(179,1,2),(180,1,2),(181,1,2),(182,1,2),(183,1,2),(184,1,2),(185,1,2),(186,1,2),(187,1,2),(188,1,2),(189,1,2),(190,1,2),(191,1,2),(192,1,2),(193,1,2),(194,1,2),(195,1,2),(196,1,2),(197,1,2),(198,1,2),(199,1,2),(200,1,2),(201,1,2),(202,1,2),(203,1,2),(204,1,2),(205,1,2),(206,1,2),(207,1,2),(208,1,2),(209,1,2),(210,1,2),(211,1,2),(212,1,2),(213,1,2),(214,1,2),(215,1,2),(216,1,2),(217,1,2),(218,1,2),(219,1,2),(220,1,2),(221,1,2),(222,1,2),(223,1,2),(224,1,2),(225,1,2),(226,1,2),(227,1,2),(228,1,2),(229,1,2),(230,1,2),(231,1,2),(232,1,2),(233,1,2),(234,1,2),(235,1,2),(236,1,2),(237,1,2),(238,1,2),(239,1,2),(240,1,2),(241,1,2),(242,1,2),(243,1,2),(244,1,2),(245,1,2),(246,1,2),(247,1,2),(248,1,2),(249,1,2),(250,1,2),(251,2,2),(252,2,2),(253,2,2),(254,2,2),(255,2,2),(256,2,2),(257,2,2),(258,2,2),(259,2,2),(260,2,2),(261,2,2),(262,2,2),(263,2,2),(264,2,2),(265,2,2),(266,2,2),(267,2,2),(268,2,2),(269,2,2),(270,2,2),(271,2,2),(272,2,2),(273,2,2),(274,2,2),(275,2,2),(276,2,2),(277,2,2),(278,2,2),(279,2,2),(280,2,2),(281,2,2),(282,2,2),(283,2,2),(284,2,2),(285,2,2),(286,2,2),(287,2,2),(288,2,2),(289,2,2),(290,2,2),(291,2,2),(292,2,2),(293,2,2),(294,2,2),(295,2,2),(296,2,2),(297,2,2),(298,2,2),(299,2,2),(300,2,2),(301,3,2),(302,3,2),(303,3,2),(304,3,2),(305,3,2),(306,3,2),(307,3,2),(308,3,2),(309,3,2),(310,3,2),(311,3,2),(312,3,2),(313,3,2),(314,3,2),(315,3,2),(316,3,2),(317,3,2),(318,3,2),(319,3,2),(320,3,2),(321,3,2),(322,3,2),(323,3,2),(324,3,2),(325,3,2),(326,3,2),(327,3,2),(328,3,2),(329,3,2),(330,3,2),(331,3,2),(332,3,2),(333,3,2),(334,3,2),(335,3,2),(336,3,2),(337,3,2),(338,3,2),(339,3,2),(340,3,2),(341,3,2),(342,3,2),(343,3,2),(344,3,2),(345,3,2),(346,3,2),(347,3,2),(348,3,2),(349,3,2),(350,3,2),(351,1,3),(352,1,3),(353,1,3),(354,1,3),(355,1,3),(356,1,3),(357,1,3),(358,1,3),(359,1,3),(360,1,3),(361,1,3),(362,1,3),(363,1,3),(364,1,3),(365,1,3),(366,1,3),(367,1,3),(368,1,3),(369,1,3),(370,1,3),(371,1,3),(372,1,3),(373,1,3),(374,1,3),(375,1,3),(376,1,3),(377,1,3),(378,1,3),(379,1,3),(380,1,3),(381,1,3),(382,1,3),(383,1,3),(384,1,3),(385,1,3),(386,1,3),(387,1,3),(388,1,3),(389,1,3),(390,1,3),(391,1,3),(392,1,3),(393,1,3),(394,1,3),(395,1,3),(396,1,3),(397,1,3),(398,1,3),(399,1,3),(400,1,3),(401,2,3),(402,2,3),(403,2,3),(404,2,3),(405,2,3),(406,2,3),(407,2,3),(408,2,3),(409,2,3),(410,2,3),(411,2,3),(412,2,3),(413,2,3),(414,2,3),(415,2,3),(416,2,3),(417,2,3),(418,2,3),(419,2,3),(420,2,3),(421,2,3),(422,2,3),(423,2,3),(424,2,3),(425,2,3),(426,2,3),(427,2,3),(428,2,3),(429,2,3),(430,2,3),(431,2,3),(432,2,3),(433,2,3),(434,2,3),(435,2,3),(436,2,3),(437,2,3),(438,2,3),(439,2,3),(440,2,3),(441,2,3),(442,2,3),(443,2,3),(444,2,3),(445,2,3),(446,2,3),(447,2,3),(448,2,3),(449,2,3),(450,2,3),(451,3,3),(452,3,3),(453,3,3),(454,3,3),(455,3,3),(456,3,3),(457,3,3),(458,3,3),(459,3,3),(460,3,3),(461,3,3),(462,3,3),(463,3,3),(464,3,3),(465,3,3),(466,3,3),(467,3,3),(468,3,3),(469,3,3),(470,3,3),(471,3,3),(472,3,3),(473,3,3),(474,3,3),(475,3,3),(476,3,3),(477,3,3),(478,3,3),(479,3,3),(480,3,3),(481,3,3),(482,3,3),(483,3,3),(484,3,3),(485,3,3),(486,3,3),(487,3,3),(488,3,3),(489,3,3),(490,3,3),(491,3,3),(492,3,3),(493,3,3),(494,3,3),(495,3,3),(496,3,3),(497,3,3),(498,3,3),(499,3,3),(500,3,3),(501,1,4),(502,1,4),(503,1,4),(504,1,4),(505,1,4),(506,1,4),(507,1,4),(508,1,4),(509,1,4),(510,1,4),(511,1,4),(512,1,4),(513,1,4),(514,1,4),(515,1,4),(516,1,4),(517,1,4),(518,1,4),(519,1,4),(520,1,4),(521,1,4),(522,1,4),(523,1,4),(524,1,4),(525,1,4),(526,1,4),(527,1,4),(528,1,4),(529,1,4),(530,1,4),(531,1,4),(532,1,4),(533,1,4),(534,1,4),(535,1,4),(536,1,4),(537,1,4),(538,1,4),(539,1,4),(540,1,4),(541,1,4),(542,1,4),(543,1,4),(544,1,4),(545,1,4),(546,1,4),(547,1,4),(548,1,4),(549,1,4),(550,1,4),(551,1,4),(552,1,4),(553,1,4),(554,1,4),(555,1,4),(556,1,4),(557,1,4),(558,1,4),(559,1,4),(560,1,4),(561,1,4),(562,1,4),(563,1,4),(564,1,4),(565,1,4),(566,1,4),(567,1,4),(568,1,4),(569,1,4),(570,1,4),(571,1,4),(572,1,4),(573,1,4),(574,1,4),(575,1,4),(576,1,4),(577,1,4),(578,1,4),(579,1,4),(580,1,4),(581,1,4),(582,1,4),(583,1,4),(584,1,4),(585,1,4),(586,1,4),(587,1,4),(588,1,4),(589,1,4),(590,1,4),(591,1,4),(592,1,4),(593,1,4),(594,1,4),(595,1,4),(596,1,4),(597,1,4),(598,1,4),(599,1,4),(600,1,4),(601,2,4),(602,2,4),(603,2,4),(604,2,4),(605,2,4),(606,2,4),(607,2,4),(608,2,4),(609,2,4),(610,2,4),(611,2,4),(612,2,4),(613,2,4),(614,2,4),(615,2,4),(616,2,4),(617,2,4),(618,2,4),(619,2,4),(620,2,4),(621,2,4),(622,2,4),(623,2,4),(624,2,4),(625,2,4),(626,2,4),(627,2,4),(628,2,4),(629,2,4),(630,2,4),(631,2,4),(632,2,4),(633,2,4),(634,2,4),(635,2,4),(636,2,4),(637,2,4),(638,2,4),(639,2,4),(640,2,4),(641,3,4),(642,3,4),(643,3,4),(644,3,4),(645,3,4),(646,3,4),(647,3,4),(648,3,4),(649,3,4),(650,3,4),(651,3,4),(652,3,4),(653,3,4),(654,3,4),(655,3,4),(656,3,4),(657,3,4),(658,3,4),(659,3,4),(660,3,4),(661,3,4),(662,3,4),(663,3,4),(664,3,4),(665,3,4),(666,3,4),(667,3,4),(668,3,4),(669,3,4),(670,3,4),(671,1,5),(672,1,5),(673,1,5),(674,1,5),(675,1,5),(676,1,5),(677,1,5),(678,1,5),(679,1,5),(680,1,5),(681,1,5),(682,1,5),(683,1,5),(684,1,5),(685,1,5),(686,1,5),(687,1,5),(688,1,5),(689,1,5),(690,1,5),(691,1,5),(692,1,5),(693,1,5),(694,1,5),(695,1,5),(696,1,5),(697,1,5),(698,1,5),(699,1,5),(700,1,5),(701,1,5),(702,1,5),(703,1,5),(704,1,5),(705,1,5),(706,1,5),(707,1,5),(708,1,5),(709,1,5),(710,1,5),(711,1,5),(712,1,5),(713,1,5),(714,1,5),(715,1,5),(716,1,5),(717,1,5),(718,1,5),(719,1,5),(720,1,5),(721,1,5),(722,1,5),(723,1,5),(724,1,5),(725,1,5),(726,1,5),(727,1,5),(728,1,5),(729,1,5),(730,1,5),(731,1,5),(732,1,5),(733,1,5),(734,1,5),(735,1,5),(736,1,5),(737,1,5),(738,1,5),(739,1,5),(740,1,5),(741,1,5),(742,1,5),(743,1,5),(744,1,5),(745,1,5),(746,1,5),(747,1,5),(748,1,5),(749,1,5),(750,1,5),(751,1,5),(752,1,5),(753,1,5),(754,1,5),(755,1,5),(756,1,5),(757,1,5),(758,1,5),(759,1,5),(760,1,5),(761,1,5),(762,1,5),(763,1,5),(764,1,5),(765,1,5),(766,1,5),(767,1,5),(768,1,5),(769,1,5),(770,1,5),(771,2,5),(772,2,5),(773,2,5),(774,2,5),(775,2,5),(776,2,5),(777,2,5),(778,2,5),(779,2,5),(780,2,5),(781,2,5),(782,2,5),(783,2,5),(784,2,5),(785,2,5),(786,2,5),(787,2,5),(788,2,5),(789,2,5),(790,2,5),(791,2,5),(792,2,5),(793,2,5),(794,2,5),(795,2,5),(796,2,5),(797,2,5),(798,2,5),(799,2,5),(800,2,5),(801,2,5),(802,2,5),(803,2,5),(804,2,5),(805,2,5),(806,2,5),(807,2,5),(808,2,5),(809,2,5),(810,2,5),(811,2,5),(812,2,5),(813,2,5),(814,2,5),(815,2,5),(816,2,5),(817,2,5),(818,2,5),(819,2,5),(820,2,5),(821,3,5),(822,3,5),(823,3,5),(824,3,5),(825,3,5),(826,3,5),(827,3,5),(828,3,5),(829,3,5),(830,3,5),(831,3,5),(832,3,5),(833,3,5),(834,3,5),(835,3,5),(836,3,5),(837,3,5),(838,3,5),(839,3,5),(840,3,5),(841,3,5),(842,3,5),(843,3,5),(844,3,5),(845,3,5),(846,3,5),(847,3,5),(848,3,5),(849,3,5),(850,3,5),(851,3,5),(852,3,5),(853,3,5),(854,3,5),(855,3,5),(856,3,5),(857,3,5),(858,3,5),(859,3,5),(860,3,5),(861,3,5),(862,3,5),(863,3,5),(864,3,5),(865,3,5),(866,3,5),(867,3,5),(868,3,5),(869,3,5),(870,3,5),(871,1,6),(872,1,6),(873,1,6),(874,1,6),(875,1,6),(876,1,6),(877,1,6),(878,1,6),(879,1,6),(880,1,6),(881,1,6),(882,1,6),(883,1,6),(884,1,6),(885,1,6),(886,1,6),(887,1,6),(888,1,6),(889,1,6),(890,1,6),(891,1,6),(892,1,6),(893,1,6),(894,1,6),(895,1,6),(896,1,6),(897,1,6),(898,1,6),(899,1,6),(900,1,6),(901,1,6),(902,1,6),(903,1,6),(904,1,6),(905,1,6),(906,1,6),(907,1,6),(908,1,6),(909,1,6),(910,1,6),(911,1,6),(912,1,6),(913,1,6),(914,1,6),(915,1,6),(916,1,6),(917,1,6),(918,1,6),(919,1,6),(920,1,6),(921,1,6),(922,1,6),(923,1,6),(924,1,6),(925,1,6),(926,1,6),(927,1,6),(928,1,6),(929,1,6),(930,1,6),(931,1,6),(932,1,6),(933,1,6),(934,1,6),(935,1,6),(936,1,6),(937,1,6),(938,1,6),(939,1,6),(940,1,6),(941,1,6),(942,1,6),(943,1,6),(944,1,6),(945,1,6),(946,1,6),(947,1,6),(948,1,6),(949,1,6),(950,1,6),(951,1,6),(952,1,6),(953,1,6),(954,1,6),(955,1,6),(956,1,6),(957,1,6),(958,1,6),(959,1,6),(960,1,6),(961,1,6),(962,1,6),(963,1,6),(964,1,6),(965,1,6),(966,1,6),(967,1,6),(968,1,6),(969,1,6),(970,1,6),(971,2,6),(972,2,6),(973,2,6),(974,2,6),(975,2,6),(976,2,6),(977,2,6),(978,2,6),(979,2,6),(980,2,6),(981,2,6),(982,2,6),(983,2,6),(984,2,6),(985,2,6),(986,2,6),(987,2,6),(988,2,6),(989,2,6),(990,2,6),(991,2,6),(992,2,6),(993,2,6),(994,2,6),(995,2,6),(996,2,6),(997,2,6),(998,2,6),(999,2,6),(1000,2,6),(1001,2,6),(1002,2,6),(1003,2,6),(1004,2,6),(1005,2,6),(1006,2,6),(1007,2,6),(1008,2,6),(1009,2,6),(1010,2,6),(1011,3,6),(1012,3,6),(1013,3,6),(1014,3,6),(1015,3,6),(1016,3,6),(1017,3,6),(1018,3,6),(1019,3,6),(1020,3,6),(1021,3,6),(1022,3,6),(1023,3,6),(1024,3,6),(1025,3,6),(1026,3,6),(1027,3,6),(1028,3,6),(1029,3,6),(1030,3,6),(1031,3,6),(1032,3,6),(1033,3,6),(1034,3,6),(1035,3,6),(1036,3,6),(1037,3,6),(1038,3,6),(1039,3,6),(1040,3,6),(1041,3,6),(1042,3,6),(1043,3,6),(1044,3,6),(1045,3,6),(1046,3,6),(1047,3,6),(1048,3,6),(1049,3,6),(1050,3,6);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timezone` (
  `timezone_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL CHECK (`name` in ('Africa/Abidjan','Africa/Accra','Africa/Addis_Ababa','Africa/Algiers','Africa/Asmara','Africa/Asmera','Africa/Bamako','Africa/Bangui','Africa/Banjul','Africa/Bissau','Africa/Blantyre','Africa/Brazzaville','Africa/Bujumbura','Africa/Cairo','Africa/Casablanca','Africa/Ceuta','Africa/Conakry','Africa/Dakar','Africa/Dar_es_Salaam','Africa/Djibouti','Africa/Douala','Africa/El_Aaiun','Africa/Freetown','Africa/Gaborone','Africa/Harare','Africa/Johannesburg','Africa/Juba','Africa/Kampala','Africa/Khartoum','Africa/Kigali','Africa/Kinshasa','Africa/Lagos','Africa/Libreville','Africa/Lome','Africa/Luanda','Africa/Lubumbashi','Africa/Lusaka','Africa/Malabo','Africa/Maputo','Africa/Maseru','Africa/Mbabane','Africa/Mogadishu','Africa/Monrovia','Africa/Nairobi','Africa/Ndjamena','Africa/Niamey','Africa/Nouakchott','Africa/Ouagadougou','Africa/Porto-Novo','Africa/Sao_Tome','Africa/Timbuktu','Africa/Tripoli','Africa/Tunis','Africa/Windhoek','America/Adak','America/Anchorage','America/Anguilla','America/Antigua','America/Araguaina','America/Argentina/Buenos_Aires','America/Argentina/Catamarca','America/Argentina/ComodRivadavia','America/Argentina/Cordoba','America/Argentina/Jujuy','America/Argentina/La_Rioja','America/Argentina/Mendoza','America/Argentina/Rio_Gallegos','America/Argentina/Salta','America/Argentina/San_Juan','America/Argentina/San_Luis','America/Argentina/Tucuman','America/Argentina/Ushuaia','America/Aruba','America/Asuncion','America/Atikokan','America/Atka','America/Bahia','America/Bahia_Banderas','America/Barbados','America/Belem','America/Belize','America/Blanc-Sablon','America/Boa_Vista','America/Bogota','America/Boise','America/Buenos_Aires','America/Cambridge_Bay','America/Campo_Grande','America/Cancun','America/Caracas','America/Catamarca','America/Cayenne','America/Cayman','America/Chicago','America/Chihuahua','America/Coral_Harbour','America/Cordoba','America/Costa_Rica','America/Creston','America/Cuiaba','America/Curacao','America/Danmarkshavn','America/Dawson','America/Dawson_Creek','America/Denver','America/Detroit','America/Dominica','America/Edmonton','America/Eirunepe','America/El_Salvador','America/Ensenada','America/Fort_Nelson','America/Fort_Wayne','America/Fortaleza','America/Glace_Bay','America/Godthab','America/Goose_Bay','America/Grand_Turk','America/Grenada','America/Guadeloupe','America/Guatemala','America/Guayaquil','America/Guyana','America/Halifax','America/Havana','America/Hermosillo','America/Indiana/Indianapolis','America/Indiana/Knox','America/Indiana/Marengo','America/Indiana/Petersburg','America/Indiana/Tell_City','America/Indiana/Vevay','America/Indiana/Vincennes','America/Indiana/Winamac','America/Indianapolis','America/Inuvik','America/Iqaluit','America/Jamaica','America/Jujuy','America/Juneau','America/Kentucky/Louisville','America/Kentucky/Monticello','America/Knox_IN','America/Kralendijk','America/La_Paz','America/Lima','America/Los_Angeles','America/Louisville','America/Lower_Princes','America/Maceio','America/Managua','America/Manaus','America/Marigot','America/Martinique','America/Matamoros','America/Mazatlan','America/Mendoza','America/Menominee','America/Merida','America/Metlakatla','America/Mexico_City','America/Miquelon','America/Moncton','America/Monterrey','America/Montevideo','America/Montreal','America/Montserrat','America/Nassau','America/New_York','America/Nipigon','America/Nome','America/Noronha','America/North_Dakota/Beulah','America/North_Dakota/Center','America/North_Dakota/New_Salem','America/Nuuk','America/Ojinaga','America/Panama','America/Pangnirtung','America/Paramaribo','America/Phoenix','America/Port_of_Spain','America/Port-au-Prince','America/Porto_Acre','America/Porto_Velho','America/Puerto_Rico','America/Punta_Arenas','America/Rainy_River','America/Rankin_Inlet','America/Recife','America/Regina','America/Resolute','America/Rio_Branco','America/Rosario','America/Santa_Isabel','America/Santarem','America/Santiago','America/Santo_Domingo','America/Sao_Paulo','America/Scoresbysund','America/Shiprock','America/Sitka','America/St_Barthelemy','America/St_Johns','America/St_Kitts','America/St_Lucia','America/St_Thomas','America/St_Vincent','America/Swift_Current','America/Tegucigalpa','America/Thule','America/Thunder_Bay','America/Tijuana','America/Toronto','America/Tortola','America/Vancouver','America/Virgin','America/Whitehorse','America/Winnipeg','America/Yakutat','America/Yellowknife','Antarctica/Casey','Antarctica/Davis','Antarctica/DumontDUrville','Antarctica/Macquarie','Antarctica/Mawson','Antarctica/McMurdo','Antarctica/Palmer','Antarctica/Rothera','Antarctica/South_Pole','Antarctica/Syowa','Antarctica/Troll','Antarctica/Vostok','Arctic/Longyearbyen','Asia/Aden','Asia/Almaty','Asia/Amman','Asia/Anadyr','Asia/Aqtau','Asia/Aqtobe','Asia/Ashgabat','Asia/Ashkhabad','Asia/Atyrau','Asia/Baghdad','Asia/Bahrain','Asia/Baku','Asia/Bangkok','Asia/Barnaul','Asia/Beirut','Asia/Bishkek','Asia/Brunei','Asia/Calcutta','Asia/Chita','Asia/Choibalsan','Asia/Chongqing','Asia/Chungking','Asia/Colombo','Asia/Dacca','Asia/Damascus','Asia/Dhaka','Asia/Dili','Asia/Dubai','Asia/Dushanbe','Asia/Famagusta','Asia/Gaza','Asia/Harbin','Asia/Hebron','Asia/Ho_Chi_Minh','Asia/Hong_Kong','Asia/Hovd','Asia/Irkutsk','Asia/Istanbul','Asia/Jakarta','Asia/Jayapura','Asia/Jerusalem','Asia/Kabul','Asia/Kamchatka','Asia/Karachi','Asia/Kashgar','Asia/Kathmandu','Asia/Katmandu','Asia/Khandyga','Asia/Kolkata','Asia/Krasnoyarsk','Asia/Kuala_Lumpur','Asia/Kuching','Asia/Kuwait','Asia/Macao','Asia/Macau','Asia/Magadan','Asia/Makassar','Asia/Manila','Asia/Muscat','Asia/Nicosia','Asia/Novokuznetsk','Asia/Novosibirsk','Asia/Omsk','Asia/Oral','Asia/Phnom_Penh','Asia/Pontianak','Asia/Pyongyang','Asia/Qatar','Asia/Qostanay','Asia/Qyzylorda','Asia/Rangoon','Asia/Riyadh','Asia/Saigon','Asia/Sakhalin','Asia/Samarkand','Asia/Seoul','Asia/Shanghai','Asia/Singapore','Asia/Srednekolymsk','Asia/Taipei','Asia/Tashkent','Asia/Tbilisi','Asia/Tehran','Asia/Tel_Aviv','Asia/Thimbu','Asia/Thimphu','Asia/Tokyo','Asia/Tomsk','Asia/Ujung_Pandang','Asia/Ulaanbaatar','Asia/Ulan_Bator','Asia/Urumqi','Asia/Ust-Nera','Asia/Vientiane','Asia/Vladivostok','Asia/Yakutsk','Asia/Yangon','Asia/Yekaterinburg','Asia/Yerevan','Atlantic/Azores','Atlantic/Bermuda','Atlantic/Canary','Atlantic/Cape_Verde','Atlantic/Faeroe','Atlantic/Faroe','Atlantic/Jan_Mayen','Atlantic/Madeira','Atlantic/Reykjavik','Atlantic/South_Georgia','Atlantic/St_Helena','Atlantic/Stanley','Australia/ACT','Australia/Adelaide','Australia/Brisbane','Australia/Broken_Hill','Australia/Canberra','Australia/Currie','Australia/Darwin','Australia/Eucla','Australia/Hobart','Australia/LHI','Australia/Lindeman','Australia/Lord_Howe','Australia/Melbourne','Australia/North','Australia/NSW','Australia/Perth','Australia/Queensland','Australia/South','Australia/Sydney','Australia/Tasmania','Australia/Victoria','Australia/West','Australia/Yancowinna','Brazil/Acre','Brazil/DeNoronha','Brazil/East','Brazil/West','Canada/Atlantic','Canada/Central','Canada/Eastern','Canada/Mountain','Canada/Newfoundland','Canada/Pacific','Canada/Saskatchewan','Canada/Yukon','CET','Chile/Continental','Chile/EasterIsland','CST6CDT','Cuba','EET','Egypt','Eire','EST','EST5EDT','Etc/GMT','Etc/GMT-0','Etc/GMT-1','Etc/GMT-10','Etc/GMT-11','Etc/GMT-12','Etc/GMT-13','Etc/GMT-14','Etc/GMT-2','Etc/GMT-3','Etc/GMT-4','Etc/GMT-5','Etc/GMT-6','Etc/GMT-7','Etc/GMT-8','Etc/GMT-9','Etc/GMT+0','Etc/GMT+1','Etc/GMT+10','Etc/GMT+11','Etc/GMT+12','Etc/GMT+2','Etc/GMT+3','Etc/GMT+4','Etc/GMT+5','Etc/GMT+6','Etc/GMT+7','Etc/GMT+8','Etc/GMT+9','Etc/GMT0','Etc/Greenwich','Etc/UCT','Etc/Universal','Etc/UTC','Etc/Zulu','Europe/Amsterdam','Europe/Andorra','Europe/Astrakhan','Europe/Athens','Europe/Belfast','Europe/Belgrade','Europe/Berlin','Europe/Bratislava','Europe/Brussels','Europe/Bucharest','Europe/Budapest','Europe/Busingen','Europe/Chisinau','Europe/Copenhagen','Europe/Dublin','Europe/Gibraltar','Europe/Guernsey','Europe/Helsinki','Europe/Isle_of_Man','Europe/Istanbul','Europe/Jersey','Europe/Kaliningrad','Europe/Kiev','Europe/Kirov','Europe/Kyiv','Europe/Lisbon','Europe/Ljubljana','Europe/London','Europe/Luxembourg','Europe/Madrid','Europe/Malta','Europe/Mariehamn','Europe/Minsk','Europe/Monaco','Europe/Moscow','Europe/Nicosia','Europe/Oslo','Europe/Paris','Europe/Podgorica','Europe/Prague','Europe/Riga','Europe/Rome','Europe/Samara','Europe/San_Marino','Europe/Sarajevo','Europe/Saratov','Europe/Simferopol','Europe/Skopje','Europe/Sofia','Europe/Stockholm','Europe/Tallinn','Europe/Tirane','Europe/Tiraspol','Europe/Ulyanovsk','Europe/Uzhgorod','Europe/Vaduz','Europe/Vatican','Europe/Vienna','Europe/Vilnius','Europe/Volgograd','Europe/Warsaw','Europe/Zagreb','Europe/Zaporozhye','Europe/Zurich','GB','GB-Eire','GMT','GMT-0','GMT+0','GMT0','Greenwich','Hongkong','HST','Iceland','Indian/Antananarivo','Indian/Chagos','Indian/Christmas','Indian/Cocos','Indian/Comoro','Indian/Kerguelen','Indian/Mahe','Indian/Maldives','Indian/Mauritius','Indian/Mayotte','Indian/Reunion','Iran','Israel','Jamaica','Japan','Kwajalein','Libya','MET','Mexico/BajaNorte','Mexico/BajaSur','Mexico/General','MST','MST7MDT','Navajo','NZ','NZ-CHAT','Pacific/Apia','Pacific/Auckland','Pacific/Bougainville','Pacific/Chatham','Pacific/Chuuk','Pacific/Easter','Pacific/Efate','Pacific/Enderbury','Pacific/Fakaofo','Pacific/Fiji','Pacific/Funafuti','Pacific/Galapagos','Pacific/Gambier','Pacific/Guadalcanal','Pacific/Guam','Pacific/Honolulu','Pacific/Johnston','Pacific/Kanton','Pacific/Kiritimati','Pacific/Kosrae','Pacific/Kwajalein','Pacific/Majuro','Pacific/Marquesas','Pacific/Midway','Pacific/Nauru','Pacific/Niue','Pacific/Norfolk','Pacific/Noumea','Pacific/Pago_Pago','Pacific/Palau','Pacific/Pitcairn','Pacific/Pohnpei','Pacific/Ponape','Pacific/Port_Moresby','Pacific/Rarotonga','Pacific/Saipan','Pacific/Samoa','Pacific/Tahiti','Pacific/Tarawa','Pacific/Tongatapu','Pacific/Truk','Pacific/Wake','Pacific/Wallis','Pacific/Yap','Poland','Portugal','PRC','PST8PDT','ROC','ROK','Singapore','Turkey','UCT','Universal','US/Alaska','US/Aleutian','US/Arizona','US/Central','US/East-Indiana','US/Eastern','US/Hawaii','US/Indiana-Starke','US/Michigan','US/Mountain','US/Pacific','US/Samoa','UTC','W-SU','WET','Zulu')),
  PRIMARY KEY (`timezone_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezone`
--

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
INSERT INTO `timezone` VALUES 
(NULL, 'Europe/Amsterdam'),
(NULL, 'Europe/Athens'),
(NULL, 'Europe/Belgrade'),
(NULL, 'Europe/Berlin'),
(NULL, 'Europe/Brussels'),
(NULL, 'Europe/Bucharest'),
(NULL, 'Europe/Budapest'),
(NULL, 'Europe/Copenhagen'),
(NULL, 'Europe/Dublin'),
(NULL, 'Europe/Helsinki'),
(NULL, 'Europe/Istanbul');
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `town`
--

DROP TABLE IF EXISTS `town`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `town` (
  `town_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country_ID` int(11) NOT NULL,
  PRIMARY KEY (`town_ID`),
  KEY `country_id` (`country_ID`),
  CONSTRAINT `town_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `town`
--

LOCK TABLES `town` WRITE;
/*!40000 ALTER TABLE `town` DISABLE KEYS */;
INSERT INTO `town` VALUES (1,'Zagreb',1),(2,'Split',1),(3,'Berlin',4),(4,'Munchen',4),(5,'Pariz',2),(6,'Lyon',2),(7,'London',3),(8,'Manchester',3),(9,'Rio de Janiero',5),(10,'New York',6),(11,'Washington',6),(12,'Dubai',7);
/*!40000 ALTER TABLE `town` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelclass`
--

DROP TABLE IF EXISTS `travelclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelclass` (
  `travelclass_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`travelclass_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelclass`
--

LOCK TABLES `travelclass` WRITE;
/*!40000 ALTER TABLE `travelclass` DISABLE KEYS */;
INSERT INTO `travelclass` VALUES (1,'Economy'),(2,'Business'),(3,'First Class');
/*!40000 ALTER TABLE `travelclass` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-09 21:32:04
