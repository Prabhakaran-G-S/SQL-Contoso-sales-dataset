WITH total_sales_revenue AS(
SELECT 
    d.year,
    d.yearmonthshort,
    d.yearmonthnumber,
    ROUND(SUM((s.netprice :: NUMERIC * s.quantity)/  s.exchangerate :: NUMERIC), 2)  AS sales_revenue
FROM    
    sales s
INNER JOIN date d ON s.orderdate = d.date
GROUP BY d.year, d.yearmonthshort, d.yearmonthnumber),
monthly_rev AS(
SELECT
    year,
    yearmonthshort,
    yearmonthnumber,
    sales_revenue,
    LAG(sales_revenue) OVER (ORDER BY yearmonthnumber) AS previous_month_revenue
FROM    
    total_sales_revenue)
SELECT
    yearmonthshort,
    sales_revenue,
    previous_month_revenue,
    ROUND(100.0 *(sales_revenue - previous_month_revenue)/previous_month_revenue, 2)  AS change_pct
FROM
    monthly_rev
ORDER BY year, yearmonthnumber;
