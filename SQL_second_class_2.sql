create database dress_bulk_data;

use dress_bulk_data

create table if not exists dress1(
`Dress_ID` varchar(30),	
`Style` varchar(30),	
`Price` varchar(30),	
`Rating` varchar(30),	
`Size` varchar(30),	
`Season` varchar(30),	
`NeckLine` varchar(30),	
`SleeveLength` varchar(30),	
`waiseline` varchar(30),	
`Material` varchar(30),	
`FabricType` varchar(30),	
`Decoration` varchar(30),	
`Pattern_Type` varchar(30), 
`Recommendation` varchar(30))

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/AttributeDataSet.csv'
into table dress1
FIELDS terminated by ','
enclosed by '"'
lines terminated by '\n'
Ignore 1 ROWS;

select * from dress1;

create table if not exists test(
test_id int auto_increment,
test_name varchar(30),
test_emailid varchar(30),
test_adress varchar(30),
primary key (test_id))

select * from test;

insert into test values(1,'shivan', 'shivan@ineuron.ai','Banglaore'),
(2,'shubham', 'shubham@ineuron.ai','Bangalore')

// Constraints

create table if not exists test1(
test_id int not null auto_increment,
test_name varchar(30),
test_emailid varchar(30),
test_adress varchar(30),
primary key (test_id))

insert into test1(test_name,test_emailid, test_adress) values('shivan', 'shivan@ineuron.ai','Banglaore'),
('shubham', 'shubham@ineuron.ai','Bangalore')

select * from test1;

create table if not exists test3(
test_id int,
test_name varchar(30),
test_emailid varchar(30),
test_adress varchar(30),
test_salary int check(test_salary > 10000))

insert into test3 values(1,'shivan', 'shivan@ineuron.ai','Banglaore', 100000),
(2,'shubham', 'shubham@ineuron.ai','Bangalore', 20000)

select * from test3;

create table if not exists test4(
test_id int,
test_name varchar(30),
test_emailid varchar(30),
test_adress varchar(30) check (test_adress = 'Banglaore'),
test_salary int check(test_salary > 10000))

insert into test4 values(1,'shivan', 'shivan@ineuron.ai','Banglaore', 100000),
(2,'shubham', 'shubham@ineuron.ai','Banglaore', 20000),
(3, 'Nishtha', 'Nishtha@ineuron.ai', 'Banglaore', 300000)

select * from test4;

// Modify someting in your table
alter table test4 add check (test_id > 0)

insert into test4 values(7,'shivan', 'shivan@ineuron.ai','Banglaore', 100000)

select * from test4;

// 
create table if not exists test5(
test_id int NOT NULL,
test_name varchar(30),
test_emailid varchar(30),
test_adress varchar(30) check (test_adress = 'Banglaore'),
test_salary int check(test_salary > 10000))

select * from test5;

insert into test5 (test_id,test_name,test_emailid, test_adress, test_salary) values(24,'shivan', 'shivan@ineuron.ai','Banglaore', 100000)

insert into test5 (test_id,test_name,test_emailid, test_adress, test_salary) values('shivan', 'shivan@ineuron.ai','Banglaore', 100000)

create table if not exists test6(
test_id int NOT NULL default 0,
test_name varchar(30),
test_emailid varchar(30),
test_adress varchar(30) check (test_adress = 'Banglaore'),
test_salary int check(test_salary > 10000))

insert into test6 (test_id,test_name,test_emailid, test_adress, test_salary) values(24,'shivan', 'shivan@ineuron.ai','Banglaore', 100000)
insert into test6 (test_name,test_emailid, test_adress, test_salary) values('shivan', 'shivan@ineuron.ai','Banglaore', 100000)
select * from test6;

create table if not exists test7(
test_id int NOT NULL default 0,
test_name varchar(30),
test_emailid varchar(30) unique,
test_adress varchar(30) check (test_adress = 'Banglaore'),
test_salary int check(test_salary > 10000))

insert into test7 (test_name,test_emailid, test_adress, test_salary) values('shivan', 'shivan@ineuron.ai','Banglaore', 100000)
insert into test7 (test_name,test_emailid, test_adress, test_salary) values('shivan', 'shivan@ineuron.ai','Banglaore', 100000)

// Final Table where i have used all constraints

create table if not exists test8(
test_id int NOT NULL auto_increment,
test_name varchar(30) NOT NULL  default 'unknown',
test_emailid varchar(30) unique,
test_adress varchar(30) check (test_adress = 'Banglaore') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id))

select * from test8;

insert into test8 (test_id,test_name,test_emailid, test_adress, test_salary) values(100, 'shivan', 'shivan@ineuron.ai','Banglaore', 100000)

select * from test8;

insert into test8 (test_name,test_emailid, test_adress, test_salary) values('shivan', 'shivan1@ineuron.ai','Banglaore', 100000)


insert into test8 (test_name,test_emailid, test_adress, test_salary) values('shivan', 'shivan2@ineuron.ai','Banglaore', 100000)
select * from test8;

insert into test8 (test_name,test_emailid, test_adress, test_salary) values('shivan', 'shivan22@ineuron.ai','Banglaore', 100000)
select * from test8;

insert into test8 (test_id,test_name,test_emailid, test_adress, test_salary) values(500, 'shivan', 'shivan123@ineuron.ai','Banglaore', 100000)
select * from test8;

insert into test8 (test_name,test_emailid, test_adress, test_salary) values('shivan', 'shivan222@ineuron.ai','Banglaore', 100000)
select * from test8;