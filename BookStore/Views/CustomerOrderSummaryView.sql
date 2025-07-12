CREATE VIEW CustomerOrderSummaryView AS
SELECT
	c.CustomerID,
	c.FirstName AS CustomerFirstName,
	c.LastName AS CustomerLastName,
	o.OrderID,
	o.OrderDate,
	o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
