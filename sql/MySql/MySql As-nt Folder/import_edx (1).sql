# Remove any databases with the same name as the one we're about to create
DROP DATABASE IF EXISTS edx;

# Creating a Database named edx
CREATE DATABASE edx;

CREATE TABLE edx.RECORDS (
    `course_id` VARCHAR(300) NOT NULL,
    `Course_Short_Title` VARCHAR(300) DEFAULT NULL,
    `Course_Long_Title` VARCHAR(300) DEFAULT NULL,
    `userid_DI` VARCHAR(300) NOT NULL,
    `registered` INT DEFAULT NULL,
    `viewed` INT DEFAULT NULL,
    `explored` INT DEFAULT NULL,
    `certified` INT DEFAULT NULL,
    `Country` VARCHAR(300) DEFAULT NULL,
    `LoE_DI` VARCHAR(300) DEFAULT NULL,
-- fill in the rest here
);

# Truncate is used to remove all records if already the table exists
# TRUNCATE edx.RECORDS;

# Loading data in our newly created table from the external .CSV file
# Make sure to change the path to you file location
-- an example with osx shown below:
LOAD DATA LOCAL INFILE '/Users/Terianne/Documents/Data/EdX_Data_10pct.csv'

-- an example with windows shown below:
-- LOAD DATA LOCAL INFILE 'C://Users//smit//Desktop//edx_hybrid//dropbox//EdX_Enrollment_Data_10pct.csv'

INTO TABLE edx.RECORDS



# Each column in a CSV file is separated by ','
FIELDS TERMINATED BY ',' 

# Each line in a CSV file is separated by '\n'
LINES TERMINATED BY '\r' 

# Because we want to ignore the header of the .csv file. If your .csv does not have a header remove this line
IGNORE 1 LINES;

SELECT 
    *
FROM
    edx.RECORDS;