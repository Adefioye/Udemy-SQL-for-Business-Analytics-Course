-- Create employees duplicate

/*
UNION vs UNION ALL
-- when uniting two identically organized table
# UNION displays only distinct values in the output
	-- UNION uses more SQL resources (computational power and storage space)
# UNION ALL retrieves the duplicate as well

-- Looking for better results use UNION, however to optimize optimize prrformance use UNION ALL
# 

*/

use employees;

drop table if exists employees_dup;

create table employees_dup
(
	emp_no numeric(11),
    birth_date date,
    first_name varchar(14),
    last_name varchar(16),
    gender enum('M', 'F'),
    hire_date date
);

-- duplicate structure of employees table

insert into employees_dup
select * from employees limit 20;

select * from employees_dup;

/*
UNION ALL is used to combine a few SELECT statements in a single output. we can think of it as 
alter tool that allows you to unify tables
# SYNTAX is as shown below

select N_columns
from table_1
UNION ALL
Select N_columns
from table_2

-- The columns should in both table should be of same name, order and data types
*/

-- To join two tables with different columns,

select e.emp_no, e.first_name, e.last_name, null as dept_no, null as from_date
from employees_dup e where e.emp_no = 10001
union all
select null as emp_no, null as first_name, null as last_name, m.dept_no, m.from_date
from dept_manager m;

-- insert a duplicate first row

insert into employees_dup values
('10001', '1953-09-02', 'Georgi', 'facello', 'M', '1986-06-26');

set @@global.sql_mode = replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            m.dept_no,
            m.from_date
    FROM
        dept_manager m) AS a
ORDER BY - a.emp_no desc;
