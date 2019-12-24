/*
IF NULL() and COALESCE() are among the advanced SQL functions used when null values are dispersed
in your data table and you would like to substitute the null values with another value

IF NULL(expression_1, expression_2) returns expresssion_1 if the data found in the table is not
null and returns expression_2 if there is a null value

COALESCE(expression_1, expression_2, ...., expression_N)
allows one to input more than one arguments in the parentheses. COALESCE() will always return a 
single value of the ones we have within parentheses, and this value will be the first non-null
value of this list, reading the values from left to right

-- One can think of COALESCE() as IFNULL() with more than two parameters

It is also essential to know that IF NULL() and COALESCE() do not make changes to the dataset
they merely create an output where certain data values appear in place of NULL values

COALESCE() can also have a single argument in a given function 
COALESCE(expression_1)
*/

select * from dept_duplicate;

-- The dept_name column has a NOT NULL CONSTRAINTS. The codes blow alter the column to have
-- alter the column to accept NULL values

alter table dept_duplicate
change column dept_name dept_name varchar(40) null;

-- After this, insert 'd010' and 'd011' into dept_duplicate

insert into dept_duplicate(dept_no) values ('d010'), ('d011');

-- Checking to see if query was performed successfully

select * from dept_duplicate order by dept_no asc;

-- Add a third column to the dept_duplicate table called 'Department manager'. It will indicate
-- the manager of the respective department and attach a NULL CONSTRAINT. Finally, we will place
-- next to the dept_name column

alter table dept_duplicate add column dept_manager varchar(255) null after dept_name;

select * from dept_duplicate;

-- To save the dept_duplicate in its current state
commit;

-- Using IF NULL() CLAUSE
-- IF NULL cannot accept any less than 2 parameters

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    dept_duplicate;
    
rollback;
    
-- Using COALESCE()
/*
coalesce(dept_manager, dept_name, 'N/A')-- If dept_manager is not null, nothing changes. but 
if dept_manager is null, dept_name is inputed in dept_manager column, and if dept_name is null,
 N/A is inputed in the dept_manager column where dept_name is NULL
*/

select dept_no, dept_name, coalesce(dept_manager, dept_name, 'N/A') as dept_manager
from dept_duplicate order by dept_no asc;

SELECT 
    dept_no,
    dept_name,
    COALESCE('department manager name') AS fake_col
FROM
    dept_duplicate;
    
-- Select the department number and name from the ‘dept_duplicate’ table and add a third column 
-- where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have 
-- a value, use ‘dept_name’.

select dept_no, dept_name, coalesce(dept_no, dept_name) as dept_info from dept_duplicate;

-- Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ is 
-- displayed whenever a department number has no value, and ‘Department name not provided’ is 
-- shown if there is no value for ‘dept_name’.

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
	COALESCE(dept_no, dept_name) as dept_info
FROM
    dept_duplicate;