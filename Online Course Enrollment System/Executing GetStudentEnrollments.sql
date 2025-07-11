USE OnlineCourseEnrollmentSystemDb;

BEGIN TRY  
    EXEC GetStudentEnrollments @StudentID = 1
END TRY  
BEGIN CATCH  
    SELECT ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
GO  