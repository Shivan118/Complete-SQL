CREATE DATABASE window1;
USE window1;
CREATE TABLE learning(
emp_id INT,
emp_name varchar(30),
dept_name varchar(30),
salry INT);

INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(101, 'Rahul', 'admin',3500);
INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(102, 'Rajkumae', 'Digital',3800);
INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(103, 'Shubham', 'SE',4200);
INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(104, 'Shivan', 'SE',1425);
INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(105, 'Shivam', 'Sales',1536);
INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(106, 'Kishan', 'HR',1452);
INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(107, 'Monal', 'Sales',3620);
INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(108, 'Ketan', 'Data',1452);
INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(109, 'Manju', 'ID',1425);
INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(110, 'Riya', 'admin',2400);
INSERT INTO learning(emp_id,emp_name,dept_name,salry)VALUES(111, 'Sanju', 'admin',2600);

select * from learning;

select max(salry) as max_salary from learning;

select emp_name,max(salry) as max_salary from learning;

-- based upon group by 
select dept_name,max(salry) as max_salary from learning group by dept_name;

-- Window function
select e.*, 
max(salry) over() as max_salary from 
learning e;

-- adding partition by

select e.*, 
max(salry) over(partition by dept_name) as max_salary from 
learning e;

select e.*, 
min(salry) over(partition by dept_name) as max_salary from 
learning e;

-- row_number, rank, dense_rank, lead and lag
select e.*,
row_number() over() as rn
from learning as e;

select e.*,
row_number() over(partition by dept_name) as rn
from learning as e;

-- fetch the first 2 employees from each department to join the company
select e.*,
row_number() over(partition by dept_name order by emp_id) as rn
from learning as e;

select * from(
	select e.*,
	row_number() over(partition by dept_name order by emp_id) as rn
	from learning as e) x
where x.rn < 3;

-- Fetch the top 3 employees in each department earning the max salary.

-- Rank()
select e.*,
rank() over(partition by dept_name order by salry desc) as rnk
from learning e;

-- using subquery
select * from (
	select e.*,
	rank() over(partition by dept_name order by salry desc) as rnk
	from learning e) x
where x.rnk < 2;

-- Dense_rank()

select e.*,
rank() over(partition by dept_name order by salry desc) as rnk,
dense_rank() over(partition by dept_name order by salry desc) as dense_rnk
from learning e;

select e.*,
rank() over(partition by dept_name order by salry desc) as rnk,
dense_rank() over(partition by dept_name order by salry desc) as dense_rnk,
row_number() over(partition by dept_name order by salry desc) as rn
from learning e;

-- Lead & lag

-- fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee.

select e.*,
lag(salry) over(partition by dept_name order by emp_id) as prev_empl_sal
from learning e;

select e.*,
lag(salry) over(partition by dept_name order by emp_id) as prev_empl_sal,
case when e.salry > lag(salry) over(partition by dept_name order by emp_id) then 'Higher than previous employee'
     when e.salry < lag(salry) over(partition by dept_name order by emp_id) then 'Lower than previous employee'
	 when e.salry = lag(salry) over(partition by dept_name order by emp_id) then 'Same than previous employee' end as sal_range
from learning e;

-- Similarly using lead function to see how it is different from lag.
select e.*,
lag(salry) over(partition by dept_name order by emp_id) as prev_empl_sal,
lead(salry) over(partition by dept_name order by emp_id) as next_empl_sal
from learning e;



















