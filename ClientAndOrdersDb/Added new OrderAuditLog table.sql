USE ClientsAndOrdersDb;

CREATE TABLE OrderAuditLog (
	LogID INT IDENTITY PRIMARY KEY,
	OrderID INT,
	OldAmount DECIMAL(10,2),
	NewAmount DECIMAL(10,2),
	ChangedAt DATETIME,
	ChangeBy NVARCHAR(100)
)