show databases;

use customer_db;



 DELIMITER $$ 
CREATE PROCEDURE show_message() 
BEGIN 
SELECT 'Welcome to MySQL Stored Procedures'; 
END $$ 
DELIMITER ;

CALL show_message(); 



DELIMITER // 
CREATE PROCEDURE GetCustomerInfo(IN CustomerAge INT) 
BEGIN 
SELECT * FROM CUSTOMERS WHERE AGE = CustomerAge; 
END // 
DELIMITER ;

CALL GetCustomerInfo(25); 
CALL GetCustomerInfo(32); 
CALL GetCustomerInfo(27); 
CALL GetCustomerInfo(20); 



DELIMITER // 
CREATE PROCEDURE GetCustomerSalary(IN CustomerID Int) 
BEGIN 
SELECT SALARY FROM CUSTOMERS WHERE ID = CustomerID; 
END // 
DELIMITER ; 

CALL GetCustomerSalary(6);



CALL GetCustomerSalary(1);
CALL GetCustomerSalary(2);
CALL GetCustomerSalary(3);


DELIMITER //
CREATE PROCEDURE GetNameAge(IN cust_id INT)
BEGIN
    SELECT NAME, AGE 
    FROM CUSTOMERS 
    WHERE ID = cust_id;
END //
DELIMITER ;

call GetNameAge(1);


DELIMITER //
CREATE PROCEDURE GetAddress(IN cust_name VARCHAR(50))
BEGIN
    SELECT ADDRESS 
    FROM CUSTOMERS 
    WHERE NAME = cust_name;
END //
DELIMITER ;

call GetAddress('Manuja');


DELIMITER //
CREATE PROCEDURE GetNamesByAge(IN cust_age INT)
BEGIN
    SELECT NAME 
    FROM CUSTOMERS 
    WHERE AGE = cust_age;
END //
DELIMITER ;

call GetNamesByAge(25);


DELIMITER //
CREATE PROCEDURE GetAgeSalary(IN cust_name VARCHAR(50))
BEGIN
    SELECT AGE, SALARY 
    FROM CUSTOMERS 
    WHERE NAME = cust_name;
END //
DELIMITER ;

call GetAgeSalary('Kamal');


DELIMITER //
CREATE PROCEDURE GetCustomersByAgeRange(IN min_age INT, IN max_age INT)
BEGIN
    SELECT * 
    FROM CUSTOMERS 
    WHERE AGE BETWEEN min_age AND max_age;
END //
DELIMITER 

call GetCustomersByAgeRange(25,30);



DELIMITER // 
CREATE PROCEDURE GetDetail(OUT total INT) 
BEGIN 
SELECT COUNT(AGE) INTO total FROM CUSTOMERS 
WHERE AGE = 25; 
END // 
DELIMITER ; 

CALL GetDetail(@total);

SELECT @total; 

SHOW CREATE PROCEDURE GetDetails;



DELIMITER //
CREATE PROCEDURE GetMinSalary(OUT min_sal INT)
BEGIN
    SELECT MIN(SALARY) INTO min_sal FROM CUSTOMERS;
END //
DELIMITER ;

call GetMinSalary(@min);
SELECT @min; 



DELIMITER //
CREATE PROCEDURE GetMaxSalary(OUT max_sal INT)
BEGIN
    SELECT MAX(SALARY) INTO max_sal FROM CUSTOMERS;
END //
DELIMITER ;

call GetMaxSalary(@max);
SELECT @max; 



DELIMITER //
CREATE PROCEDURE GetNameByID(IN cust_id INT, OUT cust_name VARCHAR(50))
BEGIN
    SELECT NAME INTO cust_name 
    FROM CUSTOMERS 
    WHERE ID = cust_id;
END //
DELIMITER ;

call GetNameByID(1,@name);
SELECT @name;



DELIMITER //
CREATE PROCEDURE GetTotalSalary(OUT total_sal INT)
BEGIN
    SELECT SUM(SALARY) INTO total_sal FROM CUSTOMERS;
END //
DELIMITER ;

call GetTotalSalary(@total);
SELECT(@total);


DELIMITER //
CREATE PROCEDURE GetAvgAge(OUT avg_age DECIMAL(5,2))
BEGIN
    SELECT AVG(AGE) INTO avg_age FROM CUSTOMERS;
END //
DELIMITER ;

call GetAvgAge(@avg);
SELECT @avg;



DELIMITER //
CREATE PROCEDURE GetAddressByName(IN cust_name VARCHAR(50), OUT addr VARCHAR(100))
BEGIN
    SELECT ADDRESS INTO addr 
    FROM CUSTOMERS 
    WHERE NAME = cust_name;
END //
DELIMITER ;

call GetAddressByName('Manuja' ,@addr);
SELECT @addr;


DELIMITER //
CREATE PROCEDURE CountByAgeRange(IN min_age INT, IN max_age INT, OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total
    FROM CUSTOMERS
    WHERE AGE BETWEEN min_age AND max_age;
END //
DELIMITER ;

call CountByAgeRange(20,30,@count);
SELECT @count;