-- 1. Create the database and use it
CREATE DATABASE teachingmanagement;
USE teachingmanagement;

-- 2. Create the department table
CREATE TABLE department (
    DNumber VARCHAR(4) PRIMARY KEY NOT NULL,
    DName VARCHAR(20) NOT NULL
);

-- 3. Create the course table
CREATE TABLE course (
    CNumber VARCHAR(4) PRIMARY KEY NOT NULL,
    CName VARCHAR(20) NOT NULL,
    CUnit VARCHAR(1) NOT NULL
);

-- 4. Create the faculty table (initially with salary, to demonstrate dropping it)
CREATE TABLE faculty (
    FNumber VARCHAR(4) PRIMARY KEY NOT NULL,
    FacultyName VARCHAR(20) NOT NULL,
    Birthdate DATE NOT NULL,
    Address VARCHAR(20) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    DNumber VARCHAR(4) NOT NULL,
    FOREIGN KEY (DNumber) REFERENCES department(DNumber)
);

-- 5. Drop salary as requested
ALTER TABLE faculty DROP COLUMN Salary;

-- 6. Add Gender column and rename Address
ALTER TABLE faculty
    ADD Gender VARCHAR(1) NOT NULL AFTER Birthdate,
    CHANGE COLUMN Address FacultyAddress VARCHAR(20) NOT NULL;

-- 7. Create the teachingload table with foreign key constraints
CREATE TABLE teachingload (
    FNumber VARCHAR(4) NOT NULL,
    CNumber VARCHAR(4) NOT NULL,
    PRIMARY KEY (FNumber, CNumber),
    FOREIGN KEY (FNumber) REFERENCES faculty(FNumber),
    FOREIGN KEY (CNumber) REFERENCES course(CNumber)
);

-- 8. Insert departments
INSERT INTO department (DNumber, DName) VALUES
('D001', 'IT'),
('D002', 'Mathematics'),
('D003', 'English'),
('D004', 'Civil Engineering'),
('D005', 'Filipino');

-- 9. Insert courses
INSERT INTO course (CNumber, CName, CUnit) VALUES
('C001', 'INTECH 3101', '3'),
('C002', 'CENGR 2100', '2'),
('C003', 'FILKOM 1100', '3'),
('C004', 'COMSCI 2100', '2'),
('C005', 'COMSCI 3100', '1'),
('C006', 'MATH 1100', '3'),
('C007', 'ENGL 3125', '3'),
('C008', 'ITELEC 4103', '1');

-- 10. Insert faculty
INSERT INTO faculty (FNumber, FacultyName, Birthdate, Gender, FacultyAddress, DNumber) VALUES
('F001', 'GSInocencio', '1988-01-15', 'F', 'Munoz', 'D002'),
('F002', 'MAManalang', '1988-04-20', 'F', 'Talavera', 'D004'),
('F003', 'ALedesma', '1988-05-25', 'M', 'Munoz', 'D001'),
('F004', 'BVJose', '1991-10-15', 'F', 'CLSU', 'D005'),
('F005', 'EAVillanueva', '1989-02-20', 'F', 'Munoz', 'D001'),
('F006', 'MGReyes', '1999-01-05', 'M', 'CLSU', 'D003'),
('F007', 'MIMSantos', '1997-01-10', 'F', 'Munoz', 'D001'),
('F008', 'GSInocencio', '1995-04-15', 'M', 'CLSU', 'D004');

-- 11. Insert teaching loads
INSERT INTO teachingload (FNumber, CNumber) VALUES
('F001', 'C004'),
('F002', 'C005'),
('F002', 'C008'),
('F004', 'C003'),
('F005', 'C004'),
('F001', 'C006'),
('F008', 'C002'),
('F007', 'C001');

-- 12. Delete specific faculty members
DELETE FROM faculty WHERE FacultyName = 'BVJose';
DELETE FROM faculty WHERE FacultyName = 'MGDeGuzman'; -- This may not delete anything if the name doesn't exist
