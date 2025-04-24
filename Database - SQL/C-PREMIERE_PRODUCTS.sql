-- Create the 'PREMIERE_PRODUCTS' database
CREATE DATABASE PREMIERE_PRODUCTS;
USE PREMIERE_PRODUCTS;

-- Create the 'SALES_REP' table
CREATE TABLE SALES_REP (
    SlsRep_number CHAR(2),
    LAST CHAR(10),
    FIRST CHAR(8),
    STREET CHAR(15),
    CITY CHAR(15),
    STATE CHAR(2),
    ZIP_CODE CHAR(5),
    TOTAL_COMMISSION DECIMAL(7,2),
    COMMISSION_RATE DECIMAL(3,2)
);

-- Insert data into 'SALES_REP' table
INSERT INTO SALES_REP
VALUES
    ('83','Jones','Mary','123 Main','Grant','MI','49219',2150.00,.05),
    ('06','Smith','William','102 Raymond','Ada','MI','49441',4912.50,.07),
    ('12','Diaz','Miguel','419 Harper','Lansing','MI','49224',2150.00,.05);

-- Insert a new sales rep and update their last name
INSERT INTO SALES_REP (SLSREP_NUMBER, LAST, FIRST)
VALUES
    ('18','Martin','Elyse');

UPDATE SALES_REP SET LAST = 'Marlin' WHERE SLSREP_NUMBER = '18';

-- Delete a sales rep by their number
DELETE FROM SALES_REP WHERE SLSREP_NUMBER ='18';

-- Create the 'CUSTOMER' table
CREATE TABLE CUSTOMER (
    Customer_number CHAR(3) PRIMARY KEY,
    Last CHAR(10) NOT NULL,
    First CHAR(8) NOT NULL,
    Street CHAR(15),
    City CHAR(15),
    State CHAR(2),
    Zip_Code CHAR(5),
    Balance DECIMAL(7,2),
    Credit_Limit DECIMAL(6,2),
    SLSREP_NUMBER CHAR(2)
);

-- Insert data into 'CUSTOMER' table
INSERT INTO CUSTOMER
VALUES
    ('124','Adams','Sally','481 Oak','Lansing','MI','49224',818.75,1000,03),
    ('256','Samuels','Ann','215 Pete','Grant','MI','49219',21.50,1500,06),
    ('311','Charles','Don','48 College','Ira','MI','49034',825.75,1000,12),
    ('315','Daniels','Tom','914 Cherry','Kent','MI','48391',770.75,750,06),
    ('405','Williams','Al','519 Watson','Grant','MI','49219',402.75,1500,12),
    ('412','Adams','Sally','16 Elm','Lansing','MI','49224',1817.50,2000,03),
    ('522','Nelson','Mary','108 Pine','Ada','MI','49441',98.75,1500,12),
    ('567','Dinh','Tran','808 Ridge','Harper','MI','48421',402.40,750,06),
    ('587','Galvez','Mara','512 Pine','Ada','MI','49441',114.60,1000,06),
    ('622','Martin','Dan','419 Chip','Grant','MI','49219',1045.75,1000,03);

-- Create the 'ORDERS' table
CREATE TABLE ORDERS (
    ORDER_NUMBER CHAR(5) PRIMARY KEY,
    ORDER_DATE DATE,
    CUSTOMER_NUMBER CHAR(3)
);

-- Insert data into 'ORDERS' table
INSERT INTO ORDERS
VALUES
    ('12489','2022-9-2','124'),
    ('12491','2022-9-2','311'),
    ('12494','2022-9-4','315'),
    ('12495','2022-9-4','256'),
    ('12498','2022-9-5','522'),
    ('12500','2022-9-5','124'),
    ('12504','2022-9-5','522');

-- Update a sales rep number
UPDATE SALES_REP SET SlsRep_number = '03' WHERE SlsRep_number = '83';

-- Create the 'PART' table
CREATE TABLE PART (
    PART_NUMBER CHAR(4) PRIMARY KEY,
    PART_DESCRIPTION CHAR(12),
    UNITS_ON_HAND DECIMAL(4,0),
    ITEM_CLASS CHAR(2),
    WAREHOUSE_NUMBER CHAR(1),
    UNIT_PRICE DECIMAL(6,2)
);

-- Insert data into 'PART' table
INSERT INTO PART
VALUES
    ('AX12','Iron',104,'HW','3',24.95),
    ('AZ52','Dartboard',20,'SG','2',12.95),
    ('BA74','Basketball',40,'SG','1',29.95),
    ('BH22','Cornpopper',95,'HW','3',24.95),
    ('BT04','Gas Grill',11,'AP','2',149.99),
    ('BZ66','Washer',52,'AP','3',399.99),
    ('CA14','Griddle',78,'HW','3',39.99),
    ('CB03','Bike',44,'SG','1',299.99),
    ('CX11','Blender',112,'HW','3',22.95),
    ('CZ81','Treadmill',68,'SG','2',349.95);

-- Create the 'ORDER_LINE' table
CREATE TABLE ORDER_LINE (
    ORDER_NUMBER CHAR(5),
    PART_NUMBER CHAR(4),
    NUMBER_ORDERED DECIMAL(3,0),
    QUOTED_PRICE DECIMAL(6,2),
    PRIMARY KEY (ORDER_NUMBER, PART_NUMBER)
);

-- Insert data into 'ORDER_LINE' table
INSERT INTO ORDER_LINE
VALUES
    ('12489','AX12',11,21.95),
    ('12491','BT04',1,149.99),
    ('12491','BZ66',1,399.99),
    ('12494','CB03',4,279.99),
    ('12495','CX11',2,22.95),
    ('12498','AZ52',2,12.95),
    ('12498','BA74',4,24.95),
    ('12500','BT04',1,149.99),
    ('12504','CZ81',2,325.99);
