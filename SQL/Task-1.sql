CREATE DATABASE SchoolDB; 

USE SchoolDB;

CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    marks INT
);


INSERT INTO students
VALUES (101, 'Rahul', 21, 'Data Analyst',60),
       (102, 'Mohit', 20, 'Data Analyst',100),
       (103, 'Mihir', 24, 'Full Stack',90),
       (104, 'Dhananjay', 21, 'Hacker',90),
       (105, 'Jay', 30, 'Flutter ',90)
;

select * from students;
