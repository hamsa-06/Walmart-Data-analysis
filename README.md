# Walmart-Data-analysis

**Walmart Sales Data Analysis  SQL PROJECT**

**Project Overview**
This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data.
The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.
This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

**Objectives**
1.Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
2.Data Cleaning: Identify and remove any records with missing or null values.
3.Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
4.Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.

**1. Database Setup**
    **Database Creation** : The project starts by creating a database named walmart.
    **Table Creation** : A table named **sales** is created to store the sales data. The table structure includes columns for invoice_id,Branch, City,category,unit_price,quantity,date,time,payment_method,rating,rating_margin
         CREATE DATABASE Walmart;
         Use Walmart;
         Create table sales(
          invoice_id int,
          Branch varchar(30),
          City varchar(40),
          category varchar(40),
          unit_price double,
          quantity int,
          date date,
          time time,
          payment_method varchar(30),
          rating float,
          rating_margin float);
**2. Data Exploration & Cleaning**
      **Check for Duplicates** 
          SELECT DISTINCT invoice_id,COUNT(*) FROM sales GROUP BY invoice_id HAVING COUNT(*) > 1;
       **Remove Dollar Sign from Unit Price**
         UPDATE sales
         SET unit_price = REPLACE(unit_price,'$','')
         WHERE unit_price LIKE '$%';
**3.Data Analysis & Findings**SELECT CASE WHEN (quantity * unit_price) > 500  THEN 'high reveue'
			else 'low revenue' end as revenue,
				COUNT(*) as trans,
                COUNT(*) * 100/(SELECT COUNT(*) FROM walmart) as percentage
                FROM walmart
                GROUP BY revenue;
The following SQL queries were developed to answer specific business questions:
   **Top-Selling Products**
      SELECT invoice_id,Branch,City,category,unit_price,quantity,ROUND(unit_price*quantity,2) sales_price,date,time,rating FROM sales  ORDER BY sales_price DESC LIMIT 10; 
   **Total Revenue Per Branch**
      SELECT Branch,SUM(unit_price*quantity) revenue FROM sales GROUP BY Branch ORDER BY revenue DESC;
   **Best-Selling Category**
      SELECT category,SUM(quantity) total_quantity FROM sales GROUP BY category ORDER BY total_quantity DESC LIMIT 1;
   **Peak Sales Hours**
      SELECT HOUR(time) AS sales_hour, COUNT(*) AS total_transactions FROM sales GROUP BY sales_hour ORDER BY total_transactions DESC LIMIT 1;
   **Average Customer Rating Per Branch**
      SELECT branch,AVG(rating) avg_rating FROM sales GROUP BY branch ORDER BY 2 DESC;
   **Impact of Rating Margin on Sales**
      SELECT rating_margin,SUM(quantity*unit_price) total_sales FROM sales GROUP BY rating_margin ORDER BY rating_margin DESC;
   **Preferred Payment Method**
      SELECT COUNT(*) cnt,payment_method FROM sales GROUP BY payment_method ORDER BY cnt DESC LIMIT 1;
   **City-Wise Revenue Comparison**
      SELECT city,SUM(unit_price*quantity) revenue FROM sales GROUP BY 1 ORDER BY revenue DESC;
   **Seasonal Sales Trends**
      SELECT MONTH(date) month_sales,SUM(unit_price*quantity) FROM walmart GROUP BY 1 ORDER By 2 DESC;
   **High Revenue vs. Low Revenue Transactions**
      SELECT CASE WHEN (quantity * unit_price) > 500  THEN 'high reveue'
			else 'low revenue' end as revenue,
				COUNT(*) as trans,
                COUNT(*) * 100/(SELECT COUNT(*) FROM walmart) as percentage
                FROM sales
                GROUP BY revenue;
   **Effect of Quantity Purchased on Revenue**
      SELECT quantity,SUM(unit_price*quantity) revenue FROM sales GROUP BY 1 ORDER BY revenue DESC;
   **Customer Purchase Behavior**
      SELECT category,COUNT(*) FROM sales GROUP BY category;
   **Store Performance Analysis**
      SELECT MIN(unit_price*quantity) lowest_revenue,MAX(unit_price*quantity) highest_revenue FROM sales;
