-- 1. Create the database and use it
CREATE DATABASE Basketball_Game;
USE Basketball_Game;

-- 2. Create the Team table
CREATE TABLE Team (
    TeamID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TeamName VARCHAR(255)
);

-- 3. Create the Referee table
CREATE TABLE Referee (
    RefereeID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    RName VARCHAR(255),
    Birthdate DATE,
    Address VARCHAR(255)
);

-- 4. Create the Location table
CREATE TABLE Location (
    LocationID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    LocationName VARCHAR(255)
);

-- 5. Create the Game_Play table with foreign keys
CREATE TABLE Game_Play (
    GameID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    WinnerTeamID INT UNSIGNED,
    LoserTeamID INT UNSIGNED,
    Wscore INT,
    Lscore INT,
    LocationID INT UNSIGNED,
    GameDate DATE,
    FOREIGN KEY (WinnerTeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (LoserTeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- 6. Create the Game_Official table with composite keys and foreign keys
CREATE TABLE Game_Official (
    GameID INT UNSIGNED,
    RefereeID INT UNSIGNED,
    PRIMARY KEY (GameID, RefereeID),
    FOREIGN KEY (GameID) REFERENCES Game_Play(GameID),
    FOREIGN KEY (RefereeID) REFERENCES Referee(RefereeID)
);

-- 7. Insert sample data into Team
INSERT INTO Team (TeamName) VALUES 
('Ateneo Blue Eagles'),
('La Salle Green Archers'),
('UST Growling Tigers'),
('FEU Tamaraws'),
('UP Fighting Maroons'),
('UE Red Warriors'),
('Adamson Falcons'),
('NU Bulldogs');

-- 8. Insert sample data into Referee
INSERT INTO Referee (RName, Birthdate, Address) VALUES 
('Gil Bautista', '1990-08-30', 'Luzon'),
('Rey Sanchez', '1990-11-08', 'Visayas'),
('Brando Ferrer', '1987-09-15', 'Luzon'),
('Ismael Mansol', '1977-10-31', 'Visayas'),
('Teofilo Ofre', '1972-11-20', 'Mindanao'),
('Jaime Ranito', '1992-11-02', 'Visayas');

-- 9. Insert sample data into Location
INSERT INTO Location (LocationName) VALUES 
('Araneta Coliseum'),
('Cuneta Astrodome'),
('MOA Arena');

-- 10. Insert sample data into Game_Play
INSERT INTO Game_Play (WinnerTeamID, LoserTeamID, Wscore, Lscore, LocationID, GameDate) VALUES 
(1, 4, 98, 92, 1, '2017-11-15'),
(5, 6, 102, 76, 2, '2017-11-20'),
(3, 8, 76, 74, 2, '2017-11-25'),
(2, 7, 85, 80, 3, '2017-12-15'),
(5, 1, 116, 99, 1, '2017-12-20'),
(3, 2, 89, 74, 3, '2018-01-05'),
(1, 2, 96, 91, 1, '2018-01-10'),
(5, 3, 85, 76, 3, '2018-01-15');

-- 11. Insert sample data into Game_Official
INSERT INTO Game_Official (GameID, RefereeID) VALUES 
(1, 2), (1, 5),
(2, 3), (2, 5),
(3, 3), (3, 6),
(4, 5), (4, 6),
(5, 2), (5, 3),
(6, 2), (6, 6),
(7, 3), (7, 6),
(8, 2), (8, 3);
