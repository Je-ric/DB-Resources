-- Create and use the 'company' database
CREATE DATABASE company;
USE company;

-- Create the 'employees' table
CREATE TABLE employees (
    employeeid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    jobtitle VARCHAR(50) NOT NULL,
    salary FLOAT
);

-- Insert data into 'employees' table
INSERT INTO employees (name, jobtitle, salary) 
VALUES 
    ('John Doe', 'Web Developer', 3500.00),
    ('Mary Smith', 'Web Developer', 3500.00),
    ('James Brown', 'Web Developer', 3500.00),
    ('Mike Walker', 'Web Developer', 3500.00),
    ('Linda Jones', 'Web Developer', 3500.00),
    ('John Doe', 'Systems Administrator', 3400.00),
    ('James Smith', 'Systems Administrator', 3400.00),
    ('John Brown', 'Systems Administrator', 3400.00),
    ('Daniel Jones', 'Systems Administrator', 3400.00),
    ('Paul Anderson', 'Systems Administrator', 3400.00),
    ('Mark Davis', 'IT Support Manager', 3200.00),
    ('Steven Thomas', 'IT Support Manager', 3200.00),
    ('Brian King', 'IT Support Manager', 3200.00),
    ('Kevin Hall', 'IT Support Manager', 3200.00),
    ('Jason Lee', 'IT Support Manager', 3200.00),
    ('Jose Young', 'Database Administrator', 3700.00),
    ('Frank Smith', 'Database Administrator', 3700.00),
    ('Eric Jones', 'Database Administrator', 3700.00),
    ('Jerry Martin', 'Database Administrator', 3700.00),
    ('Peter King', 'Database Administrator', 3700.00),
    ('Henry Clark', 'Application Developer', 3800.00),
    ('Carl White', 'Application Developer', 3800.00),
    ('Joe Thomas', 'Application Developer', 3800.00),
    ('Jack Smith', 'Application Developer', 3800.00),
    ('Roy King', 'Application Developer', 3800.00);

-- Create the 'clients' table
CREATE TABLE clients (
    clientid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(150)
);

-- Insert data into 'clients' table
INSERT INTO clients (name, phone, address) 
VALUES 
    ('Jimmy Jones', '1234567890', 'Victoria Pavilion, Las Vegas, NV'),
    ('Henry Clark', '0987654321', '4125 Sydney Place, Miami, FL'),
    ('Ruby Young', '1234512345', '6170 Peshwar Place, Washington, DC'),
    ('Julia King', '0987612345', 'MountainView Hospital, Victoria, TX');

-- Create the 'projects' table
CREATE TABLE projects (
    projectid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    clientid INT,
    employeeid INT,
    startdate DATETIME,
    enddate DATETIME
);

-- Insert data into 'projects' table
INSERT INTO projects (title, clientid, employeeid, startdate, enddate) 
VALUES 
    ('Develop ecommerce website from scratch', 1, 3, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
    ('WordPress website for our company', 1, 2, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
    ('Manage our company servers', 2, 7, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
    ('Hosting account is not working', 3, 9, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
    ('MySQL database from my desktop application', 4, 17, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
    ('Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
    ('Migrate web application and database to new server', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
    ('Android Application development', 4, 23, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));

-- Show all tables in the database
SHOW TABLES;
