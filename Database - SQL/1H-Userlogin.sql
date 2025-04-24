-- Create and use the database
CREATE DATABASE userlogin;
USE userlogin;

-- Create the 'user' table
CREATE TABLE user (
    id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    username VARCHAR(25) NOT NULL,
    password VARCHAR(25) NOT NULL,
    visible TINYINT(1) NOT NULL,
    email VARCHAR(40) NOT NULL
);

-- Show tables
SHOW TABLES;

-- Describe the 'user' table structure
DESCRIBE user;

-- Alter the 'user' table to add the 'sex' column
ALTER TABLE user ADD sex VARCHAR(10) NOT NULL AFTER lastname;

-- Drop the 'sex' column
ALTER TABLE user DROP COLUMN sex;

-- Change the 'sex' column to 'gender'
ALTER TABLE user CHANGE COLUMN sex gender VARCHAR(6) NOT NULL;

-- Rename the 'user' table to 'usertable'
ALTER TABLE user RENAME TO usertable;

-- Show tables after renaming
SHOW TABLES;

-- Insert sample data into the 'usertable'
INSERT INTO usertable (firstname, lastname, gender, username, password, visible, email) 
VALUES ("JOHN", "DOE", "MALE", "primetuber", "12345", 1, "abc123@hotmail.com");

-- Select all data from 'usertable'
SELECT * FROM usertable;

-- Select specific columns (firstname, lastname, email)
SELECT firstname, lastname, email FROM usertable;

-- Insert multiple records into the 'usertable'
INSERT INTO usertable (firstname, lastname, gender, username, password, visible, email) 
VALUES 
    ("JOHANA", "WILLIAMS", "FEMALE", "pinkpanther", "54321", 1, "jwilliams@gmail.com"),
    ("MARK", "ALLEN", "FEMALE", "blackbird34", "98765", 1, "markallen@gmail.com");

-- Select all records after inserting
SELECT * FROM usertable;

-- Select records where gender is 'FEMALE'
SELECT * FROM usertable WHERE gender = "FEMALE";

-- Update gender for id = 3 to 'MALE'
UPDATE usertable SET gender = "MALE" WHERE id = 3;

-- Select all records after the update
SELECT * FROM usertable;

-- Update firstname for id = 2 to 'Joana'
UPDATE usertable SET firstname = "Joana" WHERE id = 2;

-- Select all records after the update
SELECT * FROM usertable;

-- Delete the record with id = 3
DELETE FROM usertable WHERE id = 3;

-- Select all records after the deletion
SELECT * FROM usertable;

-- Select firstname and lastname for all records
SELECT firstname, lastname FROM usertable;

-- Select firstname, lastname, and email for specific ids
SELECT firstname, lastname, email FROM usertable WHERE id = 1 OR id = 2;

-- Add a new column 'course' to the 'usertable'
ALTER TABLE usertable ADD course VARCHAR(6) NOT NULL;

-- Update 'course' for id = 1 and id = 2 to 'BSIT'
UPDATE usertable SET course = "BSIT" WHERE id = 1 OR id = 2;

-- Show all data after updating 'course'
SELECT * FROM usertable;
