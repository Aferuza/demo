


Create table Studentinfo
(course_id_num INT NOT NULL, Course_Short_Title char (20), Course_Long_Title char (20),  Country char(20));

Insert 
into Studentinfo (course_id_num, Course_Short_Title, Course_Long_Title, Country)
values 
('1',  'HeroesAX', 'The Ancient Italian Hero', 'Germany');

Insert 
into Studentinfo (course_id_num, Course_Short_Title, Course_Long_Title, Country)
values
('HarvardX/C322x/2014_Spring',  'HeroesAX', 'The Ancient Italian Hero', 'Germany');


ALTER TABLE Studentinfo
ADD Institution VARCHAR(50) not null;

select * from Studentinfo;
