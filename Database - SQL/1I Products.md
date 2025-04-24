-- Create and use the 'products' database
CREATE DATABASE products;
USE products;

-- Create the 'Category' table
CREATE TABLE Category (
    CID INT PRIMARY KEY,
    Category VARCHAR(255)
);

-- Insert sample data into 'Category'
INSERT INTO Category (CID, Category) 
VALUES (1, 'Cellphone'), 
       (2, 'Tablet'), 
       (3, 'Computer');

-- Create the 'Manufacturer' table
CREATE TABLE Manufacturer (
    MID INT PRIMARY KEY,
    Manufacturer VARCHAR(255),
    CountryOriginated VARCHAR(255)
);

-- Insert sample data into 'Manufacturer'
INSERT INTO Manufacturer (MID, Manufacturer, CountryOriginated) 
VALUES 
    (1, 'Apple Inc', 'USA'), 
    (2, 'HTC', 'Taiwan'), 
    (3, 'Lenovo', 'China'), 
    (4, 'Samsung', 'South Korea'), 
    (5, 'Sony', 'Japan');

-- Create the 'Sales' table
CREATE TABLE Sales (
    SID INT PRIMARY KEY,
    Customer INT,
    Product INT,
    DateSold DATE,
    FOREIGN KEY (Customer) REFERENCES Customer(CustomerID),
    FOREIGN KEY (Product) REFERENCES Product(PID)
);

-- Insert sample data into 'Sales'
INSERT INTO Sales (SID, Customer, Product, DateSold) 
VALUES 
    (1, 2, 1, '2012-12-22'), 
    (2, 3, 12, '2013-01-15'), 
    (3, 4, 6, '2013-01-31'), 
    (4, 4, 5, '2016-02-14'), 
    (5, 5, 4, '2013-09-13'), 
    (6, 7, 7, '2013-10-09'), 
    (7, 1, 8, '2013-11-11'), 
    (8, 6, 11, '2013-12-21'), 
    (9, 6, 9, '2014-02-08'), 
    (10, 7, 10, '2014-03-03'), 
    (11, 1, 3, '2014-08-02'), 
    (12, 2, 2, '2014-07-21');

-- Create the 'Product' table
CREATE TABLE Product (
    PID INT PRIMARY KEY,
    CID INT,
    Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Manufacturer INT,
    FOREIGN KEY (CID) REFERENCES Category(CID),
    FOREIGN KEY (Manufacturer) REFERENCES Manufacturer(MID)
);

-- Insert sample data into 'Product'
INSERT INTO Product (PID, CID, Name, Price, Manufacturer) 
VALUES 
    (1, 1, 'Phones', 5849.00, 1),
    (2, 1, 'S6', 578.00, 4),
    (3, 1, 'Desce 010', 531050.00, 2),
    (4, 1, 'Eve 4G LTE', 8200.00, 2),
    (5, 2, 'Xperia Tablet Z', 557490.00, 5),
    (6, 2, 'Galaxy Tab Pro 64', 5628.00, 4),
    (7, 2, 'Pad Mini', 29900.00, 1),
    (8, 2, 'IdeaPad A1000', 129.99, 3),
    (9, 3, 'Flex 10 Signature Edition', 32900.00, 3),
    (10, 3, 'VAIO Tap 20 Mobile Desktop', 110000.00, 5),
    (11, 3, 'ATIV Book 9 2014 Edition', 152100.00, 4),
    (12, 3, 'Mac Book Pro (3 Gen)', 1222.20, 1);

-- Select Customer details with specific conditions on ContactNumber
SELECT Name, Address, ContactNumber 
FROM Customer 
WHERE ContactNumber LIKE '%1%' 
  AND ContactNumber LIKE '%2%' 
  AND ContactNumber LIKE '%3%';

-- Update Product price for tablets
UPDATE Product 
SET Price = 6000 
WHERE CID = 2;

-- Select products with specific price range and manufacturer
SELECT Name, Price 
FROM Product 
WHERE Price BETWEEN 5000 AND 20000 
  AND Manufacturer IN (SELECT MID FROM Manufacturer WHERE Manufacturer IN ('Lenovo', 'HTC'));

-- Select products from specific countries and order by name
SELECT Name, Manufacturer 
FROM Product 
WHERE Manufacturer IN (SELECT MID FROM Manufacturer WHERE CountryOriginated IN ('Taiwan', 'China'))
ORDER BY Name ASC;

-- Select customer details based on birth region and year of birth
SELECT Name, Address, ContactNumber 
FROM Customer 
WHERE BirthRegion = 3 
  AND YEAR(BirthDate) BETWEEN 1960 AND 1989;
