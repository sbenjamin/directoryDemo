-- MySQL dump 10.13  Distrib 5.5.24, for Win64 (x86)
--
-- Host: localhost    Database: contactsdemo
-- ------------------------------------------------------
-- Server version	5.5.24

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `idaddresses` int(11) NOT NULL AUTO_INCREMENT,
  `idcontacts` int(11) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(12) DEFAULT NULL,
  `isPrimary` tinyint(4) DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT NULL,
  `lastModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idaddresses`),
  KEY `idContactsXaddresses_idx` (`idcontacts`),
  CONSTRAINT `idContactsXaddresses` FOREIGN KEY (`idcontacts`) REFERENCES `contacts` (`idcontacts`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'123 Main St.','Suite 100','San Francisco','SF','94108',1,'2015-04-14 15:38:30',NULL),(2,2,'124 Main St.','Suite 101','San Francisco','SF','94108',1,'2015-04-14 15:39:19',NULL),(3,3,'125 Main St.','Suite 102','San Francisco','SF','94108',1,'2015-04-14 15:39:28',NULL),(4,4,'126 Main St.','Suite 103','San Francisco','SF','94108',1,'2015-04-14 15:39:36',NULL),(5,5,'127 Main St.','Suite 104','San Francisco','SF','94108',1,'2015-04-14 15:39:48',NULL),(6,6,'128 Main St.','Suite 105','San Francisco','SF','94108',1,'2015-04-14 15:39:54',NULL),(7,7,'129 Main St.','Suite 106','San Francisco','SF','94108',1,'2015-04-14 15:40:02',NULL),(8,8,'130 Main St.','Suite 107','San Francisco','SF','94108',1,'2015-04-14 15:40:11',NULL),(9,9,'131 Main St.','Suite 108','San Francisco','SF','94108',1,'2015-04-14 15:40:18',NULL),(10,10,'132 Main St.','Suite 109','San Francisco','SF','94108',1,'2015-04-14 15:40:24',NULL),(11,11,'133 Main St.','Suite 110','San Francisco','SF','94108',1,'2015-04-14 15:40:30',NULL),(12,1,'134 Main St.','Suite 111','San Francisco','SF','94108',0,'2015-04-14 15:40:35',NULL),(13,2,'135 Main St.','Suite 112','San Francisco','SF','94108',0,'2015-04-14 15:40:42',NULL),(14,3,'136 Main St.','Suite 116','San Francisco','SF','94108',0,'2015-04-14 15:40:51',NULL),(15,4,'137 Main St.','Suite 117','San Francisco','SF','94108',0,'2015-04-14 15:40:57',NULL),(16,5,'139 Main St.','Suite 119','San Francisco','SF','94108',0,'2015-04-14 15:41:09',NULL),(17,6,'140 Main St.','Suite 120','San Francisco','SF','94108',0,'2015-04-14 15:41:17',NULL);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `idcompanies` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(12) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `website` varchar(75) DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT NULL,
  `lastModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idcompanies`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Companies have contacts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'ACME Anvil Corp.','3321 Hyland Avenue',NULL,'Costa Mesa','CA','92626','4157638725','http://www.chuckjones.com/acme-anvil/',NULL,NULL),(2,'The Black and White Cookie Co','1230 Park Avenue',NULL,'New York','NY','10128','2126539987','http://www.blackandwhitecookies.com/',NULL,NULL),(3,'Actual Cloud Corp','345 Spear Street',NULL,'San Francisco','CA','94105','4152322266','http://goo.gl/sCpgzW',NULL,NULL),(4,'The Nice Company','14747 N Northsight Blvd ','Suite 111','Scottsdale','AZ','85251','6025638832','http://thenicestplaceontheinter.net/',NULL,NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `idcontacts` int(11) NOT NULL AUTO_INCREMENT,
  `idcompanies` int(11) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT NULL,
  `lastmodifed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idcontacts`),
  KEY `idcompanies_idx` (`idcompanies`),
  CONSTRAINT `idcompaniesXcontacts` FOREIGN KEY (`idcompanies`) REFERENCES `companies` (`idcompanies`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='contacts have multiple phone numbers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,1,'Brad','Feld','bradfeld.jpg',NULL,NULL),(2,1,'Peter','Thiel','Peter-Thiel.jpg',NULL,NULL),(3,1,'Ben','Horowitz','Ben-Horowitz.jpg',NULL,NULL),(4,1,'Marc','Andreessen','Marc-Andreessen.jpg',NULL,NULL),(5,2,'Jason','Calicanis','Jason-Calicanis.jpg',NULL,NULL),(6,2,'Tom','Rickets','Tom-Rickets.jpg',NULL,NULL),(7,2,'Jeff','Weiner','Jeff-Weiner.jpg',NULL,NULL),(8,2,'Reid','Hoffman','Reid-Hoffman.jpg',NULL,NULL),(9,3,'Shantanu','Narayen','Shantanu-Narayen.jpg',NULL,NULL),(10,3,'Jeff','Bezos','Jeff-Bezos.jpg',NULL,NULL),(11,3,'Kenneth',' Chenault','Kenneth-Chenault.jpg',NULL,NULL),(12,4,'Tim','Cook','Tim-cook.jpg',NULL,NULL),(13,4,'John','Chambers','JohnChambers.jpg',NULL,NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `idemail` int(11) NOT NULL AUTO_INCREMENT,
  `idcontacts` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `isPrimary` tinyint(4) DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idemail`),
  KEY `idcontacts_idx` (`idcontacts`),
  CONSTRAINT `idcontactsXemail` FOREIGN KEY (`idcontacts`) REFERENCES `contacts` (`idcontacts`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,1,'brad@feld.com',1,'2015-04-14 15:31:18',NULL),(2,2,'peter@thiel.com',1,'2015-04-14 15:31:18',NULL),(3,3,'ben@a16z.com',1,'2015-04-14 15:31:18',NULL),(4,4,'marc@a16z.com',1,'2015-04-14 15:31:18',NULL),(5,5,'jason@inside.com',1,'2015-04-14 15:31:18',NULL),(6,6,'tom@incapital.com',1,'2015-04-14 15:31:18',NULL),(7,7,'jeff@linkedin.com',1,'2015-04-14 15:31:18',NULL),(8,8,'reid@linkedin.com',1,'2015-04-14 15:31:18',NULL),(9,9,'Shantanu@adobe.com',1,'2015-04-14 15:31:18',NULL),(10,10,'jeff@amazon.com',1,'2015-04-14 15:31:18',NULL),(11,11,'ken@amex.com',1,'2015-04-14 15:31:18',NULL),(12,12,'tim@apple.com',1,'2015-04-14 15:31:18',NULL),(13,13,'john@cisco.com',1,'2015-04-14 15:31:18',NULL);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumbers`
--

DROP TABLE IF EXISTS `phonenumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonenumbers` (
  `idphoneNumbers` int(11) NOT NULL AUTO_INCREMENT,
  `idcontacts` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `isPrimary` tinyint(4) DEFAULT '0',
  `datecreated` timestamp NULL DEFAULT NULL,
  `lastmodified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idphoneNumbers`),
  KEY `idcontacts_idx` (`idcontacts`),
  CONSTRAINT `idcontactsXphone` FOREIGN KEY (`idcontacts`) REFERENCES `contacts` (`idcontacts`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Phone number of contacts				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumbers`
--

LOCK TABLES `phonenumbers` WRITE;
/*!40000 ALTER TABLE `phonenumbers` DISABLE KEYS */;
INSERT INTO `phonenumbers` VALUES (1,1,'4151710168',1,NULL,NULL),(2,1,'4154249928',0,NULL,NULL),(3,2,'4158174662',1,NULL,NULL),(4,2,'4158099313',0,NULL,NULL),(5,2,'4153839632',0,NULL,NULL),(6,3,'4158268621',1,NULL,NULL),(7,3,'4158024539',0,NULL,NULL),(8,4,'4159882975',1,NULL,NULL),(9,5,'4158105480',1,NULL,NULL),(10,5,'4154046444',0,NULL,NULL),(11,6,'4151277385',1,NULL,NULL),(12,6,'4155430562',0,NULL,NULL),(13,7,'4159481514',1,NULL,NULL),(14,7,'4154139398',0,NULL,NULL),(15,8,'4155672321',1,NULL,NULL),(16,8,'4154510132',0,NULL,NULL),(17,9,'4154423964',1,NULL,NULL),(18,9,'4152010268',0,NULL,NULL),(19,10,'4157481085',1,NULL,NULL),(20,10,'4151080759',0,NULL,NULL),(21,11,'4153685340',1,NULL,NULL),(22,12,'4153994246',0,NULL,NULL),(23,13,'4153583480',1,NULL,NULL),(24,13,'4156168330',0,NULL,NULL);
/*!40000 ALTER TABLE `phonenumbers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-14 12:18:34
