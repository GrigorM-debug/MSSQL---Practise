CREATE TRIGGER trg_UpdateStockAfterOrderItemInsert
ON OrderItems
AFTER INSERT
AS
BEGIN 
	DECLARE @BookID INT = (SELECT i.BookID FROM inserted AS i)
	DECLARE @Quantity INT = -(SELECT i.Quanity FROM inserted AS i) 
	EXEC usp_UpdateBookStock @BookID = @BookID, @QuantityChange = @Quantity
END
	