show databases


create database if not exists shivan_fsda

use shivan_fsda

create table if not exists bank_details(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30))

select * from bank_details

insert into bank_details values(58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no")


insert into bank_details values(
44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no"),
(57,"technician","married","secondary","no",839,"no","yes","unknown",5,"may",225,1,-1,0,"unknown","no"),
(49,"management","married","tertiary","no",378,"yes","no","unknown",5,"may",230,1,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",39,"yes","yes","unknown",5,"may",208,1,-1,0,"unknown","no"),
(59,"blue-collar","married","secondary","no",0,"yes","no","unknown",5,"may",226,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",10635,"yes","no","unknown",5,"may",336,1,-1,0,"unknown","no"),
(57,"technician","divorced","secondary","no",63,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(25,"blue-collar","married","secondary","no",-7,"yes","no","unknown",5,"may",365,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",-3,"no","no","unknown",5,"may",1666,1,-1,0,"unknown","no"),
(36,"admin.","divorced","secondary","no",506,"yes","no","unknown",5,"may",577,1,-1,0,"unknown","no"),
(37,"admin.","single","secondary","no",0,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(44,"services","divorced","secondary","no",2586,"yes","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(50,"management","married","secondary","no",49,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(60,"blue-collar","married","unknown","no",104,"yes","no","unknown",5,"may",22,1,-1,0,"unknown","no"),
(54,"retired","married","secondary","no",529,"yes","no","unknown",5,"may",1492,1,-1,0,"unknown","no"),
(58,"retired","married","unknown","no",96,"yes","no","unknown",5,"may",616,1,-1,0,"unknown","no"),
(36,"admin.","single","primary","no",-171,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(58,"self-employed","married","tertiary","no",-364,"yes","no","unknown",5,"may",355,1,-1,0,"unknown","no"),
(44,"technician","married","secondary","no",0,"yes","no","unknown",5,"may",225,2,-1,0,"unknown","no"),
(55,"technician","divorced","secondary","no",0,"no","no","unknown",5,"may",160,1,-1,0,"unknown","no")

select * from bank_details

select count(*) from bank_details

select age, job, loan from bank_details

select `default` from bank_details

select * from bank_details limit 5

select * from bank_details where age = 33

select * from bank_details where age = 60 and job = 'retired'

select * from bank_details where education = 'unknown' or marital = 'single'

select * from bank_details where education = 'unknown' and marital = 'single'

select * from bank_details where education = 'unknown' or marital = 'single' and balance < 500

select * from bank_details where (education = 'unknown' or marital = 'single') and balance < 500

select distinct job from bank_details

select * from bank_details order by age

select * from bank_details order by age desc

// Assignment 1: With this data try to find out some of blance

// try to find out avaerage of Blance 

select avg(balance) from bank_details

// try to find out who is having a min blance

select * from bank_details order by balance limit 1

select min(balance) from bank_details

select *, min(balance) from bank_details

select * from bank_details where balance in (select min(balance) from bank_details)

select * from bank_details where balance = ( select min(balance) MinBlance from bank_details);


// try to find out who is having a maximum blance

select * from bank_details where balance = ( select max(balance) MinBlance from bank_details);

select * from bank_details order by balance desc

select * from bank_details order by balance desc limit 1 

// try to prepare a list of all the person who is having loan

select * from bank_details where loan = 'yes'

// try to find out average blance for all the perople whose job role is admin

select * from bank_details where job = 'admin.'

select avg(balance) from bank_details where job = 'admin.'


// try to find out person without job whose age is below 45

select * from bank_details where job = 'unknown' and age <= 45

// try to find out a record where education is primarty and person is jobless

select * from bank_details where education = 'primary' and job = 'unknown' 

// try to find of a record whose bank account is having a negative blance

select * from bank_details where balance < 0

// try to find our a record who is not having house at all along with there blance.

select balance, housing from bank_details where housing = 'no'

*************************Assignment Complete *************************************

DELIMITER && 
create procedure select_rec()
BEGIN 
  select * from bank_details;
END &&

call select_rec()

DELIMITER && 
create procedure select_rec1()
BEGIN 
  select * from bank_details where balance in (select min(balance) from bank_details);
END &&

call select_rec1()

DELIMITER && 
create procedure avg_bal_jobrole1(IN var varchar(30))
BEGIN 
  select avg(balance) from bank_details where job = var;
END &&
 
 call avg_bal_jobrole1('admin.')
 
call avg_bal_jobrole1('unknown')

DELIMITER && 
create procedure sel_edu_job(in v1 varchar(30), in v2 varchar(30))
BEGIN 
  select * from bank_details where education = v1 and job = v2;
END &&

call sel_edu_job('technician', 'secondary')

create view bank_view as select age, job, marital, education, balance from bank_details;

SELECT * FROM shivan_fsda.bank_view;

select avg(balance) from bank_view where job = 'admin.'

 
