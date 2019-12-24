select * from dept_duplicate;

-- Drop the dept_manager column

alter table dept_duplicate
drop column dept_manager;

-- Changing dept_no and dept_name columns to NULL

alter table dept_duplicate
change column dept_no dept_no char(4) null;

commit;

-- Insert a record whose dept_name is 'Public relations'

insert into dept_duplicate (dept_name) values ('Public relations');

-- Delete records related to department number two

delete from dept_duplicate where dept_no = 'd002';

-- Rename dept_duplicate table to dept_dup

rename table dept_duplicate to dept_dup;

-- Create a table named dept_manager_dub (a duplicate of dept_manager table)

drop table dept_manager_dup;
create table dept_manager_dup like dept_manager;

-- the table has (emp_no and dept_no) as primary key. Hence, primary key is dropped to allow
-- insertion of values into both columns. Also key constraint is dropped on dept_no

alter table dept_manager_dup drop primary key;
alter table dept_manager_dup drop key dept_no;

alter table dept_manager_dup
change column dept_no dept_no char(4) null,
change column to_date to_date date null;

commit;


insert into dept_manager_dup
select * from dept_manager;

insert into dept_manager_dup (emp_no, from_date)
values (999904, '2017-01-01'), (999905, '2017-01-01'), (999906, '2017-01-01'), (999907, '2017-01-01');

-- Delete department number 1 from dept_manager_dup table

delete from dept_manager_dup where dept_no = 'd001';

commit;

insert into dept_dup (dept_name) values ('Public relations');

delete from dept_dup where dept_no = 'd002';




