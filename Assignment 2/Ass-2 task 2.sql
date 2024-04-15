use SISDB;
--task 2
select * from Students;
select * from Courses;
select * from Teacher;
select * from Enrollments;
select * from Payments;

--1
INSERT INTO Students
VALUES (7011,'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

--2
insert into Enrollments
values (3021,7011,2014,'2024-04-08')

--3
Update Teacher
set Email='KarthikSinha'
where Teacher_id=15001;

--4
delete Enrollments
where Student_id=7011 and Course_id=2014;

--5
update Courses
set Teacher_id=15007
where Course_id=2009;

--6
-- Modify the foreign key constraint in the "Enrollments" table to include ON DELETE CASCADE
ALTER TABLE Enrollments
ADD CONSTRAINT fk_Enrollments_Students FOREIGN KEY (Student_id) REFERENCES Students(Student_id)
ON DELETE CASCADE;

-- Modify the foreign key constraint in the "Payments" table to include ON DELETE CASCADE
ALTER TABLE Payments
ADD CONSTRAINT fk_Payments_Students FOREIGN KEY (Student_id) REFERENCES Students(Student_id)
ON DELETE CASCADE;


-- Delete a specific student from the "Students" table
DELETE FROM Students WHERE Student_id = 7011;


--7
UPDATE Payments
SET Amount = 1900
WHERE Payment_id = 80919;
