WITH products_sold AS (
    SELECT
        p.productkey,
        p.productname,
        p.categoryname,
        p.subcategoryname,
        SUM((s.netprice::NUMERIC * s.quantity) / NULLIF(s.exchangerate::NUMERIC, 0)) AS sales_revenue,
        SUM(s.quantity) AS units_sold
    FROM sales s
    INNER JOIN product p
        ON p.productkey = s.productkey
    GROUP BY
        p.productkey, p.productname, p.categoryname, p.subcategoryname),
categorywise_revenue AS (
    SELECT
        categoryname,
        SUM(units_sold) AS units_sold,
        SUM(sales_revenue) AS category_revenue
    FROM products_sold
    GROUP BY categoryname
)
SELECT
    categoryname,
    units_sold,
    ROUND(category_revenue ::NUMERIC, 1) AS category_revenue
FROM categorywise_revenue
ORDER BY category_revenue DESC;
