# BETWEEN...   AND... helps us designate the interval to which a given value belongs
# BETWEEN.. AND... can be used for dates, strings anmd numeric data types

-- To select individuals who were hired between Jan 1, 1990 to Jan 1, 2000
-- It is essential to note that both values are inclusive in the output

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';

/*
NOT BETWEEN... AND... will refer to an interval composed of two parts
-- an interval below the first value indicated
-- a second interval above the second value

*/

-- To select individuals who were not hired between Jan 1, 1990 to Jan 1, 2000
-- It is important to note that both values are not inclusive for NOT BETWEEN ... AND...

SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';

-- Select all information from the 'salaries' table regarding salary from 66000
-- to 70000 dollars per year

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;

-- Retrieve a list of individuals whose employee number is not between '10004' and '10012'

SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';

-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.

SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';


