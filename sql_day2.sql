--  Foreign Key Constraint - Complete Demonstration

show databases;

use employee;

CREATE TABLE students(
student_id INT auto_increment,
student_fname varchar(30) NOT NULL,
student_lname varchar(30) NOT NULL,
student_mname varchar(30),
student_email varchar(30) NOT NULL,
student_phone varchar(30) NOT NULL,
student_alternate_number varchar(30),
enrollment_date timestamp NOT NULL,
year_of_experience INT NOT NULL,
student_Company varchar(30),
batch_date varchar(30) NOT NULL,
source_of_joining varchar(30) NOT NULL,
location varchar(30) NOT NULL,
PRIMARY KEY(student_id),
UNIQUE KEY(student_email));

DESC students;

INSERT INTO students(student_fname,student_lname,student_email,student_phone,
enrollment_date,year_of_experience,student_Company,batch_date,source_of_joining,location) VALUES("Shivan", "kumar", "shiva@gmail.com", 
"99882334455",'05-05-2021',12,"Amazon",'19-02-2022', "Google", "B");

-- SQL session 6 | Distinct, Order By, Limit, Like Keyword

-- SQL session 7 | Order of execution in SQL

-- SQL session 8 | Aggregate Functions

SELECT count(*) from emp;

SELECT count(student_company) from emp;

SELECT count student_company from emp;

SELECT count(DISTINCT student_company) from emp;

SELECT count(DISTINCT student_company) AS num_of_Company from emp;

SELECT count(DISTINCT locations) from emp;

SELECT count(DISTINCT source_of_joining) from emp;

SELECT count(*) from emp where batch_date like '%-02-%'; 

SELECT count(*) from emp where batch_date like '19-%'; 

-- Group BY
-- MIN MAX
-- SUM

-- SQL session 9 | A few more Datatypes

DECIMAL (3,4)
TIMESTAMP CURRENT & UPDATED

-- SQL session 10 | Logical Operators

-- CASE STATEMENT ( yo

SELECT course_id, course_name, course_fee, 
	CASE
		WHEN course_duration_months > 4 THEN 'masters'
        ELSE 'diploma'
	END as course_type
    FROM courses;
    
-- Joins in SQL - very important for interviews | SQL session 11
/*
In students table selectd_course
In courses table course_id

select students.student_fname, students.student_lname, courses.course_name 
from students join courses on students.selected_course = courses.course_id;

by default it is a inner join....

Only the matching records are considered. Non matching records are discarded.

*/
/*

Left Outer Join - 
ALl the matching records fromleft and right table are considered 
+
All the non matching recored in the left table which does not have the match in the right padded with null



CREATE table students_latest as select * from students;

CREATE table courses_latest as select * from courses;

-- Left outjoin implmentation

select students_latest.student_fname, students_latest.student_lname, courses_latest.course_name 
from students_latest left join courses_latest on students_latest.selected_course = courses_latest.course_id;
*/

/* 
RIght Outer JOIN

ALl the matching records fromleft and right table are considered 
+
All the non matching recored in the right table which does not have the match in the left padded with null

-- right outjoin implmentation

select students_latest.student_fname, students_latest.student_lname, courses_latest.course_name 
from students_latest right join courses_latest on students_latest.selected_course = courses_latest.course_id;

*/

/*

Full outer join

All matching records 
+
non matching records from left
+
non matching records from right

select students_latest.student_fname, students_latest.student_lname, courses_latest.course_name 
from students_latest left join courses_latest on students_latest.selected_course = courses_latest.course_id;
UNION
select students_latest.student_fname, students_latest.student_lname, courses_latest.course_name 
from students_latest right join courses_latest on students_latest.selected_course = courses_latest.course_id;
*/

/*

Cross JOIN

*/

-- Important SQL INTERVIEW question | Difference between where and having in mysql
-- where clause is used to filter the individual records before aggregation ( groupby).
-- having clause used to filter the records afte aggregation ( groupby).

/*

Q1a. Display the total no. of students joined from each source & the lead sources
         through which more than 1 person has registered

----> SELECT source_of_joining,count(*) AS TOTAL from students
       GROUP BY source_of_joining
       HAVING TOTAL > 1;
   
   b. Display the count of people who registered through linkedIN.

----> SELECT source_of_joining,count(*) AS TOTAL from students
       GROUP BY source_of_joining = 'linkedIN';

Q2. The locations from which more than 1 student has joined & students having 
     more than 10 years of experience.
    
----> SELECT location, count(*) AS TOTAL from students
       where years_of_experience > 10
       GROUP BY location
       HAVING TOTAL > 1;
       
*/
/*
-- WHere is used before group by and do filtering on individuals records
-- Having is used aftr group by and do filtering on aggregated records.
-- we can use where and having in the same query also.
-- where is more performant than having.
*/

-- Very Important SQL Interview question | Over Clause | Partition By Clause


CREATE TABLE empl(
firstname VARCHAR(20),
lname VARCHAR(20),
age INT,
salary INT,
location VARCHAR(20));

INSERT INTO empl VALUES('Shivan', 'Kumar', 26, 1000, 'B');
INSERT INTO empl VALUES('BHarath', 'Sharm', 26, 100000, 'JH');
INSERT INTO empl VALUES('Sanju', 'ROy', 26, 1000, 'M');
INSERT INTO empl VALUES('Rahul', 'DHawan', 26, 1500, 'P');
INSERT INTO empl VALUES('sipli', 'Kumar', 26, 5000, 'D');

-- how many people are from location and avg salart at each location

SELECT location, count(location) as total, avg(salary) as avg from empl group by location;

-- ONline IDE below link
-- https://onecompiler.com/mysql

-- we can try achiving it using JOIN
SELECT firstname, lname, empl.location, total_count, avg_salary from empl join
(SELECT location, count(location) as total_count, avg(salary) as avg_salary from empl group by location) temptable on
 empl.location = temptable.location;

-- we can use OVER PARTITION BY to achive this easily.
SELECT firstname, lname, location, 
count(location) OVER (PARTITION BY location),
avg(salary) OVER(PARTITION BY location) as average
from empl;

-- add alies
SELECT firstname, lname, location, 
count(location) OVER (PARTITION BY location) as location,
avg(salary) OVER(PARTITION BY location) as average
from empl;

-- Row Number Function in MySQL | Important SQL Interview Question

SELECT firstname, lname, salary, 
row_number() over (order by salary desc) from empl;

-- find the 5th higest salary

SELECT * FROM (SELECT firstname, lname, salary, 
row_number() over (order by salary desc) as rownum from empl) temptable where rownum=5;

-- I want to assign row number for each partitions based on each locations.

SELECT firstname, lname, location, salary, 
row_number() over (partition by location order by salary desc) from empl;

-- find the higest salary at each location.

SELECT * FROM (SELECT firstname, lname,location, salary, 
row_number() over (partition by location order by salary desc) as rownum from empl) temptable where rownum = 1;
/*

-- when we use row_number we should be using order by clause
-- we can also use the partition by - optional
-- the rownumber starts from 1 for every partition  

*/

-- Rank and Dense Rank in MySQL - Important SQL Interview Question











































