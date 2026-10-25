WITH product_performance AS (
    SELECT
        p.productkey,
        p.productname,
        SUM(s.quantity) AS ordered_qty,
        SUM(
            (s.netprice::NUMERIC * s.quantity)
            / s.exchangerate::NUMERIC
        ) AS sales_revenue
    FROM sales s
    INNER JOIN product p
        ON s.productkey = p.productkey
    GROUP BY p.productkey, p.productname
),
ranked_products AS (
    SELECT
        *,
        PERCENT_RANK() OVER (ORDER BY ordered_qty) AS quantity_rank,
        PERCENT_RANK() OVER (ORDER BY sales_revenue) AS revenue_rank
    FROM product_performance
)
SELECT
    productname,
    ordered_qty,
    ROUND(sales_revenue, 2) AS sales_revenue
FROM ranked_products
WHERE quantity_rank >= 0.80
  AND revenue_rank <= 0.20
ORDER BY ordered_qty DESC;
