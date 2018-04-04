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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'2018-04-04 10:07:41','You\'ve ordered Order No.1','Order',1),(2,'2018-04-04 11:32:28','TEST update profile','Account Settings',1),(3,'2018-04-04 11:32:29','You\'ve edited your account settings','Edited Account',1),(4,'2018-04-04 14:38:58','You\'ve edited your account settings','Edited Account',1),(5,'2018-04-04 14:40:12','You\'ve edited your account settings','Edited Account',1),(6,'2018-04-04 14:40:58','You\'ve edited your account settings','Edited Account',1),(7,'2018-04-04 14:41:25','You\'ve edited your account settings','Edited Account',1),(8,'2018-04-04 14:45:28','Password Changed','Reset Password',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1),(2);
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
INSERT INTO `cart_items` VALUES (2,2);
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
INSERT INTO `customer` VALUES (1,'asd','asd','Afghanistan','1700',18,'93','presspurchase@gmail.com','09996668084','','TEST','FEMALE','asd','asd','\0','$2a$10$dA79c462MTVYF4puoqxC4eAON0U0zevqjm.OFF956ObMsGfGU2GEK','/profile-img-customer/becfb907888c8d48f8328dba7edf6969.jpg','Customer1',1);
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
INSERT INTO `customer_shipping_addresses` VALUES (1,1);
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
INSERT INTO `employee` VALUES (0,'asd','asd','asd','63',23,'63','Admin1@gmail.com','09996668084','','asd','MALE','asd','asd','','$2a$10$w921HXavi.mOnflh.yIQNePCcnsgP50S7BwkZr9Zknd6IVzAcKflK',NULL,'Admin1','Admin'),(32768,'asd','asd','Antigua and Barbuda','1700',18,'297','Employee1@gmail.com','094567876','','Emp','MALE','Emp','Emp','\0','$2a$10$f36lSAMQtKSwrfnPjIuJqefyhuwVf2ymYZT5o4lhoctwSW4081/OS','/resources/admin/img/profile-male.jpg','Employee1','Empl');
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
INSERT INTO `employee_system_notification_list` VALUES (0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(0,9),(0,10),(0,11),(0,12),(0,13),(0,14),(0,15),(0,16),(0,17),(0,18),(0,19),(0,20),(0,21),(0,23),(0,25),(0,27),(0,29),(0,31),(0,33),(0,35),(0,37),(0,39),(0,41),(0,43),(0,45),(0,47),(0,49),(0,51),(0,53),(0,55),(0,57),(0,59),(0,61),(0,63),(0,65),(0,66),(0,67),(0,69),(0,71),(0,78),(32768,22),(32768,24),(32768,26),(32768,28),(32768,30),(32768,32),(32768,34),(32768,36),(32768,38),(32768,40),(32768,42),(32768,44),(32768,46),(32768,48),(32768,50),(32768,52),(32768,54),(32768,56),(32768,58),(32768,60),(32768,62),(32768,64),(32768,68),(32768,70),(32768,72),(32768,79);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (2,200,1,'KILO',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2018-04-04',NULL,NULL,'\0',NULL,'PENDING','CASH_ON_DELIVERY',NULL,NULL,1,1224,1,2,1,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2018-04-04','2018-04-04','2018-04-04','asd','\0','Nemodfgh','Nemo',200,'/products/c4ca4238a0b923820dcc509a6f75849b.jpg','POSTED','asd','asd','09996668084',400,1),(2,'2018-04-26','2018-04-04','2018-04-04','asd','\0','fghdgh','fgh',200,'/products/c81e728d9d4c2f636f067f89cc14862c.png','POSTED','asd','asd','09',800,2);
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
INSERT INTO `product_preview_image_links` VALUES (1,'/products/a64a45c1ef77e257b9b05a925f030010.jpg'),(1,'/products/0ebfe0482685612b9ddfae4c794fa837.jpg'),(1,'/products/7e5ea1d513f6d008348a7978004c8e52.jpg'),(2,'/products/17a2ec094887b34ed4602f60b176fda7.png'),(2,'/products/1183fc8db04f6129e8a3b3d228ed8fb7.png'),(2,'/products/20c9dc579a1a254ed70f8b76528124b3.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stock`
--

LOCK TABLES `product_stock` WRITE;
/*!40000 ALTER TABLE `product_stock` DISABLE KEYS */;
INSERT INTO `product_stock` VALUES (1,'2018-04-04',400,'KILO',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,0,0),(2,0,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
INSERT INTO `shipping_address` VALUES (1,'asd','asd','Afghanistan','1700','User Account','93','presspurchase@gmail.com','09996668084','','TEST asd asd','specify your shipping instructions by editing the card');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (1,'SYSTEM','2018-04-04','System Start','2018-04-04 09:42:47'),(2,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 09:44:42'),(3,'SYSTEM','2018-04-04','System Start','2018-04-04 09:45:05'),(4,'SETTINGS','2018-04-04','asd asd backup the system','2018-04-04 10:12:34'),(5,'SETTINGS','2018-04-04','asd asd export database','2018-04-04 10:12:44'),(6,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 10:13:12'),(7,'SYSTEM','2018-04-04','System Start','2018-04-04 11:00:22'),(8,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 11:28:00'),(9,'SYSTEM','2018-04-04','System Start','2018-04-04 11:28:46'),(10,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 11:29:38'),(11,'SYSTEM','2018-04-04','System Start','2018-04-04 11:30:02'),(12,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 11:33:21'),(13,'SYSTEM','2018-04-04','System Start','2018-04-04 11:33:44'),(14,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 11:36:18'),(15,'SYSTEM','2018-04-04','System Start','2018-04-04 11:36:37'),(16,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 11:38:45'),(17,'SYSTEM','2018-04-04','System Start','2018-04-04 11:39:03'),(18,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 11:39:53'),(19,'SYSTEM','2018-04-04','System Start','2018-04-04 13:20:46'),(20,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 13:41:37'),(21,'SYSTEM','2018-04-04','System Start','2018-04-04 13:42:24'),(22,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 13:46:02'),(23,'SYSTEM','2018-04-04','System Start','2018-04-04 13:46:23'),(24,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 13:49:12'),(25,'SYSTEM','2018-04-04','System Start','2018-04-04 13:49:41'),(26,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 14:11:48'),(27,'SYSTEM','2018-04-04','System Start','2018-04-04 14:13:25'),(28,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 14:19:33'),(29,'SYSTEM','2018-04-04','System Start','2018-04-04 14:20:08'),(30,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 14:20:43'),(31,'SYSTEM','2018-04-04','System Start','2018-04-04 14:21:11'),(32,'SETTINGS','2018-04-04','asd asd export database','2018-04-04 14:24:58'),(33,'SYSTEM','2018-04-04','Auto logout called on asd asd','2018-04-04 14:27:58'),(34,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 14:50:18'),(35,'SYSTEM','2018-04-04','System Start','2018-04-04 14:51:07'),(36,'SYSTEM','2018-04-04','Auto logout called on asd asd','2018-04-04 14:51:49'),(37,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 14:56:00'),(38,'SYSTEM','2018-04-04','System Start','2018-04-04 14:57:11'),(39,'SYSTEM','2018-04-04','System Start','2018-04-04 14:58:29'),(40,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 14:58:52'),(41,'SETTINGS','2018-04-04','asd asd backup the system','2018-04-04 15:00:42'),(42,'SETTINGS','2018-04-04','asd asd export database','2018-04-04 15:01:05'),(43,'SETTINGS','2018-04-04','asd asd change the system backup time to 12:00 AM and logout time to 3 minutes','2018-04-04 15:01:36'),(44,'SETTINGS','2018-04-04','asd asd change the system backup time to 03:04 PM and logout time to 3 minutes','2018-04-04 15:02:22'),(45,'SETTINGS','2018-04-04','asd asd change the system backup time to 03:08 PM and logout time to 30 minutes','2018-04-04 15:06:44'),(46,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 15:21:08'),(47,'SYSTEM','2018-04-04','System Start','2018-04-04 15:22:04'),(48,'SYSTEM','2018-04-04','System Start','2018-04-04 15:23:30'),(49,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 15:24:19'),(50,'SETTINGS','2018-04-04','asd asd restore the database','2018-04-04 15:27:56'),(51,'SETTINGS','2018-04-04','asd asd restored the backup','2018-04-04 15:27:58'),(52,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 15:28:21'),(53,'SETTINGS','2018-04-04','asd asd change the system backup time to 03:08 PM and logout time to 30 minutes','2018-04-04 15:28:21'),(54,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 15:28:43'),(55,'SETTINGS','2018-04-04','asd asd change the system backup time to 03:30 PM and logout time to 30 minutes','2018-04-04 15:28:44'),(56,'SYSTEM','2018-04-04','System Start','2018-04-04 15:34:51'),(57,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 15:35:07'),(58,'SYSTEM','2018-04-04','System Start','2018-04-04 15:40:08'),(59,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 15:42:06'),(60,'SETTINGS','2018-04-04','asd asd change the system backup time to 03:44 PM and logout time to 30 minutes','2018-04-04 15:42:07'),(61,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 15:51:56'),(62,'SYSTEM','2018-04-04','System Start','2018-04-04 15:52:22'),(63,'SETTINGS','2018-04-04','asd asd backup the database','2018-04-04 15:55:40'),(64,'SETTINGS','2018-04-04','asd asd backup the system','2018-04-04 15:55:41'),(65,'SETTINGS','2018-04-04','asd asd restore the database','2018-04-04 15:57:06'),(66,'SETTINGS','2018-04-04','asd asd restored the backup','2018-04-04 15:57:06'),(67,'SETTINGS','2018-04-04','asd asd export database','2018-04-04 15:57:11'),(68,'SETTINGS','2018-04-04','asd asd backup the database','2018-04-04 16:03:09'),(69,'SETTINGS','2018-04-04','asd asd backup the system','2018-04-04 16:03:09'),(70,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 16:09:57'),(71,'SYSTEM','2018-04-04','System Start','2018-04-04 16:10:37'),(72,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 16:12:03'),(73,'SETTINGS','2018-04-04','asd asd change the system backup time to 04:13 PM and logout time to 30 minutes','2018-04-04 16:12:04'),(74,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 16:17:52'),(75,'SYSTEM','2018-04-04','System Start','2018-04-04 16:18:20'),(76,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 16:19:39'),(77,'SETTINGS','2018-04-04','asd asd change the system backup time to 04:23 PM and logout time to 30 minutes','2018-04-04 16:19:39'),(78,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 16:24:09'),(79,'SYSTEM','2018-04-04','System Start','2018-04-04 16:24:29'),(80,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 16:28:00'),(81,'SYSTEM','2018-04-04','System Start','2018-04-04 16:28:28'),(82,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 16:29:58'),(83,'SYSTEM','2018-04-04','System Start','2018-04-04 16:30:28'),(84,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 16:32:05'),(85,'SETTINGS','2018-04-04','asd asd change the system backup time to 04:33 PM and logout time to 30 minutes','2018-04-04 16:32:05'),(86,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 16:35:49'),(87,'SYSTEM','2018-04-04','System Start','2018-04-04 16:36:07'),(88,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 16:37:12'),(89,'SETTINGS','2018-04-04','asd asd change the system backup time to 04:38 PM and logout time to 30 minutes','2018-04-04 16:37:13'),(90,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 16:38:19'),(91,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 16:38:59'),(92,'SETTINGS','2018-04-04','asd asd change the system backup time to 04:39 PM and logout time to 30 minutes','2018-04-04 16:39:00'),(93,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 16:39:06'),(94,'SETTINGS','2018-04-04','asd asd change the system backup time to 04:40 PM and logout time to 30 minutes','2018-04-04 16:39:06'),(95,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 16:40:19'),(96,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 16:41:12'),(97,'SYSTEM','2018-04-04','System Start','2018-04-04 17:21:31'),(98,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:26:54'),(99,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 17:28:08'),(100,'SYSTEM','2018-04-04','System Start','2018-04-04 17:28:25'),(101,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:29:49'),(102,'SETTINGS','2018-04-04','asd asd change the system backup time to 05:30 PM and logout time to 30 minutes','2018-04-04 17:29:50'),(103,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:30:07'),(104,'SETTINGS','2018-04-04','asd asd change the system backup time to 05:31 PM and logout time to 30 minutes','2018-04-04 17:30:07'),(105,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 17:31:41'),(106,'SETTINGS','2018-04-04','asd asd restore the database','2018-04-04 17:37:12'),(107,'SETTINGS','2018-04-04','asd asd restored the backup','2018-04-04 17:37:13'),(108,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:37:21'),(109,'SETTINGS','2018-04-04','asd asd change the system backup time to 05:31 PM and logout time to 30 minutes','2018-04-04 17:37:21'),(110,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:40:53'),(111,'SETTINGS','2018-04-04','asd asd change the system backup time to 05:31 PM and logout time to 30 minutes','2018-04-04 17:40:54'),(112,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:41:12'),(113,'SETTINGS','2018-04-04','asd asd change the system backup time to 05:42 PM and logout time to 30 minutes','2018-04-04 17:41:56'),(114,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:42:13'),(115,'SETTINGS','2018-04-04','asd asd change the system backup time to 05:44 PM and logout time to 30 minutes','2018-04-04 17:42:13'),(116,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 17:44:39'),(117,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:45:00'),(118,'SETTINGS','2018-04-04','asd asd change the system backup time to 05:45 PM and logout time to 30 minutes','2018-04-04 17:45:00'),(119,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 17:45:44'),(120,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:46:21'),(121,'SETTINGS','2018-04-04','asd asd change the system backup time to 05:47 PM and logout time to 30 minutes','2018-04-04 17:46:21'),(122,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 17:47:37'),(123,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 17:50:56'),(124,'SYSTEM','2018-04-04','System Start','2018-04-04 17:51:19'),(125,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:53:20'),(126,'SETTINGS','2018-04-04','asd asd change the system backup time to 05:55 PM and logout time to 30 minutes','2018-04-04 17:53:23'),(127,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 17:55:31'),(128,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 17:56:11'),(129,'SYSTEM','2018-04-04','System Start','2018-04-04 17:56:29'),(130,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 17:57:47'),(131,'SYSTEM','2018-04-04','System Start','2018-04-04 17:58:05'),(132,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:59:08'),(133,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:00 PM and logout time to 30 minutes','2018-04-04 17:59:08'),(134,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 17:59:28'),(135,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:00 PM and logout time to 30 minutes','2018-04-04 17:59:28'),(136,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:00:18'),(137,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:02:17'),(138,'SYSTEM','2018-04-04','System Start','2018-04-04 18:02:34'),(139,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:03:16'),(140,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:05 PM and logout time to 30 minutes','2018-04-04 18:03:16'),(141,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:05:46'),(142,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:07:35'),(143,'SYSTEM','2018-04-04','System Start','2018-04-04 18:07:53'),(144,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:08:40'),(145,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:09 PM and logout time to 30 minutes','2018-04-04 18:08:40'),(146,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:09:05'),(147,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:10:21'),(148,'SYSTEM','2018-04-04','System Start','2018-04-04 18:10:39'),(149,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:11:34'),(150,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:12 PM and logout time to 30 minutes','2018-04-04 18:11:34'),(151,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:12:52'),(152,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:13:52'),(153,'SYSTEM','2018-04-04','System Start','2018-04-04 18:15:36'),(154,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:16:52'),(155,'SYSTEM','2018-04-04','System Start','2018-04-04 18:17:16'),(156,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:18:37'),(157,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:20 PM and logout time to 30 minutes','2018-04-04 18:18:37'),(158,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:20:28'),(159,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:22:43'),(160,'SYSTEM','2018-04-04','System Start','2018-04-04 18:23:03'),(161,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:24:17'),(162,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:25 PM and logout time to 30 minutes','2018-04-04 18:24:18'),(163,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:25:15'),(164,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:26:00'),(165,'SYSTEM','2018-04-04','System Start','2018-04-04 18:26:16'),(166,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:28:20'),(167,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:29 PM and logout time to 30 minutes','2018-04-04 18:28:20'),(168,'SYSTEM','2018-04-04','Auto logout called on Emp Emp','2018-04-04 18:28:59'),(169,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:29:28'),(170,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:33:33'),(171,'SYSTEM','2018-04-04','System Start','2018-04-04 18:33:58'),(172,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:34:36'),(173,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:35 PM and logout time to 30 minutes','2018-04-04 18:34:36'),(174,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:35:11'),(175,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:35:31'),(176,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:36 PM and logout time to 30 minutes','2018-04-04 18:35:32'),(177,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:36:11'),(178,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:38:26'),(179,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:39 PM and logout time to 30 minutes','2018-04-04 18:38:27'),(180,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:39:11'),(181,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:40:48'),(182,'SYSTEM','2018-04-04','System Start','2018-04-04 18:41:04'),(183,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:42:04'),(184,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:42 PM and logout time to 30 minutes','2018-04-04 18:42:05'),(185,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:42:16'),(186,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:42:51'),(187,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:44 PM and logout time to 30 minutes','2018-04-04 18:42:51'),(188,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:44:16'),(189,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:44:58'),(190,'SYSTEM','2018-04-04','System Start','2018-04-04 18:45:25'),(191,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:46:52'),(192,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:48 PM and logout time to 30 minutes','2018-04-04 18:46:52'),(193,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:48:52'),(194,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:52:27'),(195,'SYSTEM','2018-04-04','System Start','2018-04-04 18:53:29'),(196,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:54:41'),(197,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:55:50'),(198,'SYSTEM','2018-04-04','System Start','2018-04-04 18:56:06'),(199,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:57:00'),(200,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 18:57:58'),(201,'SYSTEM','2018-04-04','System Start','2018-04-04 18:58:14'),(202,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:58:26'),(203,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 18:58:54'),(204,'SETTINGS','2018-04-04','asd asd change the system backup time to 06:59 PM and logout time to 30 minutes','2018-04-04 18:58:55'),(205,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 18:59:25'),(206,'SETTINGS','2018-04-04','asd asd restore the database','2018-04-04 19:00:23'),(207,'SETTINGS','2018-04-04','asd asd restored the backup','2018-04-04 19:00:24'),(208,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 19:02:36'),(209,'SYSTEM','2018-04-04','System Start','2018-04-04 19:03:16'),(210,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 19:04:45'),(211,'SETTINGS','2018-04-04','asd asd change the system backup time to 07:06 PM and logout time to 30 minutes','2018-04-04 19:04:46'),(212,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 19:06:33'),(213,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 19:07:23'),(214,'SYSTEM','2018-04-04','System Start','2018-04-04 19:07:39'),(215,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 19:09:39'),(217,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 19:10:51'),(218,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 19:11:05'),(219,'SYSTEM','2018-04-04','System Start','2018-04-04 19:11:22'),(220,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 19:14:07'),(221,'SETTINGS','2018-04-04','asd asd change the system backup time to 07:15 PM and logout time to 30 minutes','2018-04-04 19:14:07'),(222,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 19:15:34'),(223,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 19:23:35'),(224,'SYSTEM','2018-04-04','System Start','2018-04-04 19:23:55'),(225,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 19:25:47'),(226,'SETTINGS','2018-04-04','asd asd change the system backup time to 07:26 PM and logout time to 30 minutes','2018-04-04 19:25:48'),(227,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 19:26:07'),(228,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 19:28:19'),(229,'SETTINGS','2018-04-04','asd asd change the system backup time to 07:29 PM and logout time to 30 minutes','2018-04-04 19:28:19'),(230,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 19:29:06'),(231,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 19:35:31'),(232,'SYSTEM','2018-04-04','System Start','2018-04-04 19:35:50'),(233,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 19:36:24'),(234,'SETTINGS','2018-04-04','asd asd change the system backup time to 07:37 PM and logout time to 30 minutes','2018-04-04 19:36:24'),(235,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 19:37:02'),(236,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 19:37:23'),(237,'SYSTEM','2018-04-04','System Start','2018-04-04 19:38:31'),(238,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 19:39:04'),(239,'SETTINGS','2018-04-04','asd asd change the system backup time to 07:40 PM and logout time to 30 minutes','2018-04-04 19:39:04'),(240,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 19:40:47'),(241,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 19:48:59'),(242,'SYSTEM','2018-04-04','System Start','2018-04-04 19:52:30'),(243,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 19:53:41'),(244,'SETTINGS','2018-04-04','asd asd change the system backup time to 07:54 PM and logout time to 30 minutes','2018-04-04 19:53:42'),(245,'SETTINGS','2018-04-04','Automatic backup database','2018-04-04 19:54:50'),(246,'SYSTEM','2018-04-04','System Shutdown','2018-04-04 20:00:00'),(247,'SYSTEM','2018-04-04','System Start','2018-04-04 20:05:13'),(248,'SETTINGS','2018-04-04','asd asd update the system settings','2018-04-04 20:06:43'),(249,'SETTINGS','2018-04-04','asd asd change the system backup time to 08:07 PM and logout time to 30 minutes','2018-04-04 20:06:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
INSERT INTO `system_notification` VALUES (1,'2018-04-04 10:01:32','New product has added Nemo','New Product','','INVENTORY_ADD_PRODUCT'),(2,'2018-04-04 10:07:41','asd asd has ordered','New order','','ORDER_NEW_ORDER'),(3,'2018-04-04 15:00:41','System backup success','System Backup','','SYSTEM_BACKUP'),(4,'2018-04-04 15:01:36','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(5,'2018-04-04 15:02:22','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(6,'2018-04-04 15:06:44','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(7,'2018-04-04 15:27:57','System restore success','System Restore','','SYSTEM_BACKUP'),(8,'2018-04-04 15:28:21','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(9,'2018-04-04 15:28:44','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(10,'2018-04-04 15:42:07','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(11,'2018-04-04 15:55:40','System backup success','System Backup','','SYSTEM_BACKUP'),(12,'2018-04-04 15:57:06','System restore success','System Restore','','SYSTEM_BACKUP'),(13,'2018-04-04 16:03:09','System backup success','System Backup','','SYSTEM_BACKUP'),(14,'2018-04-04 16:12:03','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(15,'2018-04-04 16:19:39','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(16,'2018-04-04 16:32:05','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(17,'2018-04-04 16:37:12','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(18,'2018-04-04 16:38:59','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(19,'2018-04-04 16:39:06','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(20,'2018-04-04 17:26:54','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(21,'2018-04-04 17:29:49','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(22,'2018-04-04 17:29:49','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(23,'2018-04-04 17:30:07','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(24,'2018-04-04 17:30:07','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(25,'2018-04-04 17:34:18','New product has added fgh','New Product','','INVENTORY_ADD_PRODUCT'),(26,'2018-04-04 17:34:18','New product has added fgh','New Product','','INVENTORY_ADD_PRODUCT'),(27,'2018-04-04 17:37:12','System restore success','System Restore','','SYSTEM_BACKUP'),(28,'2018-04-04 17:37:12','System restore success','System Restore','','SYSTEM_BACKUP'),(29,'2018-04-04 17:37:21','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(30,'2018-04-04 17:37:21','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(31,'2018-04-04 17:38:15','Product no. 2 has been edited','Edited Product','','INVENTORY_EDIT_PRODUCT'),(32,'2018-04-04 17:38:15','Product no. 2 has been edited','Edited Product','','INVENTORY_EDIT_PRODUCT'),(33,'2018-04-04 17:40:34','Product no. 1 has been edited','Edited Product','','INVENTORY_EDIT_PRODUCT'),(34,'2018-04-04 17:40:34','Product no. 1 has been edited','Edited Product','','INVENTORY_EDIT_PRODUCT'),(35,'2018-04-04 17:40:53','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(36,'2018-04-04 17:40:53','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(37,'2018-04-04 17:41:12','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(38,'2018-04-04 17:41:12','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(39,'2018-04-04 17:42:13','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(40,'2018-04-04 17:42:13','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(41,'2018-04-04 17:45:00','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(42,'2018-04-04 17:45:00','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(43,'2018-04-04 17:46:21','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(44,'2018-04-04 17:46:21','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(45,'2018-04-04 17:53:20','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(46,'2018-04-04 17:53:20','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(47,'2018-04-04 18:08:40','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(48,'2018-04-04 18:08:40','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(49,'2018-04-04 18:11:34','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(50,'2018-04-04 18:11:34','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(51,'2018-04-04 18:18:37','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(52,'2018-04-04 18:18:37','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(53,'2018-04-04 18:34:36','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(54,'2018-04-04 18:34:36','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(55,'2018-04-04 18:35:32','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(56,'2018-04-04 18:35:32','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(57,'2018-04-04 18:38:26','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(58,'2018-04-04 18:38:26','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(59,'2018-04-04 18:42:04','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(60,'2018-04-04 18:42:04','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(61,'2018-04-04 18:42:51','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(62,'2018-04-04 18:42:51','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(63,'2018-04-04 18:46:52','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(64,'2018-04-04 18:46:52','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(65,'2018-04-04 18:54:41','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(66,'2018-04-04 18:57:01','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(67,'2018-04-04 18:58:54','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(68,'2018-04-04 18:58:54','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(69,'2018-04-04 19:00:23','System restore success','System Restore','','SYSTEM_BACKUP'),(70,'2018-04-04 19:00:23','System restore success','System Restore','\0','SYSTEM_BACKUP'),(71,'2018-04-04 19:04:45','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(72,'2018-04-04 19:04:45','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP'),(74,'2018-04-04 10:01:32','dad','ada','\0','ORDER_NEW_ORDER'),(75,'2018-04-04 10:01:32','dad','ada','\0','ORDER_NEW_ORDER'),(76,'2018-04-04 10:01:32','dad','ada','\0','ORDER_NEW_ORDER'),(77,'2018-04-04 10:01:32','dad','ada','\0','ORDER_NEW_ORDER'),(78,'2018-06-04 08:06:43','Udpdate system settings success','System Settings Update','','SYSTEM_BACKUP'),(79,'2018-06-04 08:06:43','Udpdate system settings success','System Settings Update','\0','SYSTEM_BACKUP');
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
INSERT INTO `system_settings` VALUES (1,'00:30:00','20:07:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_log`
--

LOCK TABLES `user_access_log` WRITE;
/*!40000 ALTER TABLE `user_access_log` DISABLE KEYS */;
INSERT INTO `user_access_log` VALUES (1,'2018-04-04','asd asd has logged in','0:0:0:0:0:0:0:1','09:59:04',0),(2,'2018-04-04','asd asd has logged out','0:0:0:0:0:0:0:1','10:01:42',0),(3,'2018-04-04','asd asd has logged in','0:0:0:0:0:0:0:1','10:10:10',0),(4,'2018-04-04','asd asd has logged in','0:0:0:0:0:0:0:1','14:24:27',0),(5,'2018-04-04','asd asd has logged in','0:0:0:0:0:0:0:1','14:46:59',0),(6,'2018-04-04','asd asd has logged in','0:0:0:0:0:0:0:1','14:59:46',0),(7,'2018-04-04','asd asd has logged in','0:0:0:0:0:0:0:1','15:41:34',0),(8,'2018-04-04','asd asd has logged in','192.168.4.205','17:23:57',0),(9,'2018-04-04','Emp Emp has logged in','0:0:0:0:0:0:0:1','17:25:47',32768);
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

-- Dump completed on 2018-04-04 20:07:31
