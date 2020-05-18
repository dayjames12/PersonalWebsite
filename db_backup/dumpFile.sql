-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: dealership
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `carID` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(45) NOT NULL,
  `miles` int(11) NOT NULL,
  `carTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`carID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'1245874',10000,1),(2,'5262627',20000,1),(3,'1237512',30000,1),(5,'1256987',40000,2),(6,'4523698',50000,2),(7,'1252547',60000,2),(8,'8T79514',175000,2),(9,'1',1,1),(10,'1',1,1),(11,'1',1,4),(12,'8T79514',175000,1);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_features`
--

DROP TABLE IF EXISTS `car_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_features` (
  `carFeatureID` int(11) NOT NULL AUTO_INCREMENT,
  `carTypeID` int(11) NOT NULL,
  `cost` double NOT NULL,
  `featureName` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`carFeatureID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_features`
--

LOCK TABLES `car_features` WRITE;
/*!40000 ALTER TABLE `car_features` DISABLE KEYS */;
INSERT INTO `car_features` VALUES (1,1,250,'Sport Tire','Hancook'),(2,1,300,'All-Terrain Tire','Nitto'),(3,1,350,'Performance Tire','Michelin');
/*!40000 ALTER TABLE `car_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_type`
--

DROP TABLE IF EXISTS `car_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_type` (
  `carTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `make` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`carTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_type`
--

