/*
AGGREGATE functions are used to transform multiple records of a column into a single output
-- Example
# COUNT(), SUM(), MIN(), MAX(), AVG()
*/

/*
COUNT(), used for counting the non-null values in a field or column and it is frequently
# used with the reserved word 'DISTINCT'.

The syntax is as shown below

SELECT COUNT(column_name) FROM table_name

It is important to place the parentheses just right after the COUNT()keyword, not after
WHITESPACES
*/

-- To get the number of employees in our database

select count(emp_no) from employees;

-- To get the number of employees without a first name using the COUNT() fuction

select count(first_name) from employees where first_name is null;

-- To get the the number of different first names that can be found in the employees table

select count(distinct first_name) from employees;

-- To get the the number of different last names that can be found in the employees table

select count(distinct last_name) from employees;

-- How many annual contracts with the a value higher or eqwual to $100000 have been
--  registered in the salaries table?

SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;

-- How many managers do we have in the 'employees' database?

SELECT 
    COUNT(DISTINCT emp_no)
FROM
    dept_manager;

SELECT 
    COUNT(*)
FROM
    dept_manager;

# Both queries above return same output since all values in the emp_no column
# are unique and different

