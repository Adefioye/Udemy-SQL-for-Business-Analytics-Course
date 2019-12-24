# AND operator allows for the simultaneous satisfaction of 2/more statements 
# in the condition code block 

# To select people with the first name 'Denis' that are MALE

USE employees;

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    
# To retrieve a list with all female employees whose first name is kellie

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
-- OR CLAUSE allows for distinct satisfaction of each condition amongst conditions 
-- specified in the condition code block in the WHERE clause

/*
The AND clause is typically used for conditions set on different columns whilw 
OR clause is used for conditions set on the same column
*/

-- To select people whose first name is 'Denis' and 'Elvis'

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';
        
-- To select a list with all employees whose first name is either Kellie or Aruna

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        



    

    
