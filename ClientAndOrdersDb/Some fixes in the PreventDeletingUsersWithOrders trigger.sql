ALTER TRIGGER PreventDeletingCustomersWithOrders
ON Customers
INSTEAD OF DELETE
AS
BEGIN
	IF EXISTS(
			SELECT 1 FROM deleted JOIN Orders ON Orders.CustomerID = deleted.CustomerID
			)
		THROW 51000, 'Cannot delete customer with existing orders', 1;
	ELSE
		DELETE FROM Customers
		WHERE Customers.CustomerID IN (SELECT CustomerID FROM deleted);
END