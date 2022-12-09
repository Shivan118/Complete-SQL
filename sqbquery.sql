create database sub;

use sub;

create table emp(
emi_id varchar(20),
emp_name varchar(20),
dept_name varchar(20),
salary int);

INSERT INTO emp(emi_id, emp_name, dept_name, salary) values('101', 'Shubham', 'admin', 4000);
INSERT INTO emp(emi_id, emp_name, dept_name, salary) values('102', 'rahul', 'HR', 3000);
INSERT INTO emp(emi_id, emp_name, dept_name, salary) values('103', 'shivan', 'IT', 4000);
INSERT INTO emp(emi_id, emp_name, dept_name, salary) values('104', 'sanju', 'Finance', 6500);
INSERT INTO emp(emi_id, emp_name, dept_name, salary) values('105', 'rohit', 'HR', 3000);
INSERT INTO emp(emi_id, emp_name, dept_name, salary) values('106', 'vivek', 'Finance', 5000);

select * from emp;

-- Find the employees who's salary is more than the average salary earned by all employee
-- let's break our query in 2 parts
-- 1. find the avg salary
-- filter the employees based on the above results.

-- step 1
select avg(salary) from emp; -- 4166.6667

-- step 2
select * from emp
where salary > 4166.6667;

-- step 3 ( final outout)

select * from emp -- outer query / main query
where salary > (select avg(salary) from emp); -- this is called sub query 0 Inner query

-- Types of sub query
-- 1. Scalar Subquery
-- 2. Multiple row Subquery
-- 3. Correlated Subquery

-- 1. Scalar Subquery ( Its only returns one rows and one columns )

 -- using Join
 
select * from emp e
join (select avg(salary) sal from emp) avg_sal
on e.salary > avg_sal.sal;

-- if you want exect answers like where cluse use only e.*

select e.* from emp e
join (select avg(salary) sal from emp) avg_sal
on e.salary > avg_sal.sal;

-- Multiple row Subquery

-- Types of Multiple row Subquery
-- 1. Subquery which returns multiple column and multiple rows
-- 2. Subquery which returns only 1 column and multiple rows

/* Quesions: find the employees who earn the higest salary in each department */

-- Part 1
select dept_name, max(salary)
from emp
group by dept_name;

-- part 2
/* syntax

select * 
from emp 
where (dept_name, salary) in ( above_query)

*/
select * 
from emp 
where (dept_name, salary) in (
							select dept_name, max(salary)
							from emp
							group by dept_name);
                            
-- 2. Subquery which returns only single column and multiple rows

-- find who don;t have any employee


















