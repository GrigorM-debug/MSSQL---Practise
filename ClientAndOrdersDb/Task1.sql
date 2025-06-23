USE ClientsAndOrdersDb;

SELECT
	Customers.CustomerName,
	COUNT(*) AS OrdersTotalCount,
 	SUM(Orders.Amount) AS OrdersTotalSum
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY CustomerName
ORDER BY OrdersTotalSum ASC;