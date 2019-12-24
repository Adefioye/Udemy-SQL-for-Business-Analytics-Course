/*
<>, != represents 'NOT EQUAL' operators
*/

-- To select people whose first name is not 'Mark' from employees table
 USE employees;

SELECT 
    *
FROM
    employees
WHERE
    first_name != 'Mark';

-- To provide a list of employees hired after the '1st of January 2000'

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';

-- To provide a list of employees hired on and after the '1st of January 2000'

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

-- To provide a list of employees hired before '1st of February 1985'

SELECT 
    *
FROM
    employees
WHERE
    hire_date < '1985-02-01';

-- To provide a list of employees hired before and on '1st of February 1985'

SELECT 
    *
FROM
    employees
WHERE
    hire_date <= '1985-02-01';

-- To retrieve a list of all female employees who were hired in the year 2000 and after

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';

-- To extract a list with all employees salaries higher than $150,000 per annum

SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;