CREATE DATABASE salesdb;

CREATE SCHEMA sales;

CREATE TABLE sales.customers (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone CHAR(10)
);

CREATE TABLE sales.products (
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	price NUMERIC(10,2) NOT NULL,
	stock_quantity INT NOT NULL
);

CREATE TABLE sales.orders (
	order_id SERIAL PRIMARY KEY,
	customer_id INT NOT NULL REFERENCES sales.customers(customer_id),
	order_date DATE NOT NULL
);

CREATE TABLE sales.orderitems (
	order_item_id SERIAL PRIMARY KEY,
	order_id INT NOT NULL REFERENCES sales.orders(order_id),
	product_id INT NOT NULL REFERENCES sales.products(product_id),
	quantity INT NOT NULL CHECK (quantity >= 1)
);