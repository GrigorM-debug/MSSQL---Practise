CREATE PROCEDURE usp_UpdateBookStock @BookID INT, @QuantityChange INT
AS 
BEGIN
	IF(@BookID IS NULL)
		THROW 51000, 'BookID can not be null', 1;

	--Check if the book exists
	DECLARE @IsBookExisting BIT = (SELECT dbo.fn_BookExistingByBookID(@BookID))
	IF(@IsBookExisting = 0)
		THROW 51000, 'Book does not exists', 1;

	--Negative means decreasing the quantity in stock
	IF(@QuantityChange < 0)
		BEGIN
			UPDATE Books 
			SET StockQuantity -= @QuantityChange 
			WHERE  
				BookID = @BookID  
				AND StockQuantity >= Abs(@QuantityChange);  
			IF @@ROWCOUNT = 0 THROW 50000, 'Insufficient quantity available', 0; 
		END
	--Positive means add quantity in stock -> Re-stock
	ELSE
		BEGIN
			UPDATE Books
			SET StockQuantity += @QuantityChange  
			WHERE BookID = BookID  
		END
END