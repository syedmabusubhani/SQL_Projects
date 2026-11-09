 USE project_medical_data_history;
SHOW TABLES;
select * from admissions;
select * from doctors;
select * from patients;
select * from province_names;
-- 1. Show first name, last name, and gender of patients who's gender is 'M'
select first_name, last_name, gender from patients where gender = 'M';
-- 2. Show first name and last name of patients who does not have allergies.
select first_name, last_name, allergies from patients where allergies  is null;
-- 3. Show first name and last name of patients who have a allergies.
select first_name, last_name, allergies from patients where allergies is not null;
-- . Show first name of patients that start with the letter 'C'
select first_name from patients where first_name like 'C%';
-- 5. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
select first_name, last_name, weight from patients where weight between 100 and 120;
select first_name, last_name, weight from patients where weight in (100, 120);
select first_name, last_name, weight from patients where weight not between 100 and 120;
-- 6. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
set SQL_SAFE_UPDATES = 0;
update patients set allergies = 'NKA' where allergies is null;
select * from patients;
select user(), current_user();
show grants;
grant update 
on project_medical_data_history.patients to 'dm_team4'@'103.206.9.229';
select user(), current_user();
show grants for current_user();
-- 6. Show first name and last name concatenated into one column to show their full name.
select first_name, last_name, concat(first_name, ' ', last_name) as full_name from patients;
-- 7. Show first name, last name, and the full province name of each patient.
select * from province_names;
select * from patients;
select 
p.first_name,
p.last_name,
pn.province_name from
patients as p join province_names as pn on p.province_id = pn.province_id;
-- 8. Show how many patients have a birth_date with 2010 as the birth year.
select * from patients;
select count(*) as total_patients from patients where year(birth_date) = 2010;
-- 9. Show the first_name, last_name, and height of the patient with the greatest height.
select first_name, last_name, height from patients order by height desc limit 1;
select max(height) from patients;
-- 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * from patients where patient_id in (1, 45, 534, 879, 1000);

-- 11. Show the total number of admissions
select * from admissions;
select count(*) as total_admissions from admissions;
-- 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions where admission_date = discharge_date;
-- 13. Show the total number of admissions for patient_id 579.
select count(*) as total_admissions from admissions where patient_id = 579;
-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select * from patients;
select distinct city as unique_citys from patients where province_id = 'NS';
-- 15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
select first_name, last_name, birth_date, height, weight from patients where height > 160 and weight > 70;

-- 16. Show unique birth years from patients and order them by ascending.
select distinct(year(birth_date)) as birth_years from patients order by 1;
select distinct(month(birth_date)) as birth_month from patients order by birth_month;
select distinct(day(birth_date)) as birth_date from patients order by birth_date ;
-- 17. Show unique first names from the patients table which only occurs once in the list.
select first_name from patients group by 1 having count(*) = 1;
-- 18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id, first_name from patients where first_name like 'S______%s';
-- 19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.  
-- Primary diagnosis is stored in the admissions table.
select 
distinct
p.patient_id, p.first_name, p.last_name, a.diagnosis from patients as p join
admissions as a on p.patient_id = a.patient_id where diagnosis = 'Dementia';
select 
p.patient_id, p.first_name, p.last_name, a.diagnosis from patients as p join
admissions as a on p.patient_id = a.patient_id where diagnosis = 'Dementia';
-- 20. Display every patient's first_name. 
-- Order the list by the length of each name and then by alphbetically.
select first_name, length(first_name) as name_length from patients order by name_length;
select first_name from patients order by length(first_name) asc, first_name asc; 
SELECT first_name, LENGTH(first_name)
FROM patients
ORDER BY LENGTH(first_name) ASC,
         first_name ASC;

show databases;
use project_medical_data_history;
show tables;
-- 
USE project_medical_data_history;



