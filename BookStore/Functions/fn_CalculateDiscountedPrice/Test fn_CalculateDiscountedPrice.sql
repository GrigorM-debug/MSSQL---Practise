USE BookStoreDB

DECLARE @OriginalPrice DECIMAL(19,4)
SET @OriginalPrice = (SELECT b.Price FROM Books b WHERE b.BookID = 1)

SELECT dbo.fn_CalculateDiscountedPrice(@OriginalPrice, 10) AS DiscountedPrice;