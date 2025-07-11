CREATE TRIGGER TRG_PreventAddingStudentsThatAlreadyExists
ON Students
INSTEAD OF INSERT
AS 
BEGIN
    DECLARE @IsStudentExisting BIT

    SET @IsStudentExisting = (  
            SELECT 1
            FROM Students AS s
            JOIN inserted AS i ON i.Email = s.Email
            WHERE s.FirstName = i.FirstName AND
            s.LastName = i.LastName AND
            s.RegistrationDate = i.RegistrationDate
        )
    
    IF(@IsStudentExisting = 1) 
        BEGIN
            THROW 50010, 'Student already exists!', 1; 
        END
    ELSE
        BEGIN
            INSERT INTO Students (FirstName, LastName, Email, RegistrationDate)
                SELECT 
                    FirstName, 
                    LastName, 
                    Email, 
                    RegistrationDate
                FROM inserted
        END
END