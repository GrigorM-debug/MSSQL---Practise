
CREATE PROCEDURE SelectCustomersWithOrdersByCountry
	@Country NVARCHAR(50)
AS
	SELECT 
		Customers.CustomerID,	
		Customers.CustomerName,
		Customers.Country,
		SUM(Orders.Amount) AS OrdersTotalSum
	FROM Customers
	JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	WHERE Country = @Country
	GROUP BY Customers.CustomerID, Customers.CustomerName, Customers.Country;
GO
