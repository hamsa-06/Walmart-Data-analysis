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
          SELECT DISTINCT invoice_id,COUNT(*) FROM walmart GROUP BY invoice_id HAVING COUNT(*) > 1;
       **Remove Dollar Sign from Unit Price**
         UPDATE sales
         SET unit_price = REPLACE(unit_price,'$','')
         WHERE unit_price LIKE '$%';
