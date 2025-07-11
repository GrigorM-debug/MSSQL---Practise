BEGIN TRY  
    EXEC UpdateEnrollmentStatus @EnrollmentID = 9, @NewStatus = 'Dropped'
END TRY  
BEGIN CATCH  
    SELECT ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
GO  