CREATE DATABASE employee;

use employee; 

CREATE TABLE emp(
firstname VARCHAR(20),
middlename VARCHAR(20),
lastname VARCHAR(20),
age int,
salary int,
location VARCHAR(20));

show tables;

describe emp;

SELECT * from emp;

INSERT INTO emp VALUES('SHivan', 'Yadav', 'Kumar', 26, 10, 'B');

INSERT INTO emp VALUES('Rahul', 'SHarma', 'Kumar', 32, 10, 'B');

-- Let's say some people don't have middile name ( In this case we can use with table name & Values )

-- INSERT INTO emp VALUES('Rahul', 'Kumar', 32, 10, 'B'); /* If you're using this methods you will get error */

INSERT INTO emp(firstname,lastname,age,salary,location) VALUES('Rahul', 'Kumar', 32, 10, 'Delhi');

-- Bulk Insert 

INSERT INTO emp VALUES('shubham', 'ROy', 'Kumar', 26, 10, 'B'),
('Khushboo', 'SIngh', 'Kumar', 23, 10, 'B'),
('Sima', 'Sharma', 'Kumar', 28, 12, 'B'),
('Ritisha', 'Yadav', 'Kumar', 26, 10, 'B'),
('Sanju', 'Roy', 'Kumar', 26, 10, 'D'),
('Nistha', 'Jain', 'Kumar', 30, 10, 'P');

SELECT * FROM emp;

DROP TABLE emp;


CREATE TABLE emp(
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20),
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL);

DESC emp;

INSERT INTO emp(middlename,lastname,age,salary,location) VALUES('Rahul', 'Kumar', 32, 10, 'Delhi');

DROP TABLE emp;

/* Defaul Vlaues */

CREATE TABLE emp(
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20),
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) default 'Bangalore');

DESC emp;

INSERT INTO emp(firstname,lastname,age,salary) VALUES('Rahul', 'Kumar', 28, 10);

select * from emp; 

INSERT INTO emp(firstname,lastname,age,salary, location) VALUES('Rahul', 'Kumar', 28, 10, 'Delhi');

DESC emp;

/* Lest set manuaaly null in location */

INSERT INTO emp(firstname,lastname,age,salary, location) VALUES('Rahul', 'Kumar', 28, 10, NULL);

/* Null don't be allowed manually here */

DROP TABLE emp;

CREATE TABLE emp(
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20),
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL default 'Bangalore');

INSERT INTO emp(firstname,lastname,age,salary, location) VALUES('Rahul', 'Kumar', 28, 10, null);
select * from emp;

DROP TABLE emp;
/* Sesstion 3 
Primary Key
Auto Increment Keys
Uniques Key
Primary Key vs Unique Key
 */

 -- Primay Key constraints ( Uniquely identify each record in the table
 
CREATE TABLE emp(
ID INT,
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20),
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL default 'Bangalore');

INSERT INTO emp(ID, firstname,lastname,age,salary) VALUES(1, 'Rahul', 'Kumar', 28, 10000);
INSERT INTO emp(ID, firstname,lastname,age,salary) VALUES(1, 'Rahul', 'Kumar', 28, 10000);

select * from emp;

DROP TABLE emp;

CREATE TABLE emp(
ID INT PRIMARY KEY,
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20),
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL default 'Bangalore');

-- OR 

CREATE TABLE emp(
ID INT,
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20),
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL default 'Bangalore',
PRIMARY KEY(ID));

DESC emp;

INSERT INTO emp(ID, firstname,lastname,age,salary) VALUES(1, 'Rahul', 'Kumar', 28, 10000);
INSERT INTO emp(ID, firstname,lastname,age,salary) VALUES(1, 'Rahul', 'Kumar', 28, 10000);

 /* For a primay key Null is not allowed and aslo repeted values are not allowed */

INSERT INTO emp(Null, firstname,lastname,age,salary) VALUES(1, 'Rahul', 'Kumar', 28, 10000);

DROP TABLE emp;

CREATE TABLE emp(
ID INT AUTO_INCREMENT,
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20),
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL default 'Bangalore',
PRIMARY KEY(ID));

