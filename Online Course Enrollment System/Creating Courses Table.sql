USE OnlineCourseEnrollmentSystemDb;

--Check before creating
CREATE TABLE Courses (
    CourseID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    CreditHours INT NOT NULL,
    StartDate DATETIME2 NOT NULL,
    EndDate DATETIME2 NOT NULL
);