DECLARE @VarBookType BookType

INSERT INTO @VarBookType
VALUES 
(1),
(2)

EXEC usp_PlaceOrder @CustomerID = 4, @ParBookType = @VarBookType, @Quantity = 1

DELETE FROM @VarBookType;