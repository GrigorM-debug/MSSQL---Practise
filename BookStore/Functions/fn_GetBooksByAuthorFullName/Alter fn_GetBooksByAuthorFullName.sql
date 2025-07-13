ALTER FUNCTION fn_GetBooksByAuthorFullName (@AuthorFullName NVARCHAR(100))
RETURNS TABLE
AS
RETURN
	SELECT
		b.Title AS BookTitle,
		b.ISBN,
		b.PublicationYear
	FROM Books b
	JOIN BookAuthor ba ON b.BookID = ba.BookID
	JOIN Authors a ON ba.AuthorID = a.AuthorID
	WHERE CONCAT_WS(' ', a.FirstName, a.LastName) = @AuthorFullName