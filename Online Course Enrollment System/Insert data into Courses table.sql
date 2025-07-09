USE OnlineCourseEnrollmentSystemDb;

INSERT INTO Courses (Title, Description, CreditHours, StartDate, EndDate, InstructorID)
VALUES 
-- John Smith (Software Engineering)
('Intro to Programming', 'Learn the basics of programming using Python.', 3, '2025-09-01 08:00:00', '2025-12-15 10:00:00', 1),

-- Sara Smith (Data Science)
('Data Analysis with Python', 'Data wrangling, visualization, and statistical analysis in Python.', 4, '2025-09-01 09:00:00', '2025-12-15 11:00:00', 2),

-- Emily Carter (Digital Marketing)
('Digital Marketing Fundamentals', 'SEO, social media, and content strategy.', 3, '2025-09-05 10:00:00', '2025-12-20 12:00:00', 3),

-- Liam Bennett (Cybersecurity)
('Network Security', 'Explore cyber threats, firewalls, and secure protocols.', 3, '2025-09-01 13:00:00', '2025-12-15 15:00:00', 4),

-- Marcus Neal (Human Resources)
('Organizational Behavior', 'Understand team dynamics and leadership in the workplace.', 2, '2025-09-10 14:00:00', '2025-11-30 16:00:00', 5),

-- Kevin Zhang (Mechanical Engineering)
('Thermodynamics', 'Study heat, energy, and mechanical systems.', 4, '2025-09-03 08:00:00', '2025-12-18 10:00:00', 6),

-- Chloe Schmidt (Machine Learning)
('Intro to Machine Learning', 'Fundamentals of ML algorithms and applications.', 4, '2025-09-02 11:00:00', '2025-12-16 13:00:00', 7);
