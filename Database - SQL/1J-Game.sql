-- Create and use the 'basketball_game' database
CREATE DATABASE basketball_game;
USE basketball_game;

-- Create the 'team' table
CREATE TABLE team (
    TeamID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TeamName VARCHAR(50) NOT NULL
);

-- Create the 'referee' table
CREATE TABLE referee (
    RefereeID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    RName VARCHAR(50) NOT NULL,
    Birthdate DATE NOT NULL,
    Age INT(3) NOT NULL,
    Address VARCHAR(50) NOT NULL
);

-- Create the 'location' table
CREATE TABLE location (
    LocationID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    LocationName VARCHAR(30) NOT NULL
);

-- Create the 'game_play' table
CREATE TABLE game_play (
    GameID INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    WinTeamID INT NOT NULL,
    LooseTeamID INT NOT NULL,
    Wscore INT NOT NULL,
    Lscore INT NOT NULL,
    LocationID INT NOT NULL,
    GameDate DATE NOT NULL
);

-- Insert data into 'team' table
INSERT INTO team (TeamName) 
VALUES 
    ('Ateneo Blue Eagles'), 
    ('La Salle Green Archers'), 
    ('UST Growling Tigers'), 
    ('FEU Tamaraws'), 
    ('UP Fighting Maroons'), 
    ('UE Red Warriors'), 
    ('Adamson Falcons'), 
    ('NU Bulldogs');

-- Insert data into 'referee' table
INSERT INTO referee (RName, Birthdate, Age, Address) 
VALUES 
    ('Gil Bautista', '1983-08-30', 34, 'Luzon'),
    ('Rey Sanchez', '1980-11-08', 37, 'Visayas'),
    ('Brando Ferrer', '1987-11-08', 30, 'Luzon'),
    ('Ismael Mansol', '1977-10-31', 40, 'Luzon'),
    ('Teofilo Ofre', '1972-11-20', 45, 'Mindanao'),
    ('Jaime Ranito', '1992-11-02', 25, 'Visayas');

-- Insert data into 'location' table
INSERT INTO location (LocationName) 
VALUES 
    ('Araneta Coliseum'),
    ('Cuneta Astrodome'),
    ('MOA Arena');

-- Insert data into 'game_play' table
INSERT INTO game_play (WinTeamID, LooseTeamID, Wscore, Lscore, LocationID, GameDate) 
VALUES 
    (1, 4, 98, 92, 1, '2017-11-15'),
    (5, 6, 102, 76, 2, '2017-11-20'),
    (3, 8, 76, 74, 3, '2017-11-25'),
    (2, 7, 85, 80, 3, '2017-12-15'),
    (5, 1, 116, 99, 1, '2017-12-20'),
    (3, 2, 89, 74, 3, '2018-01-05'),
    (1, 2, 96, 91, 1, '2018-01-10'),
    (5, 3, 85, 76, 3, '2018-01-15');

-- Query to select all records from 'referee'
SELECT * FROM referee;

-- Query to select all records from 'game_play'
SELECT * FROM game_play;

-- Query to select all records from 'team'
SELECT * FROM team;

-- Query to select all records from 'location'
SELECT * FROM location;

-- Query to select referees born between 1980-01-01 and 1989-12-31
SELECT RName, Age, Birthdate 
FROM referee 
WHERE Birthdate BETWEEN '1980-01-01' AND '1989-12-31';

-- Query to select referees ordered by name
SELECT 
    RefereeID AS "Ref_ID", 
    RName AS "Ref_Name", 
    Birthdate AS "Ref_Birthdate", 
    Age AS "Ref_Age", 
    Address AS "Ref_Address" 
FROM referee 
ORDER BY RName ASC;

-- Query to select game details for November 2017
SELECT WinTeamID, LooseTeamID, LocationID, GameDate 
FROM game_play 
WHERE GameDate LIKE '2017-11%';

-- Query to select games by location ID
SELECT GameID, GameDate 
FROM game_play 
WHERE LocationID IN (1, 2, 3);

-- Query to select referees between ages 30 and 40
SELECT * 
FROM referee 
WHERE Age >= 30 AND Age <= 40;

