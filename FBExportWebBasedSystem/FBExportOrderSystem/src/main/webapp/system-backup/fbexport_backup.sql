-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
-- Current Database: `fbexport`
--

/*!40000 DROP DATABASE IF EXISTS `fbexport`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fbexport` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fbexport`;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `FKse269fvw3ft70lc8sf7mp5kpo` (`customer_id`),
  CONSTRAINT `FKse269fvw3ft70lc8sf7mp5kpo` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'2018-04-03 16:11:50','You\'ve reviewed a product box rush','Reviewed Product',1),(2,'2018-04-03 16:12:21','You\'ve ordered Order No.1','Order',1),(3,'2018-04-03 16:12:36','You\'ve ordered Order No.2','Order',1),(4,'2018-04-04 00:28:24','You\'ve ordered Order No.3','Order',1),(5,'2018-04-04 00:28:47','You\'ve ordered Order No.4','Order',1),(6,'2018-04-04 00:29:08','You\'ve ordered Order No.5','Order',1),(7,'2018-04-04 00:29:35','You\'ve ordered Order No.6','Order',1),(8,'2018-04-04 03:58:05','You\'ve cancelled your Order No.6','Order Cancelled',1),(9,'2018-04-04 03:59:36','You\'ve Paid your Order No.6','Order Paid',1),(10,'2018-04-04 04:00:04','You\'ve Refund your Order No.6','Order Refund',1),(11,'2018-04-04 04:01:14','You\'ve reordered your Order No.6','Reordered',1),(12,'2018-04-04 04:01:45','You\'ve cancelled your Order No.6','Order Cancelled',1),(13,'2018-04-04 04:12:45','You\'ve cancelled your Order No.5','Order Cancelled',1),(14,'2018-04-04 04:36:43','You\'ve cancelled your Order No.6','Order Cancelled',1),(15,'2018-04-04 04:37:23','You\'ve cancelled your Order No.6','Order Cancelled',1),(16,'2018-04-04 04:39:00','You\'ve Paid your Order No.6','Order Paid',1),(17,'2018-04-04 04:39:19','You\'ve Refund your Order No.6','Order Refund',1),(18,'2018-04-04 04:40:18','You\'ve requested to returned order No. 6','Returned Product',1),(19,'2018-04-04 04:52:06','You\'ve Paid your Order No.6','Order Paid',1),(20,'2018-04-04 05:46:48','You\'ve cancelled your Order No.5','Order Cancelled',1),(21,'2018-04-04 05:46:52','You\'ve cancelled your Order No.4','Order Cancelled',1);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'ADMIN',0),(2,'CUSTOMER',1),(3,'EMPLOYEE',32768);
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1),(2),(3),(4),(5),(6),(7);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `cart_cart_id` bigint(20) NOT NULL,
  `items_item_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_pypafu0nle8455vljl95ae63p` (`items_item_id`),
  KEY `FK9846r70h5gdhsnpd4ljwl3hti` (`cart_cart_id`),
  CONSTRAINT `FK9846r70h5gdhsnpd4ljwl3hti` FOREIGN KEY (`cart_cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `FKg0vcyxnrx30vy32hux1yds9o0` FOREIGN KEY (`items_item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (2,2),(3,4),(4,6),(5,8),(6,10),(7,12);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `online` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image_link` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `cart_cart_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh8td8fqfv3u9171e9oqye30fv` (`cart_cart_id`),
  CONSTRAINT `FKh8td8fqfv3u9171e9oqye30fv` FOREIGN KEY (`cart_cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'rivera compound saint joseph subdivision','las pinas city','Philippines','14400',18,'358','krysseltillada@gmail.com','9161829106','','kryssel','MALE','de leon','tilladA','\0','$2a$10$mextiVhGdS.BcehQlX4HtOF54DWkdVYpKHbRd/Rc1Rax.YwIRtzee','/resources/customer/img/profile-male.jpg','krysseltillada',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notifications`
--

DROP TABLE IF EXISTS `customer_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_notifications` (
  `customer_id` bigint(20) NOT NULL,
  `notifications_notification_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ql9mx0i1ht5ir1kuntp4lhoja` (`notifications_notification_id`),
  KEY `FKekx2r4gmy2a6dsrjpcit8ofvs` (`customer_id`),
  CONSTRAINT `FKekx2r4gmy2a6dsrjpcit8ofvs` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKmgal9vskl36pm1mesn967tuup` FOREIGN KEY (`notifications_notification_id`) REFERENCES `notification` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notifications`
--

LOCK TABLES `customer_notifications` WRITE;
/*!40000 ALTER TABLE `customer_notifications` DISABLE KEYS */;
INSERT INTO `customer_notifications` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64);
/*!40000 ALTER TABLE `customer_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_shipping_addresses`
--

DROP TABLE IF EXISTS `customer_shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_shipping_addresses` (
  `customer_id` bigint(20) NOT NULL,
  `shipping_addresses_shipping_address_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_bwqlbuefsx221dfemluuq0h2u` (`shipping_addresses_shipping_address_id`),
  KEY `FKha6q0d4r9rv2uu1xb5vfr5dhk` (`customer_id`),
  CONSTRAINT `FKha6q0d4r9rv2uu1xb5vfr5dhk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKrqtmdfdxbtbdlmsm0m8suiv1f` FOREIGN KEY (`shipping_addresses_shipping_address_id`) REFERENCES `shipping_address` (`shipping_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_shipping_addresses`
--

LOCK TABLES `customer_shipping_addresses` WRITE;
/*!40000 ALTER TABLE `customer_shipping_addresses` DISABLE KEYS */;
INSERT INTO `customer_shipping_addresses` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `customer_shipping_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `online` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image_link` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (0,'wfawf','wefw','wegw','123',19,'12','krysseltillada@gmail.com','123123','','krysseltillada','MALE','de leon ','tillada','','$2a$10$w921HXavi.mOnflh.yIQNePCcnsgP50S7BwkZr9Zknd6IVzAcKflK',NULL,'krysseltillada','ADMIN'),(32768,'rivera compound saint joseph','angola','Angola','1400',18,'54','finalexistence@ymail.com','9123123123','','judy','MALE','ando','n','','$2a$10$.6jwXH05UmEtaRxYDEFDDObNeI2Gy2k/4mlPd4k.IRB5gOoSowC/S','/resources/admin/img/profile-male.jpg','finalexistence','STAFF');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_system_notification_list`
--

DROP TABLE IF EXISTS `employee_system_notification_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_system_notification_list` (
  `employee_id` bigint(20) NOT NULL,
  `system_notification_list_notification_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ii8tfx0hep1nc5wfh9u7pn1g5` (`system_notification_list_notification_id`),
  KEY `FK3884ke73fgnob9j1jlcckjnx3` (`employee_id`),
  CONSTRAINT `FK3884ke73fgnob9j1jlcckjnx3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FKk9xxpgfs61agh0jgkcxwoic3j` FOREIGN KEY (`system_notification_list_notification_id`) REFERENCES `system_notification` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_system_notification_list`
