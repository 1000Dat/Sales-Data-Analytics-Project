USE IndustrialSalesDB;
GO

INSERT INTO industrial_zones VALUES
(1, 'Quang Minh IZ', 'North'),
(2, 'Thang Long IZ', 'North'),
(3, 'VSIP Bac Ninh', 'North'),
(4, 'Dinh Vu IZ', 'North');

INSERT INTO customers VALUES
(1, 'Samsung Electronics', 3, '2023-01-15'),
(2, 'Canon Vietnam', 2, '2023-03-10'),
(3, 'Foxconn', 1, '2023-02-20'),
(4, 'LG Display', 4, '2023-04-01'),
(5, 'VinFast Supplier', 1, '2023-05-12');

INSERT INTO products VALUES
(1, 'Industrial Sensor', 'Electronics', 120, 80),
(2, 'Control Board', 'Electronics', 250, 180),
(3, 'Steel Component', 'Mechanical', 75, 50),
(4, 'Hydraulic Pump', 'Mechanical', 400, 300),
(5, 'Packaging Material', 'Supply', 30, 15);