SHOW TABLES;
select * from admissions;
select * from doctors;
select * from patients;
select * from province_names;
-- 1. Show first name, last name, and gender of patients who's gender is 'M'
select first_name, last_name, gender from patients where gender = 'M';
-- 2. Show first name and last name of patients who does not have allergies.
select first_name, last_name, allergies from patients where allergies  is null;
-- 3. Show first name and last name of patients who have a allergies.
select first_name, last_name, allergies from patients where allergies is not null;
-- . Show first name of patients that start with the letter 'C'
select first_name from patients where first_name like 'C%';
-- 5. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
select first_name, last_name, weight from patients where weight between 100 and 120;
select first_name, last_name, weight from patients where weight in (100, 120);
select first_name, last_name, weight from patients where weight not between 100 and 120;
-- 6. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
set SQL_SAFE_UPDATES = 0;
update patients set allergies = 'NKA' where allergies is null;
select * from patients;
select user(), current_user();
show grants;
grant update 
on project_medical_data_history.patients to 'dm_team4'@'103.206.9.229';
select user(), current_user();
show grants for current_user();
-- 6. Show first name and last name concatenated into one column to show their full name.
select first_name, last_name, concat(first_name, ' ', last_name) as full_name from patients;
-- 7. Show first name, last name, and the full province name of each patient.
select * from province_names;
select * from patients;
select 
p.first_name,
p.last_name,
pn.province_name from
patients as p join province_names as pn on p.province_id = pn.province_id;
-- 8. Show how many patients have a birth_date with 2010 as the birth year.
select * from patients;
select count(*) as total_patients from patients where year(birth_date) = 2010;
-- 9. Show the first_name, last_name, and height of the patient with the greatest height.
select first_name, last_name, height from patients order by height desc limit 1;
select max(height) from patients;
-- 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * from patients where patient_id in (1, 45, 534, 879, 1000);

-- 11. Show the total number of admissions
select * from admissions;
select count(*) as total_admissions from admissions;
-- 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions where admission_date = discharge_date;
-- 13. Show the total number of admissions for patient_id 579.
select count(*) as total_admissions from admissions where patient_id = 579;
-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select * from patients;
select distinct city as unique_citys from patients where province_id = 'NS';
-- 15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
select first_name, last_name, birth_date, height, weight from patients where height > 160 and weight > 70;

-- 16. Show unique birth years from patients and order them by ascending.
select distinct(year(birth_date)) as birth_years from patients order by 1;
select distinct(month(birth_date)) as birth_month from patients order by birth_month;
select distinct(day(birth_date)) as birth_date from patients order by birth_date ;
-- 17. Show unique first names from the patients table which only occurs once in the list.
select first_name from patients group by 1 having count(*) = 1;
-- 18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id, first_name from patients where first_name like 'S______%s';
-- 19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.  
-- Primary diagnosis is stored in the admissions table.
select 
distinct
p.patient_id, p.first_name, p.last_name, a.diagnosis from patients as p join
admissions as a on p.patient_id = a.patient_id where diagnosis = 'Dementia';
select 
p.patient_id, p.first_name, p.last_name, a.diagnosis from patients as p join
admissions as a on p.patient_id = a.patient_id where diagnosis = 'Dementia';
-- 20. Display every patient's first_name. 
-- Order the list by the length of each name and then by alphbetically.
select first_name, length(first_name) as name_length from patients order by name_length;
select first_name from patients order by length(first_name) asc, first_name asc; 
SELECT first_name, LENGTH(first_name)
FROM patients
ORDER BY LENGTH(first_name) ASC,
         first_name ASC;

show databases;
use project_medical_data_history;
-- 
USE project_medical_data_history;



