-- Window Functions

SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;



SELECT dem.first_name, dem.last_name, AVG(salary) OVER(PARTITION BY gender )
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;


SELECT dem.first_name, dem.last_name, salary, 
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

SELECT dem.employee_id, dem.first_name, dem.last_name, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num_salary,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num_salary,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_num_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;