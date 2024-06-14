
USE amazon;

-- Change column names and data types
ALTER TABLE amazon CHANGE `Invoice_ID` invoice_id VARCHAR(30);
ALTER TABLE amazon CHANGE `Branch` branch VARCHAR(5);
ALTER TABLE amazon CHANGE `City` city VARCHAR(30);
ALTER TABLE amazon CHANGE `customer_type` customer_type VARCHAR(30);
ALTER TABLE amazon CHANGE `Gender` gender VARCHAR(30);
ALTER TABLE amazon CHANGE `Product_line` product_line VARCHAR(30);
ALTER TABLE amazon CHANGE `Unit_price` unit_price DECIMAL(10,2);
ALTER TABLE amazon CHANGE `Quantity` quantity INT;
ALTER TABLE amazon CHANGE `Tax 5%` vat FLOAT(6,4);
ALTER TABLE amazon CHANGE `Total` total DECIMAL(10,2);
ALTER TABLE amazon CHANGE `Date` date DATE;
ALTER TABLE amazon CHANGE `Time` time TIME;
ALTER TABLE amazon CHANGE `Payment` payment VARCHAR(20);
ALTER TABLE amazon CHANGE `COGS` cogs DECIMAL(10,2);
ALTER TABLE amazon CHANGE `gross_margin_percentage` gross_margin_percentage FLOAT(11,9);
ALTER TABLE amazon CHANGE `gross_income` gross_income DECIMAL(10,2);
ALTER TABLE amazon CHANGE `Rating` rating FLOAT(4,1);

/*Product Analysis needs to be done to check which products perform better 
and which products performance needs to improve*/

select distinct product_line from amazon;

/*By using the below written code we can
 find the product line that generates best revenue in total*/

select product_line, SUM(total) as total_revenue
from amazon
group by product_line
order by total_revenue desc;

/* By the below code we can identify the product lines that need improvements*/

select product_line, SUM(quantity) as total_quantity
from amazon
group by product_line
order by total_quantity asc;

/* Sales Analysis aims to answer the question of the sales trends of product.
 The result of this can help us measure the effectiveness of each sales strategy 
 the business applies and what modifications are needed to gain more sales*/
 
 /* This shows how the sales changing from month to month*/
 
 select DATE_FORMAT(date, '%Y-%m') as month, product_line, SUM(total) as Sales
from amazon
group by month, product_line
order by month;

/* This This shows how the sales changing from quarter year to quarter year*/

select quarter(date) as quarter, year(date) as year, product_line, SUM(total) as Sales
from amazon
group by year,quarter, product_line
order by year, quarter;

/*  This shows how the sales changing over a year*/

select year(date) as year, product_line, SUM(total) as Sales
from amazon
group by year, product_line
order by year;
/*Firstly we have to check with the type of customers who are purchasing the products*/

select distinct customer_type from amazon;

/*we have to find with the total purchases made by the customers*/

select DATE_FORMAT(date, '%Y-%m') as month, customer_type, SUM(total) as Total_Purchases
from amazon
group by month, customer_type
order by month;

/*calculate the profit that we made based on the purchase that customers did*/

select customer_type, SUM(total) - SUM(cogs) as Profit
from amazon
group by customer_type;

-- Display all records and count them
select * from amazon;
select COUNT(*) from amazon;
describe amazon;



-- Show the updated columns
show columns from amazon;

/* DATA WRANGLING-->This is done to check if we have any null values in our dataset or not 
if we find any null vakues then we have to fill those null values by using data replacement method*/

-- Select records with any NULL values in specified columns
SELECT * FROM amazon WHERE
invoice_id IS NULL OR branch IS NULL OR
city IS NULL OR customer_type IS NULL OR
gender IS NULL OR product_line IS NULL OR
unit_price IS NULL OR quantity IS NULL OR
vat IS NULL OR total IS NULL OR date IS NULL OR
time IS NULL OR payment IS NULL OR cogs IS NULL OR
 gross_income IS NULL OR rating IS NULL;
 
 #there are no null values in the dataset
 
 /*FEATURE ENGINEERING-->This is done to add new column into the table amazon and also to update 
 if it is time of day then we have to use morning,afternoon and evening to check the sales that 
 happening a lot*/
 
UPDATE amazon
SET time_of_day = CASE
   WHEN Time(time) BETWEEN '04:00:00' AND '11:59:59' THEN 'Morning'
   WHEN Time(time) BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
   WHEN Time(time) BETWEEN '17:00:00' AND '20:59:59' THEN 'Evening'
