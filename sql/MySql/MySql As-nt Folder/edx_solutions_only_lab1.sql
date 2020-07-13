# step 1
# In Order to create a new Database, we need to first Remove any databases with the same name as the one we're about to create

DROP DATABASE IF EXISTS edx;

# STEP 2
# the name of the database can be anything but in this case we will consider it to be `edx`
# Create a Database named edx

CREATE DATABASE edx;

CREATE TABLE edx.RECORDS (
    `course_id` VARCHAR(300) DEFAULT NULL,
    `Course_Short_Title` VARCHAR(300) DEFAULT NULL,
    `Course_Long_Title` VARCHAR(300) DEFAULT NULL,
    `userid_DI` VARCHAR(300) DEFAULT NULL,
    `registered` INT(1) DEFAULT NULL,
    `viewed` INT(1) DEFAULT NULL,
    `explored` INT(1) DEFAULT NULL,
    `certified` INT(1) DEFAULT NULL,
    `Country` VARCHAR(300) DEFAULT NULL,
    `LoE_DI` VARCHAR(300) DEFAULT NULL,
    `YoB` INT(4) DEFAULT NULL,
    `Age` INT(3) DEFAULT NULL,
    `gender` VARCHAR(5) DEFAULT NULL,
    `grade` DOUBLE DEFAULT NULL,
    `nevents` INT(4) DEFAULT NULL,
    `ndays_act` INT(4) DEFAULT NULL,
    `nplay_video` VARCHAR(300) DEFAULT NULL,
    `nchapters` INT(4) DEFAULT NULL,
    `nforum_posts` INT(5) DEFAULT NULL,
    `roles` VARCHAR(300) DEFAULT NULL,
    `incomplete_flag` INT(5) DEFAULT NULL
);


# Truncate is used to remove all records if already the table exists
TRUNCATE edx.RECORDS;
#Step 4
# Loading data in our newly created table from the external .CSV file
# Make sure to change the path to you file location 

LOAD DATA LOCAL INFILE '/Users/Terianne/Dropbox (Level)/Level-SU2016 Hybrid Lab Content/August 10/EdX_Enrollment_Data_10pct.csv'
-- example windows path:
-- 'G://Research//Level Data//Hybrid//SQL//EdX_Enrollment_Data_10pct.csv'


INTO TABLE edx.RECORDS

# Each column in a CSV file is separated by ','
FIELDS TERMINATED BY ',' 

# Each line in a CSV file is separated by '\n'
LINES TERMINATED BY '\n' 

# Because we want to ignore the header of the .csv file. If your .csv does not have a header remove this line
IGNORE 1 LINES;


-- this is the database we will use, now we can call the tables without edx. prefix
use edx;

SELECT 
    *
FROM
    edx.records;

SELECT 
    COUNT(*)
FROM
    edx.records;

# Step6
# Now let us create three new columns (use the ALTER command to add new columns in the table)
# Note: 'Alter' keyword can only be used to update an existing table
# Note: 'Alter' keyword can only be used to update the Structure of the table

ALTER TABLE edx.RECORDS
ADD institution VARCHAR (50),
ADD course_number VARCHAR (50),
ADD course_term VARCHAR (50);

SELECT 
    *
FROM
    edx.RECORDS
LIMIT 1;

SELECT 
    course_id,
    SUBSTRING_INDEX(`course_id`, '/', 1) AS institution
FROM
    edx.RECORDS;
    
SELECT 
    course_id,
    SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 2),
            '/',
            - 1) AS course_number
FROM
    edx.RECORDS;
    
SELECT 
    course_id,
    SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 3),
                    '/',
                    - 1),
            '/',
            - 2) AS course_term
FROM
    edx.RECORDS;


# Step7
# Without a primary key in the tables, the settings need to be updated to allow the changes:
SET SQL_SAFE_UPDATES = 0;

