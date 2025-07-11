
-- This trigger should prevent an instructor from enrolling in a course they are teaching. If an instructor attempts to enroll in their own course, the enrollment should be rolled back, and an informative message should be provided.
CREATE TRIGGER TRG_PreventInstructorSelfEnrollment
ON Enrollments
INSTEAD OF INSERT
AS
    BEGIN 
        IF EXISTS (
                SELECT 1 
                FROM inserted AS i 
                JOIN Courses AS c ON c.CourseID = i.CourseID
                WHERE i.StudentID = c.InstructorID
                )
            BEGIN
                THROW 50010, 'Instructor can not enrolled courses that he is teaching', 1
            END
        ELSE 
            BEGIN
                INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, CompletionStatus)
                    SELECT StudentID, CourseID, EnrollmentDate, CompletionStatus FROM inserted
            END
    END