# IS NOT NULL is used to extract values out that are not null

-- To extract all employee records where individuals first name is not null

use employees;

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;

-- To check if there is missing values in firstname column

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;

-- Selecting the names of all departments whose department number value is not null

SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL;