/*
MYSQL index functions like the index of a book. Data is taken from a column of the table and is 
stored in a certain order in a distinct place called AN INDEX

# Indexes are used to increase the speed of searches related to a table

SYNTAX is as follows

CREATE INDEX index_name
ON table_name (column_1, column_2, ......)

COMPOSITE INDEXES apply to multiple columns, not just a single one

# Primary and unique keys are MYSQL indexes. They represent columns on which someone would 
typically based their search

Specialists are always looking for a good balance between a improvement of speed search and the 
resources used for its execution

-- For small datasets, the costs of having an index might outweight its benefits
-- For large datasets, a well-optimized index can make a positive impact on the 
search process

*/

# How many people were hired after 1st January 2000?

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';

CREATE INDEX i_hire_date ON employees(hire_date);

# Select all employees bearing the name 'Georgi Facello'

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello';

create index i_composite on employees(first_name, last_name);

show index from employees from employees;

-- To drop i_hire_date index

Alter table employees drop index i_hire_date;

-- Selecting all records from the salaries table of peiople whose salary is higher than $89,000
-- per annum. After, index is created on the salary column

select * from salaries where salary > 89000;

create index i_salary on salaries(salary);
