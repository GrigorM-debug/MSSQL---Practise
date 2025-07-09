USE OnlineCourseEnrollmentSystemDb;

CREATE TABLE Courses (
    CourseID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Title NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(MAX),
    CreditHours INT NOT NULL,
    StartDate DATETIME2 NOT NULL,
    EndDate DATETIME2 NOT NULL,
    InstructorID INT NOT NULL FOREIGN KEY REFERENCES Instructors(InstructorID)
);