/*
SELECT statement returns records from designated columns, given some citeria.

In the selection of rows of values, to avoid duplicate values, SELECT DISTINCT is used.


*/

-- To select distinct or unique values in the gender column

select distinct gender from employees;

-- To obtain 1000 records of employees with different and unique 'hire dates'

select distinct hire_date from employees limit 1000;