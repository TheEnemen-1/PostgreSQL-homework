CREATE DATABASE elearningdb;

CREATE SCHEMA elearning;

CREATE TABLE elearning.students (
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE elearning.instructors (
	instructor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE elearning.courses (
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	instructor_id INT NOT NULL REFERENCES elearning.instructors(instructor_id)
);

CREATE TABLE elearning.enrollments (
	enrollment_id SERIAL PRIMARY KEY,
	student_id INT NOT NULL REFERENCES elearning.students(student_id),
	course_id INT NOT NULL REFERENCES elearning.courses(course_id),
	enroll_date DATE NOT NULL
);

CREATE TABLE elearning.assignments (
	assignment_id SERIAL PRIMARY KEY,
	course_id INT NOT NULL REFERENCES elearning.courses(course_id),
	title VARCHAR(100) NOT NULL,
	due_date DATE NOT NULL
);

CREATE TABLE elearning.submissions (
	submission_id SERIAL PRIMARY KEY,
	assignment_id INT NOT NULL REFERENCES elearning.assignments(assignment_id),
	student_id INT NOT NULL REFERENCES elearning.students(student_id),
	submission_date DATE NOT NULL,
	grade NUMERIC(5,2) CHECK (grade >= 0 AND grade <= 100)
);