SELECT
    c.countryfull AS country_name,
   ROUND(SUM((s.netprice :: NUMERIC * s.quantity) / s.exchangerate :: NUMERIC), 1) AS sales_revenue
FROM
    sales s
INNER JOIN customer c ON c.customerkey = s.customerkey
GROUP BY countryfull
ORDER BY sales_revenue DESC
