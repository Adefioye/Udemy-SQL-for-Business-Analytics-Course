/*
DUPLICATE records also known as duplicate rows are identical rows in aSQL table


*/

# Creating duplicate rows

insert into dept_manager_dup values ('110228', 'd003', '1992-03-21', '9999-01-01');

insert into dept_dup values ('d009', 'Customer Service');

# Check 'dept_manager_dup' and 'dept_dup'

select * from dept_manager_dup order by dept_no asc;

select * from dept_dup order by dept_no asc;

# inner join

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
inner join dept_dup d on m.dept_no = d.dept_no
order by m.dept_no;

# To handle duplicate rows, GROUP BY the field that differs most amongst all records

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
inner join dept_dup d on m.dept_no = d.dept_no
group by m.dept_no
order by m.dept_no;

# Remove duplicate rows
delete from dept_manager_dup where emp_no = '110228';
delete from dept_dup where dept_no = 'd009';

# Insert back the records

insert into dept_manager_dup values ('110228', 'd003', '1992-03-21', '9999-01-01');
insert into dept_dup values ('d009', 'Customer Service');


/*
LEFT JOIN rturns all matching values of two tables and values from the left table that match
no values on the right table
*/

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
left join dept_dup d on m.dept_no = d.dept_no
order by m.dept_no;

# Changing the order of appearance of the tables leads to a different output

select d.dept_no, m.emp_no, d.dept_name
from dept_dup d
left join dept_manager_dup m on m.dept_no = d.dept_no
order by d.dept_no;

# To get values that are in the dept_manager_dup table and not dept_dup table

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m 
left join dept_dup d on m.dept_no = d.dept_no
where dept_name is null
order by m.dept_no;

# Join employees and dept_manager tables to return subset of all employees whose last name is
# Markovitch. See if the output contains a manager with that name

select e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no
where last_name = 'Markovitch' and dm.dept_no is not null
order by dm.dept_no, e.emp_no;

/*
RIGHT JOIN output result set that contain all matching values between the linking column and 
non-matching values that are on the right but not on the left
*/

-- Getting the first name and last name of employees with salary greater than 145,000

use employees;

select e.emp_no, e.first_name, e.last_name, s.salary
from employees e join salaries s on e.emp_no = s.emp_no
where s.salary > 145000 order by first_name, last_name;


-- Select the first and last name, the hire date, and the job title of all employees whose
-- first name is “Margareta” and have the last name “Markovitch”.

select e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
from employees e join titles t on e.emp_no = t.emp_no
where e.first_name = 'Margareta' and e.last_name = 'Markovitch';

select @@global.sql_mode;

/*
CROSS JOIN takes the values from a certain table and join them with all the values from the table
we want to join it with. That is it joins all the values from the two tables.
 
 # Mathematically, cross product is the cartesian product of the values of the two or more sets
 # Particularly useful when the tables in a database are not well connected
*/


# To obtain all the department managers in the department. CROSS JOIN is USED

select dm.*, d.*
from dept_manager dm cross join departments d
order by dm.emp_no, d.dept_no;

# To obtain the results not incuding the department the manager is currently head off

select dm.*, d.*
from dept_manager dm cross join departments d
where dm.dept_no != d.dept_no
order by dm.emp_no, d.dept_no;

#

select e.*, d.*
from dept_manager dm cross join departments d join employees e on dm.emp_no = e.emp_no
where dm.dept_no != d.dept_no
order by dm.emp_no, d.dept_no;

-- Use a CROSS JOIN to return a list with all possible combinations between managers from
--  the dept_manager table and department number 9

select dm.*, d.*
from dept_manager dm cross join departments d
where d.dept_no = 'd009'
order by dm.emp_no, d.dept_no;

-- To return results of the first 10 employees based on ID number

select e.*, d.*
from employees e cross join departments d
where e.emp_no <= 10010
order by e.emp_no, d.dept_name;