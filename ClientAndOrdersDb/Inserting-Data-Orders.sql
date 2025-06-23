USE ClientsAndOrdersDb;

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES 
	(101, 1, '2024-02-10', 120.50),
	(102, 1, '2024-05-15', 230.00),
	(103, 2, '2023-12-22', 85.00),
	(104, 3, '2024-01-05', 300.00),
	(105, 3, '2024-06-01', 150.00),
	(106, 4, '2024-03-30', 50.00);