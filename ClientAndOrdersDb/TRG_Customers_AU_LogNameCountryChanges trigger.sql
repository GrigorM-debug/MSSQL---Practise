CREATE TRIGGER TRG_Customers_AU_LogNameCountryChanges
ON Customers
AFTER UPDATE
AS 
BEGIN
	IF EXISTS (
		SELECT 1 
		FROM deleted 
		JOIN inserted ON inserted.CustomerID = deleted.CustomerID
		WHERE deleted.CustomerName COLLATE SQL_Latin1_General_CP1_CI_AS  <> inserted.CustomerName COLLATE SQL_Latin1_General_CP1_CI_AS  OR deleted.Country <> inserted.Country
	)
		BEGIN
			INSERT INTO CustomerUpdateLog (CustomerID, OldName, NewName, OldCountry, NewCountry, ChangedBy)
				SELECT 
					deleted.CustomerID,
					deleted.CustomerName, --Old name
					inserted.CustomerName, -- New name
					deleted.Country, --Old country
					inserted.Country, --New Country
					'system user'
				FROM deleted 
				JOIN inserted ON inserted.CustomerID = deleted.CustomerID
				WHERE deleted.CustomerName COLLATE SQL_Latin1_General_CP1_CI_AS  <> inserted.CustomerName COLLATE SQL_Latin1_General_CP1_CI_AS  OR deleted.Country <> inserted.Country
		END
END