--

LOCK TABLES `employee_system_notification_list` WRITE;
/*!40000 ALTER TABLE `employee_system_notification_list` DISABLE KEYS */;
INSERT INTO `employee_system_notification_list` VALUES (0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(0,9),(0,10),(0,11),(0,12),(0,13),(0,14),(0,15),(0,16),(0,17),(0,18),(0,19),(0,20),(0,21),(0,22),(0,23),(0,24),(0,25),(0,26),(0,27),(0,28),(0,29),(0,31),(0,33),(0,35),(0,37),(32768,30),(32768,32),(32768,34),(32768,36),(32768,38);
/*!40000 ALTER TABLE `employee_system_notification_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) NOT NULL,
  `sequence_next_hi_value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('account',2);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `weight` double NOT NULL,
  `weight_type` varchar(255) DEFAULT NULL,
  `product_product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK6fok9mmtsmu22sejwqg8cq6u3` (`product_product_id`),
  CONSTRAINT `FK6fok9mmtsmu22sejwqg8cq6u3` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (2,123,1,'KILO',1),(4,369,3,'KILO',1),(6,123,1,'KILO',1),(8,123,1,'KILO',1),(10,123,1,'KILO',1),(12,123,1,'KILO',1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `is_seen` bit(1) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'2018-04-03 16:16:39','Your Order# 2 is Shipping','Order To Shipping','',2),(2,'2018-04-03 16:52:23','Your Order# 1 is Shipping','Order To Shipping','',1),(3,'2018-04-03 16:54:04','Your Order# 2 is Shipping','Order To Shipping','',2),(4,'2018-04-03 17:21:10','Your Order# 2 is approved','Order Approved','',2),(5,'2018-04-03 17:21:21','Your Order# 2 is Shipping','Order To Shipping','',2),(6,'2018-04-03 17:22:56','Your Order# 2 is rejected','Order Rejected','',2),(7,'2018-04-03 17:23:08','Your Order# 2 is Shipping','Order To Shipping','',2),(8,'2018-04-03 17:34:11','Your Order# 2 is Shipping','Order To Shipping','',2),(9,'2018-04-03 17:54:11','Your Order# 2 is Shipping','Order To Shipping','',2),(10,'2018-04-03 17:55:23','Your Order# 2 is rejected','Order Rejected','',2),(11,'2018-04-03 17:55:43','Your Order# 2 is rejected','Order Rejected','',2),(12,'2018-04-03 17:59:04','Your Order# 1 is rejected','Order Rejected','',1),(13,'2018-04-03 17:59:24','Your Order# 2 is Shipping','Order To Shipping','',2),(14,'2018-04-03 17:59:30','Your Order# 2 is Shipping','Order To Shipping','',2),(15,'2018-04-03 18:02:21','Your Order# 2 is rejected','Order Rejected','',2),(16,'2018-04-03 18:04:48','Your Order# 2 is rejected','Order Rejected','',2),(17,'2018-04-03 18:05:01','Your Order# 1 is rejected','Order Rejected','',1),(18,'2018-04-03 18:07:52','Your Order# 2 is rejected','Order Rejected','',2),(19,'2018-04-03 18:08:06','Your Order# 1 is rejected','Order Rejected','',1),(20,'2018-04-03 20:27:46','Your Order# 2 is approved','Order Approved','',2),(21,'2018-04-03 20:28:43','Your Order# 2 is rejected','Order Rejected','',2),(22,'2018-04-03 20:29:27','Your Order# 2 is Shipping','Order To Shipping','',2),(23,'2018-04-04 00:29:49','Your Order# 1 is approved','Order Approved','',1),(24,'2018-04-04 00:30:39','Your Order# 1 is approved','Order Approved','',1),(25,'2018-04-04 00:44:39','Your Order# 6 is approved','Order Approved','',6),(26,'2018-04-04 00:44:54','Your Order# 5 is rejected','Order Rejected','',5),(27,'2018-04-04 00:46:41','Your Order# 6 is approved','Order Approved','',6),(28,'2018-04-04 01:09:55','Your Order# 6 is Shipping','Order To Shipping','',6),(29,'2018-04-04 03:29:46','Your Order# 5 is rejected','Order Rejected','',5),(30,'2018-04-04 03:50:14','Your Order# 4 is approved','Order Approved','',4),(31,'2018-04-04 03:57:47','Your Order# 6 is approved','Order Approved','',6),(32,'2018-04-04 03:58:35','Your Order# 6 is approved','Order Approved','',6),(33,'2018-04-04 04:00:31','Your Order# 6 is rejected','Order Rejected','',6),(34,'2018-04-04 04:01:33','Your Order# 6 is rejected','Order Rejected','',6),(35,'2018-04-04 04:02:02','Your Order# 6 is Shipping','Order To Shipping','',6),(36,'2018-04-04 04:06:18','Your Order# 5 is approved','Order Approved','',5),(37,'2018-04-04 04:06:52','Your Order# 4 is approved','Order Approved','',4),(38,'2018-04-04 04:07:08','Your Order# 4 is approved','Order Approved','',4),(39,'2018-04-04 04:08:33','Your Order# 6 is approved','Order Approved','',6),(40,'2018-04-04 04:09:10','Your Order# 3 is rejected','Order Rejected','',3),(41,'2018-04-04 04:09:37','Your Order# 6 is Shipping','Order To Shipping','',6),(42,'2018-04-04 04:09:59','Your Order# 6 is rejected','Order Rejected','',6),(43,'2018-04-04 04:10:16','Your Order# 6 is Shipping','Order To Shipping','',6),(44,'2018-04-04 04:10:33','Your Order# 6 is rejected','Order Rejected','',6),(45,'2018-04-04 04:11:53','Your Order# 6 is Shipping','Order To Shipping','',6),(46,'2018-04-04 04:18:21','Your Order# 6 is Shipping','Order To Shipping','',6),(47,'2018-04-04 04:18:39','Your Order# 6 is Shipping','Order To Shipping','',6),(48,'2018-04-04 04:20:34','Your Order# 6 is Shipping','Order To Shipping','',6),(49,'2018-04-04 04:20:53','Your Order# 5 is Shipping','Order To Shipping','',5),(50,'2018-04-04 04:21:25','Your Order# 6 is approved','Order Approved','',6),(51,'2018-04-04 04:23:17','Your Order# 6 is approved','Order Approved','',6),(52,'2018-04-04 04:23:29','Your Order# 6 is approved','Order Approved','',6),(53,'2018-04-04 04:24:50','Your Order# 6 is approved','Order Approved','',6),(54,'2018-04-04 04:24:56','Your Order# 6 is approved','Order Approved','',6),(55,'2018-04-04 04:31:01','Your Order# 5 is approved','Order Approved','',5),(56,'2018-04-04 04:31:21','Your Order# 3 is Shipping','Order To Shipping','',3),(57,'2018-04-04 04:35:54','Your Order# 3 is rejected','Order Rejected','',3),(58,'2018-04-04 04:37:12','Your Order# 6 is rejected','Order Rejected','',6),(59,'2018-04-04 04:37:58','Your Order# 6 is approved','Order Approved','',6),(60,'2018-04-04 04:41:57','Your Order# 6 is Shipping','Order To Shipping','',6),(61,'2018-04-04 04:51:07','Your Order# 6 is Shipping','Order To Shipping','',6),(62,'2018-04-04 04:51:29','Your Order# 6 is approved','Order Approved','',6),(63,'2018-04-04 04:52:30','Your Order# 6 is Shipping','Order To Shipping','',6),(64,'2018-04-04 05:37:28','Your Order# 5 is approved','Order Approved','',5);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_ordered` date DEFAULT NULL,
  `date_paid` date DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `is_paid` bit(1) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `total_items` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `total_weight` double NOT NULL,
  `cart_cart_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `shipping_shipping_id` bigint(20) DEFAULT NULL,
  `shipping_address_shipping_address_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKtg32cl8e1f2afe83we3bqrw2h` (`cart_cart_id`),
  KEY `FK624gtjin3po807j3vix093tlf` (`customer_id`),
  KEY `FK8o21kg6tvreikslhq6n0o5jxf` (`shipping_shipping_id`),
  KEY `FK89wuak53n6o826m6ltksv9gj9` (`shipping_address_shipping_address_id`),
  CONSTRAINT `FK624gtjin3po807j3vix093tlf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK89wuak53n6o826m6ltksv9gj9` FOREIGN KEY (`shipping_address_shipping_address_id`) REFERENCES `shipping_address` (`shipping_address_id`),
  CONSTRAINT `FK8o21kg6tvreikslhq6n0o5jxf` FOREIGN KEY (`shipping_shipping_id`) REFERENCES `shipping` (`shipping_id`),
  CONSTRAINT `FKtg32cl8e1f2afe83we3bqrw2h` FOREIGN KEY (`cart_cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2018-04-03',NULL,NULL,'\0','','RETURNED','PAYPAL','your order has been returned',NULL,1,1137.76,1,2,1,NULL,1),(2,'2018-04-03',NULL,NULL,'\0','','PENDING','CASH_ON_DELIVERY','',NULL,1,1413.28,3,3,1,NULL,1),(3,'2018-04-04',NULL,NULL,'\0','your order has been rejected','REJECTED','PAYPAL','your order has been returned',NULL,1,1137.76,1,4,1,NULL,1),(4,'2018-04-04',NULL,NULL,'\0','your order has been approved','CANCELLED','PAYPAL','fwefwe',NULL,1,1137.76,1,5,1,NULL,1),(5,'2018-04-04',NULL,NULL,'\0','your order has been approved','CANCELLED','PAYPAL','gwr',NULL,1,1137.76,1,6,1,NULL,1),(6,'2018-04-04','2018-04-04',NULL,'','','RECEIVED','PAYPAL','',NULL,1,1137.76,1,7,1,19,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_of_delivery` date DEFAULT NULL,
  `date_posted` date DEFAULT NULL,
  `date_registered` date DEFAULT NULL,
  `description` longtext,
  `is_posted` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `product_image_link` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `supplier_contact_number` varchar(255) DEFAULT NULL,
  `weight` double NOT NULL,
  `rating_rating_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKg0klkuq150g13y1o1porbpxrj` (`rating_rating_id`),
  CONSTRAINT `FKg0klkuq150g13y1o1porbpxrj` FOREIGN KEY (`rating_rating_id`) REFERENCES `rating` (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2018-04-04','2018-04-03','2018-04-03','wegweg','\0','box rush','box rush',123,'/products/c4ca4238a0b923820dcc509a6f75849b.png','POSTED','wegwe','wegweg','123123',1511,1),(2,'2018-04-04','2018-04-04','2018-04-04','egweg','\0','pigfishfghrgh','pigfishfgh',200,'/products/c81e728d9d4c2f636f067f89cc14862c.png','POSTED','wegw','wegweg','12313',11400,2),(3,'2018-04-05','2018-04-04','2018-04-04','wegwe','\0','egweg','egwg',1231,'/products/eccbc87e4b5ce2fe28308fd9f2a7baf3.png','POSTED','wgwgwe','wgweg','12313',123,3),(4,'2018-04-05','2018-04-04','2018-04-04','rgweg','\0','wfqfqfw','wgweg',1231,'/products/a87ff679a2f3e71d9181a67b7542122c.png','POSTED','wegw','wgweg','1231312',123,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_preview_image_links`
--

DROP TABLE IF EXISTS `product_preview_image_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_preview_image_links` (
  `product_product_id` bigint(20) NOT NULL,
  `preview_image_links` varchar(255) DEFAULT NULL,
  KEY `FKdd7qp30sc55wvg24rv6vj3lpm` (`product_product_id`),
  CONSTRAINT `FKdd7qp30sc55wvg24rv6vj3lpm` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_preview_image_links`
--

LOCK TABLES `product_preview_image_links` WRITE;
/*!40000 ALTER TABLE `product_preview_image_links` DISABLE KEYS */;
INSERT INTO `product_preview_image_links` VALUES (1,'/products/5af8dbdac79caaf85a8cc833045f6107.png'),(1,'/products/58332a8372b7dd6e5e7077da8f1e8a34.png'),(1,'/products/f44e79e5d8eec8a86c4944a1f2becfdc.png'),(2,'/products/1116a18ec565528c46b95718ebe5dabe.png'),(2,'/products/3b7fce9471840cf719d97497093af906.png'),(2,'/products/aeba9c4fdf499ad3f1f91fe612cfe66a.png'),(3,'/products/62b12214332098a476fa28df5e1eaa95.png'),(3,'/products/d3e0de9687fda01dc4b4e690316f16ba.png'),(3,'/products/72855e5deb8fed7bf147bf77d42e8fdf.png'),(4,'/products/8c927b34a46ff79a2542c7a2f82ea537.png'),(4,'/products/f1e56eaf1447b82f930d92c310cf8f8e.png'),(4,'/products/fd4a46a1ce75b23fdd95e5b36d06e1e6.png');
/*!40000 ALTER TABLE `product_preview_image_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product_stocks`
--

DROP TABLE IF EXISTS `product_product_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_product_stocks` (
  `product_product_id` bigint(20) NOT NULL,
  `product_stocks_product_stock_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_3fawfyqkmwapjx0yk1n6ty2fq` (`product_stocks_product_stock_id`),
  KEY `FKp08vhgf807mfbfnxdo63qwyb0` (`product_product_id`),
  CONSTRAINT `FKp08vhgf807mfbfnxdo63qwyb0` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKs43xvxaockusequ4njcbdw5ap` FOREIGN KEY (`product_stocks_product_stock_id`) REFERENCES `product_stock` (`product_stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product_stocks`
--

LOCK TABLES `product_product_stocks` WRITE;
/*!40000 ALTER TABLE `product_product_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_product_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stock`
--

DROP TABLE IF EXISTS `product_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_stock` (
  `product_stock_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `weight` double NOT NULL,
  `weight_type` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`product_stock_id`),
  KEY `FKlpu1phje1bb3y9ww8k9fut4gh` (`product_id`),
  CONSTRAINT `FKlpu1phje1bb3y9ww8k9fut4gh` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stock`
--

LOCK TABLES `product_stock` WRITE;
/*!40000 ALTER TABLE `product_stock` DISABLE KEYS */;
INSERT INTO `product_stock` VALUES (1,'2018-04-03',565,'KILO',1),(2,'2018-04-03',55,'KILO',1),(3,'2018-04-03',768,'KILO',1),(4,'2018-04-04',200,'KILO',2),(5,'2018-04-04',200,'KILO',2),(6,'2018-04-04',10000,'KILO',2);
/*!40000 ALTER TABLE `product_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,4,2),(2,0,1),(3,0,0),(4,0,0);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_reviews`
--

DROP TABLE IF EXISTS `rating_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_reviews` (
  `rating_rating_id` bigint(20) NOT NULL,
  `reviews_review_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_3hrujf10stro0omcr6phogocb` (`reviews_review_id`),
  KEY `FKt68wy7lknb9tjf291c5xypqkc` (`rating_rating_id`),
  CONSTRAINT `FKlofrye5pgcbvjp52s6ob1dxop` FOREIGN KEY (`reviews_review_id`) REFERENCES `review` (`review_id`),
  CONSTRAINT `FKt68wy7lknb9tjf291c5xypqkc` FOREIGN KEY (`rating_rating_id`) REFERENCES `rating` (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_reviews`
--

LOCK TABLES `rating_reviews` WRITE;
/*!40000 ALTER TABLE `rating_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rate` double NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping` (
  `shipping_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `arrival_date` date DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `shipment_status` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `imo_number` varchar(255) DEFAULT NULL,
  `mmsi_number` varchar(255) DEFAULT NULL,
  `vessel_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shipping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (19,'2018-04-02','2018-04-01','2018-04-07','ON_TRUCK',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_address` (
  `shipping_address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `default_shipping_address` bit(1) NOT NULL,
  `receiver_full_name` varchar(255) DEFAULT NULL,
  `shipping_instructions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shipping_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
INSERT INTO `shipping_address` VALUES (1,'rivera compound saint joseph subdivision','las pinas city','Philippines','14400','User Account','358','krysseltillada@gmail.com','9161829106','\0','kryssel tilladA de leon','specify your shipping instructions by editing the card'),(2,'address','city','Afghanistan','1231','wife','93',NULL,'9123123','','judy ann mari n ando','shipping instructions');
/*!40000 ALTER TABLE `shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_log`
--

DROP TABLE IF EXISTS `shipping_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_log` (
  `shipping_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` longtext,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `is_complete` bit(1) NOT NULL,
  PRIMARY KEY (`shipping_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_log`
--

LOCK TABLES `shipping_log` WRITE;
/*!40000 ALTER TABLE `shipping_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_shipping_log`
--

DROP TABLE IF EXISTS `shipping_shipping_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_shipping_log` (
  `shipping_shipping_id` bigint(20) NOT NULL,
  `shipping_log_shipping_log_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_763o5kp8bux2vdy6u4vrir65s` (`shipping_log_shipping_log_id`),
  KEY `FK7mf21i418hg2qn6kgrmjqpnkh` (`shipping_shipping_id`),
  CONSTRAINT `FK7mf21i418hg2qn6kgrmjqpnkh` FOREIGN KEY (`shipping_shipping_id`) REFERENCES `shipping` (`shipping_id`),
  CONSTRAINT `FKq6s1ssjgtx0cpqylwbcgadwdv` FOREIGN KEY (`shipping_log_shipping_log_id`) REFERENCES `shipping_log` (`shipping_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_shipping_log`
--

LOCK TABLES `shipping_shipping_log` WRITE;
/*!40000 ALTER TABLE `shipping_shipping_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_shipping_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `system_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(255) DEFAULT NULL,
  `date_occured` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time_occured` datetime DEFAULT NULL,
  PRIMARY KEY (`system_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (1,'SYSTEM','2018-04-03','System Start','2018-04-03 15:55:20'),(2,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:00:28'),(3,'SYSTEM','2018-04-03','System Start','2018-04-03 16:00:44'),(4,'SYSTEM','2018-04-03','Auto logout called on krysseltillada de leon ','2018-04-03 16:04:17'),(5,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:18:21'),(6,'SYSTEM','2018-04-03','System Start','2018-04-03 16:18:36'),(7,'SETTINGS','2018-04-03','krysseltillada de leon  change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-03 16:20:22'),(8,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:40:02'),(9,'SYSTEM','2018-04-03','System Start','2018-04-03 16:40:17'),(10,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:47:09'),(11,'SYSTEM','2018-04-03','System Start','2018-04-03 16:47:24'),(12,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 16:48:42'),(13,'SYSTEM','2018-04-03','System Start','2018-04-03 16:48:57'),(14,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:06:51'),(15,'SYSTEM','2018-04-03','System Start','2018-04-03 17:07:08'),(16,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:09:25'),(17,'SYSTEM','2018-04-03','System Start','2018-04-03 17:20:16'),(18,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:52:01'),(19,'SYSTEM','2018-04-03','System Start','2018-04-03 17:52:15'),(20,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:53:11'),(21,'SYSTEM','2018-04-03','System Start','2018-04-03 17:53:25'),(22,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 17:56:12'),(23,'SYSTEM','2018-04-03','System Start','2018-04-03 17:56:27'),(24,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 18:03:51'),(25,'SYSTEM','2018-04-03','System Start','2018-04-03 18:04:05'),(26,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 18:05:21'),(27,'SYSTEM','2018-04-03','System Start','2018-04-03 18:07:16'),(28,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 18:08:14'),(29,'SYSTEM','2018-04-03','System Start','2018-04-03 20:13:29'),(30,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 20:23:08'),(31,'SYSTEM','2018-04-03','System Start','2018-04-03 20:23:22'),(32,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 20:24:40'),(33,'SYSTEM','2018-04-03','System Start','2018-04-03 20:24:55'),(34,'SYSTEM','2018-04-03','System Shutdown','2018-04-03 21:51:50'),(35,'SYSTEM','2018-04-03','System Start','2018-04-03 23:45:39'),(36,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 00:03:50'),(37,'SYSTEM','2018-04-04','System Start','2018-04-04 00:04:39'),(38,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 00:19:07'),(39,'SYSTEM','2018-04-04','System Start','2018-04-04 00:19:24'),(40,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 00:43:32'),(41,'SYSTEM','2018-04-04','System Start','2018-04-04 00:43:51'),(42,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 00:48:21'),(43,'SYSTEM','2018-04-04','System Start','2018-04-04 00:58:56'),(44,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 02:41:46'),(45,'SYSTEM','2018-04-04','System Start','2018-04-04 02:50:58'),(46,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 02:51:09'),(47,'SYSTEM','2018-04-04','System Start','2018-04-04 03:09:46'),(48,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 03:09:58'),(49,'SYSTEM','2018-04-04','System Start','2018-04-04 03:18:09'),(50,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 03:18:20'),(51,'SYSTEM','2018-04-04','System Start','2018-04-04 03:20:37'),(52,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 03:38:37'),(53,'SYSTEM','2018-04-04','System Start','2018-04-04 03:39:02'),(54,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 06:14:44'),(55,'SYSTEM','2018-04-04','System Start','2018-04-04 14:19:35'),(56,'SYSTEM','2018-04-04','Auto logout called on krysseltillada de leon ','2018-04-04 14:22:10'),(57,'SYSTEM','2018-04-04','Auto logout called on krysseltillada de leon ','2018-04-04 15:20:39'),(58,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 20:02:24'),(59,'SYSTEM','2018-04-04','System Start','2018-04-04 23:32:41'),(60,'SETTINGS','2018-04-04','krysseltillada de leon  update the system settings','2018-04-04 23:33:57'),(61,'SETTINGS','2018-04-04','krysseltillada de leon  change the system backup time to 11:34 PM and logout time to 30 minutes','2018-04-04 23:33:57'),(62,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 23:34:58'),(63,'SETTINGS','2018-04-04','krysseltillada de leon  update the system settings','2018-04-04 23:44:23'),(64,'SETTINGS','2018-04-04','krysseltillada de leon  change the system backup time to 11:34 PM and logout time to 30 minutes','2018-04-04 23:44:23'),(65,'SETTINGS','2018-04-04','krysseltillada de leon  update the system settings','2018-04-04 23:44:28'),(66,'SETTINGS','2018-04-04','krysseltillada de leon  change the system backup time to 11:34 PM and logout time to 30 minutes','2018-04-04 23:44:28'),(67,'SETTINGS','2018-04-04','krysseltillada de leon  update the system settings','2018-04-04 23:44:33'),(68,'SETTINGS','2018-04-04','krysseltillada de leon  change the system backup time to 11:34 PM and logout time to 30 minutes','2018-04-04 23:44:34');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notification`
--

DROP TABLE IF EXISTS `system_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_notification` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `is_seen` bit(1) NOT NULL,
  `system_notification_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
INSERT INTO `system_notification` VALUES (1,'2018-04-03 15:58:09','New product has added box rush','New Product','','INVENTORY_ADD_PRODUCT'),(2,'2018-04-03 16:12:21','kryssel de leon has ordered','New order','','ORDER_NEW_ORDER'),(3,'2018-04-03 16:12:36','kryssel de leon has ordered','New order','','ORDER_NEW_ORDER'),(4,'2018-04-03 17:07:38','kryssel de leon has paid order# 2','Order paid','','ORDER_PAID'),(5,'2018-04-04 00:28:24','kryssel de leon has ordered','New order','','ORDER_NEW_ORDER'),(6,'2018-04-04 00:28:47','kryssel de leon has ordered','New order','','ORDER_NEW_ORDER'),(7,'2018-04-04 00:29:08','kryssel de leon has ordered','New order','','ORDER_NEW_ORDER'),(8,'2018-04-04 00:29:35','kryssel de leon has ordered','New order','','ORDER_NEW_ORDER'),(9,'2018-04-04 03:58:05','kryssel de leon has cancelled order# 6','Order cancelled','','ORDER_CANCELLED'),(10,'2018-04-04 03:59:36','kryssel de leon has paid order# 6','Order paid','','ORDER_PAID'),(11,'2018-04-04 04:00:04','kryssel de leon wants to refund order# 6','Order refund','','ORDER_REFUND'),(12,'2018-04-04 04:01:45','kryssel de leon has cancelled order# 6','Order cancelled','','ORDER_CANCELLED'),(13,'2018-04-04 04:12:45','kryssel de leon has cancelled order# 5','Order cancelled','','ORDER_CANCELLED'),(14,'2018-04-04 04:36:43','kryssel de leon has cancelled order# 6','Order cancelled','','ORDER_CANCELLED'),(15,'2018-04-04 04:37:23','kryssel de leon has cancelled order# 6','Order cancelled','','ORDER_CANCELLED'),(16,'2018-04-04 04:39:00','kryssel de leon has paid order# 6','Order paid','','ORDER_PAID'),(17,'2018-04-04 04:39:19','kryssel de leon wants to refund order# 6','Order refund','','ORDER_REFUND'),(18,'2018-04-04 04:40:18','kryssel de leon wants to return order# 6','Order return','','ORDER_RETURN'),(19,'2018-04-04 04:52:06','kryssel de leon has paid order# 6','Order paid','','ORDER_PAID'),(20,'2018-04-04 04:56:10','New product has added pigfish','New Product','','INVENTORY_ADD_PRODUCT'),(21,'2018-04-04 05:46:48','kryssel de leon has cancelled order# 5','Order cancelled','','ORDER_CANCELLED'),(22,'2018-04-04 05:46:52','kryssel de leon has cancelled order# 4','Order cancelled','','ORDER_CANCELLED'),(23,'2018-04-04 17:29:22','Product no. 2 has been edited','Edited Product','','INVENTORY_EDIT_PRODUCT'),(24,'2018-04-04 17:33:03','Product no. 2 has been edited','Edited Product','','INVENTORY_EDIT_PRODUCT'),(25,'2018-04-04 23:33:57','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(26,'2018-04-04 23:34:58','System backup success','System Backup','','SYSTEM_BACKUP'),(27,'2018-04-04 23:38:28','Product no. 1 has been edited','Edited Product','','INVENTORY_EDIT_PRODUCT'),(28,'2018-04-04 23:41:44','New product has added egweg','New Product','','INVENTORY_ADD_PRODUCT'),(29,'2018-04-04 23:44:23','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(30,'2018-04-04 23:44:23','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(31,'2018-04-04 23:44:28','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(32,'2018-04-04 23:44:28','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(33,'2018-04-04 23:44:33','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(34,'2018-04-04 23:44:33','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(35,'2018-04-04 23:46:49','Product no. 1 has been edited','Edited Product','\0','INVENTORY_EDIT_PRODUCT'),(36,'2018-04-04 23:46:49','Product no. 1 has been edited','Edited Product','','INVENTORY_EDIT_PRODUCT'),(37,'2018-04-04 23:52:03','New product has added wfqfqfw','New Product','\0','INVENTORY_ADD_PRODUCT'),(38,'2018-04-04 23:52:03','New product has added wfqfqfw','New Product','\0','INVENTORY_ADD_PRODUCT');
/*!40000 ALTER TABLE `system_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `system_settings_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `logout_time` time DEFAULT '00:03:00',
  `system_backup_time` time DEFAULT '00:00:00',
  PRIMARY KEY (`system_settings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (1,'00:30:00','23:34:00');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access_log`
--

DROP TABLE IF EXISTS `user_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_access_log` (
  `user_access_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_occured` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `time_occured` time DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_access_log_id`),
  KEY `FK4jo8eq6diu8mwg6a3fekhm47y` (`employee_id`),
  CONSTRAINT `FK4jo8eq6diu8mwg6a3fekhm47y` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_log`
--

LOCK TABLES `user_access_log` WRITE;
/*!40000 ALTER TABLE `user_access_log` DISABLE KEYS */;
INSERT INTO `user_access_log` VALUES (1,'2018-04-03','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','15:57:26',0),(2,'2018-04-03','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','16:05:20',0),(3,'2018-04-03','krysseltillada de leon  has logged out','0:0:0:0:0:0:0:1','16:06:47',0),(4,'2018-04-03','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','16:07:11',0),(5,'2018-04-03','krysseltillada de leon  has logged out','0:0:0:0:0:0:0:1','16:08:43',0),(6,'2018-04-03','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','16:13:22',0),(7,'2018-04-03','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','20:19:48',0),(8,'2018-04-03','krysseltillada de leon  has logged out','0:0:0:0:0:0:0:1','20:41:04',0),(9,'2018-04-03','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','20:42:11',0),(10,'2018-04-03','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','23:46:56',0),(11,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','03:24:55',0),(12,'2018-04-04','krysseltillada de leon  has logged out','0:0:0:0:0:0:0:1','05:37:59',0),(13,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','05:38:06',0),(14,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','14:20:40',0),(15,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','14:41:07',0),(16,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','16:19:54',0),(17,'2018-04-04','krysseltillada de leon  has logged out','0:0:0:0:0:0:0:1','16:21:09',0),(18,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','17:07:06',0),(19,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','23:33:22',0),(20,'2018-04-04','krysseltillada de leon  has logged out','0:0:0:0:0:0:0:1','23:35:04',0),(21,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','23:35:16',0),(22,'2018-04-04','krysseltillada de leon  has logged out','0:0:0:0:0:0:0:1','23:36:16',0),(23,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','23:36:27',0),(24,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','23:38:01',0),(25,'2018-04-04','krysseltillada de leon  has logged out','0:0:0:0:0:0:0:1','23:45:18',0),(26,'2018-04-04','judy ando has logged in','0:0:0:0:0:0:0:1','23:45:28',32768),(27,'2018-04-04','krysseltillada de leon  has logged out','0:0:0:0:0:0:0:1','23:45:42',0),(28,'2018-04-04','krysseltillada de leon  has logged in','0:0:0:0:0:0:0:1','23:45:51',0);
/*!40000 ALTER TABLE `user_access_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-04 23:53:15
