/*

SYNTAX CASE STATEMENT

SELECT
	column_name(s) 
    CASE condition_field
		WHEN condtion_field_value_1 THEN result_1
		WHEN condition_field_value_2 THEN result_2
		...
		ELSE
		END AS 
FROM
	table_name;
    
IF vs CASE STRUCTURE, IF structure provides just one conditional expression while CASE structure 
provides multiple conmditional structure
*/

SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;
    
-- 2nd approach

SELECT 
    emp_no,
    first_name,
    last_name,
    CASE gender 
        WHEN 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;
    
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'manager'
        ELSE 'employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;

-- Using IF CONSTRUCT

SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female')
FROM
    employees;
    
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'salary was raised by over $30,000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'salary was raised by more than $20,000 but less than $30,000'
        ELSE 'salary was raised by less
        than $20,000'
    END AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

-- Creatiing a 4th coluimn for employee number greater than 109990 indicating whether
-- the employee is also a manager or employee

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.emp_no > 109990;
    
-- Extract a dataset containing the following information about the managers: employee number, 
-- first name, and last name. Add two columns at the end – one showing the difference between 
-- the maximum and minimum salary of that employee, and another one saying whether this salary 
-- raise was higher than $30,000 or NOT.

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'salary raise greater than 30000'
        ELSE 'salary raise not greater than 30000'
    END AS salary_increase
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.emp_no;

/*
Extract the employee number, first name, and last name of the first 100 employees, and add a 
fourth column, called “current_employee” saying “Is still employed” if the employee is still 
working in the company, or “Not an employee anymore” if they aren’t.
*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    IF(MAX(de.to_date) > CURRENT_DATE(),
        'is still employed',
        'Not an employee anymore') AS employee_status
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 100;

select * from dept_emp;