CREATE TRIGGER TRG_AddingNewOrder_Amount_Validation
ON Orders
INSTEAD OF INSERT
AS 
BEGIN 
	IF EXISTS (
			SELECT 1 FROM inserted WHERE inserted.Amount > 10000
		)
		BEGIN
			INSERT INTO RejectedOrdersLog(CustomerID, AttemptedAmount, Reason)
				SELECT 
					inserted.CustomerID, 
					inserted.Amount, 
					'Order amount cannot exceed 10,000.' 
					FROM inserted 
					WHERE inserted.Amount > 10000;

			THROW 51000, 'One or more order amounts exceeded 10,000. No orders from this batch were inserted into the Orders table.', 1;
		END
	ELSE 
		BEGIN
			INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
				SELECT 
					inserted.OrderID, 
					inserted.CustomerID, 
					inserted.OrderDate, 
					inserted.Amount 
				FROM inserted
		END
END