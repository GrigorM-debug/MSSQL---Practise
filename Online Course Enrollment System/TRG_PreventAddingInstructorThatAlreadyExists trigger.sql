CREATE TRIGGER TRG_PreventAddingInstructorThatAlreadyExists
ON Instructors
INSTEAD OF INSERT
AS 
BEGIN
    DECLARE @IsInstructorExisting BIT

    SET @IsInstructorExisting = (
            SELECT 1
            FROM Instructors AS ins
            JOIN inserted AS i ON i.Email = ins.Email
            WHERE ins.FirstName = i.FirstName AND
            ins.LastName = i.LastName AND 
            ins.Email = i.Email AND
            ins.Specialization = i.Specialization
        )

    IF (@IsInstructorExisting = 1)
        BEGIN
            THROW 50010, 'Instructor already exists', 1;  
        END
    ELSE
        BEGIN
            INSERT INTO Instructors (FirstName, LastName, Email, Specialization)
                SELECT FirstName, LastName, Email, Specialization FROM inserted 
        END
END