SHOW TABLES;
select * from admissions;
select * from doctors;
select * from patients;
select * from province_names;
-- 1. Show first name, last name, and gender of patients who's gender is 'M'
select first_name, last_name, gender from patients where gender = 'M';
-- 2. Show first name and last name of patients who does not have allergies.
select first_name, last_name, allergies from patients where allergies  is null;
-- 3. Show first name and last name of patients who have a allergies.
select first_name, last_name, allergies from patients where allergies is not null;
-- . Show first name of patients that start with the letter 'C'
select first_name from patients where first_name like 'C%';
-- 5. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
select first_name, last_name, weight from patients where weight between 100 and 120;
select first_name, last_name, weight from patients where weight in (100, 120);
select first_name, last_name, weight from patients where weight not between 100 and 120;
-- 6. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
set SQL_SAFE_UPDATES = 0;
update patients set allergies = 'NKA' where allergies is null;
select * from patients;
select user(), current_user();
show grants;
grant update 
on project_medical_data_history.patients to 'dm_team4'@'103.206.9.229';
select user(), current_user();
show grants for current_user();
-- 6. Show first name and last name concatenated into one column to show their full name.
select first_name, last_name, concat(first_name, ' ', last_name) as full_name from patients;
-- 7. Show first name, last name, and the full province name of each patient.
select * from province_names;
select * from patients;
select 
p.first_name,
p.last_name,
pn.province_name from
patients as p join province_names as pn on p.province_id = pn.province_id;
-- 8. Show how many patients have a birth_date with 2010 as the birth year.
select * from patients;
select count(*) as total_patients from patients where year(birth_date) = 2010;
-- 9. Show the first_name, last_name, and height of the patient with the greatest height.
select first_name, last_name, height from patients order by height desc limit 1;
select max(height) from patients;
-- 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * from patients where patient_id in (1, 45, 534, 879, 1000);

-- 11. Show the total number of admissions
select * from admissions;
select count(*) as total_admissions from admissions;
-- 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions where admission_date = discharge_date;
-- 13. Show the total number of admissions for patient_id 579.
select count(*) as total_admissions from admissions where patient_id = 579;
-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select * from patients;
select distinct city as unique_citys from patients where province_id = 'NS';
-- 15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
select first_name, last_name, birth_date, height, weight from patients where height > 160 and weight > 70;

-- 16. Show unique birth years from patients and order them by ascending.
select distinct(year(birth_date)) as birth_years from patients order by 1;
select distinct(month(birth_date)) as birth_month from patients order by birth_month;
select distinct(day(birth_date)) as birth_date from patients order by birth_date ;
-- 17. Show unique first names from the patients table which only occurs once in the list.
select first_name from patients group by 1 having count(*) = 1;
-- 18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id, first_name from patients where first_name like 'S______%s';
-- 19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.  
-- Primary diagnosis is stored in the admissions table.
select 
distinct
p.patient_id, p.first_name, p.last_name, a.diagnosis from patients as p join
admissions as a on p.patient_id = a.patient_id where diagnosis = 'Dementia';
select 
p.patient_id, p.first_name, p.last_name, a.diagnosis from patients as p join
admissions as a on p.patient_id = a.patient_id where diagnosis = 'Dementia';
-- 20. Display every patient's first_name. 
-- Order the list by the length of each name and then by alphbetically.
select first_name, length(first_name) as name_length from patients order by name_length;
select first_name from patients order by length(first_name) asc, first_name asc; 
SELECT first_name, LENGTH(first_name)
FROM patients
ORDER BY LENGTH(first_name) ASC,
         first_name ASC;

show databases;
use project_medical_data_history;
-- 21. Show the total amount of male patients and the total amount of female patients in the patients table. 
-- Display the two results in the same row.
select
sum(case when gender = "M" Then 1 else 0 end) as Total_male_patients,
sum(case when gender = "F" Then 1 else 0 end) as Total_female_patients
from patients;
-- 22. Show the total amount of male patients and the total amount of female patients in the patients table. 
-- Display the two results in the same row.
select gender, count(*) as total_patients from patients where gender in('M', 'F') group by gender;
-- 23. Show patient_id, diagnosis from admissions. 
-- Find patients admitted multiple times for the same diagnosis.
select patient_id, diagnosis, count(*) as admission_count
from admissions group by 1, 2 having count(*) > 1;
-- 24. Show the city and the total number of patients in the city. 
-- Order from most to least patients and then by city name ascending.
select city, count(*) as total_patients from patients
group by city order by total_patients desc, city asc;
-- 25. Show first name, last name and role of every person that is either patient or doctor.-- 
-- The roles are either "Patient" or "Doctor"
select first_name, last_name, 'Patient' as role from patients
union all 
select first_name, last_name, 'Doctor' as role from doctors;
-- 26. Show all allergies ordered by popularity. Remove NULL values from query.
select allergies, count(*) as total_patients
from patients where allergies is not null group by allergies order by total_patients desc;
-- 27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. 
-- Sort the list starting from the earliest birth_date.
SELECT first_name, last_name, birth_date
FROM patients
WHERE birth_date >= '1970-01-01'
  AND birth_date < '1980-01-01'
