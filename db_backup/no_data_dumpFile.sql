-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: dealership
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `carID` int NOT NULL AUTO_INCREMENT,
  `license` varchar(45) NOT NULL,
  `miles` int NOT NULL,
  `carTypeID` int DEFAULT NULL,
  PRIMARY KEY (`carID`),
  UNIQUE KEY `license_UNIQUE` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `car_features`
--

DROP TABLE IF EXISTS `car_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_features` (
  `carFeatureID` int NOT NULL AUTO_INCREMENT,
  `carTypeID` int NOT NULL,
  `cost` double NOT NULL,
  `featureName` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`carFeatureID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `car_type`
--

DROP TABLE IF EXISTS `car_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_type` (
  `carTypeID` int NOT NULL AUTO_INCREMENT,
  `year` int DEFAULT NULL,
  `make` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`carTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_preference`
--

DROP TABLE IF EXISTS `customer_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_preference` (
  `customerPreferenceID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `carFeatureID` int DEFAULT NULL,
  `budget` double DEFAULT NULL,
  PRIMARY KEY (`customerPreferenceID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `hours` int NOT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loaner_cars`
--

DROP TABLE IF EXISTS `loaner_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaner_cars` (
  `loanerCarID` int NOT NULL AUTO_INCREMENT,
  `carID` int NOT NULL,
  PRIMARY KEY (`loanerCarID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mechanic`
--

DROP TABLE IF EXISTS `mechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mechanic` (
  `mechanicID` int NOT NULL AUTO_INCREMENT,
  `employeeID` int NOT NULL,
  PRIMARY KEY (`mechanicID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts` (
  `partID` int NOT NULL AUTO_INCREMENT,
  `cost` int NOT NULL,
  PRIMARY KEY (`partID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parts_employee`
--

DROP TABLE IF EXISTS `parts_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts_employee` (
  `partEmployeeID` int NOT NULL AUTO_INCREMENT,
  `employeeID` int NOT NULL,
  PRIMARY KEY (`partEmployeeID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parts_used`
--

DROP TABLE IF EXISTS `parts_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts_used` (
  `partsUsedID` int NOT NULL AUTO_INCREMENT,
  `repairID` int NOT NULL,
  `quantity` int NOT NULL,
  `cost` int NOT NULL,
  `partID` int NOT NULL,
  PRIMARY KEY (`partsUsedID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rented_cars`
--

DROP TABLE IF EXISTS `rented_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rented_cars` (
  `serviceManagerID` int NOT NULL AUTO_INCREMENT,
  `loanerCarID` int NOT NULL,
  `customerID` int NOT NULL,
  PRIMARY KEY (`serviceManagerID`,`loanerCarID`,`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair` (
  `repairID` int NOT NULL AUTO_INCREMENT,
  `carID` int NOT NULL,
  `mechanicID` int NOT NULL,
  `serviceManagerID` int NOT NULL,
  `customerID` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`repairID`),
  UNIQUE KEY `carID_UNIQUE` (`carID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `saleID` int NOT NULL AUTO_INCREMENT,
  `salesEmployeeID` int DEFAULT NULL,
  `partsEmployeeID` int DEFAULT NULL,
  `customerID` int NOT NULL,
  `carID` int DEFAULT NULL,
  `tradeInID` int DEFAULT NULL,
  `partID` int DEFAULT NULL,
  PRIMARY KEY (`saleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_employee`
--

DROP TABLE IF EXISTS `sales_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_employee` (
  `salesEmployeeID` int NOT NULL AUTO_INCREMENT,
  `employeeID` int NOT NULL,
  PRIMARY KEY (`salesEmployeeID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_manager`
--

DROP TABLE IF EXISTS `service_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_manager` (
  `serviceManagerID` int NOT NULL AUTO_INCREMENT,
  `employeeID` int NOT NULL,
  PRIMARY KEY (`serviceManagerID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade_in`
--

DROP TABLE IF EXISTS `trade_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade_in` (
  `tradeInID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `carID` int NOT NULL,
  `value` int DEFAULT NULL,
  PRIMARY KEY (`tradeInID`),
  UNIQUE KEY `customerID_UNIQUE` (`customerID`),
  UNIQUE KEY `carID_UNIQUE` (`carID`),
  CONSTRAINT `carID` FOREIGN KEY (`carID`) REFERENCES `car` (`carID`),
  CONSTRAINT `customerID` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(2048) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-19  1:23:52
