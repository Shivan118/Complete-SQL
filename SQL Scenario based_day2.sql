CREATE DATABASE Company1;

use Company1;

CREATE table pharmacy_sales(
product_id int,
units_sold int,
total_sales DECIMAL(12,4),
cogs DECIMAL(12,4),
manufacturer varchar(20),
drug varchar(200));

SET @@global.sql_mode= '';
LOAD DATA INFILE 'C:/ProgramData/MySQL/Uploads/data.csv'
into table pharmacy_sales
FIELDS terminated by ','
enclosed by '"'
lines terminated by '\n'
Ignore 1 ROWS;

select * from pharmacy_sales;

-- Methods First

 SELECT drug, total_sales, cogs,
 total_sales - cogs AS total_profit
 from pharmacy_sales
 ORDER By total_profit DESC
 LIMIT 3;

-- Method Second

SELECT sub.drug, sub.Profit FROM
(
SELECT drug, total_sales, cogs, total_sales - cogs as Profit,
RANK() OVER( ORDER BY total_sales - cogs DESC) as rnk
from pharmacy_sales
) sub
WHERE rnk <= 3;












