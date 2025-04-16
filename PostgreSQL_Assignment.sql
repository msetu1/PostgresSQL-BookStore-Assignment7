-- Active: 1743216657176@@127.0.0.1@5432@bookstore_db

-- Create books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    author VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0),
    stock INT CHECK (stock >= 0),
    published_year INT
);

-- Create customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(85) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

-- Create orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE,
    book_id INTEGER REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert books data

INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('JavaScript', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

-- Insert customers data
INSERT INTO customers (name, email) VALUES
('Alice', 'alice@email.com'),
('Bob', 'bob@email.com'),
('Charlie', 'charlie@email.com');

-- select * all data 
SELECT * FROM books;
SELECT * FROM customers;