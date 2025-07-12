USE BookStoreDB

--Retrieve all books: Select Title, ISBN, and Price for all books.
SELECT
	b.Title,
	b.ISBN,
	b.Price
FROM Books AS b
