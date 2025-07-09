USE OnlineCourseEnrollmentSystemDb;

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, CompletionStatus)
VALUES
(1, 1, '2024-01-10 09:00:00', 'Completed'),
(1, 2, '2024-01-12 09:15:00', 'Completed'),

(2, 3, '2024-02-05 10:20:00', 'Dropped'),
(2, 4, '2024-02-07 13:00:00', 'In Progress'),

(3, 2, '2024-03-01 08:45:00', 'In Progress'),

(4, 1, '2024-03-05 11:30:00', 'Completed'),
(4, 4, '2024-03-07 11:00:00', 'In Progress'),
(4, 6, '2024-03-10 14:00:00', 'Dropped'),

(5, 3, '2024-04-01 10:00:00', 'In Progress'),
(5, 5, '2024-04-04 14:30:00', 'In Progress'),

(6, 6, '2024-05-11 09:00:00', 'Completed'),

(7, 4, '2024-05-15 10:00:00', 'Dropped'),
(7, 7, '2024-05-17 11:00:00', 'In Progress'),

(8, 1, '2024-06-01 12:00:00', 'In Progress'),
(8, 3, '2024-06-03 13:30:00', 'Completed'),

(9, 2, '2024-06-12 10:00:00', 'Dropped'),

(10, 5, '2024-06-14 08:45:00', 'Completed'),
(10, 6, '2024-06-16 09:15:00', 'In Progress'),

(11, 7, '2024-07-01 10:00:00', 'In Progress'),

(12, 2, '2024-07-05 13:00:00', 'Completed'),
(12, 4, '2024-07-07 14:00:00', 'Completed');
