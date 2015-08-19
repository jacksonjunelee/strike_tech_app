-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: st-bodb-01    Database: test
-- ------------------------------------------------------
-- Server version	5.5.25a

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
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connections` (
  `idconnections` int(11) NOT NULL AUTO_INCREMENT,
  `engineName` varchar(3) NOT NULL,
  `exchange` int(11) NOT NULL,
  `sessionName` varchar(45) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `port` int(11) NOT NULL,
  PRIMARY KEY (`idconnections`),
  UNIQUE KEY `idconnections_UNIQUE` (`exchange`,`sessionName`,`ip`,`port`),
  UNIQUE KEY `connection_unique` (`exchange`,`sessionName`,`ip`,`port`),
  KEY `toEngine_idx` (`engineName`),
  KEY `toEng_idx` (`engineName`),
  CONSTRAINT `connToEngine` FOREIGN KEY (`engineName`) REFERENCES `engines` (`engineName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (1,'N/A',1,'nyse01',171128579,11111),(2,'N/A',1,'nyse02',171128580,11112),(3,'N/A',1,'nyse03',171128581,11113),(4,'N/A',1,'nyse04',171128582,11114),(5,'N/A',1,'test01',2887687013,11115),(6,'222',2,'nasdaq02',2887687013,11116),(7,'444',2,'nasdaq03',2887687013,11117),(8,'AAA',2,'nasdaq04',2887687013,11118),(9,'555',2,'test01',2887687013,11119),(10,'111',3,'bats00',2887687013,222),(11,'333',3,'bats01',2887687115,223),(12,'555',3,'bats01',2887687116,224),(13,'777',3,'test01',167772161,225),(14,'N/A',3,'test02',167772161,226),(15,'777',1,'1000',167772161,227),(16,'N/A',2,'1001',167772161,228),(17,'AAA',3,'1002',167772161,229),(18,'222',4,'1003',2887687114,31311),(19,'999',4,'1004',2887687114,31312),(20,'222',4,'TEST123-02@',2887687114,31313),(21,'333',4,'user1',2887687114,31314),(22,'222',2,'user2',2887687114,31315),(23,'222',2,'user3',2887687114,31316),(24,'111',2,'user4',2887687114,31317),(25,'666',1,'user5',2887687114,31318),(26,'555',2,'user6',2887687114,31319),(27,'111',1,'user7',2887675730,31313),(28,'222',1,'user6',2887687114,31313);
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engines`
--

DROP TABLE IF EXISTS `engines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engines` (
  `engineName` varchar(3) NOT NULL,
  `lastRun` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` bit(32) NOT NULL,
  PRIMARY KEY (`engineName`),
  UNIQUE KEY `engineName_UNIQUE` (`engineName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engines`
--

LOCK TABLES `engines` WRITE;
/*!40000 ALTER TABLE `engines` DISABLE KEYS */;
INSERT INTO `engines` VALUES ('111','2015-08-14 13:00:00','\0\0\0\0'),('222','2015-08-14 13:01:30','\0\0\0\0'),('333','2015-08-14 13:00:00','\0\0\0\0'),('444','2015-08-14 13:00:00','\0\0\0\0'),('555','2015-08-14 13:00:00','\0\0\0\0'),('666','2015-08-14 13:00:00','\0\0\0\0'),('777','2015-08-14 13:00:00','\0\0\0\0'),('888','2015-08-01 17:00:00','\0\0\0\0'),('999','2015-08-01 17:00:00','\0\0\0\0'),('AAA','2015-08-14 13:00:00','\0\0\0\0'),('N/A','2015-08-14 17:53:12','\0\0\0\0');
/*!40000 ALTER TABLE `engines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'bob','9f9d51bc70ef21ca5c14f307980a29d8'),(2,'alice','6384e2b2184bcbf58eccf10ca7a6563c'),(3,'fernando','cebdd715d4ecaafee8f147c2e85e0754'),(4,'john','527bd5b5d689e2c32ae974c6229ff785');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertoengines`
--

DROP TABLE IF EXISTS `usertoengines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertoengines` (
  `idusertoengines` int(11) NOT NULL AUTO_INCREMENT,
  `idusers` int(11) DEFAULT NULL,
  `engineName` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`idusertoengines`),
  UNIQUE KEY `idusertoengines_UNIQUE` (`idusertoengines`),
  KEY `usertoengines_toEng_idx` (`engineName`),
  KEY `usertoengines_toUser_idx` (`idusers`),
  CONSTRAINT `toUser` FOREIGN KEY (`idusers`) REFERENCES `users` (`idusers`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `toEng` FOREIGN KEY (`engineName`) REFERENCES `engines` (`engineName`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertoengines`
--

LOCK TABLES `usertoengines` WRITE;
/*!40000 ALTER TABLE `usertoengines` DISABLE KEYS */;
INSERT INTO `usertoengines` VALUES (1,1,'111'),(2,1,'222'),(3,1,'333'),(4,1,'444'),(5,1,'555'),(6,1,'666'),(7,1,'777'),(8,1,'888'),(9,1,'999'),(10,1,'AAA'),(11,2,'111'),(12,2,'333'),(13,2,'777'),(14,3,'222'),(15,3,'333'),(16,3,'444'),(17,3,'555'),(18,3,'666');
/*!40000 ALTER TABLE `usertoengines` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-14 16:16:45
