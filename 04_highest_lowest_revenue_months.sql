WITH year_month_total_revenue AS (
SELECT
    d.year,
    d.yearmonthshort,
    SUM((s.quantity * s.netprice) / s.exchangerate) AS total_sales_revenue
FROM    
    sales s
INNER JOIN date d ON d.date = s.orderdate
GROUP BY d.year, d.yearmonthshort, d.yearmonthnumber
),min_max_revenue AS(
SELECT
    year,
    yearmonthshort,
    total_sales_revenue,
    MIN(total_sales_revenue) OVER (PARTITION BY year) AS minimum_rev,
    MAX(total_sales_revenue) OVER (PARTITION BY year) AS maximum_rev
FROM
    year_month_total_revenue)
SELECT 
    year,
    MAX(CASE WHEN total_sales_revenue = minimum_rev THEN yearmonthshort END) AS lowest_revenue_month,
    MAX(CASE WHEN total_sales_revenue = maximum_rev THEN yearmonthshort END) AS highest_revenue_month
FROM    
    min_max_revenue
GROUP BY year
ORDER BY year
