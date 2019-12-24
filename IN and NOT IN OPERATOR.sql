-- The IN OPEARTOR allows SQL to return the names written in parenthesses, if they exist in 
-- our table

-- To select people with firstname either Cathie or Mark or Nathan using IN OPERATOR 

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');

-- To select people with firstname other than Cathie, Mark and Nathan. NOT IN operator is used.

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');

-- To select all individuals from employee table whose first name is either 'Denis' or 'Elvis'
-- using IN OPERATOR

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');

-- To select individuasls from employees table that are not 'Denis' and 'Elvis' using
-- using NOT IN OPERATOR

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Denis' , 'Elvis');

-- Extract all records from the employees table aside from those with employees named 
-- john, mark or jacob

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');