/*
DROP vs TRUNCATE vs DELETE

# When a table is dropped, It cannot be rolled back to its initial state or last commit
# statement. Hence DROP TABLE is used when one is sure not to use the TABLE anymore.

# TRUNCATE is ~ a DELETE without WHERE. When truncating, auto_increment will be reset

# DELETE removes record row by row

# TRUNCATE vs DELETE WITHOUT WHERE

-- the SQL optimizer will implement different programmatic approaches when we are using TRUNCATE or
-- DELETE. TRUNCATE delivers the output much quicker than DELETE.

-- Auto_increment values are not reset with DELETE STATEMENT

-- To remove a table together with its structure and all related objects like indexes and
-- constraints,  a DROP STATEMENT is used.
*/

