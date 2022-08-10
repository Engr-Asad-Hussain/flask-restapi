-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: flask
-- ------------------------------------------------------
-- Server version	5.5.5-10.8.3-MariaDB-1:10.8.3+maria~jammy

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
-- Table structure for table `flask_org`
--

DROP TABLE IF EXISTS `flask_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flask_org` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization` varchar(150) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flask_org`
--

LOCK TABLES `flask_org` WRITE;
/*!40000 ALTER TABLE `flask_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `flask_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flask_roles`
--

DROP TABLE IF EXISTS `flask_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flask_roles` (
  `grade` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `actions` varchar(4000) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`grade`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flask_roles`
--

LOCK TABLES `flask_roles` WRITE;
/*!40000 ALTER TABLE `flask_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `flask_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flask_users`
--

DROP TABLE IF EXISTS `flask_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flask_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `flask_users_FK` (`org_id`),
  KEY `flask_users_FK_1` (`role_id`),
  CONSTRAINT `flask_users_FK` FOREIGN KEY (`org_id`) REFERENCES `flask_org` (`org_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `flask_users_FK_1` FOREIGN KEY (`role_id`) REFERENCES `flask_roles` (`grade`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flask_users`
--

LOCK TABLES `flask_users` WRITE;
/*!40000 ALTER TABLE `flask_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `flask_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'flask'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-10 11:30:33
