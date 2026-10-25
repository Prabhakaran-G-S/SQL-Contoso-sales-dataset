WITH customer_lifetime_value AS(
    SELECT  
        customerkey,
        cleaned_name,
        SUM(total_net_revenue) AS lifetime_revenue
    FROM    
        cohort_analysis
    GROUP BY
        customerkey, cleaned_name),
customer_segments AS(
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY lifetime_revenue) AS percentile_25th,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY lifetime_revenue) AS percentile_75th 
    FROM
        customer_lifetime_value),
segment_values AS(
    SELECT
        c.*,
        CASE WHEN c.lifetime_revenue <= cs.percentile_25th THEN '1 - Low Value'
             WHEN c.lifetime_revenue <= cs.percentile_75th THEN '2 - Mid Value'
        ELSE '3 - High Value' END AS customer_segment
        FROM customer_lifetime_value c,
            customer_segments cs)
SELECT
    customer_segment,
    COUNT(customerkey) AS customer_count,
    SUM(lifetime_revenue) AS revenue,
    SUM(lifetime_revenue) / COUNT(customerkey) AS avg_revenue
FROM
    segment_values
GROUP BY customer_segment
ORDER BY customer_segment DESC
