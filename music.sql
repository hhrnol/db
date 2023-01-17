-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: music
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id` int unsigned NOT NULL,
  `artist_id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `year` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name_in_album` (`artist_id`,`name`),
  KEY `fk_artist_in_album` (`artist_id`),
  CONSTRAINT `fk_artist_in_album` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,1,'...And Justice For All',1988),(2,1,'Black Album',1991),(3,1,'Master of Puppets',1986),(4,2,'Endgame',2009),(5,2,'Peace Sells',1986),(6,3,'The Greater of 2 Evils',2004),(7,4,'Reptile',2001),(8,4,'Riding with the King',2000),(9,5,'Greatest Hits',1992),(10,6,'Greatest Hits',2004),(11,7,'All-Time Greatest Hits',1975),(12,8,'Greatest Hits',2003),(13,9,'Sgt. Pepper\'s Lonely Hearts Club Band',1967);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `id` int unsigned NOT NULL,
  `record_label_id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name_in_artist` (`record_label_id`,`name`),
  KEY `fk_record_label_in_artist` (`record_label_id`),
  CONSTRAINT `fk_record_label_in_artist` FOREIGN KEY (`record_label_id`) REFERENCES `record_label` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (3,1,'Anthrax'),(2,1,'Megadeth'),(1,1,'Metallica'),(4,2,'Eric Clapton'),(6,2,'Van Halen'),(5,2,'ZZ Top'),(8,3,'AC/DC'),(7,3,'Lynyrd Skynyrd'),(9,6,'The Beatles');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_copy`
--

DROP TABLE IF EXISTS `artist_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_copy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `record_label_id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_copy`
--

LOCK TABLES `artist_copy` WRITE;
/*!40000 ALTER TABLE `artist_copy` DISABLE KEYS */;
INSERT INTO `artist_copy` VALUES (3,1,'Anthrax'),(4,2,'Eric Clapton'),(5,2,'ZZ Top'),(6,2,'Van Halen'),(7,3,'Lynyrd Skynyrd'),(8,3,'AC/DC'),(9,6,'The Beatles');
/*!40000 ALTER TABLE `artist_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_label`
--

DROP TABLE IF EXISTS `record_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_label` (
  `id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name_in_record_label` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_label`
--

LOCK TABLES `record_label` WRITE;
/*!40000 ALTER TABLE `record_label` DISABLE KEYS */;
INSERT INTO `record_label` VALUES (1,'Blackened'),(6,'Capitol'),(5,'Elektra'),(4,'MCA'),(3,'Universal'),(2,'Warner Bros');
/*!40000 ALTER TABLE `record_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `id` int unsigned NOT NULL,
  `album_id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `duration` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name_in_song` (`album_id`,`name`),
  KEY `fk_album_in_song` (`album_id`),
  CONSTRAINT `fk_album_in_song` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,1,'One',7.25),(2,1,'Blackened',6.42),(3,2,'Enter Sandman',5.3),(4,2,'Sad But True',5.29),(5,3,'Master of Puppets',8.35),(6,3,'Battery',5.13),(7,4,'Dialectic Chaos',2.26),(8,4,'Endgame',5.57),(9,5,'Peace Sells',4.09),(10,5,'The Conjuring',5.09),(11,6,'Madhouse',4.26),(12,6,'I am the Law',6.03),(13,7,'Reptile',3.36),(14,7,'Modern Girl',4.49),(15,8,'Riding with the King',4.23),(16,8,'Key to the Highway',3.39),(17,9,'Sharp Dressed Man',4.15),(18,9,'Legs',4.32),(19,10,'Eruption',1.43),(20,10,'Hot For Teacher',4.43),(21,11,'Sweet Home Alabama',4.45),(22,11,'Free Bird',14.23),(23,12,'Thunderstruck',4.52),(24,12,'T.N.T',3.35),(25,13,'Sgt. Pepper\'s Lonely Hearts Club Band',2.0333),(26,13,'With a Little Help from My Friends',2.7333),(27,13,'Lucy in the Sky with Diamonds',3.4666),(28,13,'Getting Better',2.8),(29,13,'Fixing a Hole',2.6),(30,13,'She\'s Leaving Home',3.5833),(31,13,'Being for the Benefit of Mr. Kite!',2.6166),(32,13,'Within You Without You',5.066),(33,13,'When I\'m Sixty-Four',2.6166),(34,13,'Lovely Rita',2.7),(35,13,'Good Morning Good Morning',2.6833),(36,13,'Sgt. Pepper\'s Lonely Hearts Club Band (Reprise)',1.3166),(37,13,'A Day in the Life',5.65);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-17 17:43:06
