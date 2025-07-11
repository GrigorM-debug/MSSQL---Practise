CREATE TRIGGER TRG_UpdateCourseEndDate
ON Enrollments
AFTER INSERT
AS 
    BEGIN
        DECLARE @CourseEndDate DATETIME2

        SET @CourseEndDate = (SELECT c.EndDate FROM Courses AS c JOIN inserted AS i ON i.CourseID = c.CourseID)

        IF(@CourseEndDate <= GETDATE())
            BEGIN
                UPDATE c
                SET c. EndDate = GETDATE() + 30
                FROM Courses AS c
                JOIN inserted AS i ON i.CourseID = c.CourseID 
            END
    END