CREATE database company;

use company;

create table employee(
emi_id varchar(20),
emp_name varchar(20),
salary INT,
dept_id varchar(20),
manager_id varchar(20));

INSERT INTO employee(emi_id, emp_name, salary, dept_id, manager_id) values('E1', 'Shubham', 15000, 'D1', 'M1');
INSERT INTO employee(emi_id, emp_name, salary, dept_id, manager_id) values('E2', 'Manoj', 15000, 'D1', 'M1');
INSERT INTO employee(emi_id, emp_name, salary, dept_id, manager_id) values('E3', 'Shivan', 55000, 'D2', 'M2');
INSERT INTO employee(emi_id, emp_name, salary, dept_id, manager_id) values('E4', 'Kumar', 25000, 'D2', 'M2');
INSERT INTO employee(emi_id, emp_name, salary, dept_id, manager_id) values('E5', 'Ribha', 20000, 'D10', 'M3');
INSERT INTO employee(emi_id, emp_name, salary, dept_id, manager_id) values('E6', 'Satya', 30000, 'D10', 'M3');

select * from employee;

create table department(
dept_id varchar(20),
dept_name varchar(20));

INSERT INTO department(dept_id, dept_name) values('D1', 'IT');
INSERT INTO department(dept_id, dept_name) values('D2', 'HR');
INSERT INTO department(dept_id, dept_name) values('D3', 'Finance');
INSERT INTO department(dept_id, dept_name) values('D4', 'Admin');

select * from department;

create table manager(
manager_id varchar(20),
manager_name varchar(20),
dept_id varchar(20));

INSERT INTO manager(manager_id, manager_name,dept_id) values('M1', 'Prem', 'D3');
INSERT INTO manager(manager_id, manager_name,dept_id) values('M2', 'Dibyanshu', 'D4');
INSERT INTO manager(manager_id, manager_name,dept_id) values('M3', 'Sunny', 'D1');
INSERT INTO manager(manager_id, manager_name,dept_id) values('M4', 'ketan', 'D1');

select * from manager;

create table projects(
project_id varchar(20),
project_name varchar(20),
team_member_id varchar(20));

INSERT INTO projects(project_id, project_name,team_member_id) values('P1', 'Data Science', 'E1');
INSERT INTO projects(project_id, project_name,team_member_id) values('P1', 'Data Science', 'E2');
INSERT INTO projects(project_id, project_name,team_member_id) values('P1', 'Data Science', 'M3');
INSERT INTO projects(project_id, project_name,team_member_id) values('P2', 'Data Analytics', 'E1');
INSERT INTO projects(project_id, project_name,team_member_id) values('P2', 'Data Analytics', 'M4');

select * from projects;

# Inner Join / Join ( both are same )

-- Featch the employee name and the department name they belong to. 

-- ( I need employe table and department table )

select e.emp_name, d.dept_name
from employee e 
join department d on e.dept_id = d.dept_id;

-- OR

select e.emp_name, d.dept_name
from employee e 
inner join department d on e.dept_id = d.dept_id;


-- LEFT JOIN

-- Fetch all the employee name their department name they belong to. 

-- left join = inner join  + any additional recoerds in the left table.

select e.emp_name, d.dept_name
from employee e 
left join department d on e.dept_id = d.dept_id;


-- Right Join

-- Right Join = inner join + anu additional recored from the right table.

select e.emp_name, d.dept_name
from employee e 
right join department d on e.dept_id = d.dept_id;

-- Now lets work on the multille table

-- Fetch details of all emp, their manager, their department and the projects they work on.

-- step first

select e.emp_name, d.dept_name
from employee e
join department d on e.dept_id = d.dept_id;

-- step 2
select e.emp_name, d.dept_name
from employee e
left join department d on e.dept_id = d.dept_id;

-- step 3

select e.emp_name, d.dept_name, m.manager_name
from employee e
left join department d on e.dept_id = d.dept_id
join manager m on m.manager_id = e.manager_id;

-- OR 

select e.emp_name, d.dept_name, m.manager_name
from employee e
left join department d on e.dept_id = d.dept_id
inner join manager m on m.manager_id = e.manager_id;

-- In a able steps i user inner join because i want to fetch a;ll employee name not a all manager name
-- if I want to fetch all manager name then we can use right join instead of inner join 

select e.emp_name, d.dept_name, m.manager_name
from employee e
left join department d on e.dept_id = d.dept_id
right join manager m on m.manager_id = e.manager_id;

