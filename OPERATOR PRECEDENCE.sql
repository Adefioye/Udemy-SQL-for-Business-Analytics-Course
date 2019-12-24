/*
OPERATOR PRECEDENCE gives logical oprder with which one can use both AND and OR
operators in the WHERE block
*/

-- Retrieving people with the lastname 'Denis' regardless of their gender

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND gender = 'M'
        OR gender = 'F';

/*
The above code did not output people with last_name = 'Denis' regardless of the gender.
The rationale lies in LOGICAL OPERATOR PRECEDENCE which is an SQL rule which states
 that in the execution of a query, the operator AND is applied first, while the 
 operator OR is applied second. that is AND > OR clause
 
 Regardless of the order in which operators arre used, SQL starts by reading 
 conditions around the AND operator, and then later comply with the conditions of the
 OR operator
 
 So in the code written above SQL first check for records that satisfy lastname of 'Denis'
with a male gender. Unfortunately, no records of such. Hence, SQL outputs records 
with a female gender.
*/

-- therefore, to solve this problem, parentheses is placed around the conditions about gender
-- as seen below
 
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');
        
-- To retrieve  all female employees whose first_name is either Kellie or Aruna

SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Kellie'
        OR first_name = 'Aruna')
        AND gender = 'F';

