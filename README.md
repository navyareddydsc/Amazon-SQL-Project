# Amazon Sales Anlaysis using SQL

##  🔍Project Overview:

This project involves the analysis of Amazon sales data using SQL in MySQL Workbench. The primary goal is to extract valuable insights and trends from the dataset, which can help in making informed business decisions. The project includes tasks such as data quality checks, feature engineering, and answering various business-related questions through SQL queries.

## :page_facing_up:Data Description:

| Column                     | Description                              | Data Type             |
|----------------------------|------------------------------------------|-----------------------|
| invoice_id                 | Invoice of the sales made                | VARCHAR(30)           |
| branch                     | Branch at which sales were made          | VARCHAR(5)            |
| city                       | The location of the branch               | VARCHAR(30)           |
| customer_type              | The type of the customer                 | VARCHAR(30)           |
| gender                     | Gender of the customer                   | VARCHAR(10)           |
| product_line               | Product line of the product sold         | VARCHAR(100)          |
| unit_price                 | The price of each product                | DECIMAL(10, 2)        |
| quantity                   | The amount of the product sold           | INT                   |
| VAT                        | The amount of tax on the purchase        | FLOAT(6, 4)           |
| total                      | The total cost of the purchase           | DECIMAL(10, 2)        |
| date                       | The date on which the purchase was made  | DATE                  |
| time                       | The time at which the purchase was made  | TIMESTAMP             |
| payment_method             | The payment method used                  | VARCHAR(15)           |
| cogs                       | Cost Of Goods sold                       | DECIMAL(10, 2)        |
| gross_margin_percentage    | Gross margin percentage                  | FLOAT(11, 9)          |
| gross_income               | Gross Income                             | DECIMAL(10, 2)        |
| rating                     | Rating                                   | FLOAT(2, 1)           |


 
## 🔧Tools Used 
<img src="https://edent.github.io/SuperTinyIcons/images/svg/mysql.svg" width="100" title="MySQL">

:green_circle:**MySQL Workbench:** Utilized for writing and executing SQL queries. 

:green_circle:**SQL:** Used extensively for data manipulation, querying, and analysis.


## 🛠️Steps Undertaken

:green_circle:**Database and Table Setup:** Created a new database and a sales table with appropriate fields to store the sales data.

:green_circle:**Data Quality Checks:** Performed checks to identify and handle missing or null values in the dataset, ensuring data integrity.

:green_circle:**Feature Engineering:** Created new features such as time_of_day, day_name, and month_name to enrich the dataset and facilitate more detailed analysis.

:green_circle:**Business Analysis:** Conducted comprehensive analysis by formulating and answering various business questions. This includes identifying sales trends, customer behaviors, revenue patterns, and 
                more.

## :books:Learnings

:green_circle:**Data Cleaning:** Gained experience in identifying and managing missing data to maintain data quality.

:green_circle:**Feature Engineering:** Learned how to create and integrate new features to enhance the analytical capabilities of the dataset.

:green_circle:**SQL Proficiency:** Improved proficiency in SQL, particularly in writing complex queries, performing aggregations, and utilizing window functions.

:green_circle:**Business Insights:** Developed the ability to derive actionable business insights from raw data, contributing to strategic decision-making.


## :checkered_flag:Conclusion

The project highlights the effectiveness of SQL in analyzing sales data and extracting meaningful insights. Through a series of structured steps, including data preparation, feature engineering, and in-depth analysis, we have uncovered valuable trends and patterns in Amazon's sales data.These insights can help optimize business strategies and improve customer satisfaction.Amazon SQL Project
Overview
This repository contains code and documentation related to an SQL project focused on Amazon data. The goal of this project is to analyze Amazon’s product data, customer reviews, and sales trends.

**Purposes Of The Capstone Project**
The major aim of this project is to gain insight into the sales data of Amazon to understand the different factors that affect sales of the different branches.

**About Data:**
This dataset contains sales transactions from three different branches of Amazon, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:

**Analysis List**

**Product Analysis:**
Conduct analysis on the data to understand the different product lines, the products lines performing best and the product lines that need to be improved.

**Sales Analysis:**
This analysis aims to answer the question of the sales trends of product. The result of this can help us measure the effectiveness of each sales strategy the business applies and what modifications are needed to gain more sales.

**Customer Analysis:**
This analysis aims to uncover the different customer segments, purchase trends and the profitability of each customer segment.


**Approach Used:**

**1.Data Wrangling: **This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace missing or NULL values.


1.1          Build a database

1.2          Create a table and insert the data.

1.3          Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT  NULL for each field, hence null values are filtered out.


2.**Feature Engineering**: This will help us generate some new columns from existing ones.


2.1           Add a new column named timeofday to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.

2.2          Add a new column named dayname that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

2.3        Add a new column named monthname that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.


3. **Exploratory Data Analysis (EDA)**: Exploratory data analysis is done to answer the listed questions and aims of this project.

**Business Questions To Answer:**
1.What is the count of distinct cities in the dataset?

2.For each branch, what is the corresponding city?

3.What is the count of distinct product lines in the dataset?

4.Which payment method occurs most frequently?

5.Which product line has the highest sales?

6.How much revenue is generated each month?

7.In which month did the cost of goods sold reach its peak?

Which product line generated the highest revenue?

In which city was the highest revenue recorded?

8.Which product line incurred the highest Value Added Tax?

9.For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."

10.Identify the branch that exceeded the average number of products sold.

11.Which product line is most frequently associated with each gender?

12.Calculate the average rating for each product line.

13.Count the sales occurrences for each time of day on every weekday.

14.Identify the customer type contributing the highest revenue.

15.Determine the city with the highest VAT percentage.

16.Identify the customer type with the highest VAT payments.

17.What is the count of distinct customer types in the dataset?

18.What is the count of distinct payment methods in the dataset?

19.Which customer type occurs most frequently?

20.Identify the customer type with the highest purchase frequency.

21.Determine the predominant gender among customers.

22.Examine the distribution of genders within each branch.

23.Identify the time of day when customers provide the most ratings.

24.Determine the time of day with the highest customer ratings for each branch.

25.Identify the day of the week with the highest average ratings.

26.Determine the day of the week with the highest average ratings for each branch.

