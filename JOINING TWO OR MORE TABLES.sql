# Finding average salaries of men and women in a company

use employees;

SELECT 
    e.gender, AVG(s.salary) AS avg_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no;
    
-- Select all managers’ first and last name, hire date, job title, start date, and department 
-- name.

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name,
    t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        LEFT JOIN
    departments d ON dm.dept_no = d.dept_no
WHERE
    t.title = 'Manager';

-- How many males and female managers do we have in employees database

SELECT 
	e.gender,
    count(e.gender) as gender_count
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        LEFT JOIN
    departments d ON dm.dept_no = d.dept_no
WHERE
    t.title = 'Manager'
GROUP BY gender;

-- A more efficient approach requiring judt one join

select e.gender, count(e.gender)
from employees e join dept_manager dm on e.emp_no = dm.emp_no
group by gender;
