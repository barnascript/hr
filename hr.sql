-- create database
CREATE DATABASE projects;

set sql_safe_updates = 0;
-- use database
USE projects;

select * from hr;

-- ------------------------------
-- DATA CLEANING ----------------
-- ------------------------------
-- ------------------------------


-- 1. change id
ALTER TABLE hr
CHANGE COLUMN id emp_id varchar(20) null;

-- 2. change birthdates FORMAT
UPDATE hr 
	set birthdate = 
	case
		when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
		when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
		else null
    end;

-- 3. change column date format'
alter table hr
modify column birthdate date;

describe hr;

select hire_date from hr;

-- 4. change hire_dates FORMAT

update hr
	set hire_date =
		case
			when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'),'%Y-%m-%d')
            when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
            else null
		end;
        
-- 5. change hire_date type to date
alter table hr
modify column hire_date date;

-- 6. change termdates FORMAT
update hr
set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate is not null and termdate != '';

-- 7. Fill empty termdate rows
UPDATE hr
SET termdate = '0000-00-00'
WHERE termdate = '';

-- 8. Convert hire_date to date
UPDATE hr
SET termdate = '0000-00-00'
WHERE termdate = NULL;

-- 9. convert termdate to date
alter table hr
modify column termdate date;

-- 10. add age column
alter table hr
add column age int;

-- 11. populate the age column
update hr
set age = timestampdiff(YEAR, birthdate, CURDATE());

-- 12. delete ages below 18
DELETE FROM hr WHERE age < 18;

describe hr;
select min(age), max(age) from hr;

select age from hr where age < 18;


-- ------------------------------
-- EXPLORATORY DATA ANALYSIS ----
-- ------------------------------
-- ------------------------------

-- 1. What is the Gender breakdown of employees in the company?

select distinct gender as gender_breakdown, 
count(gender) as gender_count 
from hr
where termdate is NULL
group by gender_breakdown; -- Male - 10794, Female - 9876, Non-Conforming - 577


-- 2. What is the Race/Ethnicity breakdown of employees in the company?
select race, count(*) as race_breakdown 
from hr
where termdate is null
group by race; 

-- 'Hispanic or Latino','1994'
-- 'White','4987'
-- 'Black or African American','2840'
-- 'Asian','2791'
-- 'Two or More Races','2867'
-- 'American Indian or Alaska Native','1051'
-- 'Native Hawaiian or Other Pacific Islander','952'


-- 3. What is the age distribution of employees in the company?

select
	case
		when age >= 18 and age <= 24 then '18 - 24'
        when age >=25 and age <= 34 then '25 - 34'
        when age >=35 and age <= 44 then '35 - 44'
        when age >=45 and age <= 54 then '45 - 54'
        when age > 54 and age <= 64 then '54 - 64'
        else '65+'
	end as age_group,
    gender,
count(age) as age_count
from hr
where termdate is null
group by age_group, gender
order by age_group asc;


-- 3. How many employees work at headquarters vs remote locations?

select location, count(*) as location_count
from hr
where termdate is null
group by location;

-- 4. What is the average length of employment for employees who have been terminated?

select round(avg(datediff(termdate, hire_date))/365, 0)
as avg_length_of_employment 
from hr
where termdate is not null and termdate <= curdate();

-- 4. How does the gender distribution vary across departments?
select distinct gender, department, 
count(gender) as number_of_gender
from hr
where termdate is null
group by gender, department
order by gender, department;

-- 5. What is the distribution of job titles accros the country?

select jobtitle, count(*) 
from hr
where termdate is null
group by jobtitle
order by jobtitle desc;

-- 6. Which department has the highest termination rate?
select 
department, 
total_count, 
terminated_count,
terminated_count / total_count as termination_rate
from(
	select department,
     count(*) as total_count,
		sum(case when termdate is not null and termdate < curdate() then 1 else 0 end) 
        as terminated_count
	from hr
    group by department
    order by department
) as termination_rate

order by termination_rate desc;


-- 7. What is the distribution of employees by city and state?
select location_state,
count(location_state) as state_count
from hr
group by location_city, 
location_state
order by count(location_state) desc;

-- 8. How has the company's employee count changed based on hire and term dates?
select 
	year,
    hires, 
    terminations,
    hires - terminations as net_change,
    round((hires - terminations)/hires * 100, 2) as terminations
from
(
select 
year(hire_date) as year,
count(*) as hires,
sum(case when termdate is not null and termdate < curdate() then 1 else 0 end) as terminations
from hr
group by year(hire_date)
) as subquery
order by year;

-- 9. What is the tenure distribution for each department?

select department, round(avg(datediff(termdate, hire_date)/365), 0) as avg_tenure
from hr
where termdate is not null and termdate < curdate()
group by department;

select * from hr;

select termdate from hr;