-- step 4 ( Projects table) 

select e.emp_name, d.dept_name, m.manager_name, p.project_name
from employee e
left join department d on e.dept_id = d.dept_id
inner join manager m on m.manager_id = e.manager_id
join projects p on p.team_member_id = e.emi_id;

-- here we got only 3 recored but we want all employee name ( so why we are getting only 3 recoderd because we are using here a ineer join)

-- Step 5 ( using left join because our employee table is a primary table )

select e.emp_name, d.dept_name, m.manager_name, p.project_name
from employee e
left join department d on e.dept_id = d.dept_id
inner join manager m on m.manager_id = e.manager_id
left join projects p on p.team_member_id = e.emi_id;

-- Step 5 ( using right join )

select e.emp_name, d.dept_name, m.manager_name, p.project_name
from employee e
left join department d on e.dept_id = d.dept_id
inner join manager m on m.manager_id = e.manager_id
right join projects p on p.team_member_id = e.emi_id;

-- Cross Join ( Return certesion prodect )

select e.emp_name, d.dept_name 
from employee e -- 6 roes
cross join department d; -- 4 roes

-- Natural Join

select e.emp_name, d.dept_name
from employee e
natural join department d;

-- alter table department rename column dept_id to id ( if requred the i will reun this code )


-- self Join

create table customers(
id int,
name VARCHAR(20),
age int,
address VARCHAR(20),
salary int);

INSERT INTO customers(id, name,age, address, salary) values(1, 'shivan',26,  'patna', 2000);
INSERT INTO customers(id, name,age, address, salary) values(2, 'shubham',27,  'Mumbai', 28000);
INSERT INTO customers(id, name,age, address, salary) values(3, 'rahul',58,  'UP', 2000);
INSERT INTO customers(id, name,age, address, salary) values(4, 'chandan',95,  'Delhi', 9822);
INSERT INTO customers(id, name,age, address, salary) values(5, 'monal',25,  'punjab', 2566);
INSERT INTO customers(id, name,age, address, salary) values(6, 'kishan',11,  'Gaya', 1455);
INSERT INTO customers(id, name,age, address, salary) values(7, 'pawan',36,  'Banglore', 2000);

select * from customers;

create table orders(
oid int,
date date,
customer_id int,
amount int);

INSERT INTO orders(oid, date,customer_id, amount) values(102, '2009-10-08 00:00:00',3, 3000);
INSERT INTO orders(oid, date,customer_id, amount) values(100, '2009-10-08 00:00:00',3, 1500);
INSERT INTO orders(oid, date,customer_id, amount) values(101, '2009-11-20 00:00:00',2, 1560);
INSERT INTO orders(oid, date,customer_id, amount) values(103, '2008-05-20 00:00:00',4, 2060);

select * from orders;

SELECT  a.ID, b.NAME, a.SALARY
   FROM CUSTOMERS a, CUSTOMERS b
   WHERE a.SALARY < b.SALARY;


-- Full Join = Inner Join
--            + all remaining recored from left table
--            + all remaining recored from right table

SELECT  id, name, amount, date
FROM customers 
FULL JOIN orders 
ON customers.id = orders.customers_id;


## Hackernk problem 
-- https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true

select s.nm 
from
( 
    select students.id as i, 
    friends.friend_id as fi, 
    packages.salary as sal, 
    students.name as nm 
    from students
    
    INNER JOIN friends ON students.id=friends.id 
    INNER JOIN packages ON students.id=packages.id 
) 

s INNER JOIN packages ON s.fi=packages.id where packages.salary>s.sal order by packages.salary; 

-- https://datalemur.com/questions/sql-page-with-no-likes ( facebook)

select pa.page_id  

from pages pa
LEFT JOIN page_likes pl on pa.page_id = pl.page_id
where pl.page_id is NULL
order by pa.page_id;

-- https://datalemur.com/questions/spotify-streaming-history ( Spotify Medium )

SELECT user_id, song_id, SUM(song_plays) AS song_plays 
FROM (
SELECT user_id, song_id, song_plays FROM songs_history 

UNION ALL 

SELECT user_id, song_id, COUNT(song_id) AS song_plays FROM songs_weekly 
WHERE listen_time < '08/05/2022' GROUP BY user_id, song_id) AS report 

GROUP BY report.user_id, report.song_id
ORDER BY song_plays DESC

-- Subquery 



