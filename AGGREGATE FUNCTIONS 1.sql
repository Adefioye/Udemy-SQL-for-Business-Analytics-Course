/*
AGGREGATE FUNCTIONS, this functions gather data from different rows and return a SINGLE VALUE
For example, COUNT(), SUM(), MIN(), MAX(), AVG().

# Agg functions are important because they are response to critical information required by
# different strata of a business structure

*/

-- To get the number of records in the salary table

select count(*) from salaries;

-- How many unique employee start dates are in the database

select count(distinct from_date) from salaries;

/*
Aggregate functions typically ignore null values throughout the field to which they 
are applied. This only happens when one has indicated a specific column name within the
parentheses. Alternatively, COUNT(*) returns the number of all rows of the table. NULL values
included.

-- It is important to place the PARENTHESES next to the AGG FUNCTION. There should be no 
white spaces between them
*/

-- How many departments are there in the 'employees' database. dept_emp table is used to answer
-- the question

select count(distinct dept_no) from dept_emp;

-- To get how much money the company spent on salaries

select sum(salary) from salaries;

-- To get the total amount of money spent on salaries for all contracts starting after 1st January
-- 1997

select sum(salary) from salaries where from_date > '1997-01-01';

-- What is the highest salary paid by the company

select max(salary) from salaries;

-- What is the lowest salary paid by the company

select *, min(salary) from salaries;

-- What is the lowest employee number in the database

select min(emp_no) from employees;

-- What is the highest employee number in the database

select max(emp_no) from employees;

# AVG() extracts average of all null values in a field

-- What is the average salaries the employees received

select avg(salary) from salaries;

-- What is the average annual salary paid to employees who started after 1st January, 1997

select avg(salary) from salaries where from_date > '1997-01-01';

/*
ROUND(#, decimal_places). numeric or math function you can use. Usually applied to the single
 values that aggregate functions return
*/

-- To return whole number output for an AGG FUNCTION

select round(avg(salary)) from salaries;

-- To return an output with 2 decimal place

select round(avg(salary), 2) from salaries;

-- Round the average amount of money spent on salaries for all contracts that started after the 
-- 1st january 1997. 

select round(avg(salary), 2) from salaries where from_date > '1997-01-01';


