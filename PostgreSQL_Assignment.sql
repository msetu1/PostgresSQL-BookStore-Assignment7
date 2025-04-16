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

-- Insert orders data
INSERT INTO orders (customer_id, book_id, quantity) VALUES
(1, 2, 1),
(2, 1, 1),
(1, 3, 2);

-- select * all data 
SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

-- PostgreSQL Problems & Solving Part

-- Problem 1: Find books that are out of stock
SELECT * FROM books
    WHERE stock=0;
-- SELECT title FROM books
--  WHERE stock=0;

-- Problem 2: Retrieve the most expensive book in the store.
SELECT * FROM books ORDER BY price DESC LIMIT 1;

-- Problem 3: Find the total number of orders placed by each customer.
SELECT customers.name, COUNT(orders.id) as total_order FROM customers
    LEFT JOIN orders ON orders.customer_id = customers.id
    GROUP BY customers.id;

-- Problem 4: Calculate the total revenue generated from book sales
SELECT SUM(books.price * orders.quantity) as total_revenue FROM orders
    JOIN books ON books.id = orders.book_id;


-- Problem 5: List all customers who have placed more than one order
SELECT customers.name, COUNT(orders.id) as orders_count FROM customers
    LEFT JOIN orders ON orders.customer_id = customers.id
    GROUP BY customers.id
    HAVING COUNT(orders.id)>1;

-- Problem 6: Find the average price of books in the store
SELECT ROUND(AVG(price),2) as average_price FROM books;

-- Problem 7: Increase the price of all books published before 2000 by 10%
-- solve korte pari na   

-- Problem 8: Delete customers who haven't placed any orders
DELETE FROM customers
    WHERE id NOT IN ( SELECT DISTINCT customer_id FROM orders); 