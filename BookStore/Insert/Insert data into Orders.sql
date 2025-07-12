USE BookStoreDB;

INSERT INTO Orders (OrderDate, TotalAmount, OrderStatus, CustomerID)
VALUES 
	('2025-06-20 10:00:00', 75.50, 'Completed', 1),
    ('2025-06-22 14:30:00', 120.00, 'Processing', 2),
    ('2025-06-25 09:15:00', 45.99, 'Shipped', 1),
    ('2025-06-28 11:00:00', 200.75, 'Completed', 3),
    ('2025-07-01 16:45:00', 99.00, 'Pending', 2);
