CREATE DATABASE universitydb;

CREATE SCHEMA university;

--1
CREATE TABLE university.students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE university.courses(
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	credits INT
);

CREATE TABLE university.enrollments(
	enrollment_id SERIAL PRIMARY KEY,
	student_id INT REFERENCES university.students(student_id),
	course_id INT REFERENCES university.courses(course_id),
	enroll_date DATE
);

--2
ALTER TABLE university.students ADD CONSTRAINT student_age CHECK (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM birth_date) >= 18);

--3
DROP TABLE university.enrollments;
DROP TABLE university.courses;
DROP TABLE university.students;