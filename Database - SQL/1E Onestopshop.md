-- Create and use the database
CREATE DATABASE Onestopshop;
USE Onestopshop;

-- Create tables
CREATE TABLE Customer (
    Cust_ID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Birthdate DATE NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL
);

CREATE TABLE Category (
    CID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Category VARCHAR(50) NOT NULL
);

CREATE TABLE Manufacturer (
    MID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Manufacturer VARCHAR(50) NOT NULL,
    Country_Originated VARCHAR(50) NOT NULL
);

CREATE TABLE Product (
    PID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    CID INT(3) UNSIGNED NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Price DECIMAL(8, 2) NOT NULL,
    Manufacturer INT(3) UNSIGNED NOT NULL,
    FOREIGN KEY (CID) REFERENCES Category(CID),
    FOREIGN KEY (Manufacturer) REFERENCES Manufacturer(MID)
);

CREATE TABLE Sales (
    SID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Customer INT(3) UNSIGNED NOT NULL,
    Product INT(3) UNSIGNED NOT NULL,
    Date_Sold DATE NOT NULL,
    FOREIGN KEY (Customer) REFERENCES Customer(Cust_ID),
    FOREIGN KEY (Product) REFERENCES Product(PID)
);

-- Insert Customers
INSERT INTO Customer (Name, Birthdate, Email, Address) VALUES 
('Arya Stark', '1999-06-02', 'arya@yahoo.com', 'Nueva Ecija'),
('Jon Snow', '1990-05-21', 'jonSnow@gmail.com', 'Nueva Ecija'),
('Tyrion Lannister', '1982-09-09', 'lannisterT@gmail.com', 'Manila'),
('Daenerys Targaryen', '1992-07-28', 'dtargaryan@yahoo.com', 'Bulacan'),
('Joffrey Baratheon', '1993-08-12', 'jofbar@gmail.com', 'Nueva Ecija'),
('Khal Drogo', '1984-03-03', 'khald@gmail.com', 'Bulacan'),
('Petyr Baelish', '1959-07-29', 'pb01@yahoo.com', 'Manila');

-- Insert Categories
INSERT INTO Category (Category) VALUES 
('Cellphone'), ('Tablet'), ('Computer');

-- Insert Manufacturers
INSERT INTO Manufacturer (Manufacturer, Country_Originated) VALUES 
('Apple Inc', 'USA'), 
('HTC', 'Taiwan'), 
('Lenovo', 'China'), 
('Samsung', 'South Korea'), 
('Sony', 'Japan');

-- Insert Products (after Category and Manufacturer!)
INSERT INTO Product (CID, Name, Price, Manufacturer) VALUES 
(1, 'iPhone5s', 849.00, 1),
(1, 'S5', 578.99, 4),
(1, 'Desire 610', 310.50, 2),
(1, 'Evo 4G LTE', 200.00, 2),
(2, 'Xperia Tablet Z', 574.99, 5),
(2, 'Galaxy Tab Pro 8.4', 329.00, 4),
(2, 'iPad Mini', 299.00, 1),
(2, 'IdeaPad A1000', 129.99, 3),
(3, 'Flex 10 Signature Edition', 329.00, 3),
(3, 'VAIO Tap 20 Mobile Desktop', 1100.00, 5),
(3, 'ATIV Book 9 2014 Edition', 1521.00, 4),
(3, 'Mac Book Pro (3rd Gen)', 1222.00, 1);

-- Insert Sales (after Products)
INSERT INTO Sales (Customer, Product, Date_Sold) VALUES 
(2, 1, '2012-12-22'),
(3, 12, '2013-01-15'),
(4, 6, '2013-01-13'),
(4, 5, '2013-02-14'),
(5, 4, '2013-09-13'),
(7, 7, '2013-10-09'),
(1, 8, '2013-11-11'),
(6, 11, '2013-12-21'),
(6, 9, '2014-02-08'),
(7, 10, '2014-03-03'),
(1, 3, '2014-06-02'),
(2, 2, '2014-07-21');
