/*
LIKE OPERATOR helps to retrieve specific pattern in a table. This is done using the wild
characters % and _. %(which is a substitute for a sequence of characters) and _(helps to match
a single character)
*/
--

-- To select people whose first name starts with 'Mar'

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%');

-- To select people whose first name starts with 'ar'

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('ar%');

-- To select people whose first name ends with 'ar'

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar');

-- To select people whose first name have 'ar' in between the wordings

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar%');

-- To select people whose first name have 4 letters starting with 'Mar' 

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');

-- To select people whose first name don't have 'Mar' within their wordings 

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Mar%');

-- To select individuals whose first name starts with 'Mark'

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');

-- To retrieve a list with employees who have been hired in the year 2000

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('2000%');

-- To retrieve a list of employees whose employee number is written with 5 characters
-- and starts with '1000'

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
