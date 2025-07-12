-- Customers with high spending: Find the FirstName, LastName, and Email of customers who have a total TotalAmount across all their orders exceeding $100.

SELECT
	c.FirstName,
	c.LastName,
	c.Email
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.Email
HAVING SUM(o.TotalAmount) > 100