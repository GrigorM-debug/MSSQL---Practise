BEGIN TRY
	EXEC GetActiveCustomers @MinOrdersCount = 2, @Country = '';
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH