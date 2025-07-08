USE OnlineCourseEnrollmentSystemDb;

--Check before creating
CREATE TABLE Instructors (
    InstructorID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(320) NOT NULL UNIQUE,
    Specialization NVARCHAR(40) NOT NULL,
);