create database SISDB;
use SISDB;

create table Students(
Student_id int primary key,
First_name varchar(30),
Last_name varchar(30),
Date_of_birth date,
Email varchar(50) unique,
Phone_number int);

create table Courses(
Course_id int primary key,
Course_name varchar(50),
Credits int,
Teacher_id int,
foreign key(Teacher_id) references Teacher(Teacher_id));

create Table Enrollments(
Enrollment_id int primary key,
Student_id int, 
Course_id int,
Enrollment_date date
foreign key(Student_id) references Students(Student_id),
foreign key(Course_id) references Courses(Course_Id)
);

create Table Teacher(
Teacher_id int primary key,
First_name varchar(50),
Last_name varchar(50),
Email varchar(50) unique);

create Table Payments(
Payment_id int primary key,
Student_id int,
Amount int,
Payment_date date
foreign key (Student_id) references Students(Student_id)
);

select * from Students;
select * from Teacher;




