use SISDB;
--task 3

select * from Payments;
select * from Teacher;
select * from Courses;
select * from Enrollments;
select * from Students;

INSERT INTO Students
VALUES (7011,'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

insert into Enrollments
values (3021,7003,2014,'2024-04-08')

--1
select s.Student_id,s.First_name,s.Last_name,sum(p.Amount) as "Total Amount Spent"
from Students s
join Payments p
on s.Student_id=p.Student_id
group by s.Student_id,s.First_name,s.Last_name;

--2
select c.Course_id,c.Course_name,count(e.Student_id) as "Sudents Enrolled"
from Courses c
join Enrollments e
on c.Course_id=e.Course_id
group by c.Course_id,c.Course_name;


--3
SELECT 
    s.First_name, 
    s.Last_name
FROM 
    Students s
LEFT JOIN 
    Enrollments e ON s.Student_id = e.Student_id
WHERE 
    e.Student_id IS NULL;

--4
select s.First_name,s.Last_name,c.course_name as "Course Enrolled"
from Students s
join Enrollments e on s.Student_id=e.Student_id
join Courses c on e.Course_id=c.Course_id
group by s.First_name,s.Last_name,c.Course_name;


--5
select CONCAT (t.First_name,' ',t.Last_name) as "Name",c.Course_name
from Teacher t
join Courses c
on t.Teacher_id=c.Teacher_id
group by t.First_name,t.Last_name,c.Course_name;

--6
select s.Student_id,s.First_Name,s.Last_name,e.Enrollment_id,e.Enrollment_date,c.Course_id,c.Course_name
from Students s
join Enrollments e on s.Student_id=e.Student_id
join Courses c on e.Course_id=c.Course_id
where c.Course_name='Cybersecurity';

--7
SELECT 
    s.First_name, 
    s.Last_name
FROM 
    Students s
LEFT JOIN 
    Payments p ON s.Student_id = p.Student_id
WHERE 
    p.Student_id IS NULL;

--8
select c.Course_name
from Courses c
left join Enrollments e
on c.Course_id=e.Course_id
where e.Course_id is  null;

--9
SELECT e1.Student_id, COUNT(distinct e1.Course_id) as "Enrollments"
FROM Enrollments e1
INNER JOIN Enrollments e2 ON e1.Student_id = e2.Student_id
GROUP BY e1.Student_id
HAVING COUNT(DISTINCT e1.Course_id) > 1;

--10
SELECT 
    t.First_name, 
    t.Last_name
FROM 
    Teacher t
LEFT JOIN 
    Courses c ON t.Teacher_id = c.Teacher_id
WHERE 
    c.Teacher_id IS NULL;