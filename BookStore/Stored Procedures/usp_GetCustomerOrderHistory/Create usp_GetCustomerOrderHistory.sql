CREATE PROCEDURE usp_GetCustomerOrderHistory @CustomerID INT
AS
BEGIN
	IF (@CustomerID IS NULL)
		THROW 51000, 'CustomerID can not be null!', 1;

	DECLARE @IsCustomerExisting BIT
	SET @IsCustomerExisting = SELECT dbo.fn_CustomerExistingByCustomerID(@CustomerID)

	IF(@IsCustomerExisting = 0)
		THROW 51000, 'TCustomer does not exists!', 1;

	SELECT
		b.Title AS BookTitle,
		oi.Quanity,
		oi.UnitPriceAtTimeOfTheOrder
	FROM Orders o
	JOIN OrderItems oi ON o.OrderID = oi.OrderID
	JOIN Books b ON oi.BookID = b.BookID
	WHERE o.CustomerID = @CustomerID
END