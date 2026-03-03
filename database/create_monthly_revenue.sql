select*from [dbo].[fact_sales] ;

USE IndustrialSalesDB;
GO

DROP TABLE monthly_revenue;

---update data type  date 
SELECT 
    DATEFROMPARTS(YEAR(o.order_date), MONTH(o.order_date), 1) AS month,
    SUM(od.quantity * p.price) AS total_revenue,
    SUM(od.quantity * (p.price - p.cost)) AS total_profit,
    SUM(od.quantity) AS total_quantity
INTO monthly_revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY DATEFROMPARTS(YEAR(o.order_date), MONTH(o.order_date), 1)
ORDER BY month;
