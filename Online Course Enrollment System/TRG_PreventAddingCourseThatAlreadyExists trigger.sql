CREATE TRIGGER TRG_PreventAddingCourseThatAlreadyExists
ON Courses 
INSTEAD OF INSERT
AS
    BEGIN
        DECLARE @IsCourseExisting BIT;

        SET @IsCourseExisting = (
                SELECT 1 
                FROM Courses AS c 
                JOIN inserted AS i ON i.Title = c.Title
                WHERE c.Description = i.Description AND 
                c.CreditHours = i.CreditHours AND 
                c.StartDate = i.StartDate AND 
                c.EndDate = i.EndDate AND 
                c.InstructorID = i.InstructorID
            )

        IF (@IsCourseExisting = 1)
            BEGIN
                THROW 50010, 'Course already exists', 1
            END 
        ELSE 
            BEGIN
                INSERT INTO Courses (Title, Description, CreditHours, StartDate, EndDate, InstructorID)
                    SELECT Title, Description, CreditHours, StartDate, EndDate, InstructorID FROM inserted  
            END
    END