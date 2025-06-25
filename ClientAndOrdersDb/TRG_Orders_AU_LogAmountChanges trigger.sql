CREATE TRIGGER TRG_Orders_AU_LogAmountChanges
ON Orders
AFTER UPDATE 
AS
BEGIN
	DECLARE @CurrentDate DATETIME
	
	SET @CurrentDate = GETDATE()

	--If thre is change in amount we log the change
	IF EXISTS (
		SELECT 1 FROM deleted 
		JOIN inserted ON inserted.OrderID = deleted.OrderID
		WHERE deleted.Amount <> inserted.Amount
	)
		INSERT INTO OrderAuditLog(OrderID, OldAmount, NewAmount, ChangedAt, ChangeBy)
		SELECT inserted.OrderID, deleted.Amount, inserted.Amount, @CurrentDate, 'system' FROM inserted LEFT JOIN deleted ON deleted.OrderID = inserted.OrderID
END