-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	8.0.36

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
  `Username` varchar(45) NOT NULL,
  `Pass` varchar(100) NOT NULL,
  `E_ID` int NOT NULL,
  PRIMARY KEY (`Username`,`E_ID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  KEY `fk_employee_id_account` (`E_ID`),
  CONSTRAINT `fk_employee_id_account` FOREIGN KEY (`E_ID`) REFERENCES `employees` (`E_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('Abdullah','am12345678',1002),('Abdulrahman','DH99!@#123',1001),('Ahmed','123456aa',1003),('Ali','qwerty123',1004),('AliHassan12','AliHassan12',1009),('Baqer','abc123123',1005),('Hassan','Hassan123456',1000),('HMohsen123','Password123',1006),('mod12345','mod12345',1014),('zayer12345','zayer12345',1007);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `C_PhoneNo` varchar(10) NOT NULL,
  `C_Fname` varchar(45) NOT NULL,
  `C_Lname` varchar(45) NOT NULL,
  `Total_Point` float DEFAULT '0',
  `Gender` char(1) NOT NULL,
  PRIMARY KEY (`C_PhoneNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('0501232318','Ahmed','Yousef',138,'M'),('0502144737','Abdulrhman','Mohsen',437,'M'),('0512345678','Mohammed','Ahmed',2151,'M'),('0545678901','Noor','Mohammed',180,'F'),('0546420000','Ali','Hassan',1392.6,'M'),('0546885516','Abdullah','Mohammed',120,'M'),('0555926390','Mohammed','Hamad',200,'M'),('0556789012','Yasmine','Khalid',170,'F'),('0567890123','Omar','Saeed',220,'M'),('0578901234','Layla','Hassan',190,'F'),('0589012345','Rida','Nasser',210,'M'),('0590123456','Sara','Amin',230,'F');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `E_ID` int NOT NULL AUTO_INCREMENT,
  `Roled` varchar(40) NOT NULL,
  `E_Salary` int NOT NULL,
  `E_Fname` varchar(40) NOT NULL,
  `E_Lname` varchar(40) NOT NULL,
  PRIMARY KEY (`E_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1000,'Manager',12000,'Hassan ','Al-Zourei'),(1001,'Cashier',7000,'Abdulrahman ','Al-Mejna'),(1002,'Cashier',7500,'Abdullah ','Al-Battat'),(1003,'Cashier',7250,' Ahmed  ','Al-Shaikh'),(1004,'Cashier',6500,' Ali   ','Al-Khars'),(1005,'Cashier',6900,' Baqer  ','Al-Haddad'),(1006,'Cashier',2500,'Hassan','Mohsen'),(1007,'Cashier',7500,'Hassan','zayer'),(1008,'Cashier',5000,'Ali','Hassan'),(1009,'Cashier',5000,'Ali','mohammed'),(1010,'Cashier',5555,'aj','def'),(1012,'Cashier',85000,'Hassan','zoury'),(1013,'Cashier',85000,'Ali','zoury'),(1014,'Cashier',1555,'mod','mod');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `Order_ID` int NOT NULL,
  `Timed` time NOT NULL,
  `Order_Date` date NOT NULL,
  `E_Id` int DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `C_PhoneNo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `fk_employee_id` (`E_Id`),
  KEY `fk_cPhone_no` (`C_PhoneNo`),
  CONSTRAINT `fk_cPhone_no` FOREIGN KEY (`C_PhoneNo`) REFERENCES `customer` (`C_PhoneNo`),
  CONSTRAINT `fk_employee_id` FOREIGN KEY (`E_Id`) REFERENCES `employees` (`E_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'17:30:30','2024-05-11',1005,13.80,12.00,1.80,NULL),(2,'17:36:01','2024-05-11',1005,29.90,26.00,3.90,'0502144737'),(3,'17:36:27','2024-05-11',1005,27.60,24.00,3.60,NULL),(4,'17:40:20','2024-05-11',1004,200.10,174.00,26.10,'0512345678'),(5,'23:42:20','2024-05-11',1004,211.60,184.00,27.60,'0546420000'),(6,'23:44:10','2024-05-11',1004,221.38,192.50,28.88,'0546420000'),(7,'23:51:13','2024-05-11',1009,75.90,66.00,9.90,NULL),(8,'00:07:10','2024-05-12',1009,346.15,301.00,45.15,'0546420000'),(9,'00:07:33','2024-05-12',1009,62.10,54.00,8.10,'0546420000'),(10,'00:14:35','2024-05-12',1009,200.10,174.00,26.10,'0546420000'),(11,'11:13:36','2024-05-12',1007,82.80,72.00,10.80,NULL),(12,'11:19:18','2024-05-12',1007,80.50,70.00,10.50,NULL);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `Item_Id` int NOT NULL AUTO_INCREMENT,
  `Name_Of_Food` varchar(40) NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Item_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Chicken Noodles',25),(2,'Chicken Burger',18),(3,'Vegetarian Pizza',15),(4,'Chocolate Cake',50),(5,'Fruit Cake',60),(6,'Strawberry Cake',55),(7,'Rainbow',35),(8,'Chocolate Coffee',18),(9,'Cappuccino Coffee',17),(10,'Cold Coffee',13),(11,'Green Tea',6),(12,'Orange Juice',8),(13,'Coke',4),(14,'7up',2),(15,'Water',0.5);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_items`
