-- 1. Create and select the database
CREATE DATABASE samplejoin;
USE samplejoin;

-- 2. Create tables
CREATE TABLE mathclub (
    mathclub_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE scienceclub (
    scienceclub_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

-- 3. Insert records
INSERT INTO mathclub (name) VALUES 
('John'), ('Jane'), ('Mary'), ('David'), ('Amelia');

INSERT INTO scienceclub (name) VALUES 
('Sophia'), ('John'), ('Amelia'), ('Joe');

-- 4. Basic SELECT queries
SELECT name FROM mathclub;
SELECT name FROM scienceclub;

SELECT mathclub_id FROM mathclub;
SELECT scienceclub_id FROM scienceclub;

-- 5. INNER JOIN (only those in both clubs)
SELECT 
    mathclub.mathclub_id, mathclub.name, 
    scienceclub.scienceclub_id, scienceclub.name 
FROM mathclub 
INNER JOIN scienceclub ON mathclub.name = scienceclub.name;

-- 6. RIGHT JOIN (all scienceclub members, match if in mathclub)
SELECT 
    mathclub.mathclub_id, mathclub.name, 
    scienceclub.scienceclub_id, scienceclub.name 
FROM mathclub 
RIGHT JOIN scienceclub ON mathclub.name = scienceclub.name;

-- 7. RIGHT JOIN (using *)
SELECT * 
FROM mathclub 
RIGHT JOIN scienceclub ON mathclub.name = scienceclub.name;

-- 8. LEFT JOIN + NULL filter (mathclub members *not* in scienceclub)
SELECT 
    mathclub.mathclub_id, mathclub.name, 
    scienceclub.scienceclub_id, scienceclub.name 
FROM mathclub 
LEFT JOIN scienceclub ON mathclub.name = scienceclub.name 
WHERE scienceclub.scienceclub_id IS NULL;

-- 9. Add "year" columns
ALTER TABLE scienceclub ADD COLUMN year VARCHAR(10);
ALTER TABLE mathclub ADD COLUMN year VARCHAR(10);

-- 10. Update year levels
UPDATE mathclub SET year = 'BSIT 2-2' WHERE name = 'John';
UPDATE mathclub SET year = 'BSIT 2-3' WHERE name = 'David';
UPDATE mathclub SET year = 'BSIT 3-1' WHERE name = 'Amelia';
UPDATE mathclub SET year = 'BSIT 4-2' WHERE name = 'Jane';
UPDATE mathclub SET year = 'BSIT 4-3' WHERE name = 'Mary';

UPDATE scienceclub SET year = 'BSIT 2-2' WHERE name = 'John';
UPDATE scienceclub SET year = 'BSIT 3-2' WHERE name = 'Sophia';
UPDATE scienceclub SET year = 'BSIT 2-1' WHERE name = 'Joe';
UPDATE scienceclub SET year = 'BSIT 3-1' WHERE name = 'Amelia';

-- 11. INNER JOIN with filter (both clubs, year starts with "BSIT 2")
SELECT 
    mathclub.mathclub_id, mathclub.name, 
    scienceclub.scienceclub_id, scienceclub.name 
FROM mathclub 
INNER JOIN scienceclub ON mathclub.name = scienceclub.name 
WHERE mathclub.year LIKE 'BSIT 2%';

-- 12. INNER JOIN with NULL filter and year condition (will always return 0 rows since inner join excludes NULLs)
SELECT 
    mathclub.mathclub_id, mathclub.name, 
    scienceclub.scienceclub_id, scienceclub.name 
FROM mathclub 
INNER JOIN scienceclub ON mathclub.name = scienceclub.name 
WHERE scienceclub.scienceclub_id IS NULL 
  AND mathclub.year LIKE 'BSIT 2%';
