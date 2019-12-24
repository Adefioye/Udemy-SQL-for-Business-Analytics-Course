/*
EXISTS checks whether certain row values are found within a subquery. this check is conducted row
by row. it returns a boolean value. if a row value of a subquery exists, it returns TRUE. otherwise
it returns false

-- EXISTS tests row values for existence while IN seraches among values
-- EXISTS is quicker in large dataset while IN is quicker in smaller dataset
-- 

*/

SELECT 
    e.*
FROM
    employees e
WHERE
    EXISTS( SELECT 
            dm.*
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);

use employees;

select * from dept_manager;

-- Select the entire information for all employees whose job title is 'Assistant engineer'
SELECT 
    e.*
FROM
    employees e
WHERE
    EXISTS( SELECT 
            t.*
        FROM
            titles t
        WHERE
            t.title = 'Assistant engineer'
                AND e.emp_no = t.emp_no); 