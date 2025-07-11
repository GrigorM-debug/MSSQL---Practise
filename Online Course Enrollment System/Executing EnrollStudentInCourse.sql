BEGIN TRY  
    EXEC EnrollStudentInCourse @StudentID = 11, @CourseID = 1
END TRY  
BEGIN CATCH  
    SELECT ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
GO  