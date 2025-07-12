CREATE VIEW AuthorBookDetailsView AS
SELECT 
	a.FirstName AS AuthorFirstName,
	a.LastName AS AuthorLastName,
	b.Title AS BookTitle,
	b.ISBN,
	b.PublicationYear
FROM Authors a
JOIN BookAuthor ba ON a.AuthorID = ba.AuthorID
LEFT JOIN Books b ON ba.BookID = b.BookID