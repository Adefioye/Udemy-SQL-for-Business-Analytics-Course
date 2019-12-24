/*
Self-join is important when a table must join itself. if one has to combine certain rows of a 
table with other rows of the same table, one needs a self_join
*/

-- From the emp_manager table, extract the record data only of those employees who are managers 
-- as well

select * from emp_manager;

SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        INNER JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
    
SELECT 
    e1.*
FROM
    emp_manager e1
        INNER JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);