DESC emp;

INSERT INTO emp(firstname,lastname,age,salary) VALUES('Rahul', 'Kumar', 28, 10000);

select * from emp;

INSERT INTO emp(firstname,lastname,age,salary) VALUES('Rahul', 'Kumar', 28, 10000);


/* Unique Key */
/*
You can have only one primary key and the primary key cannot hold any NULL .
We should use primary key when we uave to uniquely identify each record. 

Uniqe key can hold NULL

for examples in mysql a unique key can hold any number of NULL values

In some of the other famous DB  unique key hold only one NULL

So the purpose of unique key is not to make sure the values do not duplicated.

We can have only one primary key but multiple unique keys in table.

*/
DROP TABLE emp;

CREATE TABLE emp(
firstname VARCHAR(20) NOT NULL,
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
PRIMARY KEY(firstname, lastname));

DESC emp;

INSERT INTO emp VALUES('Shivan', 'Kumar', 28);
INSERT INTO emp VALUES('Shivan', 'ROy', 28);

INSERT INTO emp VALUES('Shivan', 'Kumar', 28);

SELECT * FROM emp;

/* Unique constraints */
DROP TABLE emp;

CREATE TABLE emp(
ID INT UNIQUE KEY,
firstname VARCHAR(20),
lastname VARCHAR(20),
age int NOT NULL);


INSERT INTO emp VALUES(1, 'Shivan', 'Kumar', 28);

INSERT INTO emp VALUES(1, 'Shivan', 'Kumar', 28);

INSERT INTO emp VALUES(NULL, 'Shivan', 'Kumar', 28);

SELECT * FROM emp;

CREATE TABLE emp(
ID INT,
firstname VARCHAR(20),
lastname VARCHAR(20),
age int NOT NULL,
UNIQUE KEY(ID,firstname));


/* Lofically its not good but we can use it, its possible */

/* Session - 4 | Update, Delete, Alter, DDL vs DML, Truncate vs Delete */

-- CRUD Operation (CREATE, READ, UPDATE, DELETE)

DROP TABLE emp;

CREATE TABLE emp(
ID INT PRIMARY KEY,
firstname VARCHAR(20) NOT NULL,
middlename VARCHAR(20),
lastname VARCHAR(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location VARCHAR(20) NOT NULL default 'Bangalore');

desc emp;


INSERT INTO emp(ID, firstname,lastname,age,salary) VALUES(1, 'Rahul', 'Kumar', 28, 10000);

INSERT INTO emp(ID, firstname,lastname,age,salary) VALUES(2, 'Sanju', 'Kumar', 28, 10000);

INSERT INTO emp(ID, firstname,lastname,age,salary) VALUES(3, 'Shubham', 'Kumar', 28, 10000);

SELECT * FROM emp;

SELECT * FROM emp where age > 29;

SELECT * FROM emp where firstname = 'Shubham';

/* Below statement will match the exect case and it is a case sensetive */

SELECT * FROM emp where binary firstname = 'Shubham';


SELECT firstname as name,lastname as surname FROM emp;

-- UPDATE 

SELECT * from emp;

update emp set lastname = 'Sharma' where firstname = 'Sanju';

update emp set lastname = 'Sharma' where firstname = 'Sanju' and age = 28;

-- delete
delete from emp where id = 3;

-- ALter Command

desc emp;
/* ALter is to alter the structure of the table. */

alter table emp add column jobtitle VARCHAR(30);

DESC emp;

-- IF we want to drop the columns
alter table emp drop column jobtitle;

alter table emp modify column firstname varchar(30);

DESC emp;

alter table emp drop PRIMARY KEY;

alter table emp add PRIMARY KEY(ID);


-- DDL vs DML

/* Data Definition language - Deals with table structure
   CREATE, ALTER, DROP - DDL Command
   Data Manupulation Language - here, we deal with the data
   INSERT, UPDATE, DELETE - DML command
*/

-- Delete command delete our data one by one

-- Turncate command: Its delete all records from your data ( It is a DDL command )-- Truncate command delete your data in single sort. 

-- Turncate internally drops the table and recreates it.






