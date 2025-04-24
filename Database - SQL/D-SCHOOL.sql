-- Create a new database called 'school'
CREATE DATABASE school;

-- Use the newly created database
USE school;

-- Create a 'students' table
CREATE TABLE students (
    studentid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(40) NOT NULL,
    lastname VARCHAR(40) NOT NULL,
    class VARCHAR(20),
    age INT(3)
);

-- Insert sample student data into the 'students' table
INSERT INTO students (firstname, lastname, class, age) VALUES
    ('John', 'Doe', 'First', 5),
    ('Mary', 'Smith', 'Third', 7),
    ('James', 'Brown', 'First', 5),
    ('Mike', 'Walker', 'Second', 6),
    ('Linda', 'Jones', 'Third', 7),
    ('John', 'Doe', 'Third', 7),
    ('James', 'Smith', 'First', 6),
    ('John', 'Brown', 'Second', 6),
    ('Daniel', 'Jones', 'First', 7),
    ('Paul', 'Anderson', 'Third', 5),
    ('Mark', 'Davis', 'Second', 6),
    ('Steven', 'Thomas', 'First', 7),
    ('Brian', 'King', 'Second', 5),
    ('Kevin', 'Hall', 'First', 6),
    ('Jason', 'Lee', 'Third', 5),
    ('Jose', 'Young', 'First', 6),
    ('Frank', 'Smith', 'First', 7),
    ('Eric', 'Jones', 'Second', 7),
    ('Jerry', 'Martin', 'Third', 5),
    ('Peter', 'King', 'First', 6),
    ('Henry', 'Clark', 'Second', 7),
    ('Carl', 'White', 'Second', 5),
    ('Joe', 'Thomas', 'First', 7),
    ('Jack', 'Smith', 'Third', 6),
    ('Roy', 'King', 'Second', 5),
    ('Adam', 'Hall', 'First', 6),
    ('Bobby', 'White', 'Second', 7),
    ('Johnny', 'Davis', 'First', 6),
    ('Jimmy', 'Jones', 'Third', 5),
    ('Emma', 'Walker', 'First', 5),
    ('Sophia', 'Walker', 'Third', 6),
    ('Ava', 'Jones', 'First', 7),
    ('Mia', 'Smith', 'Second', 6),
    ('Emily', 'Walker', 'Second', 5),
    ('Grace', 'King', 'First', 5),
    ('Lillian', 'Jones', 'Third', 7),
    ('Lily', 'King', 'Third', 6),
    ('Layla', 'Young', 'First', 5),
    ('Zoe', 'Thomas', 'Second', 7),
    ('Anna', 'Jones', 'Second', 5),
    ('Leah', 'Brown', 'Third', 6),
    ('Camila', 'Hall', 'First', 5),
    ('Riley', 'Martin', 'Third', 6),
    ('Nora', 'Smith', 'Second', 7),
    ('Hailey', 'Clark', 'Second', 7),
    ('Ellie', 'King', 'Third', 5),
    ('Lucy', 'Jones', 'Third', 6),
    ('Stella', 'White', 'First', 5),
    ('Bella', 'White', 'Second', 7),
    ('Mila', 'Smith', 'Third', 6),
    ('Maya', 'Brown', 'First', 5),
    ('Faith', 'Thomas', 'Third', 5),
    ('Eva', 'Brown', 'Second', 7),
    ('Julia', 'King', 'Third', 6),
    ('Ashley', 'Davis', 'First', 5),
    ('Ruby', 'Young', 'Third', 7),
    ('Alice', 'Jones', 'Second', 6),
    ('Jasmine', 'Hall', 'Third', 7);

-- Create a 'teachers' table
CREATE TABLE teachers (
    teacherid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    phone VARCHAR(10)
);

-- Insert sample teacher data into the 'teachers' table
INSERT INTO teachers (name, phone) VALUES
    ('John Doe', '1234567890'),
    ('Caroline Smith', '0987654321'),
    ('Jason King', '1234512345'),
    ('Stella Brown', '0987612345'),
    ('Eric Hall', '0987609876');

-- Create a 'subjects' table
CREATE TABLE subjects (
    subjectid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL
);

-- Insert sample subject data into the 'subjects' table
INSERT INTO subjects (title) VALUES 
    ('English'), 
    ('Mathematics'), 
    ('Science'), 
    ('Computer'), 
    ('History'), 
    ('Geography');

-- Show all tables in the database to verify creation
SHOW TABLES;
