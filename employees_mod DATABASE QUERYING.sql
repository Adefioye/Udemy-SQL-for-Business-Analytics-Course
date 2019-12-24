-- Extracting data showing a breakdown of male and female employees working in the company each
-- year starting from 1990

use employees_mod;

select count(emp_no) as number_count from t_dept_emp group by emp_no having  number_count > 1;

SELECT 
    de.from_date,
    de.to_date,
    e.gender,
    f.calendar_year,
    CASE
        WHEN f.calendar_year BETWEEN de.from_date AND de.to_date THEN 1
        ELSE 0
    END AS is_employee
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) AS f
        CROSS JOIN
    t_dept_emp de
        JOIN
    t_employees e ON e.emp_no = de.emp_no
GROUP BY calendar_year , e.gender
HAVING calendar_year >= 1990
ORDER BY calendar_year , e.gender;

select count(*) from t_employees;

-- Compare the number of male managers to the number of female managers from different departments 
-- for each year, starting from 1990.

select * from t_dept_manager;

SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN e.calendar_year BETWEEN YEAR(dm.from_date) AND YEAR(to_date) THEN 1
        ELSE 0
    END AS is_manager
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) AS e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no , calendar_year;


-- Compare the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you 
-- to see that per each department.

SELECT 
    YEAR(s.from_date) AS calendar_year,
    e.gender,
    d.dept_name,
    AVG(s.salary) AS average_salaries
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , calendar_year , e.gender
HAVING calendar_year <= 2002
ORDER BY d.dept_no;


-- Create an SQL stored procedure that will allow you to obtain the average male and female 
-- salary per department within a certain salary range. Let this range be defined by two values 
-- the user can insert when calling the procedure.

drop procedure if exists filter_avg_salary

delimiter $$
create procedure filter_avg_salary (in param_1 numeric, in param_2 numeric)
begin
select e.gender, avg(s.salary) as average_salary, d.dept_name
from t_employees e join t_salaries s on e.emp_no = s.emp_no
 join t_dept_emp de on de.emp_no = s.emp_no join t_departments d on de.dept_no = d.dept_no
 group by d.dept_name, e.gender
 having average_salary between param_1 and param_2
 order by d.dept_name, e.gender;
end$$
delimiter ;

call filter_avg_salary(50000, 90000);

