-- Group By

SELECT *
FROM employee_demographics;


SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- ORDER BY 
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC; 		-- Be careful of how you use order by

-- you can also use order by with the column number but not adviseable
SELECT *
FROM employee_demographics
ORDER BY 5, 4 DESC;

