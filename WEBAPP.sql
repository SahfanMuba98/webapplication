-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.5-m3 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5151
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for apiapima
CREATE DATABASE IF NOT EXISTS `apiapima` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `apiapima`;

-- Dumping structure for table apiapima.catogory
CREATE TABLE IF NOT EXISTS `catogory` (
  `idCatogory` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCatogory`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table apiapima.catogory: ~3 rows (approximately)
/*!40000 ALTER TABLE `catogory` DISABLE KEYS */;
INSERT INTO `catogory` (`idCatogory`, `description`) VALUES
	(1, 'Food Donation'),
	(2, 'Bood Donation'),
	(3, 'Water Donation');
/*!40000 ALTER TABLE `catogory` ENABLE KEYS */;

-- Dumping structure for table apiapima.expense
CREATE TABLE IF NOT EXISTS `expense` (
  `expenseid` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `expenseAmount` double DEFAULT NULL,
  `User_username` int(11) NOT NULL,
  `Catogory_idCatogory` int(11) NOT NULL,
  PRIMARY KEY (`expenseid`),
  KEY `fk_Expense_User1_idx` (`User_username`),
  KEY `fk_Expense_Catogory1_idx` (`Catogory_idCatogory`),
  CONSTRAINT `fk_Expense_Catogory1` FOREIGN KEY (`Catogory_idCatogory`) REFERENCES `catogory` (`idCatogory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Expense_User1` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table apiapima.expense: ~1 rows (approximately)
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;

-- Dumping structure for table apiapima.income
CREATE TABLE IF NOT EXISTS `income` (
  `incomeid` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `incomeAmount` double DEFAULT NULL,
  `User_username` int(11) NOT NULL,
  `Catogory_idCatogory` int(11) NOT NULL,
  PRIMARY KEY (`incomeid`),
  KEY `fk_Income_User_idx` (`User_username`),
  KEY `fk_Income_Catogory1_idx` (`Catogory_idCatogory`),
  CONSTRAINT `fk_Income_Catogory1` FOREIGN KEY (`Catogory_idCatogory`) REFERENCES `catogory` (`idCatogory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Income_User` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table apiapima.income: ~0 rows (approximately)
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
/*!40000 ALTER TABLE `income` ENABLE KEYS */;

-- Dumping structure for table apiapima.user
CREATE TABLE IF NOT EXISTS `user` (
  `username` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table apiapima.user: ~1 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
