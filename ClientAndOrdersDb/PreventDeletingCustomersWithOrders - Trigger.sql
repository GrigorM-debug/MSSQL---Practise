
CREATE TRIGGER PreventDeletingCustomersWithOrders
ON Customers
INSTEAD OF DELETE
AS
BEGIN
	IF EXISTS(
			SELECT 1 FROM Customers JOIN Orders ON Orders.CustomerID = Customers.CustomerID
			)
		THROW 51000, 'Cannot delete customer with existing orders', 1;
END