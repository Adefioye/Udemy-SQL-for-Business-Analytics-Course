/*
SQL view is a virtual table whose contents are obtained from an existing table or tables called 
base tables. The retrieval happens through an SQL statement incorporated into the view.

-- the view can be think of as a view into the base table
-- the view itself does not contain any real data; the data is physically stored in the base table
-- simply shows the data contained in the base table
 
 In naming a VIEW, v_ or w_ is used as starting characters for craeting VIEW OBJECTS
 
 --A view acts as a shortcut for writing the same select statement every time a new request
 -- has been made
 
 -- Because it is written only once, it saves a lot of coding time and doesnt require extra memory
 -- View acts as a dynamic table because it instantly reflects data and structural changes in the 
 -- base table
 
 -- They are not real datsets. Hence we cannot modify the data via insert and update statement
 -- they should be seen as temporary virtual data tables retrieving information from the base
 -- tables
 
*/


select * from dept_emp;

SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM
    dept_emp
GROUP BY emp_no
HAVING Num > 1;



-- Imagine we wanna visualize only the period encompassing the last contract of each employee

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
-- Create a view that will extract the average salary of all managers registered in the database.
-- Round this value to the nearest cent.

create or replace view v_average_salary_all_managers as
select dm.emp_no, s.salary, round(avg(s.salary), 2) as avg_salary
from dept_manager dm join salaries s on dm.emp_no = s.emp_no;
