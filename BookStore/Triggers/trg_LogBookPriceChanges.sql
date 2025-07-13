CREATE TRIGGER trg_LogBookPriceChanges 
ON Books
AFTER UPDATE
AS 
BEGIN
	IF EXISTS (
		SELECT * 
		FROM INSERTED AS i 
		JOIN DELETED AS d ON d.BookID = i.BookID 
		WHERE i.Price <> d.Price
	)
		BEGIN
			INSERT INTO BookPriceHistory (BookID, OldPrice, NewPrice, ChangeDate)
			SELECT
				i.BookID,
				d.Price,
				i.Price,
				GETDATE()
			FROM INSERTED AS i 
			JOIN DELETED AS d ON d.BookID = i.BookID
			WHERE i.Price <> d.Price
		END
END