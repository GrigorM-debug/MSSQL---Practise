-- A stored procedure that takes StudentID and CourseID as input, and inserts a new enrollment record. 
--It should include basic error handling (e.g., if the student or course doesn't exist,
-- or if the student is already enrolled in the course).

CREATE PROCEDURE EnrollStudentInCourse @StudentID INT, @CourseID INT
AS
    IF(@StudentID IS NULL )
        THROW 50010, 'StudentID can not be null!', 1; 
    IF(@CourseID IS NULL)
        THROW 50010, 'CourseID can not be null!', 1; 

    --Check if student exists
    IF NOT EXISTS (SELECT 1 FROM Students AS s WHERE s.StudentID = @StudentID)
        THROW 50010, 'Student does not exists!', 1; 

    --Check if course exists
    IF NOT EXISTS (SELECT 1 FROM Courses AS c WHERE c.CourseID = @CourseID)
        THROW 50010, 'Course does not exists!', 1; 

    -- Check if student already enrolled the course
    IF EXISTS (SELECT 1 FROM Enrollments AS e WHERE e.StudentID = @StudentID AND e.CourseID = @CourseID)
        THROW 50010, 'Student is already enrolled in this course', 1; 

    BEGIN
        INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, CompletionStatus)
        VALUES
            (@StudentID, @CourseID, GETDATE(), 'In Progress') 
    END 