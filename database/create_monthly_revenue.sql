USE IndustrialSalesDB;
GO

IF OBJECT_ID('monthly_revenue', 'U') IS NOT NULL
DROP TABLE monthly_revenue;
GO

SELECT 
    FORMAT(order_date,'yyyy-MM') AS month,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
INTO monthly_revenue
FROM fact_sales
GROUP BY FORMAT(order_date,'yyyy-MM');
GO

--test
SELECT * FROM monthly_revenue ORDER BY month;