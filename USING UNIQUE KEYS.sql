# UNIQUE KEY is crucial in order to avoid duplicity of data in a given field
# 

# Dropping sales before customers table in order to maintain referential integrity


DROP TABLE companies;
DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;

CREATE TABLE customer
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY(customer_id),
    UNIQUE KEY(email_address)
);

# There is another way of adding the unique key constraints provided that 
# the table customer has already been created

# The below syntax shows how it can be implemented using the ALTER TABLE clause

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

ALTER TABLE customers
ADD UNIQUE KEY (email_address);

# Indexes-- It can be said that unique keys in MySQL have the same role as indexes
# However, It is important to note that reverse is not TRUE

# Index of a table can be defined as an organzational unit that helps for easy 
# retrieval of information

# It takes more time to update a table because indexes must be updated(which is time consuming)

# To drop a unique key the below syntax is executed

ALTER TABLE customers
DROP INDEX email_address;

# Exercise

# Drop the customers columns and add a gender columna and insert a record

DROP TABLE customers;

CREATE TABLE customers
(
	customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY(customer_id)
);

ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

INSERT INTO customers(first_name, last_name, gender, email_address, number_of_complaints)
VALUES('John', 'Mackinley', 'M', 'john.mackinley@hotspot.com', 0);

SELECT * FROM customers;
