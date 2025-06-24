CREATE PROCEDURE GetActiveCustomers 
	@MinOrdersCount INT,
	@Country NVARCHAR(50)
AS
	IF(@MinOrdersCount IS NULL OR @MinOrdersCount = 0)
		THROW 70001, 'MinOrdersCount: Cannot be zero or null' , 1;

	IF(@Country IS NULL OR @Country = '')
		THROW 70001, 'Country: Cannot be null or empty' , 1;

	SELECT 
		Customers.CustomerID,
		Customers.CustomerName,
		Customers.Country,
		COUNT(*) AS TotalOrders,
		SUM(Orders.Amount) AS TotalAmount
	FROM Customers
	LEFT JOIN Orders ON Orders.CustomerID = Customers.CustomerID
	GROUP BY Customers.Country, Customers.CustomerID, Customers.CustomerName
	HAVING COUNT(*) >= @MinOrdersCount AND Customers.Country = @Country
GO
