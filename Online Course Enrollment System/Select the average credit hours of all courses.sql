-- 7. The average credit hours of all courses.

SELECT
    c.CourseID,
    AVG(c.CreditHours) AS AverageCreditHourse
FROM Courses AS c
GROUP BY c.CourseID;
