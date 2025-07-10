-- 6. Courses that have no students currently enrolled.

USE OnlineCourseEnrollmentSystemDb;

SELECT
    c.CourseID
FROM Courses AS c
WHERE c.CourseID NOT IN (SELECT e.CourseID FROM Enrollments AS e);