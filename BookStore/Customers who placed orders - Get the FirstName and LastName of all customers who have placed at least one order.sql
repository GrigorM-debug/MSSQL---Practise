USE BookStoreDB

--Customers who placed orders - Get the FirstName and LastName of all customers who have placed at least one order.
SELECT
	c.FirstName,
	c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
HAVING COUNT(*) >= 1