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
Query : [Total_sales_revenue](01_total_sales_revenue.sql)

### Avg order value
Query : [Avg_order_value](02_avg_order_value.sql)

### Month over month revenue
Query : [Month_over_revenue](03_month_over_month_revenue.sql)

### Highest and Lowest revenue months
Query : [Highest_and_Lowest_revenue_months](04_highest_lowest_revenue_months.sql)

### Category wise revenue
Query : [Category_wise_revenue](05_category_wise_revenue.sql)
Query : [Category_wise_revenue_yearly](05a_category_wise_revenue_yearly.sql)

### Subcategory wise revenue
Query : [Subcategory_wise_revenue](06_subcategory_wise_revenue.sql)

### High quantity low revenue
Query : [High_quantity_low_revenue](07_high_quantity_low_revenue.sql)

### Highest spending customers
Query : [Highest_spending_customers](08_highest_spending_customer.sql)

### Single order vs multiple order customers
Query : [Single_order_vs_multiple_order_customers](09_single_order_vs_multiple_order.sql)

### Revenue by age group
Query : [Revenue_by_age_group](10_revenue_by_age_group.sql)

### View
Query : [View](11_view.sql)

### Customer segmentation
Query : [Customer_segmentation](12_customer_segmentation..sql)

### Cohort analysis
Query : [Cohort_analysis](13_cohort_analysis.sql)

### Churned customers
Query : [Churned_customers](14_churned_customers.sql)

### Country wise revenue
Query : [Country_wise_revenue](15_country_wise_revenue.sql)

### State wise revenue
Query : [State_wise_revenue](16_state_wise_revenue.sql)


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
