USE OnlineCourseEnrollmentSystemDb;

CREATE NONCLUSTERED INDEX IX_Enrollments_CourseID
ON Enrollments (CourseID);