USE ClientsAndOrdersDb

CREATE TABLE OrderDeleteLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    CustomerID INT,
    Amount DECIMAL(10,2),
    DeletedAt DATETIME DEFAULT GETDATE(),
    DeletedBy NVARCHAR(100),
    Reason NVARCHAR(255) NULL
);
