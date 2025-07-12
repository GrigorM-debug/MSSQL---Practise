--You already have INSTEAD OF INSERT trigger on this table
CREATE TRIGGER TRG_Orders_AI_PreventDuplicateAmountIn7Days
ON Orders
INSTEAD OF INSERT
AS 
BEGIN
	IF EXISTS (
			SELECT 1 
			FROM Orders 
			JOIN inserted ON inserted.CustomerID = Orders.CustomerID
			WHERE Orders.OrderDate >= DATEADD(day,-7, GETDATE()) AND Orders.Amount = inserted.Amount 
		)
		BEGIN 
			INSERT INTO RejectedOrdersLog(CustomerID, AttemptedAmount, Reason)
				SELECT 
					inserted.CustomerID, 
					inserted.Amount, 
					'Order with this amount already exists for this user' 
				FROM Orders 
				JOIN inserted ON inserted.CustomerID = Orders.CustomerID
				WHERE Orders.OrderDate >= DATEADD(day,-7, GETDATE()) AND Orders.Amount = inserted.Amount;
				
			THROW 51000, 'Order with this amount already exists for this user', 1;
		END
	ELSE 
		BEGIN
			--I did this because we forget to add IDENTITY in OrderID
			DECLARE @OrderId INT
			SET @OrderId = FLOOR(RAND()*(2000-10+1))+10;

			DECLARE @CurrentDate DATE
			SET @CurrentDate = CONVERT(DATE, GETDATE())

			INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
				SELECT 
					@OrderId,
					inserted.CustomerID, 
					@CurrentDate,
					inserted.Amount
				FROM inserted
		END
END