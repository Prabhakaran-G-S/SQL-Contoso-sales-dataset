SELECT  
   CONCAT('$',ROUND(SUM((quantity * netprice)/exchangerate / 1000000) :: NUMERIC, 2), 'M') AS total_sales_revenue
FROM    
    sales
