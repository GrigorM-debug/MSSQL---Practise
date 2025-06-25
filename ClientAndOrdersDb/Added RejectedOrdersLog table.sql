USE ClientsAndOrdersDb

CREATE TABLE RejectedOrdersLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    AttemptedAmount DECIMAL(10,2),
    Reason NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE()
)