ORDER BY birth_date ASC;
-- 28. We want to display each patient's full name in a single column. 
-- Their last_name in all upper letters must appear first, then first_name in all lower case letters. 
-- Separate the last_name and first_name with a comma. Order the list by the first_name in decending order    
-- EX: SMITH,jane
select concat(upper(last_name), ',', lower(first_name)) as full_name from patients order by  first_name desc;
SHOW TABLES;
select * from admissions;
select * from doctors;
select * from patients;
select * from province_names;
-- 1. Show first name, last name, and gender of patients who's gender is 'M'
select first_name, last_name, gender from patients where gender = 'M';
-- 2. Show first name and last name of patients who does not have allergies.
select first_name, last_name, allergies from patients where allergies  is null;
-- 3. Show first name and last name of patients who have a allergies.
select first_name, last_name, allergies from patients where allergies is not null;
-- . Show first name of patients that start with the letter 'C'
select first_name from patients where first_name like 'C%';
-- 5. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
select first_name, last_name, weight from patients where weight between 100 and 120;
select first_name, last_name, weight from patients where weight in (100, 120);
select first_name, last_name, weight from patients where weight not between 100 and 120;
-- 6. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
set SQL_SAFE_UPDATES = 0;
update patients set allergies = 'NKA' where allergies is null;
select * from patients;
select user(), current_user();
show grants;
grant update 
on project_medical_data_history.patients to 'dm_team4'@'103.206.9.229';
select user(), current_user();
show grants for current_user();
-- 6. Show first name and last name concatenated into one column to show their full name.
select first_name, last_name, concat(first_name, ' ', last_name) as full_name from patients;
-- 7. Show first name, last name, and the full province name of each patient.
select * from province_names;
select * from patients;
select 
p.first_name,
p.last_name,
pn.province_name from
patients as p join province_names as pn on p.province_id = pn.province_id;
-- 8. Show how many patients have a birth_date with 2010 as the birth year.
select * from patients;
select count(*) as total_patients from patients where year(birth_date) = 2010;
-- 9. Show the first_name, last_name, and height of the patient with the greatest height.
select first_name, last_name, height from patients order by height desc limit 1;
select max(height) from patients;
-- 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * from patients where patient_id in (1, 45, 534, 879, 1000);

-- 11. Show the total number of admissions
select * from admissions;
select count(*) as total_admissions from admissions;
-- 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions where admission_date = discharge_date;
-- 13. Show the total number of admissions for patient_id 579.
select count(*) as total_admissions from admissions where patient_id = 579;
-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select * from patients;
select distinct city as unique_citys from patients where province_id = 'NS';
-- 15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
select first_name, last_name, birth_date, height, weight from patients where height > 160 and weight > 70;

-- 16. Show unique birth years from patients and order them by ascending.
select distinct(year(birth_date)) as birth_years from patients order by 1;
select distinct(month(birth_date)) as birth_month from patients order by birth_month;
select distinct(day(birth_date)) as birth_date from patients order by birth_date ;
-- 17. Show unique first names from the patients table which only occurs once in the list.
select first_name from patients group by 1 having count(*) = 1;
-- 18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id, first_name from patients where first_name like 'S______%s';
-- 19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.  
-- Primary diagnosis is stored in the admissions table.
select 
distinct
p.patient_id, p.first_name, p.last_name, a.diagnosis from patients as p join
admissions as a on p.patient_id = a.patient_id where diagnosis = 'Dementia';
select 
p.patient_id, p.first_name, p.last_name, a.diagnosis from patients as p join
admissions as a on p.patient_id = a.patient_id where diagnosis = 'Dementia';
-- 20. Display every patient's first_name. 
-- Order the list by the length of each name and then by alphbetically.
select first_name, length(first_name) as name_length from patients order by name_length;
select first_name from patients order by length(first_name) asc, first_name asc; 
SELECT first_name, LENGTH(first_name)
FROM patients
ORDER BY LENGTH(first_name) ASC,
         first_name ASC;

