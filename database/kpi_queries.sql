 USE IndustrialSalesDB;
GO

SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id;

SELECT 
    FORMAT(o.order_date, 'yyyy-MM') AS month,
    SUM(od.quantity * p.price) AS revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY FORMAT(o.order_date, 'yyyy-MM')
ORDER BY month;

SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_order_details FROM order_details;