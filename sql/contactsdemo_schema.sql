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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-14 12:18:30
