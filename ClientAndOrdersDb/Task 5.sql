ALTER PROCEDURE SelectCustomersWithOrdersByCountry
	@Country NVARCHAR(50)
AS
	IF(@Country IS NULL OR @Country = '')
		THROW 70001, 'Country parameter is required.', 1;

	SELECT 
		Customers.CustomerID,	
		Customers.CustomerName,
		Customers.Country,
		SUM(Orders.Amount) AS OrdersTotalSum,
		GETDATE() AS CurrentDate
	FROM Customers
	JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	WHERE Country = @Country
	GROUP BY Customers.CustomerID, Customers.CustomerName, Customers.Country;
GO