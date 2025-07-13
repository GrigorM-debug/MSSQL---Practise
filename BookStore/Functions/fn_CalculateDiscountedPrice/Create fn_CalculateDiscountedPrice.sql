CREATE FUNCTION fn_CalculateDiscountedPrice (@OriginalPrice DECIMAL(19, 4), @DiscountPercentage INT)
RETURNS DECIMAL(19,4)
AS 
BEGIN
	DECLARE @DiscountedPrice DECIMAL(19,4)
	SET @DiscountedPrice = @OriginalPrice * ( 100.0 - @DiscountPercentage ) / 100.0
	
	RETURN @DiscountedPrice
END