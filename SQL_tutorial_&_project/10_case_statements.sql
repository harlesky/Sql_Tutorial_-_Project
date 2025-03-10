-- Case Statements

SELECT first_name, last_name,age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'old'
    WHEN age >= 50 THEN 'VERy old'
END AS Age_Bracket
FROM employee_demographics;


SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN  salary * 1.07
END AS New_SAlry
FROM employee_salary;



SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN  salary * 1.07
END AS New_SAlry
FROM employee_salary;