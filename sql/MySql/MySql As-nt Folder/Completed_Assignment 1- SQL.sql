DROP DATABASE IF EXISTS DB1;
CREATE DATABASE DB1;

USE DB1;

CREATE TABLE IF NOT EXISTS DB1.stud_rec (course_id int not null, course_short_title varchar (200), course_long_title varchar (200),  country varchar(20), institution varchar (50), city varchar (50), Grade int);

INSERT INTO DB1.stud_rec (course_id, course_short_title, course_long_title, country, institution, city, grade)
VALUES (1,  'HeroesAX', 'The Ancient Italian Hero', 'Germany', 'EdX', 'London', 50);


INSERT INTO DB1.stud_rec (course_id, course_short_title, course_long_title, country, institution, city, grade)
VALUES (2,  'HeroesAX', 'The Ancient Italian Hero', 'Germany', 'EdX', 'London', 80);


INSERT INTO DB1.stud_rec (course_id, course_short_title, course_long_title, country, institution)
VALUES (3, 'The Ancient', 'Computer Science', 'USA','Ed');


INSERT INTO DB1.stud_rec (course_id, course_short_title, course_long_title, country, institution, city, grade)
VALUES (4,  'HeroesAX', 'The Ancient Italian Hero', 'Germany', 'EdX', 'London', 50);


INSERT INTO DB1.stud_rec (course_id, course_short_title, course_long_title, country, institution, city, grade)
VALUES (5,  'HeroesAX', 'The Ancient Italian Hero', 'Germany', 'EdX', 'London', 80);


INSERT INTO DB1.stud_rec (course_id, course_short_title, course_long_title, country, institution)
VALUES (6, 'The Ancient', 'Computer Science', 'USA','Ed');

SELECT * FROM stud_rec
ORDER BY course_id DESC;

SELECT * FROM DB1.stud_rec;

-- Organize a column with multiple values into separate columns - SUBSTRING_INDEX;
SELECT 
    course_id,
    SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 2),
            '/',
            - 1) AS course_num
FROM
    DB1.stud_rec;
    
USE DB1;    
UPDATE stud_rec
SET course_id = 1
WHERE grade = 10;
    
-- Add new rows and values into table; 

UPDATE stud_rec
SET c_city = 'San Francisco' 
WHERE course_id = 7;


-- Add new column Grade
ALTER TABLE stud_rec
ADD grade int NOT NULL;

-- Insert values into Grade col 
use DB1;
UPDATE stud_rec 
SET Grade = 80
WHERE course_id = 1;
SELECT * FROM DB1.stud_rec;


use DB1;
UPDATE stud_rec 
SET Grade = 90
WHERE course_id = 2;
SELECT * FROM DB1.stud_rec;

use DB1;
UPDATE stud_rec 
SET Grade = 70
WHERE course_id = 3;
SELECT * FROM DB1.stud_rec;

-- Select mean value, MAX, MIN, SUM, COUNT for the Grade col;
SELECT AVG(Grade) from stud_rec;
SELECT MAX(Grade) from stud_rec;
SELECT MIN(Grade) from stud_rec;
SELECT SUM(Grade) from stud_rec;
SELECT COUNT(Grade) from stud_rec;

-- Add new column
ALTER TABLE stud_rec
ADD Grade INT NOT NULL; 

-- Update the column values
UPDATE stud_rec 
SET Grade = 10 
where course_id = 1;
SELECT * FROM DB1.stud_rec;
show tables;

UPDATE stud_rec 
SET CITY = 'London'
where course_id = 1;
SELECT * FROM DB1.stud_rec;
UPDATE stud_rec 
SET CITY = 'New York'
where course_id = 2;
SELECT * FROM DB1.stud_rec;

UPDATE stud_rec 
SET CITY = 'Paris'
where course_id = 3;
SELECT * FROM DB1.stud_rec;


-- Delete a column from table;
ALTER TABLE stud_rec
DROP COLUMN c_city 


-- SELECT course_id, SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 2),'/', -1) AS course_id
-- FROM stud_rec;

-- SELECT course_id, SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 2),'/',- 1) AS course_name FROM stud_Info; SELECT course_id, SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 3),'/', -2) AS year_semester FROM stud_Info;

-- SELECT Course_Short_Title FROM stud_Info LIMIT 2;
--  
-- SELECT distinct Country from Stud_Info WHERE course_id between 1 and 40;
-- SELECT Count(*) FROM Stud_Info WHERE Country= 'Germany';


-- Create a view to display only 'Country' and 'Grade' columns;
;
CREATE VIEW view_edx AS
SELECT country, Grade
FROM  stud_rec
WHERE course_id BETWEEN 1 AND 4;
SELECT * FROM  view_edx;
SELECT * FROM stud_rec;


-- Order the database by the 'Grade' in Desc Order.

Select Grade
FROM stud_rec
where course_id BETWEEN 1 AND 5
ORDER BY GRADE DESC;

show tables;
-- 
