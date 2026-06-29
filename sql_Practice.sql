-- ==========================================
-- SQL Data Analysis Basics
-- Author: Alfesani Shaikh
-- ==========================================

-- Task 1: Create Students Table
CREATE TABLE Students (
    ID INTEGER,
    Name TEXT,
    Age INTEGER,
    Marks INTEGER
);

-- Task 2: Insert Data
INSERT INTO Students VALUES
(1, 'Ali', 20, 85),
(2, 'Sara', 21, 90),
(3, 'John', 19, 78),
(4, 'Aman', 20, 95),
(5, 'Riya', 21, 88);

-- Task 3: Display Data
SELECT * FROM Students;

-- Task 4: Students with Marks > 80
SELECT * FROM Students
WHERE Marks > 80;

-- Task 5: Highest Marks
SELECT MAX(Marks) AS Highest_Marks
FROM Students;

-- Task 6: Average Marks
SELECT AVG(Marks) AS Average_Marks
FROM Students;

-- Task 7: Sort by Marks
SELECT * FROM Students
ORDER BY Marks DESC;

-- Task 8: Top 3 Students
SELECT * FROM Students
ORDER BY Marks DESC
LIMIT 3;

-- Task 9: Count Students
SELECT COUNT(*) AS Total_Students
FROM Students;

-- Task 10: Total Marks
SELECT SUM(Marks) AS Total_Marks
FROM Students;

-- Task 11: Lowest Marks
SELECT MIN(Marks) AS Lowest_Marks
FROM Students;

-- Task 12: Marks Between 80 and 90
SELECT * FROM Students
WHERE Marks BETWEEN 80 AND 90;

-- Task 13: IN Operator
SELECT * FROM Students
WHERE Name IN ('Ali','Riya');

-- Task 14: LIKE Operator
SELECT * FROM Students
WHERE Name LIKE 'A%';

-- Task 15: DISTINCT
SELECT DISTINCT Age
FROM Students;

-- Task 16: Create Department Table
CREATE TABLE Department (
    ID INTEGER,
    Department TEXT
);

INSERT INTO Department VALUES
(1,'CSE'),
(2,'CSE'),
(3,'IT'),
(4,'AI'),
(5,'AI');

-- Task 17: INNER JOIN
SELECT Students.Name,
       Students.Marks,
       Department.Department
FROM Students
INNER JOIN Department
ON Students.ID = Department.ID;

-- Task 18: GROUP BY
SELECT Department,
       COUNT(*) AS Total_Students
FROM Department
GROUP BY Department;

-- Task 19: Average Marks by Department
SELECT Department.Department,
       AVG(Students.Marks) AS Average_Marks
FROM Students
JOIN Department
ON Students.ID = Department.ID
GROUP BY Department.Department;

-- Task 20: HAVING
SELECT Department.Department,
       AVG(Students.Marks) AS Average_Marks
FROM Students
JOIN Department
ON Students.ID = Department.ID
GROUP BY Department.Department
HAVING AVG(Students.Marks) > 85;

-- Task 21: CASE WHEN
SELECT Name,
       Marks,
       CASE
           WHEN Marks >= 90 THEN 'Excellent'
           WHEN Marks >= 80 THEN 'Good'
           ELSE 'Average'
       END AS Grade
FROM Students;

-- Task 22: Second Highest Marks
SELECT MAX(Marks) AS Second_Highest
FROM Students
WHERE Marks < (SELECT MAX(Marks) FROM Students);

-- Task 23: Above Average Students
SELECT *
FROM Students
WHERE Marks > (
    SELECT AVG(Marks)
    FROM Students
);

-- Task 24: ROW_NUMBER
SELECT Name,
       Marks,
       ROW_NUMBER() OVER (ORDER BY Marks DESC) AS Rank_Number
FROM Students;

-- Task 25: RANK
SELECT Name,
       Marks,
       RANK() OVER (ORDER BY Marks DESC) AS Student_Rank
FROM Students;

-- Task 26: Percentage
SELECT Name,
       Marks,
       ROUND((Marks/100.0)*100,2) AS Percentage
FROM Students;

-- Task 27: CTE
WITH TopStudents AS (
    SELECT Name, Marks
    FROM Students
    WHERE Marks > 85
)
SELECT * FROM TopStudents;

-- Task 28: VIEW
CREATE VIEW Student_View AS
SELECT Name, Marks
FROM Students;

SELECT * FROM Student_View;

-- Task 29: INDEX
CREATE INDEX idx_name
ON Students(Name);

-- Task 30: Final Report
SELECT
    Department.Department,
    COUNT(*) AS Total_Students,
    AVG(Students.Marks) AS Average_Marks
FROM Students
JOIN Department
ON Students.ID = Department.ID
GROUP BY Department.Department;