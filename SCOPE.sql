/*
SCOPE is a region of computer program where a phenomenon like variable is considered valid. A scope
could be valid for a specific statement only or it could be valid for all connections on the server

There are 3 types of MYSQL variables, local, session and global

# Local varaiable is only visible in the BEGIN-END block in which it was created. DECLARE is a keyword
that can be used when creating local variables only

# A session is a series of information exchange between a computer and a user. A session variable
 exists only for the session in which you are operating. 
 
 # Global variable applies to all connections related to a specific server

Syntax for creating global variable

SET GLOBAL var_name = value;

SET @@global.var_name = value;

-- It is important to note that not any variable can be set as GLOBAL. a specific set of 
pre-defined variables in MYSQL is suitable for this job. They are called SYSTEM VARIABLES

Example of system varables are:

-- .max_connections() indicates the maximum numbber of connections to a server that can be established at a 
certain point in time

-- .max_join_size() sets the maximum memory space allocated to the joins for a certain connection

# USER DEFINED VARIABLES VS SYSTEM VARIABLES

-- User variables can be set by the user manually while system variables are pre-defined on our system

-- Only user-defined variables are local in scope while system variables are global in scope
-- Both user-defined and system variables can be set as session variables. though there are 
limitation to this rule
-- User-defined variable can be set as local or session variable. while systems variable can be
session or global; variable. Albeit not all system varables can be set as session


# .sql_mode() can help you adjust workbench settings




*/




-- Creating a mysql session variable

set @s_var1 = 3;

select @s_var1;

-- Creating global variables

set global max_connections = 1;

