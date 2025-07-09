USE OnlineCourseEnrollmentSystemDb;

CREATE NONCLUSTERED INDEX IX_Students_FirstName_LastName
ON Students (FirstName, LastName);