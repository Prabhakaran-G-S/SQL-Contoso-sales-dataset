# Contoso_Sales_Analysis (SQL)

## 📌 Project Overview
This project analyzes the Contoso sales dataset covering January 2015 to April 2024 using PostgreSQL. It explores revenue trends, product and category performance, customer purchasing patterns, and sales growth over time to uncover business insights and evaluate performance across different dimensions.

## Dataset  Highlights

- **Dataset** : Contoso Sales Dataset
- **Tables Used** : Customer, Product, Sales, Date, Store, Currency Exchange
- **Records**:  More than 190,000 rows across multiple years

## Business Questions Answered

### Sales performance 
- What is total sales revenue?
- What is the average order value?
- How does revenue change month over month?
- Which months have the highest and lowest revenue?

### Product performance 
- Which categories and subcategories perform best?
- Which products sell in high quantities but generate relatively little revenue?
- How concentrated is revenue among top-selling products?

### Customer analysis 
- Who are the highest-spending customers?
- What percentage of customers place only one order vs repeat orders?
- Which age groups contribute the most revenue?
- **Customer Segmentation:** Who are our most valuable customers?
- **Cohort Analysis:** How do different customer groups generate revenue?
- **Retention Analysis:** Which customers haven't purchased recently?

### Geographic analysis 
- Which countries and states generate the highest revenue?

### Total sales revenue


## SQL Concepts Used

### Fundamental SQL
- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `DISTINCT`
- Aggregate functions: `SUM()`, `COUNT()`, `MIN()`, `MAX()`, `AVG()`
- Type casting using `::NUMERIC`

###  Joins and Subqueries
- `INNER JOIN`, Common Table Expressions (CTEs) 

### Window Functions
- `ROW_NUMBER()`, `LAG()`, `MIN() OVER()`, `MAX() OVER()`, `SUM() OVER()`, `PERCENTILE_CONT()`, `PARTITION BY`

### Conditional Logic 
- `CASE WHEN`, Conditional aggregation
- Date Analysis: `INTERVAL`, `EXTRACT()`
- Calculations:  `NULLIF()`, `ROUND()`
- Data transformation  `VIEW `, `TRIM()` and `CONCAT()`
