-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: project_tables
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `belongsto`
--

DROP TABLE IF EXISTS `belongsto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belongsto` (
  `device_serial_num` int NOT NULL,
  `owner_email` varchar(50) NOT NULL,
  PRIMARY KEY (`device_serial_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongsto`
--

LOCK TABLES `belongsto` WRITE;
/*!40000 ALTER TABLE `belongsto` DISABLE KEYS */;
INSERT INTO `belongsto` VALUES (57483920,'Freetrees123@yahoo.com'),(112778988,'Freetrees123@yahoo.com'),(123456789,'Freetrees123@yahoo.com'),(147258369,'Freetrees123@yahoo.com'),(258369147,'Freetrees123@yahoo.com'),(321987654,'Freetrees123@yahoo.com'),(456789123,'Freetrees123@yahoo.com'),(654321987,'Freetrees123@yahoo.com'),(789123456,'Freetrees123@yahoo.com'),(789456123,'Freetrees123@yahoo.com'),(963852741,'Freetrees123@yahoo.com'),(987654321,'1002');
/*!40000 ALTER TABLE `belongsto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `serial_num` double NOT NULL,
  `brand_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`serial_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1001,'Apple'),(1002,'Samsung'),(1003,'Fitbit'),(1004,'Sony'),(1005,'Canon'),(1006,'Microsoft'),(1007,'Garmin'),(1008,'Amazon'),(1009,'Bose'),(1010,'Google'),(456789,'Corsair'),(57483920,'FitBit'),(112778988,'Sony');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `shopping_serial_num` int NOT NULL AUTO_INCREMENT,
  `device_serial_num` int NOT NULL,
  PRIMARY KEY (`shopping_serial_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES (2001,123456789),(2002,987654321),(2003,456789123),(2004,789123456),(2005,654321987),(2006,321987654),(2007,789456123),(2008,147258369),(2009,963852741),(2010,258369147);
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creates`
--

DROP TABLE IF EXISTS `creates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creates` (
  `listing_serial_num` double NOT NULL,
  `creation_id` int NOT NULL,
  PRIMARY KEY (`listing_serial_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creates`
--

LOCK TABLES `creates` WRITE;
/*!40000 ALTER TABLE `creates` DISABLE KEYS */;
INSERT INTO `creates` VALUES (4001,5001),(4002,5002),(4003,5003),(4004,5004),(4005,5005),(4006,5006),(4007,5007),(4008,5008),(4009,5009),(4010,5010),(456789,1),(18881771,5012),(57483920,1),(91872661,5011),(112778988,1),(567567567,1),(999881111,5013),(345123456697,1);
/*!40000 ALTER TABLE `creates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `apt` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7017 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (7001,'John','Doe','123 Main Street',NULL,NULL,NULL,NULL,NULL,NULL),(7002,'Jane','Smith','456 Elm Avenue',NULL,NULL,NULL,NULL,NULL,NULL),(7003,'Michael','Johnson','789 Oak Drive',NULL,NULL,NULL,NULL,NULL,NULL),(7004,'Emily','Williams','321 Maple Lane',NULL,NULL,NULL,NULL,NULL,NULL),(7005,'David','Brown','987 Pine Road',NULL,NULL,NULL,NULL,NULL,NULL),(7006,'Sarah','Taylor','654 Cedar Street',NULL,NULL,NULL,NULL,NULL,NULL),(7007,'Christopher','Anderson','147 Birch Court',NULL,NULL,NULL,NULL,NULL,NULL),(7008,'Jessica','Thomas','963 Walnut Avenue',NULL,NULL,NULL,NULL,NULL,NULL),(7009,'Matthew','Robinson','258 Cherry Lane',NULL,NULL,NULL,NULL,NULL,NULL),(7010,'Olivia','Martinez','369 Spruce Avenue',NULL,NULL,NULL,NULL,NULL,NULL),(7011,'jiga','bobo','gkeg','055','fre','mo',233,23432,'Freetrees123@yahoo.com'),(7012,'baba','bobo','gkeg','055','fre','mo',233,23432,'Freetrees123@yahoo.com'),(7013,'baba','bobo','gkeg','055','fre','mo',233,23432,'Freetrees123@yahoo.com'),(7014,'Steve','Bui','999 Tree Road','apt 11','Sacramento','California',95111,408,'steven.bui@sjsu.edu'),(7015,'Barry','Allen','288 Berry road','Unit 11','Fresno','California',95111,4086662222,'TEST123@gmail.com'),(7016,'Steven','Bui','1300 DEMO road','apt 75','Fresno','California',95121,4085557777,'TESTDEMO@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `serial_num` double NOT NULL,
  `device_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`serial_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (456789,'Monitor'),(18881771,'Console'),(55588996,'Sony High Bass Speaker'),(57483920,'Smartwatch'),(89745497,'Laptop'),(91872661,'Keyboard'),(112778988,'Earbud'),(123412361,'Computer'),(123456789,'Smartphone'),(147258369,'Tablet'),(258369147,'Smart Speaker'),(258741963,'Speaker'),(321987654,'Gaming Console'),(412341234,'Consol'),(456789123,'Smartwatch'),(567567567,'Console'),(654321987,'Digital Camera'),(789123456,'Television'),(789456123,'Fitness Tracker'),(963852741,'Soundbar'),(987654321,'Laptop'),(999881111,'Console'),(12341256778,'Tablet'),(12347065071,'Laptop'),(123412341234,'Tablet'),(345123456697,'Phone');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `displays`
--

DROP TABLE IF EXISTS `displays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `displays` (
  `listing_id` int NOT NULL,
  `device_serial_num` double NOT NULL,
  PRIMARY KEY (`listing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `displays`
--

LOCK TABLES `displays` WRITE;
/*!40000 ALTER TABLE `displays` DISABLE KEYS */;
INSERT INTO `displays` VALUES (9,55588996),(16,88811177222),(17,999881111),(30,345123456697),(32,456789),(38,57483920),(39,112778988),(5001,123456789),(5002,987654321),(5003,456789123),(5004,789123456),(5005,654321987),(5006,321987654),(5007,789456123),(5008,147258369),(5009,963852741),(5010,258369147);
/*!40000 ALTER TABLE `displays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has` (
  `transaction_id` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
INSERT INTO `has` VALUES (6001,7001),(6002,7002),(6003,7003),(6004,7004),(6005,7005),(6006,7006),(6007,7007),(6008,7008),(6009,7009),(6010,7010);
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listings` (
  `listing_id` int NOT NULL AUTO_INCREMENT,
  `serial_num` varchar(255) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `device_type` varchar(45) NOT NULL,
  `list_description` varchar(250) NOT NULL,
  `model_name` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `device_cond` varchar(45) NOT NULL,
  `date_start` date NOT NULL,
  `date_return` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `status` int DEFAULT '0',
  PRIMARY KEY (`listing_id`),
  UNIQUE KEY `serial_num_UNIQUE` (`serial_num`),
  UNIQUE KEY `listing_id_UNIQUE` (`listing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
INSERT INTO `listings` VALUES (1,'56846854','Apple','Phone','Used iPhone X, slightly scratched','iPhone X',50,'Used','2023-07-16','2023-07-22','Freetrees123@yahoo.com',0),(4,'7987681745614','Apple','Smartwatch','Used Apple watch series 5','Apple Watch Series 5',55,'Used','2023-07-17','2023-07-29','Freetrees123@yahoo.com',0),(5,'49684298741','Samsung','Phone','Used Samsung S22 with case','Samsung S22',100,'Used','2023-07-16','2023-07-25','Freetrees123@yahoo.com',0),(7,'57186716184','Bose','Speaker','Bose Speaker used','Bose 2199',45,'Used','2023-07-16','2023-07-20','Trees@gmail.com',0),(9,'55588996','Sony','Speaker','Sony Speaker used','Sony High Bass Speaker',75,'Used','2023-07-16','2023-07-20','Penguin22@gmail.com',0),(10,'12348701235','Google','Phone','Google Pixel 6 Scratched screen','Google Pixel 6',99,'Used','2023-07-18','2023-07-20','Test99@gmail.com',0),(12,'0091872661','Logitech','Keyboard','Logitech G915 keyboard','Logitech G915',20,'Used','2023-07-16','2023-07-29','Tear123',0),(13,'5702347051','Nintendo','Console','Nintendo Switch OLED blue and red','Nintendo Switch OLED',45,'Used','2023-07-25','2023-08-10','TearCry123@gmail.com',0),(14,'3857017000','Nintendo','Console',' Nintendo Switch OLED white joy cons','Nintendo Switch OLED',45,'Used','2023-07-17','2023-07-27','TearCry123@gmail.com',0),(15,'18881771','Nintendo','Console',' Nintendo Switch LCD Yellow and Purple Joycons','Nintendo Switch LCD',78,'Used','2023-07-17','2023-07-27','PeterPC@gmail.com',0),(16,'88811177222','Microsoft','Console','Xbox 360 with 3 controllers','Xbox 360',100,'Used','2023-07-20','2023-07-27','PeterPC@gmail.com',0),(17,'999881111','Microsoft','Console','Xbox One with 2 controllers','Xbox One',100,'Used','2023-07-20','2023-07-28','Freetrees123@yahoo.com',0),(18,'80247501235','Beats','Headphones','Beats headphones pink color','Beats Studio Wireless 3',30,'Used','2023-07-16','2023-07-20','Freetrees123@yahoo.com',0),(19,'09876567890','Beats','Speaker','Beats Pill speaker red and black','Beats Pill ',10,'Used','2023-07-16','2023-07-20','Freetrees123@yahoo.com',0),(21,'88811112222','Beats','Speaker','Beats Pill speaker YELLOW','Beats Pill 3',25,'Used','2023-07-16','2023-07-21','Freetrees123@yahoo.com',0),(22,'66111222222','Beats','Speaker','Beats Pill speaker Black','Beats Pill 2',35,'Used','2023-07-16','2023-07-19','Freetrees123@yahoo.com',0),(23,'0258741963','Sony','Speaker','Sony speaker Pink','Sony Ultimate Bass 2',45,'Used','2023-07-16','2023-08-01','Freetrees123@yahoo.com',0),(24,'412341234','Nintendo','Console','Nintendo Wii','Nintendo Wii',25,'Used','2023-07-16','2023-08-01','Freetrees123@yahoo.com',0),(25,'567567567','Sony','Console','PS4 Slim With 2 games of your choice and 2 controllers','PS4 Slim',50,'Used','2023-07-16','2023-08-01','Freetrees123@yahoo.com',0),(28,'123412341234','Amazon','Tablet','Amazon Fire Tablet ready to use','Amazon Fire Tablet',20,'Used','2023-07-19','2023-08-01','Freetrees123@yahoo.com',0),(29,'12341256778','Amazon','Tablet','Amazon Fire Tablet ready to use','Amazon Fire Tablet',20,'Used','2023-07-19','2023-08-01','Freetrees123@yahoo.com',0),(30,'345123456697','Amazon','Phone','Amazon Fire Phone no SIM card included','Amazon Fire Phone',30,'Used','2023-07-19','2023-08-01','Freetrees123@yahoo.com',0),(31,'88888','Corsair','Monitor','45 inch Corsair Monitor OLED','Xeneon Flex',55,'Open Box','2023-07-23','2023-07-23','Freetrees123@yahoo.com',0),(32,'456789','Corsair','Monitor','45 inch Corsair Monitor Curved OLED Barley Used','Corsair Xenon Flex',70,'Open Box','2023-07-23','2023-07-30','Freetrees123@yahoo.com',0),(35,'123412361','N/A','Computer','Custom built PC for rent, i9 13000k, 4090','N/A',100,'Used','2023-08-03','2023-08-31','Freetree123@yahoo.com',0),(36,'12347065071','Apple','Laptop','Macbook Pro M2 Pro chip','Macbook Pro',50,'Open Box','2023-08-03','2023-08-15','Freetree123@yahoo.com',0),(37,'557896321457','Roland','Piano','Roland FPX 30 Piano','Roland FPX 30',75,'Used','2023-08-03','2023-08-31','Freetree123@yahoo.com',0),(38,'57483920','FitBit','Smartwatch','FitBit running band black color','FitBit+ 3',15,'Usede','2023-08-03','2023-08-15','Freetrees123@yahoo.com',0),(39,'112778988','Sony','Earbud','Sony Earbuds for rent. Gray color','Sony XQ112',5,'New','2023-08-05','2023-08-25','Freetrees123@yahoo.com',0);
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `device_serial_num` bigint NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`device_serial_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7023 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (7001,123456789,NULL),(7002,987654321,NULL),(7003,456789123,NULL),(7004,789123456,NULL),(7005,654321987,NULL),(7006,321987654,NULL),(7007,789456123,NULL),(7008,147258369,NULL),(7009,963852741,NULL),(7010,258369147,NULL),(7013,345123456697,'Freetrees123@yahoo.com'),(7014,345123456697,'Freetrees123@yahoo.com'),(7015,345123456697,'Freetrees123@yahoo.com'),(7016,345123456697,'Freetrees123@yahoo.com'),(7017,66111222222,'steven.bui@sjsu.edu'),(7018,66111222222,'steven.bui@sjsu.edu'),(7019,88811112222,'steven.bui@sjsu.edu'),(7020,88811112222,'steven.bui@sjsu.edu'),(7021,456789,'TEST123@gmail.com'),(7022,88888,'TESTDEMO@gmail.com');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owns`
--

DROP TABLE IF EXISTS `owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owns` (
  `renter_seller_id` int NOT NULL,
  `device_serial_num` int NOT NULL,
  PRIMARY KEY (`renter_seller_id`,`device_serial_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
INSERT INTO `owns` VALUES (3001,123456789),(3002,987654321),(3003,456789123),(3004,789123456),(3005,654321987),(3006,321987654),(3007,789456123),(3008,147258369),(3009,963852741),(3010,258369147);
/*!40000 ALTER TABLE `owns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renter`
--

DROP TABLE IF EXISTS `renter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renter` (
  `seller_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renter`
--

LOCK TABLES `renter` WRITE;
/*!40000 ALTER TABLE `renter` DISABLE KEYS */;
INSERT INTO `renter` VALUES (8001,'Adam','Smith','123 Elm Street'),(8002,'Eva','Johnson','456 Oak Avenue'),(8003,'Daniel','Williams','789 Maple Drive'),(8004,'Sophia','Brown','321 Pine Lane'),(8005,'Jacob','Taylor','987 Cedar Road'),(8006,'Olivia','Anderson','654 Birch Street'),(8007,'Matthew','Thomas','147 Walnut Court'),(8008,'Emily','Robinson','963 Cherry Avenue'),(8009,'David','Martinez','258 Spruce Lane'),(8010,'Emma','Garcia','369 Pine Avenue');
/*!40000 ALTER TABLE `renter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentsto`
--

DROP TABLE IF EXISTS `rentsto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentsto` (
  `renter_seller_id` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`renter_seller_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentsto`
--

LOCK TABLES `rentsto` WRITE;
/*!40000 ALTER TABLE `rentsto` DISABLE KEYS */;
INSERT INTO `rentsto` VALUES (8001,7001),(8002,7002),(8003,7003),(8004,7004),(8005,7005),(8006,7006),(8007,7007),(8008,7008),(8009,7009),(8010,7010);
/*!40000 ALTER TABLE `rentsto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `serial_num` int NOT NULL,
  PRIMARY KEY (`serial_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (88888),(456789),(56846854),(258741963),(412341234),(567567567);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `card_number` bigint DEFAULT NULL,
  `expire` varchar(45) DEFAULT NULL,
  `ccv` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6016 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (6001,7001,4242424242424242,'',NULL),(6002,7002,4111111111111111,NULL,NULL),(6003,7003,5555555555554444,NULL,NULL),(6004,7004,5105105105105100,NULL,NULL),(6005,7005,6011111111111117,NULL,NULL),(6006,7006,3530111333300000,NULL,NULL),(6007,7007,6011000990139424,NULL,NULL),(6008,7008,30569309025904,NULL,NULL),(6009,7009,378282246310005,NULL,NULL),(6010,7010,371449635398431,NULL,NULL),(6011,7011,3292,'322',22),(6012,7013,3292,'3223',22),(6013,7014,1111222233334444,'2028-07',678),(6014,7015,99991111111111111,'2025-06',461),(6015,7016,2222666688889999,'2026-12',654);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userregister`
--

DROP TABLE IF EXISTS `userregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userregister` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone` int NOT NULL,
  `address` varchar(45) NOT NULL,
  `apt` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userregister`
--

LOCK TABLES `userregister` WRITE;
/*!40000 ALTER TABLE `userregister` DISABLE KEYS */;
INSERT INTO `userregister` VALUES (1,'Tony','Lazarus',1247012515,'200 Fair st','Apt 27','San Jose','California',91231,'Freetrees123@yahoo.com','Free123','Tree123'),(2,'Tony','Trees',102389715,'255 Trees St','','Oakland','California',51923,'Trees@gmail.com','apsidhf12','Tree123'),(3,'Penguin','Ice',1230851245,'123 Igloo Drive','Apt 88','San Jose','California',95111,'Penguin22@gmail.com','Penguino','Tree5678'),(4,'Test','Tester',12451611,'222 Test Rd','','San Jose','California',95111,'Test99@gmail.com','Test123','Test123'),(5,'Tear','Cry',128017514,'882 Cry Rd','Apt 99','San Jose','California',95111,'TearCry123@gmail.com','Tear123','Tear123'),(6,'Peter','Computer',12315988,'890 Computer rd','apt 21','Oakland','California',91239,'PeterPC@gmail.com','Peter','Computer'),(7,'Steven','Bui',1119998888,'7741 Steven Rd','apt 110','San Jose','California',95111,'steventest@gmail.com','StevenBui','StevenBui');
/*!40000 ALTER TABLE `userregister` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-03 21:44:59