ELSE 'Night'
END;

select distinct customer_type from amazon;

ALTER TABlE amazon ADD day_name VARCHAR(20);
UPDATE amazon 
SET day_name = DAYNAME(date);


ALTER TABLE amazon 
ADD month_name VARCHAR(30);
UPDATE amazon
SET month_name = MONTHNAME(date);

/*BUSINESS QUESTIONS*/

#1.What is the count of distinct cities in the dataset?
select count(distinct city) AS distinct_cities
from amazon;


#2.for each branch, what is the corresponding city?
select branch, city
from amazon;


#3.What is the count of distinct product lines in the dataset?
select count(distinct product_line) as distinct_product_lines
from amazon;

#4.Which payment method occurs most frequently?
select payment,count(*) as frequent from amazon
group by payment
order by frequent desc;

#5.Which product line has the highest sales?

select product_line,count(product_line) as highest_sales from amazon
group by product_line 
order by highest_sales desc;

#6.How much revenue is generated each month?
select month_name,sum(total) as revenue_month from amazon
group by month_name;

#7.In which month did the cost of goods sold reach its peak?
select month_name,sum(cogs) as cogs_month from amazon
group by month_name
order by cogs_month desc;

#8.Which product line generated the highest revenue?
select product_line,sum(total) as highest_revenue from amazon
group by product_line
order by highest_revenue desc limit 1;

#9.In which city was the highest revenue recorded?
select city,sum(total) as highest_revenue from amazon
group by city
order by highest_revenue desc limit 1;

#10.Which product line incurred the highest Value Added Tax?
select product_line,sum(vat) as highest_vat from amazon
group by product_line
order by highest_vat desc;

#11.For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
select product_line,
case 
    when sum(total) > (select avg(total) from amazon) then 'Good'
    else 'Bad'
end as Sales_Performance
from amazon
group by product_line;

#12.Identify the branch that exceeded the average number of products sold.
select branch,sum(quantity) as quantity from amazon
group by branch having sum(quantity) > (select avg(quantity) from amazon)
order by quantity desc;

#13.Which product line is most frequently associated with each gender?
select gender, product_line, count(*) as count
from amazon
group by gender, product_line
order by gender, count desc;


#14.Calculate the average rating for each product line.
select product_line,avg(rating)from amazon
group by product_line;

#15.Count the sales occurrences for each time of day on every weekday.
select time_of_day,day_name,count(quantity) as sales_occurrence from amazon
group by time_of_day,day_name;


#16.Identify the customer type contributing the highest revenue.
select customer_type, SUM(total) AS revenue
from amazon
group by customer_type
order by revenue desc
limit 1;


#17.Determine the city with the highest VAT percentage.
select city, (sum(vat) / sum(total)) * 100 as vat_percentage
from amazon
group by city
order by vat_percentage desc;


#18.Identify the customer type with the highest VAT payments.
select customer_type,sum(vat) as highest_vat_payments
from amazon
group by customer_type
order by highest_vat_payments;

#19.What is the count of distinct customer types in the dataset?
select count(distinct customer_type) from amazon;

#20.What is the count of distinct payment methods in the dataset?
select count(distinct Payment) from amazon;

#21.Which customer type occurs most frequently?
select customer_type, count(*) as frequency
from amazon
group by customer_type
order by frequency DESC
limit 1;


#22.Identify the customer type with the highest purchase frequency.
select customer_type, count(*) as purchase_frequency
from amazon
group by customer_type
order by purchase_frequency DESC;


#23.Determine the predominant gender among customers.
select gender, count(*) as count
from amazon
group by gender
order by count desc
limit 1;


#24.Examine the distribution of genders within each branch.
select branch, gender, count(*) as count
from amazon
group by branch, gender
order by branch, count desc;


#25.Identify the time of day when customers provide the most ratings.
select time_of_day,count(rating) as count
from amazon
group by time_of_day
order by count desc
limit 1;

#26.Determine the time of day with the highest customer ratings for each branch.
select branch, time_of_day, avg(rating) as avg_rating
from amazon
group by branch, time_of_day
order by branch, avg_rating desc;

#27.Identify the day of the week with the highest average ratings.
select day_name, AVG(rating) as avg_rating
from amazon
group by day_name
order by avg_rating DESC
limit 1;

#28.Determine the day of the week with the highest average ratings for each branch.

select branch, day_name, avg(rating) as avg_rating
from amazon
group by branch, day_name
order by branch, avg_rating desc;





























 


 






 
