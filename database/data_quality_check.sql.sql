USE IndustrialSalesDB;
GO

-- 1. Kiểm tra NULL quan trọng
SELECT * FROM customers WHERE customer_name IS NULL;
SELECT * FROM products WHERE price IS NULL OR cost IS NULL;
SELECT * FROM orders WHERE order_date IS NULL;
SELECT * FROM order_details WHERE quantity IS NULL;


-- 2. Kiểm tra duplicate
SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT order_detail_id, COUNT(*)
FROM order_details
GROUP BY order_detail_id
HAVING COUNT(*) > 1;

-- 3. Kiểm tra giá trị âm
SELECT * FROM products WHERE price <= 0 OR cost < 0;
SELECT * FROM order_details WHERE quantity <= 0;

-- 4. Kiểm tra orphan records (FK sai)
SELECT * 
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.order_id
WHERE o.order_id IS NULL;