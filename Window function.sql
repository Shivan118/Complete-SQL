CREATE DATABASE window_f;
USE window_f;

CREATE TABLE Employee(
emp_id INT,
first_name varchar(30),
last_name varchar(30),
city varchar(30),
dept_name varchar(30),
salary varchar(30));

INSERT INTO Employee(emp_id,first_name,last_name,city,dept_name, salary)VALUES(100, 'Shivan', 'Kumar','Bihar', 'Finance',10000);
INSERT INTO Employee(emp_id,first_name,last_name,city, dept_name, salary)VALUES(101, 'rahul', 'Roy','UP','Finance', 12000);
INSERT INTO Employee(emp_id,first_name,last_name,city, dept_name, salary)VALUES(102, 'Manju', 'Kumari','Bihar', 'Sales',24000);
INSERT INTO Employee(emp_id,first_name,last_name,city,dept_name, salary)VALUES(103, 'Preti', 'Sharma','Gaya','Sales', 15000);
INSERT INTO Employee(emp_id,first_name,last_name,city, dept_name, salary)VALUES(104, 'Kiran', 'Gupta','patna','Data Science', 10000);
INSERT INTO Employee(emp_id,first_name,last_name,city,dept_name, salary)VALUES(105, 'Sima', 'Roy','Noida','Management', 18000);
INSERT INTO Employee(emp_id,first_name,last_name,city, dept_name, salary)VALUES(106, 'Shubham', 'Kumar','J & K', 'Data Science',24000);
INSERT INTO Employee(emp_id,first_name,last_name,city,dept_name, salary)VALUES(107, 'Pawan', 'Kumar','Delhi', 'Data Science',15000);
INSERT INTO Employee(emp_id,first_name,last_name,city,dept_name, salary)VALUES(108, 'jaydeep', 'Singh','Bihar', 'Finance',10000);
INSERT INTO Employee(emp_id,first_name,last_name,city,dept_name, salary)VALUES(109, 'Monal', 'S','Gaya','Data Science', 12000);
INSERT INTO Employee(emp_id,first_name,last_name,city,dept_name, salary)VALUES(110, 'Kishan', 'Kaleriya','UP','Finance', 19000);
INSERT INTO Employee(emp_id,first_name,last_name,city,dept_name, salary)VALUES(111, 'Sagar', 'Siwan','UP','Management', 20000);

select * from Employee;

/*
RANK()

It used to generate a unique rank for each row in a table based on the specified value. 
If this function gets the two records with the same value, it will assign the same rank to both records and skip the next ranking. 
For example, if rank 2 has two identical values, the rank function provides the same rank 2 to both records and skip the next rank 3. 
Now, the next rank will be assigned with rank 4.

*/

SELECT first_name, last_name, city,     
RANK () OVER (ORDER BY city) AS Rank_No     
FROM Employee;   

SELECT first_name, last_name, city,dept_name ,
RANK () OVER (ORDER BY city, dept_name) AS Rank_No     
FROM Employee;   

-- DENSE_RANK()
/* 
It works the same as the RANK() function except that it does not skip any rank. 
It always assigns rank in consecutive order. It means that when two records are found equal, 
this function will assign the same rank to both records and the next rank being the next sequential number.
*/

SELECT first_name, last_name, salary,     
DENSE_RANK() OVER (ORDER BY salary) AS Rank_No     
FROM Employee;   

SELECT first_name, last_name, salary,  dept_name,   
DENSE_RANK() OVER (ORDER BY salary, dept_name) AS Rank_No     
FROM Employee;   

-- ROW_NUMBER()

/* 
It is used to assign a unique sequential number to each record within the partition. 
It always starts with one and increases by one until all the records in a partition are not reached. 
It will be reset when one partition ranking is completed and goes to the next partition.

*/
select * from Employee;

SELECT first_name, last_name, city,
ROW_NUMBER() OVER (ORDER BY city) AS Rank_No     
FROM Employee; 


-- ROW_NUMBER() with PARTITION BY

/*
The below statement partition the table based on the city, 
which means the row number is reset for each city and restarts at 1 again. 
It is also ordering the records on the basis of the first_name column.

*/

SELECT first_name, last_name, city,     
ROW_NUMBER() OVER (PARTITION BY city ORDER BY first_name) AS Rank_No     
FROM Employee;  

-- PERCENT_RANK()
/* 
This function evaluates a percentile rank (relative rank) for rows within a partition of a result set. 
It gives the result between 0 and 1. If it finds the NULL value, it treats them as the lowest possible value.

*/
CREATE TABLE Product_Sales(    
    Emp_Name VARCHAR(45) NOT NULL,    
    Year INT NOT NULL,  
    Country VARCHAR(45) NOT NULL,    
    Prod_name VARCHAR(45) NOT NULL,    
    Sales DECIMAL(12,2) NOT NULL,    
    PRIMARY KEY(Emp_Name, Year)    
);  

INSERT INTO Product_Sales(Emp_Name, Year, Country, Prod_name, Sales)    
VALUES('Mike Johnson', 2017, 'Britain', 'Laptop', 10000),    
('Mike Johnson', 2018, 'Britain', 'Laptop', 15000),    
('Mike Johnson', 2019, 'Britain', 'TV', 20000),    
('Mary Greenspan', 2017, 'Australia', 'Computer', 15000),    
('Mary Greenspan', 2018, 'Australia', 'Computer', 10000),    
('Mary Greenspan', 2019, 'Australia', 'TV', 20000),    
('Nancy Jackson', 2017, 'Canada', 'Mobile', 20000),    
('Nancy Jackson', 2018, 'Canada', 'Calculator', 1500),    
('Nancy Jackson', 2019, 'Canada', 'Mobile', 25000);

SELECT Year, Prod_name, Country, Sales,       
PERCENT_RANK() OVER(PARTITION BY Year ORDER BY Country) AS my_rank     
FROM Product_Sales;    

SELECT Year, Prod_name, Country, Sales,       
LEAD(Sales,1) OVER (PARTITION BY Year ORDER BY Country) AS Next_Sale      
FROM Product_Sales;   




