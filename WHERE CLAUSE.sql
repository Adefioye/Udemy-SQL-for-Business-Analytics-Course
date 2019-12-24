-- WHERE CLAUSE this helps to retrieve a subset if records based of a specified condition

-- The syntactic structure is as shown below

/*
SELECT column_1, column_2, ......,column_n 
FROM table_name 
WHERE condition;
*/

-- To obtain records with the first_name 'Denis' from the employees table

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
-- Select all people with the first_name 'Elvis' from employees table

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
