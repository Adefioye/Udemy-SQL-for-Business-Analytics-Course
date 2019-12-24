/*
TYPICAL SYNTAX when working with functions

DELIMITER $$
CREATE FUNCTION function_name(parameter data_type) RETURNS data_type
DECLARE variable_name data_type
BEGIN
	SELECT
RETURN variable_name
END$$
DELIMITER ;

-- There is no OUT parameter in functions to define between the parentheses after objects name



*/

use employees;
drop function if exists f_emp_avg_salary;

delimiter $$
create function f_emp_avg_salary(p_emp_no numeric) returns decimal(10, 2)
deterministic
begin
declare v_avg_salary decimal(10, 2);
select avg(s.salary) into v_avg_salary 
from employees e join salaries s on e.emp_no = s.emp_no where e.emp_no = p_emp_no;
return v_avg_salary;
end$$
delimiter ;

select f_emp_avg_salary(11300);


drop function if exists f_emp_info;

delimiter $$
create function f_emp_info(p_first_name varchar(255), p_last_name varchar(255)) returns decimal(10, 2)
deterministic
begin
declare v_max_from_date date;
declare v_salary decimal(10, 2);
select max(from_date) into v_max_from_date from employees e join salaries s on e.emp_no = s.emp_no 
where e.first_name = p_first_name and e.last_name = p_last_name;
select s.salary into v_salary from employees e join salaries s on e.emp_no = s.emp_no 
where  e.first_name = p_first_name and e.last_name = p_last_name and s.from_date = v_max_from_date;
return v_salary;
end$$
delimiter ;

select f_emp_info('Aruna', 'Journel');

/*
TEECHNICAL DIFFERENCES between stored procedures and functions

-- Stored procedure does not return a value while Function returns a value
-- Stored procedure can be called using CALL keyword while function can be called using SELECT keyword

CONCEPTUAL DIFFERENCES

-- Stored procedure can have multiple OUT parameters, while Fucntion can return only single value only
# Hence, it is better to use stored procedures when one is to output more than 2 values howevee
# One can use a function to output a single output.

-- INSERT, UPDATE, and DELETE statement cannot be used in a function. However, the DML
-- can be used in a stored PROCEDURE without the OUT parameters

-- a function can be referenced as a column whose data can be retrieved using a SELECT STATEMENT

 



*/

-- Retrieving data about a function using SELECT STATEMENT

set @v_emp_no = 11300;
select emp_no, first_name, last_name, f_emp_avg_salary(@v_emp_no) as avg_salary
from employees where emp_no = @v_emp_no;

