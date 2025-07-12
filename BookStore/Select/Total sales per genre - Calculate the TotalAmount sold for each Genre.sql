-- Total sales per genre - Calculate the TotalAmount sold for each Genre.

SELECT
	bg.GenreID,
	SUM(o.TotalAmount) AS TotalAmount
FROM BookGenre bg
JOIN Books b ON bg.BookID = b.BookID
JOIN OrderItems oi ON b.BookID = oi.BookID
JOIN Orders o ON oi.OrderID = o.OrderID
GROUP BY bg.GenreID