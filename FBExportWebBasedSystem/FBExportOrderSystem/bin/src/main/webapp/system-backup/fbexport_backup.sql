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
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `FKse269fvw3ft70lc8sf7mp5kpo` (`customer_id`),
  CONSTRAINT `FKse269fvw3ft70lc8sf7mp5kpo` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'ADMIN',0),(2,'CUSTOMER',1),(3,'CUSTOMER',32768),(4,'EMPLOYEE',65536);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1),(2),(3);
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
INSERT INTO `cart_items` VALUES (3,2);
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
INSERT INTO `customer` VALUES (1,'Address','City','Azerbaijan','1700',18,'61','Customer1@gmail.com','09996668084','','Customer One','FEMALE','Customer One','Customer One','\0','$2a$10$A.fE44gIGcjqz5iX0egbZeYaPkyE.XYhhhMItHJT2D5DYd4W3Rw.u','','Customer1',1),(32768,'Address','City','Bangladesh','1700',18,'54','Customer2@gmail.com','09996668084','','Customer Two','MALE','Customer Two','Customer Two','\0','$2a$10$I4XrPrC4ClnjxG9Z34CLFe2qyO37au7yUb7VGxoLjsUi8pBEl.KK6','/resources/customer/img/profile-male.jpg','Customer2',2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
INSERT INTO `customer_shipping_addresses` VALUES (1,1),(32768,2);
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
INSERT INTO `employee` VALUES (0,'Address','City','Afghanistan','1700',23,'63','Admin1@gmail.com','09996668084','','Admin','FEMALE','Admin One','Admin One','','$2a$10$AnEV8dB0Wi.utLd2Akm3HeK2LKJqYTsu0ZLf4/agEprWI7Q2MVI9q','','Admin1','Admin'),(65536,'Address','Employee','Afghanistan','1700',18,'93','Employee1@gmail.com','09996668084','','Employee One','MALE','Employee','Employee One','\0','$2a$10$I6mQMXKO8CoI.qYNKMFJjeVs1fznVGr1U2jBYyJ8C1LKXzWBV0/Gu','','Employee1','Employee');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
INSERT INTO `hibernate_sequences` VALUES ('account',3);
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
INSERT INTO `item` VALUES (2,2000,10,'KILO',1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
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
  `message` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `total_items` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `total_weight` double NOT NULL,
  `cart_cart_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `shipping_shipping_id` bigint(20) DEFAULT NULL,
  `shipping_address_shipping_address_id` bigint(20) DEFAULT NULL,
  `date_paid` date DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
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
INSERT INTO `orders` VALUES (1,'2018-03-18','','CANCELLED','PAYPAL','asdasd',1,2000,10,3,1,1,1,NULL,NULL,NULL);
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
INSERT INTO `product` VALUES (1,'2018-03-17','2018-03-17','2018-03-17','Finding DOry','\0','Nemo','Finding Nemo',200,'/products/c4ca4238a0b923820dcc509a6f75849b.jpg','POSTED','Smaple','Address','09996668084',5,1),(2,'2018-03-20','2018-03-19','2018-03-19','Sample','\0','Sample','Sample',200,'/products/c81e728d9d4c2f636f067f89cc14862c.jpg','OUT_OF_STOCK','Sample','Sample','09996668084',0,2),(3,'2018-03-19','2018-03-19','2018-03-19','Sample Two','\0','Sample Two','Sample Two',200,'/products/eccbc87e4b5ce2fe28308fd9f2a7baf3.jpg','OUT_OF_STOCK','Sample Two','Sample Address','09996668084',0,3),(4,'2018-03-19','2018-03-19','2018-03-19','Samaple Three','\0','Sample Three','Sample Three',100,'/products/a87ff679a2f3e71d9181a67b7542122c.jpg','OUT_OF_STOCK','Sample Three','Sample','09996668084',0,4);
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
INSERT INTO `product_preview_image_links` VALUES (1,'/products/09e3d45d2d79ebcd559c712e25420e75.jpg'),(1,'/products/575d369e74656f6ad7cd4c3c6707da94.jpg'),(1,'/products/f3c8c3226a58624e593c10b1085d837d.jpg'),(2,'/products/045070b63d2cad3dc8f1d4aa2017bf9f.jpg'),(2,'/products/64bc52fa2b9fe74f616e363df14c37f3.jpg'),(2,'/products/8f7a038dd97e023ad033a6bf9ea126d2.jpg'),(3,'/products/1b5371779aa2b130bb28360b086dfe95.jpg'),(3,'/products/bf483288fc105fc0da589e77b3d46621.jpg'),(3,'/products/23a5717d8470a6c610f55f0af6cdd291.jpg'),(4,'/products/fd1a6232a4656f2f054b222c0d7a00d7.jpg'),(4,'/products/2d4730cfb7272031fd14d897aedb3717.jpg'),(4,'/products/1e9a654afa8a86c43ae43998d45339a1.jpg');
/*!40000 ALTER TABLE `product_preview_image_links` ENABLE KEYS */;
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
INSERT INTO `rating` VALUES (1,0,0),(2,0,0),(3,0,1),(4,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,'2018-03-13','2018-03-07','2018-03-08','ON_TRUCK',NULL,NULL,NULL,NULL);
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
INSERT INTO `shipping_address` VALUES (1,'Address','City','Azerbaijan','1700','User Account','61','Customer1@gmail.com','09996668084','','Customer One Customer One Customer One','specify your shipping instructions by editing the card'),(2,'Address','City','Bangladesh','1700','User Account','54','Customer2@gmail.com','09996668084','','Customer Two Customer Two Customer Two','specify your shipping instructions by editing the card');
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
  `time_occured` time DEFAULT NULL,
  PRIMARY KEY (`system_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
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
INSERT INTO `system_settings` VALUES (1,'00:10:00','00:00:00');
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
  `ip_address` varchar(255) DEFAULT NULL,
  `time_occured` time DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_access_log_id`),
  KEY `FK4jo8eq6diu8mwg6a3fekhm47y` (`employee_id`),
  CONSTRAINT `FK4jo8eq6diu8mwg6a3fekhm47y` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_log`
--

LOCK TABLES `user_access_log` WRITE;
/*!40000 ALTER TABLE `user_access_log` DISABLE KEYS */;
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

-- Dump completed on 2018-03-19 19:46:32
