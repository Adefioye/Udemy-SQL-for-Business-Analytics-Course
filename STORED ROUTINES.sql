/*
STORED ROUTINES. Routine is a usual, fixed action or series of actions repeated periodically.
Stored routine is a SQL statement or a series of SQL statements that can be stored on the database
server. Hence, whenever a user wants to run the query thery can CALL, REFERENCE or INVOKE the routine

-- There are 2 types of stored routines. Stored procedures and functions
MYSQL syntax for STORED PROCEDURES

DELIMITER $$
CREATE PROCEDURE procedure_name(param_1, param_2)
BEGIN
	SELECT *
    FROM table_name
    LIMIT 1000;
END$$
DELIMITER ;

Parameters represent certain values that the procedure will use to complete the calculation it is
supposed to execute

-- Note that procedure can be executed without a parameter. Nevertheless, the parentheses must always
-- be attached to its name

INVOKING A PROCEDURE. There are 3 main ways of storing a procedure

-- First, CALL database_name.procedure_name()
-- Second, Provided the database has been called using USE database STATEMENT. CALL procedure_name() is used
-- 


*/

# Creating the non-parametric procedure

drop procedure if exists select_employees;

delimiter $$
create procedure select_employees()
begin
	select * from employees limit 1000;
end$$
delimiter ;

# Creating a procedure that will provide the average salary of all employees

delimiter $$

drop procedure if exists select_employees_avg_salaries;

delimiter $$
create procedure select_employees_avg_salaries()
begin
	select dm.emp_no, s.salary, round(avg(s.salary), 2) as avg_salary
    from dept_manager dm join salaries s on dm.emp_no = s.emp_no;
end$$
delimiter ;

-- Invoking the procedure

call employees.select_employees_avg_salaries();

/*
Working with parametric procedures. 
*/

use employees;
drop procedure if exists emp_salary;

delimiter $$
use employees $$
create procedure emp_avg_salary(in p_emp_no numeric)
begin
select e.first_name, e.last_name, avg(s.salary)
from employees e join salaries s on e.emp_no = s.emp_no where e.emp_no = p_emp_no;
end$$
delimiter ;

call emp_avg_salary(11300);

/*
Stored procedures with an output paramater. The output parameter containing the output value of 
the operation executed by the query of the stored procedure. Anytime one creates a procedure
 containing both an IN and an OUT parameter, one must use the SELECT-INTO structure in the objects 
 body
*/

use employees;
drop procedure if exists emp_avg_salary_out;

delimiter $$
use employees $$
create procedure emp_avg_salary_out (in p_emp_no numeric, out p_avg_salary decimal(10, 2))
begin
select avg(s.salary) into p_avg_salary from employees e join salaries s 
on e.emp_no = s.emp_no where e.emp_no = p_emp_no;
end$$
delimiter ;

call emp_avg_salary(11300);

-- Create a procedure called 'emp_info' that uses as parameters the first and the last name of an
-- individual and returns their employee number

use employees;
drop procedure if exists emp_info;

delimiter $$
use employees $$
create procedure emp_info(in p_first_name varchar(14), in p_last_name varchar(16), out p_emp_no numeric)
begin
select emp_no into p_emp_no from employees
where first_name = p_first_name and last_name = p_last_name;
end$$
delimiter ;
