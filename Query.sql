##Retrieve all data and columns from customers
SELECT *
FROM customers

##Retrieve only the first name and country of all customers
SELECT 
	first_name,
	country
FROM customers

##List all countries of all customers without duplicates
SELECT 
	DISTINCT country
FROM customers

##Retrieve all customers where the result is sorted by score (smallest)
SELECT
*
FROM customers
ORDER BY score 

##Retrieve all customers where the result is sorted by score (highest)
SELECT
*
FROM customers
ORDER BY score DESC

##Retrieve all customers sorting the result by country (alphabetically) and then score (highest)
SELECT
*
FROM customers
ORDER BY score DESC, country ASC

##List only German customers
SELECT
*
FROM customers
WHERE country = 'Germany' 

##Find all customers whose score is greater than 500
SELECT
*
FROM customers
WHERE score > 500

##Find all customers whose score is less than 500
SELECT
*
FROM customers
WHERE score < 500

##Find all customers whose score is less than or equal to 500
SELECT
*
FROM customers
WHERE score <= 500

##Find all customers whose score is higher than or equal to 500
SELECT
*
FROM customers
WHERE score >= 500

##Find all non-German customers
SELECT
*
FROM customers
WHERE NOT country = 'Germany'

##Find all customers who come from Germany and whose score is less than 400
SELECT
*
FROM customers
WHERE country = 'Germany' AND score < 400

##Find all customers who come from Germany or whose score is less than 400
SELECT
*
FROM customers
WHERE country = 'Germany' OR score<400

##Find all customers whose score is not less than 400
SELECT
*
FROM customers
WHERE score < 400

##Find all customers whose score falls in the range between 100 and 500
SELECT
*
FROM customers
WHERE score >=100 AND score <=500

##Find all customers whose ID is equal to 1,2,5
SELECT
*
FROM customers
WHERE customer_id IN (1,2,5)

##Find all customers whose first name starts with M
SELECT
*
FROM customers
WHERE first_name LIKE 'M%'

##Find all customers whose first name ends with n
SELECT
*
FROM customers
WHERE first_name LIKE '%n'

##Find all customers whose first name contains r
SELECT
*
FROM customers
WHERE first_name LIKE '%r%'

##Find all customers whose first name contains r in 3rd position
SELECT
*
FROM customers
WHERE first_name LIKE '__r%'

##List customer ID, first name, order ID, quantity. Include the customers who have not placed any orders 
SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	o.quantity
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

##List customer ID, first name, order ID, quantity. Exclude the customers who have not placed any orders 
SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	o.quantity
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id

##List customer ID, first name, order ID, quantity. Include all orders, regardless of whether there is a matching customer 
SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	o.quantity
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

##List customer ID, first name, order ID, quantity. Include all customers and all orders 
SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	o.quantity
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	o.quantity
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

##List first name, last name, and country of all persons from customers and employees 
SELECT
	c.first_name,
	c.last_name,
	c.country
FROM customers c
UNION ALL
SELECT
	e.first_name,
	e.last_name,
	e.emp_country
FROM employees e

##List first name, last name, and country of all persons from customers and employees without duplicates
SELECT
	c.first_name,
	c.last_name,
	c.country
FROM customers c
UNION
SELECT
	e.first_name,
	e.last_name,
	e.emp_country
FROM employees e

##Find the total number of customers
SELECT
COUNT(*)
FROM customers

##Find the total quantity of all orders
SELECT
SUM(quantity)
FROM orders

##Find the average score of all customers
SELECT
AVG(score)
FROM customers

##Find the highest score of all customers
SELECT
MAX(score)
FROM customers

##Find the lowest score of all customers
SELECT
MIN(score)
FROM customers

##Find the total number of customers for each country
SELECT
country,
COUNT(*)
FROM customers
GROUP BY country

##Find the total number of customers for each country and only include countries that have more than 1 customer
SELECT
country,
COUNT(*)
FROM customers
GROUP BY country
HAVING COUNT(*) > 1

##List all customer names, where the name is a combination of first and last name
SELECT
CONCAT(first_name, ' ' ,last_name)
FROM customers

##List the first name of all customers in lowercase
SELECT
LOWER(first_name)
FROM customers

##List the first name of all customers in uppercase
SELECT
UPPER(first_name)
FROM customers

##List the last name of all customers and remove all the white space in the names
SELECT
TRIM(last_name)
FROM customers

##Find the length of the last name of all customers
SELECT
LENGTH(last_name)
FROM customers

##Subtract 3 characters from the last name of all customers starting from the 2nd position
SELECT
SUBSTRING(last_name, 2, 3)
FROM customers

##Insert new customer Anna Nixon from UK
INSERT INTO customers (first_name, last_name, country)
VALUE ('Anna', 'Nixon', 'UK')

SELECT *
FROM customers

##Change the country of customer ID 6 to Germany
UPDATE customers
SET country = 'Germany'
WHERE customer_id = 6

##Change the score of the customer Anna to 100 and change her country from UK to USA
UPDATE customers
SET country = 'USA', score =100
WHERE customer_id = 6

##Delete customer Anna from our database
DELETE FROM customers
WHERE customer_id = 6

##Create a new SQL table called Persons with 4 columns, ID, person name, birth date, and phone
CREATE TABLE persons
(id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(18) NOT NULL,
birth_date DATE NULL,
phone INT NULL,
PRIMARY KEY (id))

##Add a new column called email to the table Persons
ALTER TABLE persons
ADD email VARCHAR(20) NULL

##Delete the new table of persons from the database
DROP TABLE persons

##Find all orders placed from customers whose score is higher than 500 using customer ID
SELECT *
FROM orders o
WHERE EXISTS (
SELECT *
FROM customers c
WHERE score>500 AND o.customer_id= c.customer_id)
