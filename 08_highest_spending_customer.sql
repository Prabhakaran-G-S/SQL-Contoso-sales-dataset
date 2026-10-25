SELECT
    CONCAT(c.givenname,' ',c.surname) AS customername,
    ROUND(SUM((s.netprice :: NUMERIC * s.quantity) / s.exchangerate :: NUMERIC), 2) AS sales_revenue
FROM
    sales s
INNER JOIN customer c ON s.customerkey = c.customerkey
GROUP BY s.customerkey, C.givenname, C.surname
ORDER BY sales_revenue DESC
LIMIT 10
