USE gwnadro_BGT
	;

select State_ID, count(State_ID)
	from Jobs
	group by State_ID 
	order by count(State_ID) Desc
	;

#Selecting Jobs from NY
select JobID, Title_ID, County_ID, avg(Posting_Duration)  from Jobs
	right join States
	on Jobs.State_ID = States.State_ID
    WHERE Jobs.State_ID = 38
	group by County_ID
    ;

select Occupation_Code, Salary, Major_ID from Jobs
	left join Jobs_Majors
    on Jobs.JobID = Jobs_Majors.JobID
    ;
    
select distinct Majors.Major_ID, Edu_Major from Jobs_Majors
	left join Majors
    on Jobs_Majors.Major_ID = Majors.Major_ID
    ;
    
select Jobs.JobID, avg(Jobs.Posting_Duration), 
	Skills.Skill_Type, Skills.Skill_Name,
    Exp_Levels.Experience_Level	
	from Jobs
	left join States
	on Jobs.State_ID = States.State_ID
    left join Exp_Levels
    on Jobs.Exp_ID = Exp_Levels.Exp_ID
    left join Jobs_Skills
    on Jobs.JobID = Jobs_Skills.JobID
    left join Counties
    on Jobs.County_ID = Counties.County_ID
    left join Skills
    on Skills.Skill_ID = Jobs_Skills.Skill_ID
    WHERE Jobs.State_ID = 38
    group by Jobs_Skills.Skill_ID
	;
    
select County, avg(Posting_Duration), Edu_Major from Jobs
	left join Jobs_Majors
	on Jobs.JobID = Jobs_Majors.JobID
    left join States
    on Jobs.State_id = States.State_id
    left join Majors
    on Jobs_Majors.Major_ID = Majors.Major_ID
    left join Counties
    on Jobs.County_ID = Counties.County_ID
    where Jobs.State_id = 38
    group by Edu_Major
    ;
    
select Jobs.JobID, avg(Jobs.Posting_Duration), 
	Skills.Skill_Name, Occupations.Occupation_Name,
    Exp_Levels.Experience_Level, Majors.Edu_Major, Counties.County, Certs.Cert_Name	
	from Jobs
	left join States
	on Jobs.State_ID = States.State_ID
    left join Occupations
    on Jobs.Occupation_Code = Occupations.Occupation_Code
    left join Exp_Levels
    on Jobs.Exp_ID = Exp_Levels.Exp_ID
    left join Jobs_Skills
    on Jobs.JobID = Jobs_Skills.JobID
    left join Jobs_Majors
	on Jobs.JobID = Jobs_Majors.JobID
    left join Counties
    on Jobs.County_ID = Counties.County_ID
    left join Majors
    on Jobs_Majors.Major_ID = Majors.Major_ID
    left join Skills
    on Skills.Skill_ID = Jobs_Skills.Skill_ID
    left join Jobs_Certs
    on Jobs.JobID = Jobs_Certs.JobID
    left join Certs
    on Certs.Cert_ID = Jobs_Certs.Cert_ID
    WHERE Jobs.State_ID = 38
    group by Jobs_Skills.Skill_ID
	;

select * from Certs;