-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: banking
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `marital_status` varchar(45) NOT NULL,
  `guardian_name` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  `permanent_address` varchar(100) NOT NULL,
  `current_address` varchar(100) NOT NULL,
  `aadhaar` varchar(20) NOT NULL,
  `pan` varchar(15) NOT NULL,
  `account_type` varchar(45) NOT NULL,
  `deposit` double NOT NULL,
  `nominee_name` varchar(80) DEFAULT NULL,
  `nominee_relation` varchar(50) DEFAULT NULL,
  `nominee_dob` date DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `security_question` varchar(50) DEFAULT NULL,
  `security_answer` varchar(100) DEFAULT NULL,
  `photoPath` varchar(200) NOT NULL,
  `signaturePath` varchar(200) NOT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (8,'Gauri Katode','2005-07-23','Female','Single','Manish Katode','Indian','8600344419','gaurikatode@gmail.com','At.Post Bharaswada Ta.Ashti Dist.Wardha','Sipna Hostel','81105097654','23456trsgt45','Current',50000,'Swanandi Kholapure','Sister','2005-10-16','gau','123','What is your pet\'s name?','kiko','C:\\Users\\padol\\OneDrive\\Documents\\NetBeansProjects\\Bank\\target\\Bank-1.0-SNAPSHOT\\\\uploads\\stanley.jpeg','C:\\Users\\padol\\OneDrive\\Documents\\NetBeansProjects\\Bank\\target\\Bank-1.0-SNAPSHOT\\\\uploads\\diary.jpeg','ACCT1759306545943'),(10,'Smita ','1990-10-10','Female','Single','Raju','Indian','9993334446','smita123@gmail.com','jd complex,nagpure','jd complex,nagpure','8866688992233','tr66779900','Salary',50000,'Rekha','sister','1992-02-10','sunio','123','What is your pet\'s name?','sunio','C:\\Users\\padol\\OneDrive\\Documents\\NetBeansProjects\\Bank\\target\\Bank-1.0-SNAPSHOT\\\\uploads\\diary.jpeg','C:\\Users\\padol\\OneDrive\\Documents\\NetBeansProjects\\Bank\\target\\Bank-1.0-SNAPSHOT\\\\uploads\\stanley.jpeg','ACCT1759307790741'),(11,'Laher Yadav','2005-04-28','Female','Single','Sagar  Yadav','Indian','9876543234','lyadav@gmail.com','Sai Nagar,Amaravti','Sai Nagar,Amaravti','24682177765','tr34556755','Savings',50346,'Swanandi Kholapure','Sister','2003-08-16','laheri','lyadav123','What was your first school?','sos','C:\\Users\\padol\\OneDrive\\Documents\\NetBeansProjects\\Bank\\target\\Bank-1.0-SNAPSHOT\\\\uploads\\stanley.jpeg','C:\\Users\\padol\\OneDrive\\Documents\\NetBeansProjects\\Bank\\target\\Bank-1.0-SNAPSHOT\\\\uploads\\IMG_0785.JPG','ACCT1759476356416'),(12,'test','1212-12-31','Male','Single','test','Indian','4477788833','abc123@gmail.com','ryujj,fszf`12w,cs.x','Sipna Hostel','8866688992233','tr66779900','Current',50000,'Rekha','sister','2006-03-12','kitu','4567','What is your pet\'s name?','kitu','C:\\Users\\padol\\OneDrive\\Documents\\NetBeansProjects\\Bank\\target\\Bank-1.0-SNAPSHOT\\\\uploads\\bag.jpeg','C:\\Users\\padol\\OneDrive\\Documents\\NetBeansProjects\\Bank\\target\\Bank-1.0-SNAPSHOT\\\\uploads\\stanley.jpeg','ACCT1759918336707'),(13,'Swanandi Kholapure','2005-10-16','Female','Single','Pankaj Kholapure','Indian','9373348192','qwwd122@gmail.com','Bajrang Chowk Budhwara Amravati','Bajrang Chowk Budhwara Amravati','129994564788','4werwq4w5','Current',1000,'Gauri katode ','Sister','2005-07-23','Swan ','Swan@1234','What is your pet\'s name?','sunio','C:\\Users\\padol\\OneDrive\\Documents\\NetBeansProjects\\Bank\\target\\Bank-1.0-SNAPSHOT\\\\uploads\\stanley.jpeg','C:\\Users\\padol\\OneDrive\\Documents\\NetBeansProjects\\Bank\\target\\Bank-1.0-SNAPSHOT\\\\uploads\\diary.jpeg','ACCT1759918970990');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current`
--

DROP TABLE IF EXISTS `current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `current` (
  `userID` int NOT NULL DEFAULT '0',
  `fullName` varchar(60) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `account_type` enum('Current','Savings','Fixed Deposit') NOT NULL,
  `deposit` decimal(12,2) NOT NULL,
  `loan_eligible` varchar(10) DEFAULT 'No',
  KEY `idx_account_number` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current`
--

LOCK TABLES `current` WRITE;
/*!40000 ALTER TABLE `current` DISABLE KEYS */;
INSERT INTO `current` VALUES (9,'Swanandi','ACCT1759306545943','Current',50000.00,'No');
/*!40000 ALTER TABLE `current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `salary_id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `salary_amount` decimal(12,2) NOT NULL,
  `next_payday` date DEFAULT NULL,
  `last_payday` date DEFAULT NULL,
  `status` enum('Pending','Paid','Processing') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`salary_id`),
  UNIQUE KEY `userID` (`userID`,`next_payday`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,10,'ACCT1759307790741',50000.00,NULL,NULL,'Pending','2025-10-01 08:36:30','2025-10-01 08:36:30');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saving`
--

DROP TABLE IF EXISTS `saving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saving` (
  `userID` int NOT NULL DEFAULT '0',
  `fullName` varchar(60) NOT NULL,
  `deposit` decimal(12,2) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `last_withdrawal_date` date DEFAULT NULL,
  KEY `idx_last_withdrawal_date` (`last_withdrawal_date`),
  KEY `idx_account_number` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saving`
--

LOCK TABLES `saving` WRITE;
/*!40000 ALTER TABLE `saving` DISABLE KEYS */;
INSERT INTO `saving` VALUES (9,'Gauri Katode',50000.00,'ACCT1759306998245',NULL);
/*!40000 ALTER TABLE `saving` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-18 19:38:23
