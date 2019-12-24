# SELECT FROM STATEMENT helps to retrieve certain columns or all coluimns of a schema table


-- Selecting first_name and last_name from employees table

SELECT 
    first_name, last_name
FROM
    employees;

-- Selecting all columns in employees table. Wild character '*' is used

SELECT 
    *
FROM
    employees;
    
-- Selecting 'dept_no' column of the 'departments' table

SELECT 
    dept_no
FROM
    departments;

-- Selecting all data from the departments table

SELECT 
    *
FROM
    departments;