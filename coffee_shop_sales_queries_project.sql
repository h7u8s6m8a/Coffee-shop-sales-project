create database coffee_shop;
use coffee_shop;

CREATE TABLE coffee_shop_sales (
transaction_id INT,
transaction_date DATE,
transaction_time TIME,
store_id INT,
store_location VARCHAR(255),
product_id INT,
transaction_qty INT,
unit_price DECIMAL(10,2),
total_bill DECIMAL(10,2),
product_category VARCHAR(100),
product_type VARCHAR(100),
product_detail VARCHAR(255),
size VARCHAR(50),
month_name VARCHAR(20),
day_name VARCHAR(20),
hour INT,
month INT,
day_of_week INT,
total_sales DECIMAL(10,2),
day_name_calc VARCHAR(20),
month_calc VARCHAR(20),
hour_calc INT,
time_slot VARCHAR(20),
day_type VARCHAR(20)
);
LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Coffee_Shop_Sales_Cleaned data.csv'
INTO TABLE coffee_shop_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT count(*) from coffee_shop_sales;
SELECT * from coffee_shop_sales limit 10;
---- OVERALL REVENUE --------
select round(sum(total_sales),2) as overall_revenue from coffee_shop_sales;
select month, round(sum(total_sales),2) as revenue from coffee_shop_sales group by month order by revenue desc;
select day_name_calc, round(sum(total_sales),2) as revenue from coffee_shop_sales group by day_name_calc order by revenue desc;
select time_slot, round(sum(total_sales),2) as revenue from coffee_shop_sales group by time_slot order by revenue desc;
select store_location, round(sum(total_sales),2) as revenue from coffee_shop_sales group by store_location;
select product_detail, round(sum(total_sales),2) as revenue from coffee_shop_sales group by product_detail order by revenue desc limit 10;
create or replace view coffee_sales_view as select * from coffee_shop_sales;