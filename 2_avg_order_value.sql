SELECT
    ROUND(SUM((netprice::NUMERIC * quantity) / exchangerate::NUMERIC)
        / COUNT(DISTINCT orderkey), 2 ) AS avg_order_value
FROM sales;
