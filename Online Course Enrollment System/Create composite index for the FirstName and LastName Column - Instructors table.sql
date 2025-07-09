USE OnlineCourseEnrollmentSystemDb;

CREATE NONCLUSTERED INDEX IX_Instructors_FirstName_LastName
ON Instructors (FirstName, LastName);