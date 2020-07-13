


Create table Student		
(s_id bigint not null,		
s_num int,		
s_subj text,		
s_grade bigint not null,		
s_dept text (100));		
Insert into Student (s_id, s_num, s_subj,		
s_grade, s_dept)		
values (1, 31, 'History', 56, 'Social');		
		
Insert into Student (s_id, s_num, s_subj,		
s_grade, s_dept)		
values (2, 61, 'Math', 86, 'Economics');		
		
Insert into Student (s_id, s_num, s_subj,		
s_grade, s_dept)		
values (3, 23, 'Biology', 96, 'Medicine');		
		
Insert into Student (s_id, s_num, s_subj,		
s_grade, s_dept)		
values (4, 41, 'English', 96, 'Education');		
		
		
Create table Info		
(i_id bigint not null,		
i_num int,		
i_city text,		
i_country text,		
i_class text (100));		
Insert into Info (i_id, i_num, i_city,		
i_country, i_class)		
values (1, 31, 'Richmond', 'US', 'Social');		
		
Insert into Info (i_id, i_num, i_city,		
i_country, i_class)		
values (2, 61, 'Berlin', 'Germany', 'Economics');		
		
Insert into Info  (i_id, i_num, i_city,		
i_country, i_class)		
values (3, 23, 'Paris', 'France', 'Medicine');		
		
Insert into Info  (i_id, i_num, i_city,		
i_country, i_class)		
values (4, 41, 'Milan', 'Italy', 'Education');		


Select * from Student, Info;
	
    Select s_id, s_dept
        from Student
        where s_dept >
        (Select Max(s_grade)
        from Student
        where s_id = s_dept);
        
        
Select s_num, i_city	
from Student	
inner join Info on	
s_id = Info.i_id	
where s_num=	
(Select (i_city) in 'US'	
from Info);


Select s_dept, s_grade	
from Student	
where	
s_dept =	
(select Max (s_grade)	
from Student);	
		
	
   Select Distinct (s_grade)	
from Student	
where s_num Between 50 and 100	;	 









Select *	
from Student	
where s_subj LIKE 'S, M%';
	
    
    
    						
Select i_num								
from Info								
where i_num is not null;								
    
	Select s_num from student
    where s_num = 23
    order by s_num;
    
 						
Select s_grade, i_city								
from Student Inner Join Info ON s_id = Info.i_id;								


Select Sum(s_grade)	
from Student	
where s_grade > 50	
group by s_grade;	



Select s_num, i_city	
from Student	
inner join Info on	
s_id = Info.i_id	
where s_num	
(Select (i_city) in 'US'	
from Info);	
;

Select s_num, i_city	
from Student	
inner join Info on	
s_id = Info.i_id	
where s_num IN	
(Select (i_city) = 'US'	
from Info)
Group by s_num;;	
	
								
                                
Select Max (s_grade) 
from Student								
where s_grade in 
(Select Max(s_grade)								
from Student)								


Select s_dept, Max(s_Grade) from Student		
Group by s_dept;		


SELECT								
COUNT(*) AS CountOf								
FROM info								
GROUP BY i_id, i_num								
HAVING COUNT(*)>1		

CREATE VIEW AS		
SELECT s_num, s_grade			
FROM Student			
WHERE s_grade > (SELECT AVG(s_grade) FROM Student);		


CREATE VIEW [Higher than Average Grades] AS
SELECT s_num, s_grade, 
FROM Student
WHERE s_grade > 60;			


CREATE VIEW [Higher than Average Grades] AS			
SELECT s_num, s_grade,			
FROM Student			
WHERE s_grade > (SELECT AVG(s_grade) FROM Student);							


select * from Info



Update Info 									
Set i_city = 'London'									
where s_id = 4;			

Update Info 									
Set i_city = 'London'									
where i_id = 4;	

CREATE VIEW VF AS
SELECT s_subj, s_dept
FROM student
WHERE s_num > 3;

/* view
Select* from VF;


SELECT s_subj, s_dept,											
CASE											
WHEN s_grade > 80 THEN 'You passes the exam'											
WHEN s_grade < 80 THEN 'You failed the exam'											
ELSE 'You did not take the exam'											
END AS Studentresults											
FROM Student;											


select*from student, Info;