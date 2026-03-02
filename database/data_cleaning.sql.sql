USE IndustrialSalesDB;
GO

--INSERT DATA TEST 
INSERT INTO customers (customer_id, customer_name, zone_id, join_date)
VALUES (999, NULL, 1, '2024-01-01');

-- 1. Xử lý NULL customer_name
UPDATE customers
SET customer_name = 'Unknown'
WHERE customer_name IS NULL;


select * from [dbo].[products] ;

-- 2. Xóa duplicate orders
WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY order_id) AS rn
    FROM orders
)
DELETE FROM cte WHERE rn > 1;

-- 3. Chuẩn hóa category thành UPPER
UPDATE products
SET category = UPPER(category);

-- 4. Xóa quantity <= 0
DELETE FROM order_details
WHERE quantity <= 0;

-- 5. Xóa price <= 0
DELETE FROM products
WHERE price <= 0;