show databases;
use project_medical_data_history;
-- 21. Show the total amount of male patients and the total amount of female patients in the patients table. 
-- Display the two results in the same row.
select
sum(case when gender = "M" Then 1 else 0 end) as Total_male_patients,
sum(case when gender = "F" Then 1 else 0 end) as Total_female_patients
from patients;
-- 22. Show the total amount of male patients and the total amount of female patients in the patients table. 
-- Display the two results in the same row.
select gender, count(*) as total_patients from patients where gender in('M', 'F') group by gender;
-- 23. Show patient_id, diagnosis from admissions. 
-- Find patients admitted multiple times for the same diagnosis.
select patient_id, diagnosis, count(*) as admission_count
from admissions group by 1, 2 having count(*) > 1;
-- 24. Show the city and the total number of patients in the city. 
-- Order from most to least patients and then by city name ascending.
select city, count(*) as total_patients from patients
group by city order by total_patients desc, city asc;
-- 25. Show first name, last name and role of every person that is either patient or doctor.-- 
-- The roles are either "Patient" or "Doctor"
select first_name, last_name, 'Patient' as role from patients
union all 
select first_name, last_name, 'Doctor' as role from doctors;
-- 26. Show all allergies ordered by popularity. Remove NULL values from query.
select allergies, count(*) as total_patients
from patients where allergies is not null group by allergies order by total_patients desc;
-- 27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. 
-- Sort the list starting from the earliest birth_date.
SELECT first_name, last_name, birth_date
FROM patients
WHERE birth_date >= '1970-01-01'
  AND birth_date < '1980-01-01'
ORDER BY birth_date ASC;
-- 28. We want to display each patient's full name in a single column. 
-- Their last_name in all upper letters must appear first, then first_name in all lower case letters. 
-- Separate the last_name and first_name with a comma. Order the list by the first_name in decending order    
-- EX: SMITH,jane
select concat(upper(last_name), ',', lower(first_name)) as full_name from patients order by  first_name desc;
use project_medical_data_history;
show tables;
select * from doctors;
-- 29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
select * from province_names;
select * from patients;
select province_id, sum(height) as total_height from patients group by 1 having total_height >= 7000;
-- 30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
select max(weight) - min(weight) as weight_difference from patients where last_name = 'Maroni';
-- 31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.

SELECT DAY(admission_date) AS day_of_month,
       COUNT(*) AS total_admissions
FROM admissions
GROUP BY DAY(admission_date)
ORDER BY total_admissions DESC,
         day_of_month ASC;
-- 32. Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. 
-- Order the list by the weight group decending. e.g. if they weight 100 to 109 they are placed in the 100 weight group, 
-- 110-119 = 110 weight group, etc.
SELECT FLOOR(weight / 10) * 10 AS weight_group,
       COUNT(*) AS total_patients
FROM patients
WHERE weight IS NOT NULL
GROUP BY FLOOR(weight / 10) * 10
ORDER BY weight_group DESC;
-- 33. Show patient_id, weight, height, isObese from the patients table.
--  Display isObese as a boolean 0 or 1. Obese is defined as weight(kg)/(height(m). 
--  Weight is in units kg. Height is in units cm.
SELECT patient_id,
       weight,
       height,
       CASE
           WHEN weight / POWER(height / 100.0, 2) >= 30
           THEN 1
           ELSE 0
       END AS isObese
FROM patients
WHERE height > 0;
-- 34. Show patient_id, first_name, last_name, and attending doctor's specialty. 
-- Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'. 
-- Check patients, admissions, and doctors tables for required information.
SELECT DISTINCT
       p.patient_id,
       p.first_name,
       p.last_name,
       d.specialty
FROM patients AS p
JOIN admissions AS a
    ON p.patient_id = a.patient_id
JOIN doctors AS d
    ON a.doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy'
  AND d.first_name = 'Lisa';  
 
