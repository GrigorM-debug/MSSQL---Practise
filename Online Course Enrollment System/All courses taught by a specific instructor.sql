-- 2. All courses taught by a specific instructor (you choose the instructor).
USE OnlineCourseEnrollmentSystemDb;

SELECT *
FROM Courses AS c
WHERE c.InstructorID = 4;