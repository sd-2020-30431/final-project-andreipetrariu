-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: online_library
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id_book` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(90) NOT NULL,
  `category` varchar(45) NOT NULL,
  `publish_date` date NOT NULL,
  `content_path` varchar(90) NOT NULL,
  `permission` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT '0',
  `dislikes` int(11) DEFAULT '0',
  `is_modified` tinyint(4) DEFAULT '0',
  `fk_publisher` int(11) NOT NULL,
  PRIMARY KEY (`id_book`),
  UNIQUE KEY `id_book_UNIQUE` (`id_book`),
  KEY `fk_publisher_idx` (`fk_publisher`),
  CONSTRAINT `fk_publisher` FOREIGN KEY (`fk_publisher`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id_book`, `book_name`, `category`, `publish_date`, `content_path`, `permission`, `likes`, `dislikes`, `is_modified`, `fk_publisher`) VALUES (1,'Sample book','guides','2020-05-07','sample-book',0,0,0,0,5),(2,'Sample book','guides','2020-05-07','sample-book',0,0,0,0,5),(3,'Sample book','guides','2020-05-07','sample-book',0,0,0,0,5),(4,'Sample book','guides','2020-05-07','sample-book',0,0,0,0,5),(5,'Sample book','guides','2020-05-07','sample-book',0,0,0,0,5);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `content` varchar(200) NOT NULL,
  `post_date` datetime NOT NULL,
  `likes` int(11) DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL,
  `fk_page` int(11) NOT NULL,
  PRIMARY KEY (`id_comment`),
  UNIQUE KEY `id_comment_UNIQUE` (`id_comment`),
  KEY `fk_page_idx` (`fk_page`),
  CONSTRAINT `fk_page` FOREIGN KEY (`fk_page`) REFERENCES `books` (`id_book`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id_comment`, `username`, `content`, `post_date`, `likes`, `dislikes`, `fk_page`) VALUES (1,'Andrei98','Aua','2020-05-14 00:00:00',0,0,1),(2,'Andrei98','Aua','2020-05-14 00:00:00',0,0,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_books`
--

DROP TABLE IF EXISTS `favorite_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_books` (
  `id_favorite` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL,
  `fk_book` int(11) NOT NULL,
  PRIMARY KEY (`id_favorite`),
  UNIQUE KEY `id_favorite_UNIQUE` (`id_favorite`),
  KEY `fk_user_idx` (`fk_user`),
  KEY `fk_book_idx` (`fk_book`),
  CONSTRAINT `fk_book` FOREIGN KEY (`fk_book`) REFERENCES `books` (`id_book`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_books`
--

LOCK TABLES `favorite_books` WRITE;
/*!40000 ALTER TABLE `favorite_books` DISABLE KEYS */;
INSERT INTO `favorite_books` (`id_favorite`, `fk_user`, `fk_book`) VALUES (1,5,1),(2,5,2),(3,6,1),(4,6,3);
/*!40000 ALTER TABLE `favorite_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id_user`, `username`, `password`, `status`) VALUES (5,'Andrei98','asterix18',0),(6,'ben_pet','ben1234',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-27 13:21:17
