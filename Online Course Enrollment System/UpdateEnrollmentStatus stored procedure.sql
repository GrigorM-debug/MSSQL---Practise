-- A stored procedure that takes EnrollmentID and NewStatus as input and updates the completion status 
--of that enrollment.

CREATE PROCEDURE UpdateEnrollmentStatus @EnrollmentID INT, @NewStatus NVARCHAR(15)
AS 
    IF(@EnrollmentID IS NULL) 
        THROW 50010, 'EnrollmentID can not be null!', 1; 
    IF(@NewStatus IS NULL OR @NewStatus = '')
        THROW 50010, 'NewStatus can not be null or whitespace!', 1;
    if(LEN(@NewStatus) > 15)
        THROW 50010, 'NewStatus must be maximum 15 characters long!', 1;  
    
    --Check if enrollment exists
    IF NOT EXISTS (SELECT 1 FROM Enrollments AS e WHERE e.EnrollementID = @EnrollmentID )
        THROW 50010, 'Enrollment does not exist!', 1; 

    --Check if status is already the same as @NewStatus value
    IF EXISTS (SELECT 1 FROM Enrollments AS e WHERE e.EnrollementID = @EnrollmentID AND e.CompletionStatus = @NewStatus)
        THROW 50010, 'Enrollment already has the provided status!', 1; 

    BEGIN
        UPDATE Enrollments 
        SET CompletionStatus = @NewStatus
        WHERE EnrollementID =  @EnrollmentID 
    END