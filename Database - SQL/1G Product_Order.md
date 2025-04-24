-- Create and use the database
CREATE DATABASE Product_Order;
USE Product_Order;

-- Customers Table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    LastName VARCHAR(100),
    FirstName VARCHAR(100),
    City VARCHAR(100),
    Province VARCHAR(100),
    Zipcode VARCHAR(20),
    ContactNumber VARCHAR(20),
    EmailAddress VARCHAR(100)
);

-- Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    SalesAmount DECIMAL(10, 2),
    ModeofPayment VARCHAR(50),
    CreditCardNumber VARCHAR(50),
    ExpDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Customers
INSERT INTO Customer (LastName, FirstName, City, Province, Zipcode, ContactNumber, EmailAddress) VALUES
('Simon', 'Gloria', 'Sycamore', 'IL', '60178', '', 'gsimon@uplink.com'),
('Gibbons', 'Roger', 'Burbank', 'CA', '91501', '818-444-9878', 'rg@email.com'),
('Walter', 'Stein', 'Boise', 'ID', '83703', '', 'ws@prof.edu'),
('Jennie', 'Henderson', 'Portsmouth', 'NH', '00215', '603-558-9686', 'jh@snow.com'),
('Satyal', 'Patel', 'Denver', 'CO', '80201', '303-589-5554', 'sp@uplink.com'),
('Porter', 'Susan', 'Stonington', 'ME', '04681', '', 'sp@oal.com'),
('Poe', 'Alvin', 'Cheyenne', 'WY', '82001', '', 'ap@uplink.com'),
('Tammy', 'King', 'Madison', 'WI', '53701', '608-541-9999', 'tk@oal.com'),
('Sun', 'Kim', 'DeKalb', 'IL', '60115', '', 'sk@uplink.com'),
('Hall', 'Peter', 'Denver', 'CO', '80201', '303-885-8655', 'ph@geo.com');

-- Products
INSERT INTO Products (Description, Price) VALUES
('Freeform', 395.00),
('Halfpipe', 350.00),
('Crossbow', 295.00),
('Sidecut', 250.00);

-- Orders
-- Note: ProductIDs assumed to be: 1 (Freeform), 2 (Halfpipe), 3 (Crossbow), 4 (Sidecut)
INSERT INTO Orders (CustomerID, ProductID, OrderDate, SalesAmount, ModeofPayment, CreditCardNumber, ExpDate) VALUES
(2, 1, '2016-08-05', 395.00, 'card', '154-45-78', '2016-12-31'),
(3, 2, '2016-08-05', 350.00, 'cash', NULL, NULL),
(1, 1, '2016-08-06', 395.00, 'cash', NULL, NULL),
(5, 3, '2016-08-07', 295.00, 'cash', NULL, NULL),
(1, 2, '2016-08-08', 350.00, 'cash', NULL, NULL),
(6, 1, '2016-08-09', 395.00, 'cash', NULL, NULL),
(8, 4, '2016-08-12', 250.00, 'card', '233-45-87', '2017-10-31'),
(7, 1, '2016-08-12
