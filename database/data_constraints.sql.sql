USE IndustrialSalesDB;
GO

-- Price phải > 0
ALTER TABLE products
ADD CONSTRAINT chk_price CHECK (price > 0);

-- Cost >= 0
ALTER TABLE products
ADD CONSTRAINT chk_cost CHECK (cost >= 0);

-- Quantity > 0
ALTER TABLE order_details
ADD CONSTRAINT chk_quantity CHECK (quantity > 0);

-- Order date không được > ngày hiện tại
ALTER TABLE orders
ADD CONSTRAINT chk_order_date CHECK (order_date <= GETDATE());