LOCK TABLES `car_type` WRITE;
/*!40000 ALTER TABLE `car_type` DISABLE KEYS */;
INSERT INTO `car_type` VALUES (1,2020,'ford','raptor','black');
/*!40000 ALTER TABLE `car_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` bigint(20) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Carrol Jones','243 Jacobsen Blvd',4265896251),(2,'Benjamin Bricks','12 Harbor Lane',2354851244),(3,'Kevin Arthur','8992 Indian Road',5202521245);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_preference`
--

DROP TABLE IF EXISTS `customer_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_preference` (
  `customerPreferenceID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `carFeatureID` int(11) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  PRIMARY KEY (`customerPreferenceID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_preference`
--

LOCK TABLES `customer_preference` WRITE;
/*!40000 ALTER TABLE `customer_preference` DISABLE KEYS */;
INSERT INTO `customer_preference` VALUES (1,1,1,1500),(2,1,2,1223),(3,2,2,10000);
/*!40000 ALTER TABLE `customer_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `hours` int(11) NOT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Ahmed Kachief','1978-09-01',48),(2,'Bob Austin','1992-06-21',23),(3,'Kristie Ross','1989-11-08',29),(4,'John Doe','1956-12-02',26),(5,'Beth Ryan','1965-05-23',23),(6,'Griffin Kabus','1985-05-29',51),(7,'Joe Ryan','1988-08-26',21),(8,'Heaven Zeen','1978-02-02',10),(9,'Macbeth Butch','1999-01-15',12),(10,'Lizzy McGuire','1981-11-11',15),(11,'Darrel Sheeth','1978-10-20',34),(12,'Ozart Birkens','1979-10-21',22);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaner_cars`
--

DROP TABLE IF EXISTS `loaner_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loaner_cars` (
  `loanerCarID` int(11) NOT NULL AUTO_INCREMENT,
  `carID` int(11) NOT NULL,
  PRIMARY KEY (`loanerCarID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaner_cars`
--

LOCK TABLES `loaner_cars` WRITE;
/*!40000 ALTER TABLE `loaner_cars` DISABLE KEYS */;
INSERT INTO `loaner_cars` VALUES (1,1),(2,3),(3,2);
/*!40000 ALTER TABLE `loaner_cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mechanic`
--

DROP TABLE IF EXISTS `mechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mechanic` (
  `mechanicID` int(11) NOT NULL AUTO_INCREMENT,
  `employeeID` int(11) NOT NULL,
  PRIMARY KEY (`mechanicID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mechanic`
--

LOCK TABLES `mechanic` WRITE;
/*!40000 ALTER TABLE `mechanic` DISABLE KEYS */;
INSERT INTO `mechanic` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `mechanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts` (
  `partID` int(11) NOT NULL AUTO_INCREMENT,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`partID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES (1,20),(2,60),(3,250);
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts_employee`
--

DROP TABLE IF EXISTS `parts_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts_employee` (
  `partEmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `employeeID` int(11) NOT NULL,
  PRIMARY KEY (`partEmployeeID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts_employee`
--

LOCK TABLES `parts_employee` WRITE;
/*!40000 ALTER TABLE `parts_employee` DISABLE KEYS */;
INSERT INTO `parts_employee` VALUES (1,4),(2,5),(3,6);
/*!40000 ALTER TABLE `parts_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts_used`
--

DROP TABLE IF EXISTS `parts_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts_used` (
  `partsUsedID` int(11) NOT NULL AUTO_INCREMENT,
  `repairID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  PRIMARY KEY (`partsUsedID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts_used`
--

LOCK TABLES `parts_used` WRITE;
/*!40000 ALTER TABLE `parts_used` DISABLE KEYS */;
INSERT INTO `parts_used` VALUES (1,1,12,12,12),(2,1,20,50,47),(3,2,1,124,1);
/*!40000 ALTER TABLE `parts_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rented_cars`
--

DROP TABLE IF EXISTS `rented_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rented_cars` (
  `serviceManagerID` int(11) NOT NULL AUTO_INCREMENT,
  `loanerCarID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`serviceManagerID`,`loanerCarID`,`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rented_cars`
--

LOCK TABLES `rented_cars` WRITE;
/*!40000 ALTER TABLE `rented_cars` DISABLE KEYS */;
INSERT INTO `rented_cars` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `rented_cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair` (
  `repairID` int(11) NOT NULL AUTO_INCREMENT,
  `carID` int(11) NOT NULL,
  `mechanicID` int(11) NOT NULL,
  `serviceManagerID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`repairID`),
  UNIQUE KEY `carID_UNIQUE` (`carID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair`
--

LOCK TABLES `repair` WRITE;
/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `repair` VALUES (1,1,1,1,1,'Tire Rotation',150),(2,2,2,2,2,'Oil Change',71),(3,3,3,3,3,'Scheduled Maintenance',130);
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `saleID` int(11) NOT NULL AUTO_INCREMENT,
  `salesEmployeeID` int(11) DEFAULT NULL,
  `partsEmployeeID` int(11) DEFAULT NULL,
  `customerID` int(11) NOT NULL,
  `carID` int(11) DEFAULT NULL,
  `tradeInID` int(11) DEFAULT NULL,
  `partID` int(11) DEFAULT NULL,
  PRIMARY KEY (`saleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,NULL,1,1,NULL,NULL),(2,2,NULL,2,2,1,NULL),(3,NULL,1,1,NULL,NULL,47);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_employee`
--

DROP TABLE IF EXISTS `sales_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_employee` (
  `salesEmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `employeeID` int(11) NOT NULL,
  PRIMARY KEY (`salesEmployeeID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_employee`
--

LOCK TABLES `sales_employee` WRITE;
/*!40000 ALTER TABLE `sales_employee` DISABLE KEYS */;
INSERT INTO `sales_employee` VALUES (1,7),(2,8),(3,9);
/*!40000 ALTER TABLE `sales_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_manager`
--

DROP TABLE IF EXISTS `service_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_manager` (
  `serviceManagerID` int(11) NOT NULL AUTO_INCREMENT,
  `employeeID` int(11) NOT NULL,
  PRIMARY KEY (`serviceManagerID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_manager`
--

LOCK TABLES `service_manager` WRITE;
/*!40000 ALTER TABLE `service_manager` DISABLE KEYS */;
INSERT INTO `service_manager` VALUES (1,10),(2,11),(3,12);
/*!40000 ALTER TABLE `service_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_in`
--

DROP TABLE IF EXISTS `trade_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_in` (
  `tradeInID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `carID` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`tradeInID`),
  UNIQUE KEY `customerID_UNIQUE` (`customerID`),
  UNIQUE KEY `carID_UNIQUE` (`carID`),
  CONSTRAINT `carID` FOREIGN KEY (`carID`) REFERENCES `car` (`carID`),
  CONSTRAINT `customerID` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_in`
--

LOCK TABLES `trade_in` WRITE;
/*!40000 ALTER TABLE `trade_in` DISABLE KEYS */;
INSERT INTO `trade_in` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `trade_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(2048) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test','$2a$10$nwGjp8W379cXtXo/bIQrQe7q3KMdV9d3G8tWlvzHkoCqh472mlv9W');
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

-- Dump completed on 2020-05-18  0:07:24
