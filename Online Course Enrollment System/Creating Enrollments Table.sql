USE OnlineCourseEnrollmentSystemDb;

CREATE TABLE Enrollments (
    EnrollementID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATETIME2 NOT NULL,
    CompletionStatus NVARCHAR(15) NOT NULL,
    CONSTRAINT UQ_StudentCourse UNIQUE (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);