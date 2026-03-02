USE IndustrialSalesDB;
GO

-- Nếu tồn tại thì xóa để rebuild
IF OBJECT_ID('fact_sales', 'U') IS NOT NULL
DROP TABLE fact_sales;
GO

-- tạo table 
CREATE TABLE fact_sales (
    order_id INT,
    order_date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(18,2),
    cost DECIMAL(18,2),
    revenue DECIMAL(18,2),
    profit DECIMAL(18,2)
);
GO

-- insert data 
INSERT INTO fact_sales
SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    p.product_id,
    od.quantity,
    p.price,
    p.cost,
    (od.quantity * p.price) AS revenue,
    (od.quantity * (p.price - p.cost)) AS profit
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id;
GO

select * from fact_sales ;
-- create index
CREATE INDEX idx_fact_sales_date ON fact_sales(order_date);
CREATE INDEX idx_fact_sales_product ON fact_sales(product_id);
CREATE INDEX idx_fact_sales_customer ON fact_sales(customer_id);
 


SELECT COUNT(*) FROM fact_sales;
SELECT TOP 10 * FROM fact_sales;

