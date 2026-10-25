WITH sales_year_units AS(
SELECT
    d.year,
    p.productname,
    p.categoryname,
    p.subcategoryname,
    ROUND(SUM((s.netprice :: NUMERIC * s.quantity) / s.exchangerate :: NUMERIC),0) AS sales_revenue,
    SUM(s.quantity) AS units_sold
FROM sales s
INNER JOIN product p
    ON p.productkey = s.productkey
INNER JOIN date d
    ON d.date = s.orderdate
GROUP BY
    d.year,
    p.productname,
    p.categoryname,
    p.subcategoryname)
SELECT
    year,
    categoryname,
    SUM(sales_revenue) AS total_sales_revenue
FROM    
    sales_year_units
GROUP BY year, categoryname
ORDER BY categoryname, year
