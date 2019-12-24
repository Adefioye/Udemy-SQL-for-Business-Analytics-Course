# Default constraint helps to assign a default value to every row of a column
# A value different from the default can be stored in a field where the default constraint
# has been applied only if specifically indicated

# The number_of_complaints column in customers table was set to a default number of 0

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

# A record was then inserted with no entry for number_of_complaints. It is expected that the default
# value will be 0. except a value is inserted into column

INSERT INTO customers(first_name, last_name, gender)
VALUES ('Peter', 'Figaro', 'M');

SELECT * FROM customers;

# To drop the DEFAULT constraint in the number_of_complaints column
# The below syntax can be implemented

ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;


# Data definition language(DDL)
# CREATE, ALTER, DROP


# Exercise create companies table and set the default values of compnies name to 'X'
# thereafter the companies is then dropped

CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255) UNIQUE
);

DROP TABLE companies;