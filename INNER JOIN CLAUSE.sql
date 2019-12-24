/*
INNER JOIN helps to extract output from two tables. This is done by matching values of the column
that is common to both tables.
--SYNTAX

SELECT table_1.column_name(s), table_2.column_name(s)
FROM table_1
JOIN table_2 ON table_1.column_name = table_2.column_name;



# Venn diagram is a mathematical tool representing all possoble logical relations between a
 collection of finite sets
*/

--  Using INNER JOIN to extract records from both dept_manager_dup and dept_dup

select * from dept_manager_dup order by dept_no;

use employees;

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
inner join dept_dup d on m.dept_no = d.dept_no
order by m.dept_no;

-- Extracting a list of information of all managers' employees number, first and last name,
-- department number and hire date

select e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
from employees e
inner join dept_manager d on e.emp_no = d.emp_no
order by e.emp_no;
