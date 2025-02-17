# Walmart-Data-analysis

**Walmart Sales Data Analysis  SQL PROJECT**<br>

**Project Overview**<br>
This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data.<br>
The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.<br>
This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.<br>

**Objectives**<br>
1.Set up a retail sales database: Create and populate a retail sales database with the provided sales data.<br>
2.Data Cleaning: Identify and remove any records with missing or null values.<br>
3.Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.<br>
4.Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.<br>

**1. Database Setup**<br>
    **Database Creation** : The project starts by creating a database named walmart.<br>
    **Table Creation** : A table named **sales** is created to store the sales data. The table structure includes columns for invoice_id,Branch, City,category,unit_price,quantity,date,time,payment_method,rating,rating_margin<br>
         CREATE DATABASE Walmart;<br>
         Use Walmart;<br>
         Create table sales(<br>
          invoice_id int,<br>
          Branch varchar(30),<br>
          City varchar(40),<br>
          category varchar(40),<br>
          unit_price double,<br>
          quantity int,<br>
          date date,<br>
          time time,<br>
          payment_method varchar(30),<br>
          rating float,<br>
          rating_margin float);<br>
**2. Data Exploration & Cleaning**<br>
      **Check for Duplicates** <br>
          SELECT DISTINCT invoice_id,COUNT(*) FROM sales GROUP BY invoice_id HAVING COUNT(*) > 1;<br>
       **Remove Dollar Sign from Unit Price**<br>
         UPDATE sales<br>
         SET unit_price = REPLACE(unit_price,'$','');<br>
         WHERE unit_price LIKE '$%';<br>
**3.Data Analysis & Findings**<br>
The following SQL queries were developed to answer specific business questions:<br>
   **Top-Selling Products**<br>
      SELECT invoice_id,Branch,City,category,unit_price,quantity,ROUND(unit_price*quantity,2) sales_price,date,time,rating FROM sales  ORDER BY sales_price DESC LIMIT 10;<br> 
   **Total Revenue Per Branch**<br>
      SELECT Branch,SUM(unit_price*quantity) revenue FROM sales GROUP BY Branch ORDER BY revenue DESC;<br>
   **Best-Selling Category**<br>
      SELECT category,SUM(quantity) total_quantity FROM sales GROUP BY category ORDER BY total_quantity DESC LIMIT 1;<br>
   **Peak Sales Hours**<br>
      SELECT HOUR(time) AS sales_hour, COUNT(*) AS total_transactions FROM sales GROUP BY sales_hour ORDER BY total_transactions DESC LIMIT 1;<br>
   **Average Customer Rating Per Branch**<br>
      SELECT branch,AVG(rating) avg_rating FROM sales GROUP BY branch ORDER BY 2 DESC;<br>
   **Impact of Rating Margin on Sales**<br>
      SELECT rating_margin,SUM(quantity*unit_price) total_sales FROM sales GROUP BY rating_margin ORDER BY rating_margin DESC;<br>
   **Preferred Payment Method**<br>
      SELECT COUNT(*) cnt,payment_method FROM sales GROUP BY payment_method ORDER BY cnt DESC LIMIT 1;<br>
   **City-Wise Revenue Comparison**<br>
      SELECT city,SUM(unit_price*quantity) revenue FROM sales GROUP BY 1 ORDER BY revenue DESC;<br>
   **Seasonal Sales Trends**<br>
      SELECT MONTH(date) month_sales,SUM(unit_price*quantity) FROM walmart GROUP BY 1 ORDER By 2 DESC;<br>
   **High Revenue vs. Low Revenue Transactions**<br>
      SELECT CASE WHEN (quantity * unit_price) > 500  THEN 'high reveue'<br>
			else 'low revenue' end as revenue,<br>
				COUNT(*) as trans,<br>
                COUNT(*) * 100/(SELECT COUNT(*) FROM walmart) as percentage<br>
                FROM sales<br>
                GROUP BY revenue;<br>
   **Effect of Quantity Purchased on Revenue**<br>
      SELECT quantity,SUM(unit_price*quantity) revenue FROM sales GROUP BY 1 ORDER BY revenue DESC;<br>
   **Customer Purchase Behavior**<br>
      SELECT category,COUNT(*) FROM sales GROUP BY category;<br>
   **Store Performance Analysis**<br>
      SELECT MIN(unit_price*quantity) lowest_revenue,MAX(unit_price*quantity) highest_revenue FROM sales;<br>
