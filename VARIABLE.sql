/*
VARIABLES that are being defined in program such as stored procedure. it is called in more abstract
terms as parameters. For a stored routine for example, an input value is called 'argument' while the
obtained value is stored in a 'variable'
*/

use employees;

-- Creating a variable for average salary

set @v_avg_salary = 0;

-- Extract a value that will be assigned to the newly created variable (call the procedure)

call employees.emp_avg_salary_out(11300, @v_avg_salary);

-- Ask the software to display the output of the procedure

select @v_avg_salary;

-- Creating a variable 'v_emo_no'

set @v_emp_no = 0;

call emp_info('Aruna', 'Journel', @v_emp_no);

select @v_emp_no;