-- MySQL dump 10.13  Distrib 5.7.39, for Linux (x86_64)
--
-- Host: localhost    Database: CANTERA_API
-- ------------------------------------------------------
-- Server version	5.7.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
--
-- Create DATABASE
--

CREATE DATABASE IF NOT EXISTS `CANTERA_API`;
USE CANTERA_API;

--
-- Table structure for table `PAGE_STATUS`
--

DROP TABLE IF EXISTS `PAGE_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAGE_STATUS` (
  `status_id` int(11) NOT NULL,
  `status` varchar(225) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAGE_STATUS`
--

LOCK TABLES `PAGE_STATUS` WRITE;
/*!40000 ALTER TABLE `PAGE_STATUS` DISABLE KEYS */;
INSERT INTO `PAGE_STATUS` VALUES (0,'Queuing'),(1,'Processing'),(2,'Completed'),(3,'Error');
/*!40000 ALTER TABLE `PAGE_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROCESSES`
--

DROP TABLE IF EXISTS `PROCESSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCESSES` (
  `process_id` varchar(225) NOT NULL,
  `start_date` date NOT NULL,
  `file_create_date` date NOT NULL,
  `file_path` varchar(225) NOT NULL,
  `page_number` int(11) NOT NULL,
  `page_size` int(11) NOT NULL,
  PRIMARY KEY (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROCESSES`
--

LOCK TABLES `PROCESSES` WRITE;
/*!40000 ALTER TABLE `PROCESSES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROCESSES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROCESS_DETAILS`
--

DROP TABLE IF EXISTS `PROCESS_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCESS_DETAILS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` varchar(225) NOT NULL,
  `page_no` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PROCESSES` (`process_id`),
  KEY `FK_PROCESS_DETAILS` (`status_id`),
  CONSTRAINT `FK_PROCESSES` FOREIGN KEY (`process_id`) REFERENCES `PROCESSES` (`process_id`),
  CONSTRAINT `FK_PROCESS_DETAILS` FOREIGN KEY (`status_id`) REFERENCES `PAGE_STATUS` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROCESS_DETAILS`
--

LOCK TABLES `PROCESS_DETAILS` WRITE;
/*!40000 ALTER TABLE `PROCESS_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROCESS_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-03  4:58:38
