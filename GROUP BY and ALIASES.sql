/*
GROUP BY CLAUSE is used to group outputs according to a specific field or fields
-- GROUP BY clause must be place immediately afte the WHERE clause, if any, and just before the
-- ORDER BY clause.

When aggregate function is to be used, a GROUP BY clause is a must in the query
*/

-- Selecting individuals based on first name. This outputs unique values of first name

SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

-- The code above can also be re-written using the SELECT DISTINCT structure

SELECT DISTINCT
    first_name
FROM
    employees;

-- selecting the first name and the number of times they appear in the employees table

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

/*
ALIASES are used to rename the selection from a query. The keyword AS is used in the 
renaming of query
*/

-- For example the code above defines the count of first name with count(first_name) which is
-- unprofessional. Hence it is important to rename it to name_count using the AS keyword
-- The renaming is excuted as shown below.

SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

-- Writing a query to obtain  annual salaries higher than $80,000. The second column is 
-- renamed to 'emps_with_same_salary', must show the number of employees contracted to that
-- that salary. Lastly, sort theb output by the first column

SELECT 
    salary, COUNT(salary) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;