UPDATE edx.RECORDS 
SET 
    institution = SUBSTRING_INDEX(`course_id`, '/', 1),
    course_number = SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 2),
            '/',
            - 1),
    course_term = SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 3),
                    '/',
                    - 1),
            '/',
            - 2);

-- alternate step by step approach:
-- UPDATE edx.RECORDS 
-- SET 
--     institution = SUBSTRING_INDEX(`course_id`, '/', 1);
--     
-- UPDATE edx.RECORDS 
-- SET 
--     course_number = SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 2),
--             '/',
--             - 1);
--             
-- UPDATE edx.RECORDS 
-- SET 
--     course_term = SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 3),
--                     '/',
--                     - 1),
--             '/',
--             - 2);

SELECT 
    *
FROM
    edx.RECORDS
LIMIT 1000;

SELECT DISTINCT
    institution, course_number, course_term
FROM
    edx.RECORDS;

SELECT DISTINCT
    country
FROM
    edx.RECORDS
ORDER BY country;

SELECT DISTINCT
    country, userid_DI
FROM
    edx.RECORDS
WHERE
    LoE_DI = 'Doctorate';

SELECT DISTINCT
    Course_Long_Title
FROM
    edx.RECORDS;

SELECT 
    COUNT(*)
FROM
    edx.RECORDS
WHERE
    country = 'Germany';

CREATE TABLE edx.Course SELECT DISTINCT Course_id,
    Institution,
    Course_number,
    Course_term,
    Course_Short_Title,
    Course_Long_Title FROM
    edx.RECORDS;
    
SELECT 
    *
FROM
    edx.course;
-- note, can redefine variable types in create command as shown here:
-- CREATE TABLE edx.Course (
--     `Course_id` VARCHAR(300) NOT NULL,
--     `Institution` VARCHAR(300) DEFAULT NULL,
--     `Course_number` VARCHAR(300) DEFAULT NULL,
--     `Course_term` VARCHAR(300) DEFAULT NULL,
--     `Course_Short_Title` VARCHAR(300) DEFAULT NULL,
--     `Course_Long_Title` VARCHAR(300) DEFAULT NULL
--      )     SELECT DISTINCT Course_id,
--     Institution,
--     Course_number,
--     Course_term,
--     Course_Short_Title,
--     Course_Long_Title FROM
--     edx.RECORDS;

CREATE TABLE edx.Users SELECT userid_DI,
    ANY_VALUE(Country) AS Country,
    ANY_VALUE(LoE_DI) AS LoE_DI,
    ANY_VALUE(YoB) AS YoB,
    ANY_VALUE(Age) AS Age,
    ANY_VALUE(gender) AS Gender FROM
    edx.records
GROUP BY userid_DI;
    


-- Alternate approach:


SELECT 
    *
FROM
    edx.users;

CREATE TABLE edx.course_users SELECT `course_id`,
    `userid_DI`,
    `registered`,
    `viewed`,
    `explored`,
    `certified`,
    `grade`,
    `nevents`,
    `ndays_act`,
    `nplay_video`,
    `nchapters`,
    `nforum_posts`,
    `roles`,
    `incomplete_flag` FROM
    Edx.RECORDS;
    
# Step 13
# Now that you have loaded data in your tables
# lets go ahead and maked the keys in the tables
# we are going to make a primary key and a foreign key in the tables
# primary keys are those keys that identify each row in that particular table uniquely and cannot be NULL
# primary keys need to be unique and they cannot contain duplicate values
# foreign keys are those keys that are referenced from the primary keys
# use the 'ALTER' keyword to alter the structure of the existing table

ALTER TABLE edx.Course
ADD PRIMARY KEY (Course_id);

ALTER TABLE edx.Users
ADD PRIMARY KEY (userid_DI);

ALTER TABLE edx.course_users 
ADD CONSTRAINT fk_course_id -- names the constraint
  FOREIGN KEY (course_id)
  REFERENCES edx.course (Course_id),
ADD CONSTRAINT fk_userid_DI
  FOREIGN KEY (userid_DI)
  REFERENCES edx.users (userid_DI);

