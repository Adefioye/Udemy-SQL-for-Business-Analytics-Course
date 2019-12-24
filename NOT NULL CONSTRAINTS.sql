# NOT NULL CONSTRAINT this helps to ensure that a column in a table is not empty

# Create table with the NOT NULL constraint placed on company_name 

CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number VARCHAR(255) ,
    PRIMARY KEY(company_id)
);

# Altering the company_name column to accept null values

# 2 approaches can be used using ALTER TABLE MODIFY and ALTER TABLE CHANGE COLUMN


ALTER TABLE companies 
MODIFY company_name VARCHAR(255) NULL;

# ALTER TABLE CHANGE COLUMN syntax is used to return company_name to NOT NULL constraint

ALTER TABLE companies 
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

