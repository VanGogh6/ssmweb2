-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.53

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogId` varchar(11) NOT NULL,
  `blogName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'01      ','听风'),(2,'02','君子难博基尼'),(3,'03','大千世界'),(4,'04 ','你好世界'),(5,'05 ','农大一枝花'),(6,'06 ','Java界菜鸟'),(24,'10 ','很好');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `dateTime` varchar(21) DEFAULT NULL,
  `blogId` varchar(11) NOT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'java线程安全','2019-02-22','02'),(3,'c++的奥妙','2019-02-02','02'),(4,'spring---春天','2019-03-29','06'),(5,'aop详解','2019-09-01','05'),(6,'动态代理','2020-10-01','02'),(8,'了解自己','2019-02-03','05'),(9,'谈谈人生','2019-05-16','01'),(10,'水浒传简介','2019-05-15','01'),(11,'今天还好吗','2019-05-16','01'),(12,'第一篇文章','2019-05-16','02'),(33,'一般一般','2019-05-16','02'),(39,'题材新颖','','01    '),(42,'题材新颖','2019-05-15','01      '),(43,'菜鸟的逆袭','2019-05-16','06 '),(44,'菜鸟的逆袭','2019-05-31','06 '),(45,'菜鸟的逆袭','2019-05-25','06 ');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginfo`
--

DROP TABLE IF EXISTS `loginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `logintime` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginfo`
--

LOCK TABLES `loginfo` WRITE;
/*!40000 ALTER TABLE `loginfo` DISABLE KEYS */;
INSERT INTO `loginfo` VALUES (10,'admin','2019-05-11 17:46:52'),(11,'admin','2019-05-11 17:51:08'),(9,'admin','2019-05-11 17:33:23'),(7,'admin','2019-05-11 17:29:16'),(8,'user','2019-05-11 17:29:40'),(12,'admin','2019-05-11 18:24:26'),(13,'admin','2019-05-11 18:26:12'),(14,'admin','2019-05-11 18:26:12'),(15,'admin','2019-05-11 18:28:10'),(16,'admin','2019-05-11 18:30:28'),(17,'admin','2019-05-11 18:33:43'),(18,'admin','2019-05-11 19:59:52'),(19,'admin','2019-05-11 20:08:01'),(20,'admin','2019-05-11 20:11:12'),(21,'admin','2019-05-11 20:14:43'),(22,'admin','2019-05-11 20:20:37'),(23,'admin','2019-05-11 20:31:44'),(24,'admin','2019-05-11 20:34:17'),(25,'user','2019-05-11 20:34:34'),(26,'user','2019-05-11 20:34:42'),(27,'admin','2019-05-11 20:34:50'),(28,'admin','2019-05-11 20:35:01'),(29,'user','2019-05-11 20:39:38'),(30,'user','2019-05-11 20:41:31'),(31,'admin','2019-05-11 20:45:32'),(32,'user','2019-05-11 20:46:25'),(33,'admin','2019-05-11 20:50:23'),(34,'user','2019-05-11 20:55:18'),(35,'admin','2019-05-11 20:59:49'),(36,'user','2019-05-11 21:03:14'),(37,'user','2019-05-11 21:07:08'),(38,'test','2019-05-11 21:11:53'),(39,'admin','2019-05-11 21:13:16'),(40,'admin','2019-05-11 21:45:50'),(41,'1','2019-05-11 22:22:00'),(42,'1','2019-05-11 22:22:09'),(43,'admin','2019-05-12 09:28:25'),(44,'1','2019-05-12 09:29:20'),(45,'1','2019-05-12 09:35:17'),(46,'1','2019-05-12 09:38:49'),(47,'1','2019-05-12 09:40:22'),(48,'1','2019-05-12 09:43:27'),(49,'1','2019-05-12 09:44:55'),(50,'1','2019-05-12 09:47:48'),(51,'1','2019-05-12 09:49:36'),(52,'1','2019-05-12 10:12:32'),(53,'1','2019-05-12 10:15:42'),(54,'1','2019-05-12 10:32:43'),(55,'1','2019-05-12 10:38:48'),(56,'1','2019-05-12 10:43:30'),(57,'1','2019-05-12 11:08:10'),(58,'1','2019-05-12 11:37:33'),(59,'1','2019-05-12 11:59:52'),(60,'1','2019-05-12 12:01:37'),(61,'1','2019-05-12 12:02:59'),(62,'1','2019-05-12 12:06:54'),(63,'1','2019-05-12 12:26:32'),(64,'1','2019-05-12 12:30:19'),(65,'1','2019-05-12 12:33:03'),(66,'1','2019-05-12 12:37:24'),(67,'1','2019-05-12 12:41:22'),(68,'1','2019-05-12 12:44:25'),(69,'1','2019-05-12 12:47:30'),(70,'1','2019-05-12 12:48:00'),(71,'1','2019-05-12 12:50:48'),(72,'1','2019-05-12 12:51:57'),(73,'admin','2019-05-12 13:05:42'),(74,'1','2019-05-12 13:08:41'),(75,'admin','2019-05-12 13:09:32'),(76,'1','2019-05-12 13:11:33'),(77,'1','2019-05-12 13:15:43'),(78,'1','2019-05-12 13:21:37'),(79,'admin','2019-05-12 13:22:25'),(80,'admin','2019-05-12 13:26:59'),(81,'admin2','2019-05-12 13:27:17'),(82,'admin2','2019-05-12 14:42:04'),(83,'admin','2019-05-12 14:42:17'),(84,'admin','2019-05-12 14:47:58'),(85,'1','2019-05-12 14:48:32'),(86,'1','2019-05-12 14:48:54'),(87,'admin','2019-05-12 14:49:32'),(88,'admin','2019-05-12 14:56:39'),(89,'admin','2019-05-12 14:59:11'),(90,'admin','2019-05-12 21:01:14'),(91,'admin','2019-05-12 21:05:30'),(92,'1','2019-05-12 21:06:47'),(93,'admin','2019-05-12 21:23:02'),(94,'admin','2019-05-12 21:32:39'),(95,'admin','2019-05-12 22:07:20'),(96,'1','2019-05-12 22:07:49'),(97,'admin','2019-05-13 11:21:17'),(98,'admin','2019-05-13 11:22:39'),(99,'admin','2019-05-13 14:16:07'),(100,'admin','2019-05-13 14:18:07'),(101,'1','2019-05-13 14:19:32'),(102,'admin2','2019-05-13 15:11:46'),(103,'admin2','2019-05-13 16:02:01');
/*!40000 ALTER TABLE `loginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` varchar(20) NOT NULL,
  `passWord` varchar(50) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `imgUrl` varchar(100) DEFAULT NULL,
  `userLevel` int(11) unsigned zerofill NOT NULL,
  `blogId` varchar(255) NOT NULL,
  `opt` text NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','c81e728d9d4c2f636f067f89cc14862c','吴帆','bc929b52556148679214733a90617ab6.png',00000000001,'02','--在ip地址0:0:0:0:0:0:0:1登录(2019-05-12 21:32:40)--退出登录(2019-05-12 21:33:34)--在ip地址0:0:0:0:0:0:0:1登录(2019-05-12 22:07:20)--退出登录(2019-05-12 22:07:43)--在ip地址0:0:0:0:0:0:0:1登录(2019-05-13 11:21:20)--修改密码成功(2019-05-13 11:22:14)--退出登录(2019-05-13 11:22:19)--在ip地址0:0:0:0:0:0:0:1登录(2019-05-13 11:22:39)--在ip地址0:0:0:0:0:0:0:1登录(2019-05-13 14:16:07)--增加用户1的管理员权限(2019-05-13 14:16:19)--取消用户1的管理员权限(2019-05-13 14:16:20)--增加用户1的管理员权限(2019-05-13 14:16:21)--取消用户1的管理员权限(2019-05-13 14:16:21)--退出登录(2019-05-13 14:17:17)--在ip地址0:0:0:0:0:0:0:1登录(2019-05-13 14:18:07)--取消用户admin的管理员权限(2019-05-13 14:18:58)--增加用户admin的管理员权限(2019-05-13 14:19:00)'),('admin2','c4ca4238a0b923820dcc509a6f75849b','李四','lolo.jpg',00000000001,'06 ','--在ip地址0:0:0:0:0:0:0:1登录(2019-05-13 15:11:46)--用户更新头像(2019-05-13 15:12:29)--在ip地址0:0:0:0:0:0:0:1登录(2019-05-13 16:02:01)--用户更新头像(2019-05-13 16:02:22)--退出登录(2019-05-13 16:02:49)'),('1','c4ca4238a0b923820dcc509a6f75849b','吴帆','lolo.jpg',00000000002,'06 ','--在ip地址0:0:0:0:0:0:0:1登录(2019-05-12 22:07:49)--用户1更新头像(2019-05-12 22:08:10)--在ip地址0:0:0:0:0:0:0:1登录(2019-05-13 14:19:32)--添加文章null(2019-05-13 14:19:58)--删除文章(2019-05-13 14:20:03)');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-18 14:42:24
