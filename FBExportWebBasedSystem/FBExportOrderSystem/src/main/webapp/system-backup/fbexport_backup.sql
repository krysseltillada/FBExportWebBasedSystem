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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'ADMIN',0),(2,'CUSTOMER',1),(3,'CUSTOMER',32768),(4,'CUSTOMER',65536),(5,'ADMIN',98304),(6,'EMPLOYEE',98305),(7,'EMPLOYEE',98306);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1),(2),(3),(4),(5),(6);
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
INSERT INTO `cart_items` VALUES (2,3),(2,4),(3,7),(3,8),(4,10);
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
INSERT INTO `customer` VALUES (1,'asd','tang ina','Afghanistan','1700',18,'93','presspurchase@gmail.com','09996668084','','TEST','FEMALE','Customer','Customer','','$2a$10$XXFb95Ma1lmEzfmsyc15teuULoHj2zKX1YQ/5Y08tEnp6e99hKl9S','/profile-img-customer/becfb907888c8d48f8328dba7edf6969.jpg','Customer1',1),(65536,'asd','City','Afghanistan','1700',18,'93','fongbrosinc@gmail.com','09996668084','','Gwapo','MALE','Cus','Cus','','$2a$10$VDQVNwPHDu.SJWy0OF2XEegK99QLQHVFh/x2Sq.1r2aubIgq35/hO','/profile-img-customer/0b0216b290922f789dd3efd0926d898e.jpg','Customer2',6);
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
INSERT INTO `customer_notifications` VALUES (1,1),(1,2),(1,3);
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
INSERT INTO `customer_shipping_addresses` VALUES (1,1),(65536,3);
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
INSERT INTO `employee` VALUES (0,'asd','asd','Argentina','1700',23,'63','Admin1@gmail.com','09996668084','','asd','MALE','asd','asd','','$2a$10$oS6ofrhXiA77gYhVoDkvZu0XxEj9SiKNhw7gA2CWVC5.qCRlag3gu','/profile-img/2e33a9b0b06aa0a01ede70995674ee23.jpg','Admin1','Admin'),(98304,'asd','asd','Afghanistan','1700',18,'93','Admin2@gmail.com','09996668084','\0','asd','MALE','asd','asd','\0','$2a$10$SCg/.lr7zI5CW7ta1xx0auvJGGnSAUd0Da/z4cmHHa6rn/E8HhcOe','/resources/admin/img/profile-male.jpg','Admin2','asd'),(98305,'asd','asd','Afghanistan','asd',18,'358','Employee1@gmail.com','09996668084','\0','asd','FEMALE','asd','asd','\0','$2a$10$9B59tTKdyNUAtBMpQ2TjVOp.uSrH.dtL0kwCLUaRRVAbDLOtMuwwa','/resources/admin/img/profile-female.jpg','Employee1','asd'),(98306,'asd','asd','Afghanistan','1700',18,'93','Employee2@gmail.com','09996668084','\0','asd','MALE','asd','asd','\0','$2a$10$Cv8BBypJl.EFjGSWAE89zOHLIYNedNaWM8lrLNFTaIgfEkCbrny0a','/resources/admin/img/profile-male.jpg','Employee2','asd');
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
INSERT INTO `hibernate_sequences` VALUES ('account',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (3,200,1,'KILO',2),(4,2000,1,'KILO',3),(7,2000,1,'KILO',3),(8,200,1,'KILO',1),(10,2000,1,'KILO',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'2018-03-30 14:14:36','Your Order# 1 is approved','Order Approved','',1),(2,'2018-03-30 14:16:43','Your Order# 1 is Shipping','Order To Shipping','',1),(3,'2018-03-30 14:41:46','Your Order# 1 is approved','Order Approved','\0',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2018-03-30','2018-03-21','2018-03-30','your order has been approved','PAID','CASH_ON_DELIVERY',NULL,NULL,2,3016,2,2,1,NULL,1),(2,'2018-03-30','2018-02-20','2018-02-20',NULL,'PAID','CASH_ON_DELIVERY',NULL,NULL,2,3464.55,2,3,1,NULL,1),(3,'2018-03-30','2018-03-07','2018-03-15',NULL,'PAID','CASH_ON_DELIVERY',NULL,NULL,1,3240,1,4,1,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2018-03-29','2018-03-29','2018-03-29','asd','\0','Nemo','Nemo Origin',200,'/products/c4ca4238a0b923820dcc509a6f75849b.jpg','POSTED','Company','asd','09996668084',6000,1),(2,'2018-03-29','2018-03-29','2018-03-29','asdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd','\0','Dory','Dory',200,'/products/c81e728d9d4c2f636f067f89cc14862c.jpg','POSTED','asdasd','asd','09996668084',4900,2),(3,'2018-03-29','2018-03-29','2018-03-29','asd','\0','Tes','Tes',2000,'/products/eccbc87e4b5ce2fe28308fd9f2a7baf3.jpg','POSTED','asd','asd','09996668084',3700,3),(4,'2018-03-29','2018-03-29','2018-03-29','asd','\0','test','test',200,'/products/a87ff679a2f3e71d9181a67b7542122c.jpg','POSTED','asd','asd','09996668084',6700.5,4),(5,'2018-03-13','2018-03-31','2018-03-31','Test Description','\0','Baby Shark','Pixar',200,'/products/e4da3b7fbbce2345d7772b0674a318d5.jpg','POSTED','asd','dfggh','09996668084',400,5);
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
INSERT INTO `product_preview_image_links` VALUES (1,'/products/903b6fd7699e36e76a98f7134cb43510.jpg'),(1,'/products/f4c0498b1cf0f07839c7eaa14555c561.jpg'),(1,'/products/41bcea8265052fa03e56bf4d22cabd20.jpg'),(2,'/products/847c1d27935989465946ba9c0ba2c620.jpg'),(2,'/products/61f0e1b6872dbab7c74fe80f68cc834e.jpg'),(2,'/products/3aca219a975a0a155368ee33b8dff60c.jpg'),(3,'/products/ced6c3bbf72df626aaf66540d4b0f212.jpg'),(3,'/products/88f07037390f08074f9181fcd51de2b5.jpg'),(3,'/products/9de79c70207366d46ca90f4ef82505c4.jpg'),(4,'/products/1d8141b75fb945209fd3b329e46f36fc.jpg'),(4,'/products/76ed3f221e45e960e58045fccd1aad63.jpg'),(4,'/products/b4717682187b1a34577c6c1943cdc957.jpg'),(5,'/products/b72b6de7619f8b6a6753cfb91e93556d.jpg'),(5,'/products/ac5c57fdc4e3f96f6f98fd2577676cde.jpg'),(5,'/products/e408f412922d0a36f449a8b4405905f3.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stock`
--

LOCK TABLES `product_stock` WRITE;
/*!40000 ALTER TABLE `product_stock` DISABLE KEYS */;
INSERT INTO `product_stock` VALUES (10,'2018-03-30',400,'KILO',1),(11,'2018-03-30',500,'KILO',2),(12,'2018-03-30',700,'KILO',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,0,15),(2,0,21),(3,0,13),(4,0,0),(5,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
INSERT INTO `shipping_address` VALUES (1,'asd','tang ina','Afghanistan','1700','User Account','93','alfredoborja81194@gmail.com','09996668084','','TEST Customer Customer','specify your shipping instructions by editing the card'),(2,'asd','asd','Armenia','1700','User Account','93','fongbrosinc@gmail.com','09996668084','','Custoemr Customer Custoemr','specify your shipping instructions by editing the card'),(3,'asd','City','Afghanistan','1700','User Account','93','fongbrosinc@gmail.com','09996668084','','Gwapo Cus Cus','specify your shipping instructions by editing the card');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notification`
--

LOCK TABLES `system_notification` WRITE;
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
INSERT INTO `system_notification` VALUES (1,'2018-03-30 14:13:40','Customer Customer has ordered','New order','\0','ORDER_NEW_ORDER'),(2,'2018-03-30 15:56:43','Customer Customer has ordered','New order','\0','ORDER_NEW_ORDER'),(3,'2018-03-30 15:58:39','Customer Customer has ordered','New order','\0','ORDER_NEW_ORDER');
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
INSERT INTO `system_settings` VALUES (1,'00:30:00','00:00:00');
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

-- Dump completed on 2018-04-02  0:31:26
