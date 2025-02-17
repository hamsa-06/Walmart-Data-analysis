CREATE DATABASE Walmart;
Use Walmart;
Create table sales(
 invoice_id int,
 Branch varchar(30),
 City varchar(40),
 category varchar(40),
 unit_price varchar(20),
 quantity int,
 date date,
 time time,
 payment_method varchar(30),
 rating float,
 rating_margin float);
 
 Use Walmart;
SELECT * FROM walmart;
 Use Walmart;
 
 /*Identify duplicate records based on invoice_id*/
 SELECT DISTINCT invoice_id,COUNT(*) FROM walmart GROUP BY invoice_id HAVING COUNT(*) > 1;
 
 /*Top-Selling Products*/
SELECT invoice_id,Branch,City,category,unit_price,quantity,ROUND(unit_price*quantity,2) sales_price,date,time,rating FROM walmart  ORDER BY sales_price DESC LIMIT 10; 
/*Total Revenue Per Branch*/
SELECT Branch,SUM(unit_price*quantity) revenue FROM walmart GROUP BY Branch ORDER BY revenue DESC;
/*Best-Selling Category*/
SELECT category,SUM(quantity) total_quantity FROM walmart GROUP BY category ORDER BY total_quantity DESC LIMIT 1;
/*Peak Sales Hours*/
SELECT HOUR(time) AS sales_hour, COUNT(*) AS total_transactions FROM sales GROUP BY sales_hour ORDER BY total_transactions DESC LIMIT 1;
/*Average Customer Rating Per Branch*/
SELECT branch,AVG(rating) avg_rating FROM walmart GROUP BY branch ORDER BY 2 DESC;
/*Impact of Rating Margin on Sales*/
SELECT rating_margin,SUM(quantity*unit_price) total_sales FROM walmart GROUP BY rating_margin ORDER BY rating_margin DESC;
/*Preferred Payment Method*/
SELECT COUNT(*) cnt,payment_method FROM walmart GROUP BY payment_method ORDER BY cnt DESC LIMIT 1;
/*City-Wise Revenue Comparison*/
SELECT city,SUM(unit_price*quantity) revenue FROM walmart GROUP BY 1 ORDER BY revenue DESC;
/*Seasonal Sales Trends*/
SELECT MONTH(date) month_sales,SUM(unit_price*quantity) FROM walmart GROUP BY 1 ORDER By 2 DESC;
/* High Revenue vs. Low Revenue Transactions*/
SELECT CASE WHEN (quantity * unit_price) > 500  THEN 'high reveue'
			else 'low revenue' end as revenue,
				COUNT(*) as trans,
                COUNT(*) * 100/(SELECT COUNT(*) FROM walmart) as percentage
                FROM walmart
                GROUP BY revenue;
/*Effect of Quantity Purchased on Revenue*/
SELECT quantity,SUM(unit_price*quantity) revenue FROM walmart GROUP BY 1 ORDER BY revenue DESC;
/*Customer Purchase Behavior*/
SELECT category,COUNT(*) FROM walmart GROUP BY category;
/*Store Performance Analysis*/
SELECT MIN(unit_price*quantity) lowest_revenue,MAX(unit_price*quantity) highest_revenue FROM walmart;

SELECT category,MAX(unit_price*quantity) highest_demand FROM walmart GROUP BY category;

