
DECLARE @startId INT;

SELECT @startId = ISNULL(MAX(order_id),0) FROM orders;

;WITH Numbers AS (
    SELECT TOP 8000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects a
    CROSS JOIN sys.all_objects b
)
INSERT INTO orders (order_id, customer_id, order_date)
SELECT 
    @startId + n,
    ABS(CHECKSUM(NEWID())) % 5 + 1,
    DATEADD(DAY, n % 720, '2023-01-01')
FROM Numbers;


DECLARE @startDetailId INT;

SELECT @startDetailId = ISNULL(MAX(order_detail_id),0) FROM order_details;

;WITH Numbers AS (
    SELECT TOP 20000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects a
    CROSS JOIN sys.all_objects b
)
INSERT INTO order_details (order_detail_id, order_id, product_id, quantity)
SELECT
    @startDetailId + n,
    o.order_id,
    ABS(CHECKSUM(NEWID())) % 5 + 1,
    ABS(CHECKSUM(NEWID())) % 200 + 1
FROM Numbers
CROSS APPLY (
    SELECT TOP 1 order_id FROM orders ORDER BY NEWID()
) o;