-- Triggers and Events

SELECt * 
FROM employee_demographics;

-- Triggers

SELECT *
from employee_salary;


DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW 
BEGIN 
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
    VALUES (NEW .employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CE0', 1000000, NULL);

-- Events
SELECT * 
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees1
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE 
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%'