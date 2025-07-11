--A view that shows student first name, student last name, course title, 
--and enrollment date for all enrollments that are 'In Progress'.
CREATE VIEW ActiveEnrollmentsView AS
SELECT
    s.FirstName,
    s.LastName,
    c.Title,
    e.EnrollmentDate,
    e.CompletionStatus
FROM Enrollments AS e
LEFT JOIN Students AS s ON s.StudentID = e.StudentID
LEFT JOIN Courses AS c ON c.CourseID = e.CourseID
WHERE e.CompletionStatus = 'In Progress';