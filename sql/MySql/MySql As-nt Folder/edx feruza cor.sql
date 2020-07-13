DROP DATABASE IF EXISTS DB1;
create database DB1;

Create table DB1.Stud_rec
(course_id int (200), Course_Short_Title char (20), Course_Long_Title varchar (20),  Country char(20));

Insert 
into Stud_rec (course_id, Course_Short_Title, Course_Long_Title, Country)
values 
( 1,  'HeroesAX', 'The Ancient ', 'Germany');

Insert 
into DB1.Stud_rec (course_id, Course_Short_Title, Course_Long_Title, Country)
values 
( 2,  'HeroesAX', 'The Ancient ', 'Germany');

Insert 
into DB1.Stud_rec (course_id, Course_Short_Title, Course_Long_Title, Country)
values 
( 3,  'HeroesAX', 'The Ancient ', 'Germany');

show databases;

use DB1;
select * from DB1.Stud_rec;

ALTER TABLE Stud_rec
ADD Institution VARCHAR(50) null;
select * from stud_rec;

  SELECT course_id, SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 2),'/',
            - 1) AS course_id
FROM
   stud_Info;

SELECT course_id, SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 2),'/',
            - 1) AS course_name
FROM
   stud_Info;
   SELECT course_id, SUBSTRING_INDEX(SUBSTRING_INDEX(`course_id`, '/', 3),'/',
            - 2) AS year_semester
FROM
   stud_Info;
 
 
 select Course_Short_Title from stud_Info
 Limit 2;
 
 
 ALTER TABLE DB1.Stud_rec
ADD PRIMARY KEY (userid_DI);

ALTER TABLE DB1.Stud_rec
ADD CONSTRAINT fk_course_id -- names the constraint
  FOREIGN KEY (course_id)
  REFERENCES edx.course (Course_id),
ADD CONSTRAINT fk_userid_DI
  FOREIGN KEY (userid_DI)
  REFERENCES edx.users (
 
 
 
 
 
Select Distinct Country from Stud_Info where course_id between 1 and 40;
Select Count(*) from Stud_Info where Country= 'Germany';








