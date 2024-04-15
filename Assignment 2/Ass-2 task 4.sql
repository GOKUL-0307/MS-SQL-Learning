use SISDB;
--task 4
select * from Enrollments;
select * from Payments;
select * from Teacher;
select * from Courses;
select * from Students;

--1
select c.Course_id,c.Course_name,
( select count(e.course_id) from
Enrollments e
where e.Course_id=c.Course_id
group by (e.Course_id)
) as "Enrolled"
from Courses c;

--or

SELECT c.Course_id, c.Course_name, 
    (SELECT AVG(enrollment_count) 
     FROM (
         SELECT COUNT(*) AS enrollment_count 
         FROM Enrollments e
         WHERE e.Course_id=c.Course_id
         GROUP BY e.Course_id
     ) AS course_enrollments) AS Enrolled
FROM Courses c;

--or
SELECT
    c.Course_id,
    c.Course_name,
    AVG(enrollment_count) AS average_enrollment
FROM
    Courses c
JOIN (
    SELECT
        Course_id,
        COUNT(*) AS enrollment_count
    FROM
        Enrollments
    GROUP BY
        Course_id
) AS enrollment_counts ON c.Course_id = enrollment_counts.Course_id
GROUP BY
    c.Course_id,
    c.Course_name;



--2
SELECT  s.Student_id, s.First_name, s.Last_name, 
    (SELECT TOP 1 p.Amount --because 1 student having more than one payment
     FROM Payments p 
     WHERE s.Student_id = p.Student_id 
     ORDER BY p.Amount DESC) AS "Payment Amount"
FROM Students s
ORDER BY "Payment Amount" DESC;

--3
select c.Course_id,c.Course_name,(select count(e.Enrollment_id) from Enrollments e
where e.Course_id=c.Course_id
Group by e.Course_id) as "Enrollments"
from Courses c
Order by "Enrollments" desc;

--4
SELECT 
    c.Course_id, 
    c.Course_name, 
    t.First_name AS Teacher_First_Name, 
    (SELECT SUM(p.Amount) 
     FROM Payments p 
     WHERE p.Course_id = c.Course_id) AS Total_Amount_Spent
FROM 
    Courses c
JOIN 
    Teacher t ON c.Teacher_id = t.Teacher_id
ORDER BY 
    t.First_name;


--5
SELECT s.Student_ID, s.First_Name, s.Last_Name
FROM Students s
WHERE (SELECT COUNT(*) FROM Enrollments e WHERE e.Student_ID = s.Student_ID) = 
(SELECT COUNT(*) FROM Courses);

--6
SELECT t.Teacher_ID,t.First_Name
FROM Teacher t
WHERE t.Teacher_ID NOT IN (SELECT c.Teacher_ID FROM Courses c WHERE c.Teacher_ID IS NOT NULL);

--7
SELECT AVG(Age) AS AVERAGE_AGE
FROM(
  SELECT DATEDIFF(YEAR, Date_of_Birth, GETDATE()) AS Age
  FROM Students
) AS Student_age;

--8
SELECT c.Course_ID, c.Course_Name
FROM Courses c
WHERE c.Course_ID NOT IN (SELECT e.Course_ID FROM Enrollments e WHERE e.Course_ID IS NOT NULL);

--9
SELECT s.Student_ID, s.first_name, s.Last_Name,
(
	SELECT SUM(p.Amount)
	FROM Payments p
	WHERE p.Student_ID = s.Student_ID
) AS TOTAL_PAYMENTS
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.Student_ID, s.first_name, s.Last_Name;

--10
SELECT 
    s.Student_ID,
    s.First_Name,
    s.Last_Name,
    (
        SELECT COUNT(*)
        FROM Enrollments e
        WHERE e.Student_ID = s.Student_ID
    ) AS Courses_Enrolled_Count
FROM 
    Students s
WHERE 
    (
        SELECT COUNT(*) 
        FROM Payments p 
        WHERE s.Student_ID = p.Student_ID
    ) > 1;


--11

SELECT s.Student_ID, s.first_name, s.Last_Name,
(
        SELECT SUM(p.Amount)
        FROM Payments p
        WHERE p.Student_ID = s.Student_ID
    ) AS Total_Payments
FROM Students s

--12
SELECT c.Course_Name, 
(
	SELECT COUNT(*)
	FROM Enrollments e
	WHERE e.Course_ID = c.Course_ID
) AS Count_Enrolled
FROM Courses c;


--13
SELECT 
    student_id,
    First_name,
    (SELECT AVG(Amount) FROM Payments WHERE Payments.student_id = Students.student_id) AS average_payment
FROM 
    Students;


