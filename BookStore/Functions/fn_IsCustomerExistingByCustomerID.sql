CREATE FUNCTION fn_CustomerExistingByCustomerID(@CustomerID INT)
RETURNS BIT
AS
	BEGIN
		DECLARE @IsCustomerExisting BIT = 0

		IF EXISTS (SELECT 1 FROM Customers c WHERE c.CustomerID = @CustomerID)
			SET @IsCustomerExisting = 1
		ELSE 
			SET @IsCustomerExisting = 0

		RETURN @IsCustomerExisting
	END