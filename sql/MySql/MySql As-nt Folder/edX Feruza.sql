
create database EDXl;
use EDXl;

Create table Studentinfo
(course_id_num char (50), Course_Short_Title char (20), Course_Long_Title char (20),  Country char(20));

Insert 
into Studentinfo (course_id_num, Course_Short_Title, Course_Long_Title, Country)
values 
('HarvardX/C522x/2014_Spring',  'HeroesAX', 'The Ancient Italian Hero', 'Germany');

Insert 
into Studentinfo (course_id_num, Course_Short_Title, Course_Long_Title, Country)
values 
('HarvardX/C322x/2014_Spring',  'HeroesAX', 'The Ancient Italian Hero', 'Germany');


select * from Studentinfo;