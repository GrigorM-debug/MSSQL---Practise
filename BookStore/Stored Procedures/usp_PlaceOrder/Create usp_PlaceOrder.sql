CREATE PROCEDURE usp_PlaceOrder @CustomerID INT, @ParBookType BookType READONLY, @Quantity INT
AS
BEGIN
	BEGIN TRY
		IF(@CustomerID IS NULL)
		THROW 50010, 'CustomerID can not be null!', 1; 

		--Check if customer exists
		DECLARE @IsCustomerExisting BIT = (SELECT dbo.fn_IsCustomerExistingByCustomerID(@CustomerID))
		If(@IsCustomerExisting = 0)
			BEGIN
				THROW 50010, 'Customer does not exists!', 1; 
			END

		--Check if book/s exists
		IF NOT EXISTS (
			SELECT tvp.BookID
			FROM @ParBookType AS tvp
			LEFT JOIN Books AS b ON tvp.BookID = b.BookID
			WHERE b.BookID IS NULL
		)
			BEGIN
				THROW 50010, 'One or more requested books do not exist!', 1; 
			END

		--Check for insufficient stock
		IF EXISTS (
			SELECT tvp.BookID
			FROM @ParBookType AS tvp
			LEFT JOIN Books AS b ON tvp.BookID = b.BookID
			WHERE b.StockQuantity < @Quantity
		)
			BEGIN
				THROW 50010, 'Insufficient stock for one or more books!', 1; 
			END

		--Create new Order
		BEGIN
			
			INSERT INTO Orders (OrderDate, TotalAmount, OrderStatus, CustomerID)
				SELECT 
					GETDATE(),
					b.Price * @Quantity,
					'In Progress',
					@CustomerID
				FROM Books b
				JOIN @ParBookType AS pt ON b.BookID = pt.BookID
		END

		--Update the book/s stock quantity
		BEGIN
			UPDATE b
			SET b.StockQuantity = b.StockQuantity - @Quantity
			FROM Books b
			JOIN @ParBookType AS pt ON b.BookID = pt.BookID;
		END

		--Add OrderItems
		BEGIN 
			INSERT INTO OrderItems (Quanity, UnitPriceAtTimeOfTheOrder, BookID, OrderID)
				SELECT @Quantity, 
					b.Price, 
					b.BookID, 
					o.OrderID 
				FROM Books b 
				JOIN @ParBookType AS pt ON b.BookID = pt.BookID
				JOIN Orders o ON o.CustomerID = o.CustomerID
		END

		COMMIT TRANSACTION
		PRINT 'Order succesfully placed'
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		THROW
	END CATCH
END