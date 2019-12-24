/*
Subqueries are queries embedded in a query. They can also be called inner queries/ nested queries
they are a part of another query called outer query or outer select
*/

select * from dept_manager;

-- Select first and last name from the 'employees' table for the same employee numbers that can 
-- be found in the 'department manager' table

select e.first_name, e.last_name from employees e 
where e.emp_no in (select m.emp_no from dept_manager m);

-- Extract the information about all department managers who were hired between the Jan 1st, 1990
-- and Jan 1st, 1995

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.dept_no,
    dm.from_date,
    dm.to_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.hire_date BETWEEN '1990-01-01' AND '1995-01-01'
        AND e.emp_no IN (SELECT 
            m.emp_no
        FROM
            dept_manager m);


SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');