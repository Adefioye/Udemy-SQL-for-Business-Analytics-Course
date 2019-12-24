# INSERT STATEMENT

/*
In using INSERT INTO statements, it is importnat to place put VALUES in concordance with 
the order of the column names
*/

SELECT 
    *
FROM
    employees
LIMIT 10;

insert into employees
(
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
) values
(
	999901,
    '1986-04-01',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);

/*
Select ten records from the “titles” table to get a better idea about its content.
Then, in the same table, insert information about employee number 999903. State that he/she 
is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
At the end, sort the records from the “titles” table in descending order to check if you 
have successfully inserted the new record.

# It is crucial to understand that when INSERT INTO statement is to be used on a TABLE with a 
foreign key, one must ensure that ENTRIES inputed for foreign key has a matching value in the
PARENT TABLE that the foreign key is REFERENCING

*/

SELECT 
    *
FROM
    titles
LIMIT 10;

insert into titles (emp_no, title, from_date) 
values (999901, 'Senior Engineer', '1997-10-01');

select * from titles order by emp_no desc;

-- Insert information about the individual with employee number 999903 into the “dept_emp” table. 
-- He/She is working for department number 5, and has started work on  October 1st, 1997; 
-- her/his contract is for an indefinite period of time. '9999-01-01'

select * from dept_emp limit 10;

insert into dept_emp (emp_no, dept_no, from_date, to_date)
values (999901, 'd005', '1997-10-01', '9999-01-01');

select * from dept_emp order by emp_no desc;


/*
INSERT INTO TABLE
*/

-- To create a new table just like departments table and copy the departments data into int
select * from departments limit 10;

# The code below creates the table called department duplicate

create table dept_duplicate like departments;

# To insert the values in departments table into the new table, The following code is executed

insert into dept_duplicate (dept_no, dept_name)
select * from departments;


