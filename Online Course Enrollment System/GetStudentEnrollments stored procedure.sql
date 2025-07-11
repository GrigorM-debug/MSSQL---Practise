--A stored procedure that takes a StudentID as input and 
--returns all courses that student is enrolled in, along with their enrollment status.
CREATE PROCEDURE GetStudentEnrollments @StudentID INT
AS
    IF(@StudentID IS NULL) 
        THROW 51000, 'StudentID can not be null!', 1;

    SELECT
        e.CourseID,
        e.CompletionStatus
    FROM Enrollments AS e
    WHERE e.StudentID = @StudentID;
