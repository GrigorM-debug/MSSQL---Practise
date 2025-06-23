USE ClientsAndOrdersDb;

CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY, 
	CustomerName NVARCHAR(100),
	Country NVARCHAR(50)
);