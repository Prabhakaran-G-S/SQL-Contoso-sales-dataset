WITH age_group AS(
SELECT
    SUM((s.netprice :: NUMERIC * s.quantity) / s.exchangerate :: NUMERIC) AS sales_revenue,
    c.age
FROM
    sales s
INNER JOIN customer c ON c.customerkey = s.customerkey
GROUP BY c.age), grouping_age AS(
SELECT
    CASE WHEN age <=15 THEN '0 - 15'
         WHEN age <=30 THEN '16 - 30'
         WHEN age <=45 THEN '31 - 45'
         WHEN age <=60 THEN '46 - 60'
         WHEN age <=75 THEN '61 - 75'
         ELSE '> 75' END AS age_group,
    sales_revenue
FROM
    age_group)
SELECT
    age_group,
    ROUND(SUM(sales_revenue), 1) as total_revenue
FROM
    grouping_age
GROUP BY age_group
ORDER BY MIN(
    CASE age_group 
        WHEN '0 - 15' THEN 1
        WHEN '16 - 30' THEN 2
        WHEN '31 - 45' THEN 3
        WHEN '46 - 60' THEN 4
        WHEN '61 - 75' THEN 5
    ELSE 6 END
)
