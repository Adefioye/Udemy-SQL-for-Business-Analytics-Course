/*
WHERE vs HAVING

WHERE allows us to set conditions that refer to subsets of individual rows, applied before
 re-organizing the output into groups
*/

-- Extract a list of all names that are encountered less than 200times. Let the data refer
-- to people hired after the 1st of January 1999.

use employees; 

SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200;

/*
Important to note that the HAVING clause cannot be used on AGGREGATED and NON_AGGREGATED 
CONDITION. For aggregated condition, Group BY and HAVING CLAUSE ARE USED, For general
conditions, WHERE clause is used
*/

-- Select the employee number of all individuals who have signed more than one contract after 
-- after the 1st of january 2000

select count(distinct emp_no) from dept_emp;
select count(*) from dept_emp;

# The two codes above show that total record is more than the number of unique emp_no
# in the dept_emp table. Therefore there are some emp_no that exist more than once in the 
# the dept_rmp table

SELECT 
    emp_no, COUNT(emp_no) AS emp_id_count
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no;
