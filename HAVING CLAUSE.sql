/*
HAVING refines the output from the record that do not satisfy a certain condition. incessantly
implemented with GROUP BY. Having can be used in place of WHERE clause. However WHERE cannot
be used in a special case in which HAVING can be used because HAVING is typically used to 
prune down the output of GROUP BY clause.
block
*/

-- To extract a list of all first names that appear more than 250 times in the employees table

SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

-- To extract employees with mean salary greater than $120,000
SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

-- Need to find how to count the number of records obtained