USE OnlineCourseEnrollmentSystemDb;

CREATE NONCLUSTERED INDEX IX_Enrollments_EnrollmentDate
ON Enrollments (EnrollmentDate);