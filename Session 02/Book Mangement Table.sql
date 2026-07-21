CREATE DATABASE librarydb;

CREATE SCHEMA library;

--1
CREATE TABLE library.books(
	book_id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	author VARCHAR(50) NOT NULL,
	published_year INT,
	price DECIMAL(10,2)
);

--2
ALTER TABLE library.books ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

--3
DROP TABLE library.books;