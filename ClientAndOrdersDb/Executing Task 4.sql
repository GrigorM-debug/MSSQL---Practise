BEGIN TRY
	EXEC SelectCustomersWithOrdersByCountry @Country = 'Bulgaria';
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;