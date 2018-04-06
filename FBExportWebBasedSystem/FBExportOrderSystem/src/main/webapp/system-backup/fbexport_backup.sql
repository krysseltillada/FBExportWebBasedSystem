-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: fbexport
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB

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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
<<<<<<< HEAD
=======
INSERT INTO `activity` VALUES (1,'2018-04-05 16:55:55','You\'ve ordered Order No.1','Order',1),(2,'2018-04-05 16:58:47','You\'ve Paid your Order No.1','Order Paid',1),(3,'2018-04-05 17:41:13','You\'ve marked your Order No.1 as received','Order Marked as Received',1),(4,'2018-04-05 17:46:27','You\'ve ordered Order No.2','Order',1),(5,'2018-04-05 18:12:47','You\'ve ordered Order No.3','Order',1),(6,'2018-04-05 18:13:53','You\'ve cancelled your Order No.3','Order Cancelled',1);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `authorities` VALUES (1,'ADMIN',0),(2,'ADMIN',1);
=======
INSERT INTO `authorities` VALUES (1,'CUSTOMER',1),(2,'ADMIN',0);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
<<<<<<< HEAD
=======
INSERT INTO `cart` VALUES (1),(2),(3),(4);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
=======
INSERT INTO `cart_items` VALUES (2,2),(3,4),(4,7),(4,8);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
=======
INSERT INTO `customer` VALUES (1,'rivera compound saint joseph subdivision','las pinas city','Philippines','1400',18,'63','krysseltillada@gmail.com','91051829105','','kryssel','MALE','de leon','tillada','\0','$2a$10$CDBDMWHlf8xfyr0F6KnEY.WHDEISJhjtoERgne79EVvkVzT.nt5Iy','/resources/customer/img/profile-male.jpg','krysseltillada',1);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
=======
INSERT INTO `customer_notifications` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
=======
INSERT INTO `customer_shipping_addresses` VALUES (1,1);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
INSERT INTO `employee` VALUES (0,'asd','asd','asd','1700',23,'63','Admin1@gmail.com','09996668084','','asd','MALE','asd','ads','\0','$2a$10$w921HXavi.mOnflh.yIQNePCcnsgP50S7BwkZr9Zknd6IVzAcKflK',NULL,'Admin1','Admin'),(1,'asd','asd','Afghanistan','1700',18,'93','Admin2@gmail.com','09996668084','','asd','MALE','asd','asd','','$2a$10$ZKO26X26eySb8.nVpdaf5erPkALvknQ6lIHGoIIHZj8ISB1QWqo.a','/resources/admin/img/profile-male.jpg','Admin2','Admin');
=======
INSERT INTO `employee` VALUES (0,'awfaf','egw','wegw','123',19,'12','krysseltillada@gmail.com','123123','','kryssel','MALE','de leon','t','','$2a$10$w921HXavi.mOnflh.yIQNePCcnsgP50S7BwkZr9Zknd6IVzAcKflK',NULL,'krysseltillada','ADMIN');
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
INSERT INTO `employee_system_notification_list` VALUES (0,1),(0,3),(0,5),(0,7),(0,9),(0,11),(1,2),(1,4),(1,6),(1,8),(1,10),(1,12);
=======
INSERT INTO `employee_system_notification_list` VALUES (0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(0,9),(0,10),(0,11),(0,12),(0,13),(0,14),(0,15),(0,16),(0,17),(0,18);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
INSERT INTO `hibernate_sequences` VALUES ('account',1);
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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
<<<<<<< HEAD
=======
INSERT INTO `item` VALUES (2,6000,3,'KILO',1),(4,1999.9999999999998,1,'KILO',1),(7,9999.999999999998,5,'KILO',1),(8,1814369.48,1,'TON',1);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
<<<<<<< HEAD
=======
INSERT INTO `notification` VALUES (1,'2018-04-05 16:56:17','Your Order# 1 is approved','Order Approved','',1),(2,'2018-04-05 16:59:25','Your Order# 1 is Shipping','Order To Shipping','',1),(3,'2018-04-05 17:13:37','Your Order# 1 is Shipping','Order To Shipping','',1),(4,'2018-04-05 17:17:28','Your Order# 1 is Shipping','Order To Shipping','',1),(5,'2018-04-05 17:20:26','Your Order# 1 is Shipping','Order To Shipping','',1),(6,'2018-04-05 17:21:57','Your Order# 1 is Shipping','Order To Shipping','',1),(7,'2018-04-05 17:32:18','Your Order# 1 is Shipping','Order To Shipping','',1),(8,'2018-04-05 17:40:21','Your Order# 1 is Shipping','Order To Shipping','',1),(9,'2018-04-05 17:42:02','Your Order# 1 is Shipping','Order To Shipping','',1),(10,'2018-04-05 17:47:10','Your Order# 2 is approved','Order Approved','',2),(11,'2018-04-05 17:47:26','Your Order# 2 is Shipping','Order To Shipping','',2),(12,'2018-04-05 17:51:21','Your Order# 2 is Shipping','Order To Shipping','',2),(13,'2018-04-05 17:52:54','Your Order# 2 is approved','Order Approved','',2),(14,'2018-04-05 17:53:06','Your Order# 2 is Shipping','Order To Shipping','',2),(15,'2018-04-05 18:27:34','Your Order# 3 is approved','Order Approved','\0',3);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
<<<<<<< HEAD
=======
INSERT INTO `orders` VALUES (1,'2018-04-05',NULL,NULL,'\0','','PENDING','PAYPAL','',NULL,1,7720,3,2,1,NULL,1),(2,'2018-04-05','2018-04-05',NULL,'','','RETURNED','CASH_ON_DELIVERY','fewfwefwe',NULL,1,3240,1,3,1,5,1),(3,'2018-04-05','2018-04-05',NULL,'','your order has been approved','PAID','PAYPAL','',NULL,2,2044293.8176,912.1847399999999,4,1,NULL,1);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
<<<<<<< HEAD
=======
INSERT INTO `product` VALUES (1,'2018-04-06','2018-04-05','2018-04-05','egwegw','\0','memes','meme world',2000,'/products/c4ca4238a0b923820dcc509a6f75849b.jpg','POSTED','wegw','wegweg','12313',31000,1);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
=======
INSERT INTO `product_preview_image_links` VALUES (1,'/products/5006da69abbe417973b8d80e02c58a18.jpg'),(1,'/products/df862e4a03558a40ca151da5f05715b8.jpg'),(1,'/products/901e00c1c30b70e0ff8d4577f1e47d8e.jpg');
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stock`
--

LOCK TABLES `product_stock` WRITE;
/*!40000 ALTER TABLE `product_stock` DISABLE KEYS */;
<<<<<<< HEAD
=======
INSERT INTO `product_stock` VALUES (1,'2018-04-05',10000,'KILO',1),(2,'2018-04-05',1000,'KILO',1),(3,'2018-04-05',10000,'KILO',1);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
<<<<<<< HEAD
=======
INSERT INTO `rating` VALUES (1,0,0);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
<<<<<<< HEAD
=======
INSERT INTO `shipping` VALUES (5,'2018-04-04','2018-04-01','2018-04-05','ON_TRUCK',NULL,NULL,NULL,NULL);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
<<<<<<< HEAD
=======
INSERT INTO `shipping_address` VALUES (1,'rivera compound saint joseph subdivision','las pinas city','Philippines','1400','User Account','63','krysseltillada@gmail.com','91051829105','','kryssel tillada de leon','specify your shipping instructions by editing the card');
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
  `is_complete` bit(1) NOT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`shipping_log_id`)
<<<<<<< HEAD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_log`
--

LOCK TABLES `shipping_log` WRITE;
/*!40000 ALTER TABLE `shipping_log` DISABLE KEYS */;
INSERT INTO `shipping_log` VALUES (5,'wegweg','2018-04-05','wwegweg','wegweg','','12:00:00');
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
INSERT INTO `shipping_shipping_log` VALUES (5,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `system_log` VALUES (1,'SYSTEM','2018-04-05','System Start','2018-04-05 12:54:28'),(2,'SYSTEM','2018-04-05','System Shutdown','2018-04-05 12:58:05'),(3,'SYSTEM','2018-04-05','System Start','2018-04-05 13:03:11'),(4,'SETTINGS','2018-04-05','asd asd update the system settings','2018-04-05 13:17:10'),(5,'SETTINGS','2018-04-05','asd asd change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-05 13:17:11'),(6,'SETTINGS','2018-04-05','asd asd restore the database','2018-04-05 13:20:51'),(7,'SETTINGS','2018-04-05','asd asd restored the backup','2018-04-05 13:20:52'),(8,'SETTINGS','2018-04-05','asd asd export database','2018-04-05 13:21:02'),(9,'SETTINGS','2018-04-05','asd asd update the system settings','2018-04-05 13:22:19'),(10,'SETTINGS','2018-04-05','asd asd change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-05 13:22:20'),(11,'SETTINGS','2018-04-05','asd asd update the system settings','2018-04-05 13:22:37'),(12,'SETTINGS','2018-04-05','asd asd change the system backup time to 01:23 AM and logout time to 30 minutes','2018-04-05 13:22:38'),(13,'SETTINGS','2018-04-05','asd asd update the system settings','2018-04-05 13:24:54'),(14,'SETTINGS','2018-04-05','asd asd change the system backup time to 01:25 AM and logout time to 30 minutes','2018-04-05 13:24:55'),(15,'SYSTEM','2018-04-05','System Shutdown','2018-04-05 13:29:49'),(16,'SYSTEM','2018-04-05','System Start','2018-04-05 13:30:11'),(17,'SETTINGS','2018-04-05','asd asd update the system settings','2018-04-05 13:41:12'),(18,'SETTINGS','2018-04-05','asd asd change the system backup time to 01:43 PM and logout time to 30 minutes','2018-04-05 13:41:13');
=======
INSERT INTO `system_log` VALUES (1,'SYSTEM','2018-04-05','System Start','2018-04-05 15:47:45'),(2,'SYSTEM','2018-04-05','System Shutdown','2018-04-05 15:53:19'),(3,'SYSTEM','2018-04-05','System Start','2018-04-05 16:14:39'),(4,'SYSTEM','2018-04-05','Auto logout called on kryssel de leon','2018-04-05 17:03:09'),(5,'SYSTEM','2018-04-05','System Shutdown','2018-04-05 17:05:46'),(6,'SYSTEM','2018-04-05','System Start','2018-04-05 17:06:08'),(7,'SYSTEM','2018-04-05','System Shutdown','2018-04-05 17:09:50'),(8,'SYSTEM','2018-04-05','System Start','2018-04-05 17:10:07'),(9,'SYSTEM','2018-04-05','Auto logout called on kryssel de leon','2018-04-05 17:26:10'),(10,'SYSTEM','2018-04-05','Auto logout called on kryssel de leon','2018-04-05 17:36:03'),(11,'SYSTEM','2018-04-05','System Shutdown','2018-04-05 17:50:05'),(12,'SYSTEM','2018-04-05','System Start','2018-04-05 17:50:26'),(13,'SYSTEM','2018-04-05','Auto logout called on kryssel de leon','2018-04-05 18:02:42'),(14,'SYSTEM','2018-04-05','Auto logout called on kryssel de leon','2018-04-05 18:08:50'),(15,'SETTINGS','2018-04-05','kryssel de leon change the system backup time to 12:00 AM and logout time to 30 minutes','2018-04-05 18:40:29'),(16,'SETTINGS','2018-04-05','kryssel de leon restore the database','2018-04-05 18:42:32'),(17,'SETTINGS','2018-04-05','kryssel de leon export database','2018-04-05 18:44:31'),(18,'SETTINGS','2018-04-05','kryssel de leon change the system backup time to 06:48 PM and logout time to 30 minutes','2018-04-05 18:47:09');
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `system_notification` VALUES (1,'2018-04-05 13:17:10','Update system settings success','System Settings Update','','SYSTEM_BACKUP'),(2,'2018-04-05 13:17:10','Update system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(3,'2018-04-05 13:20:52','System restore success','System Restore','','SYSTEM_BACKUP'),(4,'2018-04-05 13:20:52','System restore success','System Restore','\0','SYSTEM_BACKUP'),(5,'2018-04-05 13:22:19','Update system settings success','System Settings Update','','SYSTEM_BACKUP'),(6,'2018-04-05 13:22:19','Update system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(7,'2018-04-05 13:22:37','Update system settings success','System Settings Update','','SYSTEM_BACKUP'),(8,'2018-04-05 13:22:37','Update system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(9,'2018-04-05 13:24:54','Update system settings success','System Settings Update','','SYSTEM_BACKUP'),(10,'2018-04-05 13:24:54','Update system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(11,'2018-04-05 13:41:12','Update system settings success','System Settings Update','','SYSTEM_BACKUP'),(12,'2018-04-05 13:41:12','Update system settings success','System Settings Update','\0','SYSTEM_BACKUP');
=======
INSERT INTO `system_notification` VALUES (1,'2018-04-05 16:46:40','New product has added memes','New Product','','INVENTORY_ADD_PRODUCT'),(2,'2018-04-05 16:55:55','kryssel de leon has ordered','New order','','ORDER_NEW_ORDER'),(3,'2018-04-05 16:58:47','kryssel de leon has paid order# 1','Order paid','','ORDER_PAID'),(4,'2018-04-05 17:11:54','kryssel de leon has received order# 1','Order received','','ORDER_RECEIVED'),(5,'2018-04-05 17:13:52','kryssel de leon has received order# 1','Order received','','ORDER_RECEIVED'),(6,'2018-04-05 17:19:31','kryssel de leon has received order# 1','Order received','','ORDER_RECEIVED'),(7,'2018-04-05 17:21:05','kryssel de leon has received order# 1','Order received','','ORDER_RECEIVED'),(8,'2018-04-05 17:23:33','kryssel de leon has received order# 1','Order received','','ORDER_RECEIVED'),(9,'2018-04-05 17:39:01','kryssel de leon has received order# 1','Order received','','ORDER_RECEIVED'),(10,'2018-04-05 17:41:13','kryssel de leon has received order# 1','Order received','','ORDER_RECEIVED'),(11,'2018-04-05 17:46:27','kryssel de leon has ordered','New order','','ORDER_NEW_ORDER'),(12,'2018-04-05 18:12:47','kryssel de leon has ordered','New order','','ORDER_NEW_ORDER'),(13,'2018-04-05 18:13:53','kryssel de leon has cancelled order# 3','Order cancelled','','ORDER_CANCELLED'),(14,'2018-04-05 18:30:29','Product no. 1 memes stocks has been updated','Update Product Stock','','INVENTORY_UPDATE_STOCK'),(15,'2018-04-05 18:31:50','Product no. 1 memes stocks has been updated','Update Product Stock','','INVENTORY_UPDATE_STOCK'),(16,'2018-04-05 18:40:29','Update system settings success','System Settings Update','','SYSTEM_BACKUP'),(17,'2018-04-05 18:42:32','System restore success','System Restore','\0','SYSTEM_BACKUP'),(18,'2018-04-05 18:47:09','Update system settings success','System Settings Update','\0','SYSTEM_BACKUP');
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
INSERT INTO `system_settings` VALUES (1,'00:30:00','13:43:00');
=======
INSERT INTO `system_settings` VALUES (1,'00:30:00','18:48:00');
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_log`
--

LOCK TABLES `user_access_log` WRITE;
/*!40000 ALTER TABLE `user_access_log` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `user_access_log` VALUES (1,'2018-04-05','asd asd has logged in','0:0:0:0:0:0:0:1','13:12:46',0),(2,'2018-04-05','asd asd has logged in','192.168.4.205','13:18:07',1),(3,'2018-04-05','asd asd has logged out','0:0:0:0:0:0:0:1','13:43:17',0);
=======
INSERT INTO `user_access_log` VALUES (1,'2018-04-05','kryssel de leon has logged in','0:0:0:0:0:0:0:1','16:45:35',0),(2,'2018-04-05','kryssel de leon has logged in','0:0:0:0:0:0:0:1','17:10:58',0),(3,'2018-04-05','kryssel de leon has logged in','0:0:0:0:0:0:0:1','17:28:33',0),(4,'2018-04-05','kryssel de leon has logged in','0:0:0:0:0:0:0:1','17:39:50',0),(5,'2018-04-05','kryssel de leon has logged in','0:0:0:0:0:0:0:1','18:05:39',0),(6,'2018-04-05','kryssel de leon has logged in','0:0:0:0:0:0:0:1','18:12:53',0),(7,'2018-04-05','kryssel de leon has logged out','0:0:0:0:0:0:0:1','18:39:07',0),(8,'2018-04-05','kryssel de leon has logged in','0:0:0:0:0:0:0:1','18:39:13',0);
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
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

<<<<<<< HEAD
-- Dump completed on 2018-04-05 13:43:27
=======
-- Dump completed on 2018-04-05 18:48:43
>>>>>>> 1358a093002d301bcf65572cfb8be5beff365667
