USE BookStoreDB

--Order details: For a specific OrderID (e.g., OrderID = 1), retrieve the BookTitle, Quantity, and UnitPriceAtTimeOfOrder for each item in that order.
SELECT 
	b.Title AS BookTitle,
	oi.Quanity,
	oi.UnitPriceAtTimeOfTheOrder
FROM OrderItems oi
JOIN Books b ON oi.BookID = b.BookID
WHERE oi.OrderID = 2