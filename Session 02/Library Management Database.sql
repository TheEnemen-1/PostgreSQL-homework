CREATE DATABASE library_management;

CREATE TABLE members(
	id SERIAL PRIMARY KEY,
	m_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE,
	phone CHAR(10) UNIQUE,
	dob DATE,
	address VARCHAR(255),
	status VARCHAR(8) CHECK (status IN ('active', 'inactive')),
	join_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE categories(
	id SERIAL PRIMARY KEY,
	c_name VARCHAR(100) NOT NULL,
	description TEXT
);

CREATE TABLE authors(
	id SERIAL PRIMARY KEY,
	a_name VARCHAR(100) NOT NULL,
	biography TEXT
);

CREATE TABLE books(
	id SERIAL PRIMARY KEY,
	isbn VARCHAR(13) UNIQUE,
	title VARCHAR(100) NOT NULL,
	publishing_year INT CHECK (publishing_year > 0),
	publisher VARCHAR(100),
	total_copies INT DEFAULT 0 CHECK (total_copies >= 0),
	available_copies INT DEFAULT 0 CHECK (available_copies >= 0 AND available_copies <= total_copies),
	category_id INT REFERENCES categories(id)
);

CREATE TABLE book_author(
	book_id INT NOT NULL REFERENCES books(id),
	author_id INT NOT NULL REFERENCES authors(id),
	PRIMARY KEY(book_id, author_id)
);

CREATE TABLE borrow(
	id SERIAL PRIMARY KEY,
	borrow_date DATE NOT NULL,
	due_date DATE NOT NULL,
	return_date DATE,
	member_id INT NOT NULL REFERENCES members(id)
);

CREATE TABLE details(
	borrow_id INT NOT NULL REFERENCES borrow(id),
	book_id INT NOT NULL REFERENCES books(id),
	PRIMARY KEY(borrow_id, book_id)
);