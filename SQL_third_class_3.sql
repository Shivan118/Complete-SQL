DROP DATABASE IF EXISTS sales;
create database sales

USE sales

// generate table name frome daatsets using python

// 1. pip install csvkit

// 2. csvsql --dialect mysql --snifflimit 1000000 [data_name with extenstion] > output.sql

create table if not exists sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

select * from sales1;

SET SESSION sql_mode = ''



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_data_final.csv'
into table sales1
FIELDS terminated by ','
enclosed by '"'
lines terminated by '\n'
Ignore 1 ROWS;

select * from sales1;

// convert varcahr ( string) to date time format

select str_to_date(order_date, '%m/%d/%y') from sales1

// convert varcahr to date time format and store in new columns

alter table sales1
add column order_date_new date after order_date

select * from sales1;

SET SQL_SAFE_UPDATES = 0;

update sales1
set order_date_new = str_to_date(order_date, '%m/%d/%Y'); 

/* COMMENT  // make sure we can defiend Y HERE. SOMETIME YOU WILL GET SLASH OR DASH ( ALWASY CREATE DATE COLUMNS IN VARCHAR ) */
/* Data Cleaning using Excel */

alter table sales1
add column ship_date_new date after ship_date

update sales1
set ship_date_new = str_to_date(ship_date, '%m/%d/%Y'); 

select * from sales1;

select * from sales1 where ship_date_new = '2011-01-05'

select * from sales1 where ship_date_new > '2011-01-05'

select * from sales1 where ship_date_new < '2011-01-05'

select * from sales1 where ship_date_new between '2011-01-04' and '2011-01-05'

/* check system current timiing */
select now()

/* check current  date */
select curdate()
select curtime()

/*   */
select * from sales1 where ship_date_new < date_sub(now(), interval 1 week)

/* Generate last week data */
select date_sub(now(), interval 1 week)

select date_sub(now(), interval 30 day)
select date_sub(now(), interval 30 year)

/* print current year  */
select year(now())

/* print current day  */
select dayname(now())

/*   */
select dayname('2022-08-06 12:40:05')

select dayname('2022-08-20 12:40:05')

select dayname('2022-08-13 12:40:05')

alter table sales1
add column flag date after order_id

update sales1
set flag = now()

select * from sales1


/*   */

alter table sales1
add column Year_new date;

alter table sales1
add column Month_new date;

alter table sales1
add column Day_new date;

select * from sales1 limit 5

/* Modify the table */

alter table sales1
modify column Year_new int;

alter table sales1
modify column Month_new int;

alter table sales1
modify column Day_new int;

update sales1 set month_new = month(order_date_new)
update sales1 set day_new = day(order_date_new);
update sales1 set year_new = year(order_date_new);

select * from sales1 limit 5

select month(order_date_new) from sales1

/* Avg sales of after 2011, 2012, 2013 and 2014 */

select avg(sales) from sales1 group by year_new

select year_new,avg(sales) from sales1 group by year_new

select year_new,sum(sales) from sales1 group by year_new

select year_new,min(sales) from sales1 group by year_new

select year_new,max(sales) from sales1 group by year_new

select * from sales1

select year_new,sum(quantity) from sales1 group by year_new

select (discount + shipping_cost) from sales1;

select (discount + shipping_cost) as CTC from sales1;

select (sales*discount + shipping_cost) as CTC from sales1;

select order_id, if(discount > 0, 'Yes', 'No') as discount_flag from sales1

select order_id, discount, if(discount > 0, 'Yes', 'No') as discount_flag from sales1;

alter table sales1
add column discount_flag date after discount;

alter table sales1
modify column discount_flag varchar(30) after discount;  /* Data types should be varchar only */

select * from sales1

update sales1
set discount_flag = if(discount > 0, 'Yes', 'No');

select * from sales1

select discount_flag, count(*) from sales1 group by discount_flag

select count(*) from sales1 where discount > 0

select count(*) from sales1 where discount < 0

select count(*) from sales1 where discount <= 0