--

DROP TABLE IF EXISTS `ordered_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_items` (
  `Invoice_ID` int NOT NULL,
  `Item_Id` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Invoice_ID`,`Item_Id`),
  KEY `Item_Id` (`Item_Id`),
  CONSTRAINT `ordered_items_ibfk_1` FOREIGN KEY (`Invoice_ID`) REFERENCES `invoice` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordered_items_ibfk_2` FOREIGN KEY (`Item_Id`) REFERENCES `menu` (`Item_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_items`
--

LOCK TABLES `ordered_items` WRITE;
/*!40000 ALTER TABLE `ordered_items` DISABLE KEYS */;
INSERT INTO `ordered_items` VALUES (1,14,3),(2,10,2),(3,12,3),(5,1,1),(6,1,3),(7,2,2),(8,2,2),(9,2,3),(10,1,2),(11,2,2),(12,8,3);
/*!40000 ALTER TABLE `ordered_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_report`
--

DROP TABLE IF EXISTS `sales_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_report` (
  `Sales_Id` int NOT NULL,
  `MO_Item` varchar(40) NOT NULL,
  `LO_Item` varchar(40) NOT NULL,
  `Total_Orders` int NOT NULL,
  `Report_Date` date NOT NULL,
  `E_Id` int DEFAULT NULL,
  PRIMARY KEY (`Sales_Id`),
  KEY `fk_employee_id_sales` (`E_Id`),
  CONSTRAINT `fk_employee_id_sales` FOREIGN KEY (`E_Id`) REFERENCES `employees` (`E_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_report`
--

LOCK TABLES `sales_report` WRITE;
/*!40000 ALTER TABLE `sales_report` DISABLE KEYS */;
INSERT INTO `sales_report` VALUES (609874619,'Chicken Burger','Green Tea',95,'2024-03-13',1000),(609875293,'Chocolate Cake','Chicken Noodles',95,'2024-04-01',1000),(609875778,'Chicken Burger','Green Tea',109,'2024-03-07',1000),(609876168,'Chicken Burger','Green Tea',104,'2024-04-01',1000),(609876302,'Chicken Burger','Green Tea',97,'2024-03-22',1000),(609876386,'Chicken Burger','Rainbow',91,'2024-04-01',1000),(609877557,'Chicken Burger','Green Tea',63,'2024-04-02',1000),(609878179,'Chocolate Cake','Chicken Noodles',114,'2024-03-25',1000),(609878283,'Chocolate Cake','Green Tea',86,'2024-04-01',1000),(609878571,'Chicken Burger','Rainbow',106,'2024-04-02',1000),(609878572,'Chicken Noodles','7up',3,'2024-05-11',1000),(609878573,'Chicken Noodles','7up',4,'2024-05-11',1000),(609878574,'Vegetarian Pizza','7up',7,'2024-05-12',1000),(609878575,'Vegetarian Pizza','Chicken Burger',3,'2024-05-12',1000);
/*!40000 ALTER TABLE `sales_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-15 19:34:05



-- SQL Query Statements:



 -- Insert:  
insert into Menu values
(16,'Pasta',32);
select * from Menu;




-- Delete:
delete from menu
where item_id = 16;
select * from Menu;





-- Update:
update menu
set Price =50
where Item_Id = 6;
select * from Menu;






-- like:
select Name_Of_Food as FoodWithAAtEnd
from Menu
where Name_Of_Food like '%a';






-- Not Like:
select Name_Of_Food as AllWithoutQ
from Menu
where Name_Of_Food not like '%q%';






-- Between:
select Price as high_cost
from Menu
where Price Between 40 and 100;
 
 
 
 
 
 
 
-- IN:
select* 
from customer 
where  Total_Point in (100,200,300,400,500);






-- Order By:
select Menu.Name_Of_Food , Menu.price as LowToHigh
from Menu
order by Price asc ;










-- Is Null:
select C_PhoneNo,C_Fname, C_Lname
from customer
where C_Fname is null;








-- INTERSECT:
-- NOTE// In MySQL, the INTERSECT keyword is not directly supported. Instead,
-- This query will give you the combination of two food items that have the highest total sales across different sales records.

-- Here's how you can rewrite the query:
SELECT 
    CONCAT(SR1.MO_Item, ' - ', SR2.LO_Item) AS Best_State,
    SUM(SR1.Total_Orders + SR2.Total_Orders) AS Total_Sales
FROM 
    Sales_Report AS SR1
JOIN 
    Sales_Report AS SR2 ON SR1.MO_Item <> SR2.MO_Item AND SR1.LO_Item <> SR2.LO_Item
GROUP BY 
    Best_State
ORDER BY 
    Total_Sales DESC
LIMIT 3;








-- NOTE// In MySQL, the except  keyword is not directly supported. Instead,
-- This query will give you the combination of two food items that have the highest total sales across different sales records,
-- considering only unique combinations of food items

-- Here's how you can rewrite the query:
SELECT 
    CONCAT(SR1.MO_Item, ' - ', SR1.LO_Item) AS Best_State,
    SUM(SR1.Total_Orders) AS Total_Sales
FROM 
    Sales_Report AS SR1
LEFT JOIN 
    Sales_Report AS SR2 ON SR1.MO_Item = SR2.MO_Item AND SR1.LO_Item = SR2.LO_Item AND SR1.Sales_Id != SR2.Sales_Id
WHERE 
    SR2.Sales_Id IS NULL
GROUP BY 
    Best_State
ORDER BY 
    Total_Sales DESC
LIMIT 1;


 
 
 
 
-- Union:
select C_PhoneNo ,Total_Point
from customer
union
select E_ID, Roled
from  employees   ;








-- Aggregate Functions:
SELECT MAX(price)
FROM Menu;

SELECT min(price)
FROM Menu;

select sum(Price)
from Menu;

select count(C_PhoneNo)
from customer;

select avg(e_salary)
from employees;







-- Aggregate Functions + Group By + Having:
select c_Lname, c_Fname
from customer
group by c_Lname, c_Fname
having avg(Total_Point) < 200
order by c_Lname ;








-- NATURAL JOIN:
SELECT *
FROM employees
NATURAL JOIN invoice ;








-- FULL OUTER JOIN :
-- NOTE// MySQL does not support FULL OUTER JOIN directly .
--        However, you can simulate a full outer join using a combination of 
--        LEFT OUTER JOIN, RIGHT OUTER JOIN, and UNION. Here's how you can achieve a full outer join in MySQL:
SELECT *
FROM invoice
LEFT OUTER JOIN customer ON invoice.C_PhoneNo = customer.C_PhoneNo
UNION
SELECT *
FROM invoice
RIGHT OUTER JOIN customer ON invoice.C_PhoneNo = customer.C_PhoneNo
WHERE invoice.C_PhoneNo IS NULL;






-- Exists :
select * from  invoice
where exists 
(select* from employees  where invoice.E_Id =  employees.E_ID );







-- Nested Query:
select E_ID,E_Salary,E_Fname,E_Lname
from employees
where E_Salary < (select avg(E_Salary) from employees);






-- Trigger :

delimiter //
CREATE TRIGGER changepoint
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    IF NEW.Total_Point BETWEEN 100 AND 120 THEN
        SET NEW.Total_Point = NEW.Total_Point + 20;
    END IF;
END//

delimiter ;





-- View :

create view item_list as
select Name_Of_Food , price 
from Menu ;
SELECT * FROM FinalProjectDatabase.item_list;








-- CREATE PROCEDURE :

DELIMITER //
CREATE PROCEDURE GetEmployeeOrders()
BEGIN
    SELECT e.E_ID, e.E_Fname, e.E_Lname, i.Order_ID, i.Order_Date
    FROM Employees e
    INNER JOIN Invoice i ON e.E_ID = i.E_Id;
END;
//
DELIMITER ;

CALL GetEmployeeOrders();






-- CREATE FUNCTION :
DELIMITER //

CREATE FUNCTION salary_bonus(salary float ,total_orders INT)
RETURNS FLOAT deterministic
BEGIN
    DECLARE total FLOAT;
    
    IF total_orders > 99 THEN
        SET total =salary * 0.05; 
    ELSE
        SET total = 0;    
    END IF;
    
    RETURN total   ;
END;
//
DELIMITER ;

SELECT salary_bonus(1000, 100); 

-- END Of SQL Query Statements: