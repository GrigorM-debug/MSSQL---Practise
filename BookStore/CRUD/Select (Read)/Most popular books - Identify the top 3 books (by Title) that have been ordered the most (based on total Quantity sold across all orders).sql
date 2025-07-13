--Most popular books - Identify the top 3 books (by Title) that have been ordered the most (based on total Quantity sold across all orders).

SELECT TOP(3)
	b.Title,
	SUM(oi.Quanity) AS TotalQuantitySold
FROM Books b
JOIN OrderItems oi ON b.BookID = oi.BookID
GROUP BY b.Title
ORDER BY SUM(oi.Quanity) DESC