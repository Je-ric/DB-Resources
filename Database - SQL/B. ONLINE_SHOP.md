-- Create the 'onlineshop' database
CREATE DATABASE onlineshop;

-- Create the 'items' table
CREATE TABLE items (
    itemid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    categoryid INT,
    name VARCHAR(100) NOT NULL,
    price FLOAT
);

-- Insert data into 'items' table
INSERT INTO items (categoryid, name, price) 
VALUES 
    (1, 'Android Mobile Phone', 250.00),
    (1, 'i7 processor, 8GB RAM Laptop', 1000.00),
    (2, 'How to train your cat', 25.00),
    (2, 'Healthy dog food recipes', 19.00),
    (2, 'Learn how to meditate for mental health', 30.00),
    (3, 'Beautiful Black T-Shirts', 99.00),
    (3, 'Blue Colored Jeans', 150.00);

-- Create the 'categories' table
CREATE TABLE categories (
    categoryid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    status TINYINT(1) NOT NULL
);

-- Insert data into 'categories' table
INSERT INTO categories (title, status) 
VALUES 
    ('Electronics', 1),
    ('Books', 1),
    ('Cloths', 1);

-- Create the 'customers' table
CREATE TABLE customers (
    userid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(150)
);

-- Insert data into 'customers' table
INSERT INTO customers (name, phone, address) 
VALUES 
    ('Jimmy Jones', '1234567890', 'Victoria Pavilion, Las Vegas, NV'),
    ('Henry Clark', '0987654321', '4125 Sydney Place, Miami, FL'),
    ('Ruby Young', '1234512345', '6170 Peshwar Place, Washington, DC'),
    ('Julia King', '0987612345', 'MountainView Hospital, Victoria, TX'),
    ('Anna Jones', '0987609876', '1234 Obere Street, Miami, FL');

-- Create the 'orders' table
CREATE TABLE orders (
    orderid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    userid INT,
    items TEXT,
    total FLOAT,
    orderdate DATETIME
);

-- Insert data into 'orders' table
INSERT INTO orders (userid, items, total, orderdate) 
VALUES 
    (2, 'i7 processor, 8GB RAM Laptop', 1000.00, NOW()),
    (1, 'Healthy dog food recipes', 19.00, NOW()),
    (25, 'Healthy dog food recipes', 19.00, NOW()),
    (1, 'How to train your cat', 25.00, NOW()),
    (3, 'Blue Colored Jeans', 150.00, NOW()),
    (15, 'Beautiful Black T-Shirts', 99.00, NOW()),
    (4, 'Beautiful Black T-Shirts', 99.00, NOW());

-- Show all tables in the database
SHOW TABLES;
