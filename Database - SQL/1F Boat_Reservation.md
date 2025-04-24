-- Create and use the database
CREATE DATABASE Boat_Reservation;
USE Boat_Reservation;

-- Sailors Table
CREATE TABLE tbl_Sailors (
    SID INT UNSIGNED PRIMARY KEY,
    SailorName VARCHAR(50),
    Rating INT,
    Age INT
);

-- Boats Table
CREATE TABLE tbl_Boats (
    BID INT UNSIGNED PRIMARY KEY,
    BoatName VARCHAR(50),
    BoatColor VARCHAR(20)
);

-- Reservations Table
CREATE TABLE tbl_Reserves (
    SID INT UNSIGNED,
    BID INT UNSIGNED,
    ReserveDay DATE,
    FOREIGN KEY (SID) REFERENCES tbl_Sailors(SID),
    FOREIGN KEY (BID) REFERENCES tbl_Boats(BID)
);

-- Insert into Sailors
INSERT INTO tbl_Sailors (SID, SailorName, Rating, Age) VALUES
(22, 'Dustin', 7, 45),
(29, 'Brutus', 1, 33),
(31, 'Lubber', 8, 55),
(32, 'Andy', 8, 25),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 10, 16),
(74, 'Horatio', 9, 35),
(85, 'Art', 3, 25),
(95, 'Bob', 3, 63);

-- Insert into Boats
INSERT INTO tbl_Boats (BID, BoatName, BoatColor) VALUES
(101, 'Interlake', 'Blue'),
(102, 'Interlake', 'Red'),
(103, 'Clipper', 'Green'),
(104, 'Marine', 'Red');

-- Insert into Reserves
INSERT INTO tbl_Reserves (SID, BID, ReserveDay) VALUES
(22, 101, '1998-10-10'),
(22, 102, '1998-10-10'),
(22, 103, '1998-10-08'),
(22, 104, '1998-10-07'),
(31, 102, '1998-11-10'),
(31, 103, '1998-11-06'),
(31, 104, '1998-11-12'),
(64, 101, '1998-09-05'),
(64, 102, '1998-09-08'),
(74, 103, '1998-09-08');
