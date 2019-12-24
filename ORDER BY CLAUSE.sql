/*
ORDER BY clause allows us to refine our output. The ORDER BY clause is supported using the 
ASC and DESC meaning 'ascending' and 'descending' respectively.When the ORDER BY clause is 
executed, ASC is the default option when neither ASC/DESC is specified. 

The dafault option of the order by clause is the 

-- ORDER BY works on both numeric and string data type
*/

-- Ordering the output by first name
-- The query returns the ordering of the output in ascending order, This is similar to having
-- ASC attached to the order by clause

USE employees;

select * from employees order by first_name;

-- To retrieve the output of the 'ordering' by 'first_name' in descending order

select * from employees order by first_name desc;

# Ordering of output can also be used using two columns

select * from employees order by first_name, last_name;

-- Selecting data from the 'employees' table, ordering by 'hire date' in descending order

select * from employees order by hire_date desc;