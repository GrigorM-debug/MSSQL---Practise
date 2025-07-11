--A view that shows instructor first name, instructor last name, and the total number of courses they teach.
CREATE VIEW InstructorCourseCountView AS
SELECT
    i.FirstName,
    i.LastName,
    COUNT(*) AS NumberOfCourse
FROM Instructors AS i
JOIN Courses AS c ON c.InstructorID = i.InstructorID
GROUP BY i.FirstName, i.LastName;
