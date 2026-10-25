WITH repeated_order AS(
SELECT
    CONCAT(c.givenname,' ',c.surname) AS customername,
    COUNT(DISTINCT s.orderkey) AS order_count
FROM
    sales s
INNER JOIN customer c ON s.customerkey = c.customerkey
GROUP BY s.customerkey, C.givenname, C.surname
)
SELECT
    ROUND(SUM(CASE WHEN order_count = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(order_count), 2) AS single_order_pct,
    ROUND(SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(order_count), 2) AS repeated_order_pct
FROM
    repeated_order
