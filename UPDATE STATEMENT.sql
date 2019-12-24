/*
UPDATE STATEMENT -- The syntax is as shown below

UPDATE table_name
SET column_1 = value_1, column_2 = value_2
WHERE conditions;


*/

use employees;

update employees
set
	first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
where 
	emp_no = 999901;

DROP TABLE dept_duplicate;

create table dept_duplicate like  departments;

select * from employees where emp_no = 999901;

alter table dept_duplicate drop primary key;

alter table dept_duplicate drop index `dept_name`;

-- checking the dept_duplicate table

insert into dept_duplicate
select * from departments;

update dept_duplicate
set
	dept_no = 'd011',
    dept_name = 'Quality control';

# The above qeries generated an error code: 1062 depicting duplicity of data entries. Hence, 
# the following codes were executed to drop primary key contraints and unique key constraints.

alter table dept_duplicate drop primary key;

alter table dept_duplicate drop index `dept_name`;

commit;

select * from dept_duplicate order by dept_no;

# UPDATING without WHERE CLAUSE

update dept_duplicate
set
	dept_no = 'd011',
    dept_name = 'Quality control';

# The code above showed that ALL rows in the table were updated with same values of 
# dept_no and dept_name BECAUSE the WHERE CLAUSE was not specified.

/*
To reverse this, the ROLLBACK clause is used. Rollback clause takes us back to the 
last commit and if no COMMIT clause has been executed, the ROLLBACK clause will 
take us back to the first change made
*/

rollback;

# The ROLLBACK clause returns back to the last COMMIT statement to UNDO the UPDATE STATEMENT 
# without the WHERE CLAUSE above

-- Change the 'Business Analysis' department name to 'Data Analysis'

insert into departments (dept_no, dept_name)
values ('d010', 'Business Analysis');

commit;

select * from departments order by dept_no desc;

update departments
set dept_name = 'Data Analysis'
where dept_no = 'd010';






