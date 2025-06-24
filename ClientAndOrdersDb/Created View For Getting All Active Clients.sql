
CREATE VIEW ActiveClients
AS
	SELECT
		Customers.CustomerID,
		Customers.CustomerName,
		Customers.Country,
		MAX(Orders.OrderDate) AS LastOrderDate
	FROM Customers
	JOIN Orders ON Orders.CustomerID = Customers.CustomerID
	WHERE Orders.OrderDate >= DATEADD(YEAR, -1, DATEADD(MONTH, DATEDIFF(MONTH, '19000101', GETDATE()), '19000101'))
	GROUP BY Customers.CustomerID, Customers.CustomerName, Customers.Country
	HAVING COUNT(*) >= 1