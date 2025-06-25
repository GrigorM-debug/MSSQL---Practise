CREATE TRIGGER TRG_DeletingOrder_Logging
ON Orders
AFTER DELETE
AS 
BEGIN
	INSERT INTO OrderDeleteLog (OrderID, CustomerID, Amount, DeletedBy, Reason)
		SELECT
			deleted.OrderID, 
			deleted.CustomerID, 
			deleted.Amount, 
			'system user', 
			'Manual deletion'  
		FROM deleted 
END