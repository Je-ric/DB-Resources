-- 1. Create the database and use it
CREATE DATABASE userlogin;
SHOW DATABASES;
USE userlogin;

-- 2. Create the initial user table
CREATE TABLE user (
    id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    username VARCHAR(25) NOT NULL,
    password VARCHAR(25) NOT NULL,
    visible TINYINT(1) NOT NULL,
    email VARCHAR(40) NOT NULL
);

-- 3. View the tables and structure
SHOW TABLES;
DESCRIBE user;

-- 4. Add, rename, and drop columns
ALTER TABLE user ADD COLUMN sex VARCHAR(10) NOT NULL AFTER lastname;
ALTER TABLE user DROP COLUMN sex;  -- This will drop the 'sex' column
ALTER TABLE user ADD COLUMN gender VARCHAR(6) NOT NULL AFTER lastname; -- Correct re-add and rename sequence

-- 5. Rename the table
ALTER TABLE user RENAME TO usertable;
SHOW TABLES;

-- 6. Insert data into usertable
INSERT INTO usertable (firstname, lastname, gender, username, password, visible, email)
VALUES ('JOHN', 'DOE', 'MALE', 'primetuber', '12345', 1, 'abc123@hotmail.com');

-- 7. Select statements
SELECT * FROM usertable;
SELECT firstname, lastname, email FROM usertable;

-- 8. Insert multiple records
INSERT INTO usertable (firstname, lastname, gender, username, password, visible, email)
VALUES 
    ('JOHANA', 'WILLIAMS', 'FEMALE', 'pinkpanther', '54321', 1, 'jwilliams@gmail.com'),
    ('MARK', 'ALLEN', 'FEMALE', 'blackbird34', '98765', 1, 'markallen@gmail.com');

-- 9. More select queries and data manipulation
SELECT * FROM usertable;
SELECT * FROM usertable WHERE gender = 'FEMALE';

-- 10. Update and delete records
UPDATE usertable SET gender = 'MALE' WHERE id = 3;
SELECT * FROM usertable;

UPDATE usertable SET firstname = 'Joana' WHERE id = 2;
SELECT * FROM usertable;

DELETE FROM usertable WHERE id = 3;
SELECT * FROM usertable;

-- 11. Targeted select queries
SELECT firstname, lastname FROM usertable;
SELECT firstname, lastname, email FROM usertable WHERE id IN (1, 2);

-- 12. Add new column and update it
ALTER TABLE usertable ADD COLUMN course VARCHAR(6) NOT NULL;
UPDATE usertable SET course = 'BSIT' WHERE id IN (1, 2);
