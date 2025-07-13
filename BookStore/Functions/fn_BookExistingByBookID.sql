CREATE FUNCTION fn_BookExistingByBookID(@BookID INT)
RETURNS BIT
AS 
BEGIN 
	DECLARE @IsBookExisting BIT = 0

	IF EXISTS (SELECT 1 FROM Books b WHERE b.BookID = @BookID)
		SET @IsBookExisting = 1
	ELSE
		SET @IsBookExisting = 0

	RETURN @IsBookExisting
END

