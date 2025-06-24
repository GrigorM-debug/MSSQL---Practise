USE ClientsAndOrdersDb;

SELECT
	Customers.CustomerName,
	COUNT(*) AS TotalOrders,
	ISNULL(SUM(Orders.Amount), 0) AS TotalAmount
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY CustomerName
HAVING COUNT(*) >= 2