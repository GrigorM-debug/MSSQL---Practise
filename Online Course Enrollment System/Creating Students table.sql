USE OnlineCourseEnrollmentSystemDb;

CREATE TABLE Students (
    StudentID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(320) NOT NULL UNIQUE,
    RegistrationDate DATETIME2 NOT NULL
);