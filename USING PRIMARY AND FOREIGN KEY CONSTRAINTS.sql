# SQL contraints are rules or limits that we define in our tables

# They can also serve to outline the existing relationships between different
# tables in our databse

# Examples of MySQL constraints

# PRIMARY KEY -- Attached to column(s) used to identify each record in the table

# Exercise for implementing primary key

USE sales;

DROP TABLE customer;

CREATE TABLE customers
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY(customer_id)
);

CREATE TABLE items
(
	item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10,2),
    company_id VARCHAR(255),
    PRIMARY KEY(item_code)
);

CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT(12),
    PRIMARY KEY(company_id)
);

# FOREIGN KEY helps to link table in a database,
# It also helps to maintain the referential integrity of a table

# Exploring the use of foreign keys

DROP TABLE sales;

CREATE TABLE sales
(
	purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY(purchase_number),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

# Function of 'ON DELETE CASCADE' is to ensure the deletion of parent tables' primary
# key translates to the concurrent deletion of the same records in the child tables

