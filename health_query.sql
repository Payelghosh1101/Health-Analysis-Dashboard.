create database health;
use health;

#1. Retrieve all male individuals with high blood pressure. 
select *
from `health`
where `High Blood Pressure` = 'yes' and `Gender`= 'Male';

#2. List individuals whose cholesterol level is above 250. 

SELECT *
FROM `health`
where `Cholesterol Level` > 250;

#3. Retrieve records of non-smokers with BMI between 18.5 and 24.9.  
SELECT *
FROM `health`
WHERE 	`Smoking` ='No' and BMI BETWEEN 18.5 and 24.9;

#4. Count individuals grouped by their smoking habits. 
SELECT `Smoking`,COUNT(*) as count
FROM `health`
GROUP BY `Smoking`;

#5. Find the average cholesterol level of individuals who have diabetes. 

SELECT AVG(`Cholesterol level`)
FROM `health`
WHERE `Diabetes`='Yes';

#6. List individuals with family heart disease history and high stress level, ordered by age descending. 

SELECT *
FROM `health`
WHERE `Family Heart Disease`='Yes' and `Stress Level`='High'
ORDER BY `Age` Desc;

#7. Count individuals with heart disease status grouped by gender. 
SELECT count(*) as count,`Family Heart Disease`,`Gender`
FROM `health`
group by `Family Heart Disease`,`Gender`;

#8. Get the maximum CRP level grouped by alcohol consumption.

 SELECT MAX(`CRP Level`),`Alcohol Consumption`
 FROM `health`
 GROUP BY `Alcohol Consumption`;

#9. Retrieve the total number of individuals with high and low HDL cholesterol levels, using HAVING to filter for counts greater than 1. 
SELECT *
FROM (
  SELECT 
    (SELECT COUNT(*) FROM `health` WHERE `Low HDL Cholesterol` = 'Yes') AS "Count Low HDL Cholesterol",
    (SELECT COUNT(*) FROM `health` WHERE `High HDL Cholesterol` = 'Yes') AS "Count High HDL Cholesterol"
) AS counts
WHERE `Count Low HDL Cholesterol` > 1 AND `Count High HDL Cholesterol` > 1;

#10. Find individuals with triglyceride levels over 300 and cholesterol levels below 200.

SELECT *
FROM `health`
WHERE `Triglyceride Level` >300 AND `Cholesterol Level`<200;

#11. Calculate the average and maximum BMI for individuals with and without family heart disease. 
SELECT AVG(`BMI`),MAX(`BMI`),`Family Heart Disease`
FROM `health`
GROUP BY `Family Heart Disease`;

#12. Display the average sleep hours and count of records for individuals grouped by diabetes status. 
SELECT AVG(`Sleep Hours`),COUNT(*), `Diabetes`
FROM `health`
GROUP BY `Diabetes`;

#13. Get the sum of CRP levels for individuals who are smokers and grouped by gender. 
SELECT SUM(`CRP Level`),`Gender`
FROM `health`
WHERE `Smoking`='Yes'
GROUP BY `Gender`;

#14. Format the gender column in uppercase and extract only individuals with BMI above 30 (obese). 
SELECT UPPER(gender) AS gender_upper,health.*
FROM `health`
WHERE `BMI`>30;

#15. Get the square root of triglyceride levels for individuals with a fasting blood sugar greater than 120

SELECT  SQRT(`Triglyceride Level`) AS "sqrt Triglyceride Level",`Triglyceride Level`,`Fasting Blood Sugar`
FROM `health`
WHERE `Fasting Blood Sugar`>120;
    
