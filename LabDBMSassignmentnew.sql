CREATE DATABASE IF NOT EXISTS `order-directory`;
USE `order-directory`;

CREATE TABLE supplier (
	SUPP_ID 	INT PRIMARY KEY AUTO_INCREMENT,
	SUPP_NAME 	VARCHAR(50) NOT NULL,
	SUPP_CITY 	VARCHAR(50) NOT NULL,
	SUPP_PHONE 	VARCHAR(50) NOT NULL);

CREATE TABLE customer (
	CUS_ID 		INT PRIMARY KEY AUTO_INCREMENT,
	CUS_NAME 	VARCHAR(20) NOT NULL,
	CUS_PHONE 	VARCHAR(10) NOT NULL,
	CUS_CITY 	VARCHAR(30) NOT NULL,
	CUS_GENDER 	CHAR );


CREATE TABLE category (
	CAT_ID 		INT PRIMARY KEY AUTO_INCREMENT,
	CAT_NAME 	VARCHAR(20) NOT NULL);

CREATE TABLE product (
	PRO_ID 		INT PRIMARY KEY AUTO_INCREMENT,
	PRO_NAME 	VARCHAR(20) NOT NULL DEFAULT "Dummy",
	PRO_DESC 	VARCHAR(60),
	CAT_ID 		INT NOT NULL,
	FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID));


CREATE TABLE supplier_pricing (
	PRICING_ID 	INT PRIMARY KEY AUTO_INCREMENT,
	PRO_ID 		INT NOT NULL,
	SUPP_ID 	INT NOT NULL,
	SUPP_PRICE 	INT NOT NULL DEFAULT 0,
	FOREIGN KEY (SUPP_ID) 	REFERENCES supplier(SUPP_ID),
	FOREIGN KEY (PRO_ID) 	REFERENCES product (PRO_ID));


CREATE TABLE `order` (
	ORD_ID 		INT PRIMARY KEY AUTO_INCREMENT,
	ORD_AMOUNT 	INT NOT NULL,
	ORD_DATE 	DATE NOT NULL,
	CUS_ID 		INT NOT NULL,
	PRICING_ID 	INT NOT NULL,
	FOREIGN KEY (CUS_ID) 		REFERENCES customer (CUS_ID),
	FOREIGN KEY (PRICING_ID) 	REFERENCES supplier_pricing (PRICING_ID) ) ;


CREATE TABLE rating (
	RAT_ID 			INT PRIMARY KEY AUTO_INCREMENT,
	ORD_ID 			INT NOT NULL,
	RAT_RATSTARS 		INT NOT NULL,
	FOREIGN KEY (ORD_ID) REFERENCES `order` (ORD_ID));

-- --DATA INSERT ------------
INSERT INTO supplier VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO supplier VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO category VALUES( 1,"BOOKS");
INSERT INTO category VALUES(2,"GAMES");
INSERT INTO category VALUES(3,"GROCERIES");
INSERT INTO category VALUES (4,"ELECTRONICS");
INSERT INTO category VALUES(5,"CLOTHES");


INSERT INTO product VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO product VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO product VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO supplier_pricing VALUES(1,1,2,1500);
INSERT INTO supplier_pricing VALUES(2,3,5,30000);
INSERT INTO supplier_pricing VALUES(3,5,1,3000);
INSERT INTO supplier_pricing VALUES(4,2,3,2500);
INSERT INTO supplier_pricing VALUES(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);

INSERT INTO `order` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `order` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `order` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `order` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `order` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `order` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `order` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `order` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `order` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `order` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `order` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `order` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `order` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `order` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `order` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `order` VALUES(116,99,"2021-09-17",2,14);

INSERT INTO rating VALUES(1,101,4);
INSERT INTO rating VALUES(2,102,3);
INSERT INTO rating VALUES(3,103,1);
INSERT INTO rating VALUES(4,104,2);
INSERT INTO rating VALUES(5,105,4);
INSERT INTO rating VALUES(6,106,3);
INSERT INTO rating VALUES(7,107,4);
INSERT INTO rating VALUES(8,108,4);
INSERT INTO rating VALUES(9,109,3);
INSERT INTO rating VALUES(10,110,5);
INSERT INTO rating VALUES(11,111,3);
INSERT INTO rating VALUES(12,112,4);
INSERT INTO rating VALUES(13,113,2);
INSERT INTO rating VALUES(14,114,1);
INSERT INTO rating VALUES(15,115,1);
INSERT INTO rating VALUES(16,116,0);

