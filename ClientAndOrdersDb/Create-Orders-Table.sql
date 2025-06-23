USE ClientsAndOrdersDb;

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
	OrderDate DATE,
	Amount DECIMAL (10, 2)
);