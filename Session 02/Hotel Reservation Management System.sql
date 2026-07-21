CREATE DATABASE hoteldb;

CREATE SCHEMA hotel;

CREATE TABLE hotel.roomtypes (
	room_type_id SERIAL PRIMARY KEY,
	type_name VARCHAR(50) NOT NULL UNIQUE,
	price_per_night NUMERIC(10,2) CHECK (price_per_night > 0),
	max_capacity INT CHECK (max_capacity > 0)
);

CREATE TABLE hotel.rooms (
	room_id SERIAL PRIMARY KEY,
	room_number VARCHAR(10) NOT NULL UNIQUE,
	room_type_id INT NOT NULL REFERENCES hotel.roomtypes(room_type_id),
	status VARCHAR(20) CHECK (status IN ('Available', 'Occupied', 'Maintenance'))
);

CREATE TABLE hotel.customers (
	customer_id SERIAL PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone VARCHAR(15) NOT NULL
);

CREATE TABLE hotel.bookings (
	booking_id SERIAL PRIMARY KEY,
	customer_id INT NOT NULL REFERENCES hotel.customers(customer_id),
	room_id INT NOT NULL REFERENCES hotel.rooms(room_id),
	check_in DATE NOT NULL,
	check_out DATE NOT NULL,
	status VARCHAR(20) CHECK (status IN ('Pending', 'Confirmed', 'Cancelled'))
);

CREATE TABLE hotel.payments (
	payment_id SERIAL PRIMARY KEY,
	booking_id INT NOT NULL REFERENCES hotel.bookings(booking_id),
	amount NUMERIC(10,2) CHECK (amount >= 0),
	payment_date DATE NOT NULL,
	method VARCHAR(20) CHECK (method IN ('Credit Card', 'Cash', 'Bank Transfer'))
);