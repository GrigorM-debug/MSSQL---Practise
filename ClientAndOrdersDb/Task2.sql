USE ClientsAndOrdersDb;

SELECT
	Customers.CustomerName,
	COUNT(*) AS OrdersTotalCount,
 	SUM(Orders.Amount) AS OrdersTotalSum
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderDate > '2024-01-01'
GROUP BY CustomerName
ORDER BY OrdersTotalSum ASC;