SELECT CUS_GENDER, COUNT(CUS_GENDER) FROM CUSTOMER 
	WHERE CUS_ID IN (
		SELECT CUS_ID FROM `ORDER`  GROUP BY CUS_ID HAVING SUM(ORD_AMOUNT) >= 3000 )
	GROUP BY CUS_GENDER
	ORDER BY CUS_GENDER;


-- ************** QUESTION 4 ***********************--
-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2

 -- SELECT * FROM `ORDER` HAVING CUS_ID = 2;
 
 
 -- **************SOLUTION***********************--

SELECT ORD_ID, ORD_AMOUNT, ORD_DATE, O.CUS_ID, O.PRICING_ID, PRO_NAME
	FROM 	`ORDER` O, SUPPLIER_PRICING SP, PRODUCT P
	WHERE 	O.PRICING_ID = SP.PRICING_ID
	AND 	SP.PRO_ID = P.PRO_ID
	AND 	O.CUS_ID = 2; 



-- ************** QUESTION 5 ***********************--

-- 5) Display the Supplier details who can supply more than one product

-- SELECT SUPP_ID FROM SUPPLIER_PRICING GROUP BY SUPP_ID HAVING COUNT( SUPP_ID > 1);

-- **************SOLUTION***********************--

SELECT * FROM SUPPLIER 
	WHERE SUPP_ID IN 
		( SELECT SUPP_ID FROM SUPPLIER_PRICING 
			GROUP BY SUPP_ID 
            HAVING COUNT( SUPP_ID > 1)
		);


-- ************** QUESTION 6 ***********************--
-- Find the least expensive product from each category and print the table with category id, name, product name and price of the product
-- **************SOLUTION***********************--
SELECT @@SESSION.SQL_MODE INTO @SESSION_SQL_MODE;
SET SESSION SQL_MODE ='';

SELECT C.CAT_ID, CAT_NAME, PRO_NAME, MIN_PRICE FROM
	( SELECT CAT_ID, P.PRO_ID, MIN(SUPP_PRICE) MIN_PRICE FROM SUPPLIER_PRICING SP, PRODUCT P 
		WHERE SP.PRO_ID = P.PRO_ID GROUP BY P.CAT_ID) AS CAT_MIN_PRICE , CATEGORY C, PRODUCT P
		WHERE C.CAT_ID = P.CAT_ID
		  AND P.PRO_ID = CAT_MIN_PRICE.PRO_ID;

SET SESSION SQL_MODE=@SESSION_SQL_MODE;

-- ************** QUESTION 7 ***********************--
-- 7) Display the Id and Name of the Product ordered after “2021-10-05”
-- **************SOLUTION***********************--


SELECT P.PRO_ID, PRO_NAME FROM PRODUCT P, SUPPLIER_PRICING SP, `ORDER` O 
	WHERE P.PRO_ID = SP.PRO_ID
      AND SP.PRICING_ID = O.PRICING_ID
      AND O.ORD_DATE > '2021-10-05'; 

-- ************** QUESTION 8 ***********************--
-- 8) Display customer name and gender whose names start or end with character 'A'.
-- **************SOLUTION***********************--


SELECT CUS_NAME, CUS_GENDER FROM CUSTOMER 
	WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A' ;


-- ************** QUESTION 8 ***********************--
-- 9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent
-- Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor ServicE
-- **************SOLUTION***********************--


DELIMITER &&
CREATE PROCEDURE display_supplier_ratings()
BEGIN

SELECT S.SUPP_ID, S.SUPP_NAME, AVG(RAT_RATSTARS),
	CASE WHEN AVG(RAT_RATSTARS) = 5 THEN 'Excellent Service'
		 WHEN AVG(RAT_RATSTARS) > 4 THEN 'Good Service'
         WHEN AVG(RAT_RATSTARS) > 2 THEN 'Average Service'
         ELSE 'Poor Service'
	END AS TYPE_OF_SERVICE
    FROM SUPPLIER S, `ORDER` O, SUPPLIER_PRICING SP, RATING R
    WHERE S.SUPP_ID = SP.SUPP_ID
	  AND SP.PRICING_ID = O.PRICING_ID
      AND O.ORD_ID = R.ORD_ID
 GROUP BY S.SUPP_ID ORDER BY S.SUPP_ID;
 
 END &&
 DELIMITER ;