USE BookStoreDB

--Books by a specific author - List all Titles and PublicationYear 
SELECT
	b.Title,
	b.PublicationYear
FROM Books b
JOIN BookAuthor ba ON b.BookID = ba.BookID
JOIN Authors a ON ba.AuthorID = a.AuthorID
WHERE CONCAT_WS(' ', a.FirstName, a.LastName) = 'Patrick Rothfuss'
