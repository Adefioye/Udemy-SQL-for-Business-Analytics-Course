# DELETE STATEMENT is used to remove records in a database table
/*
The syntax is as shown below

DELETE FROM table_name
WHERE conditions;

The WHERE CONDITION is NECESSARY to avoid losing ALL INFORMATION in the TABLE
*/

use employees;

select * from employees order by emp_no desc;

# Insert the following to the employees table

insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
values (999902, '1973-3-26', 'Patricia', 'Lawrence', 'F', '2005-01-01'),
       (999903, '1977-07-14', 'Jonathan', 'Creek', 'M', '1999-01-01');
       
insert into titles (emp_no, title, from_date)
values (999903, 'Senior Engineer', '1997-10-01');

commit;

select * from employees where emp_no = 999903;

commit;

# To delete the record with emp_no of 999903 in the employees table

delete from employees where emp_no = 999903;

# To restore the DELETE ACTION. ROLLBACK is executed
rollback;


-- To remove department number 10 in the 'departments' table

delete from departments where dept_no = 'd010';
