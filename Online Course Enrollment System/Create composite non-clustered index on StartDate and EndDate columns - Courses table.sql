USE OnlineCourseEnrollmentSystemDb;

CREATE NONCLUSTERED INDEX IX_Courses_StartDate_EndDate
ON Courses (StartDate, EndDate)