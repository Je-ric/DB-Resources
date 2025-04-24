-- 1. Create the database and switch to it
CREATE DATABASE sales_db;
USE sales_db;

-- 2. Create the products table
CREATE TABLE products (
    productID INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    productCode VARCHAR(3) NOT NULL,
    name VARCHAR(30) NOT NULL,
    quantity INT(10) UNSIGNED NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- 3. View tables and structure (for debugging/info)
SHOW TABLES;
DESCRIBE products;

-- 4. Insert product data
INSERT INTO products (productCode, name, quantity, price) VALUES
('PEN', 'Pen Red', 5000, 1.23),
('PEN', 'Pen Blue', 8000, 1.25),
('PEN', 'Pen Black', 2000, 1.25),
('PEC', 'Pencil 2B', 10000, 0.48),
('PEC', 'Pencil 2H', 8000, 0.49),
('PEC', 'Pencil HB', 400, 2.99);

-- 5. Queries

-- a. LIKE-based queries
SELECT * FROM products WHERE name LIKE 'Pen%';
SELECT * FROM products WHERE name LIKE 'Pencil%';
SELECT * FROM products WHERE name LIKE 'P__%'; -- names starting with 'P' and at least 3 characters

-- b. IN clause
SELECT * FROM products WHERE name IN ('Pen Red', 'Pen Black');

-- c. BETWEEN clause
SELECT * FROM products WHERE price BETWEEN 1.0 AND 2.0;
SELECT * FROM products WHERE quantity BETWEEN 1000 AND 2000;
SELECT * FROM products WHERE (price BETWEEN 1.0 AND 2.0) AND (quantity BETWEEN 1000 AND 2000);

-- d. NOT BETWEEN
SELECT * FROM products WHERE quantity NOT BETWEEN 1000 AND 2000;

-- e. ORDER BY
SELECT * FROM products ORDER BY name;
SELECT * FROM products ORDER BY name ASC;
SELECT * FROM products ORDER BY name DESC;

-- f. LIMIT
SELECT * FROM products ORDER BY price LIMIT 3;       -- top 3 lowest prices
SELECT * FROM products ORDER BY price LIMIT 2, 3;    -- skip 2, show next 3

-- g. SELECT specific columns and aliases
SELECT price FROM products;
SELECT DISTINCT price FROM products;
SELECT name AS "Product Name", price AS "Unit Price", quantity FROM products;

-- h. Aggregate functions
SELECT MAX(price) FROM products;
SELECT MIN(price) FROM products;

-- i. Subqueries with MAX and MIN
SELECT * FROM products WHERE price = (SELECT MAX(price) FROM products);
SELECT * FROM products WHERE price = (SELECT MIN(price) FROM products);
SELECT * FROM products 
WHERE price = (SELECT MAX(price) FROM products) 
   OR price = (SELECT MIN(price) FROM products);
