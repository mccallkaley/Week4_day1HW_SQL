-- This is a comment!   SQL caps and anything else lower
-- SLQ goes in natural order starting with 1 unlike python
-- Select all records from the actor table

SELECT *
FROM actor     --What table you want to start it from
LIMIT 10 OFFSET 5;   -- When you offset it would start at 6 and go up 10

-- LIMIT says how many records to get 

-- If you just wanted actor...
SELECT first_name, last_name  --no comma at END
FROM actor

SELCECT first_name
FROM actor
WHERE first_name = 'Nick'  -- CASE SENSITIVE

-- Query where name is Nick but using LIKE (=)

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'NicK';     --LIKE is the same thing as = 

-- Query where name is  using  wildcard so anything with j using %
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Query where names containting lowercase y anywhere in list but not at front bc case sensitive 

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE '%y%';

-- All names start with a k and have has 2 letters after the K 

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__'

-- All names start with a k and end with a th 

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K%th'

--Comparison operators:
-- > < >= <= <> [not equals is <>]
--Query the payment table customers who paid an amount greater than $2

SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

--Query the payment table customers who paid an amount less than $7.99

SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

--Query the payment table customers who paid an amount less than or equal to $7.99

SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

--Query the payment table customers who paid an amount greater than or equal to $2
-- from smallest to largest with 'ORDER BY'

SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00;
ORDER BY amount;    --same as ORDER BY ASC; which you can write this as well..

-- from smallest to largest with 'ORDER BY' same but decending 

SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount DESC;

--HOW YOU DO BETWEEN AMOUNTS
-- Query the payment tables customers who paid an amount between $2.00 and $7.99

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query the payment tables customers who paid an amount NOT = to $0.00 order decending order
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;


-- SQL aggregations SUM, AVG, COUNT, MIN, MAX 
--Take a whole bunch of values and turn it into one value

--Query to display the SUM of amounts paid that are greater than $5.99

SELECT SUM(amount)   -- in () sum of the column you want CREATE
FROM payment
WHERE amount > 5.99

--Query to display AVERAGE amounts paid that are greater than 5.99

SELECT AVG(amount)   -- in () average of the column you want CREATE
FROM payment
WHERE amount > 5.99


--Query to display how many amounts paid that are greater than 5.99

SELECT COUNT(amount)   -- in () average of the column you want CREATE
FROM payment
WHERE amount > 5.99

--Query to display how many DISTINCT amounts paid that are greater than 5.99 (unique)
-- DISTINCT removes duplicates

SELECT COUNT (DISTINCT amount)   -- in () distinct unique one of a kind of the column you want CREATE
FROM payment
WHERE amount > 5.99

--Query displayy min amount greater than 7.99

SELECT MIN(amount) AS Min_Num_Payments -- this will change column title if you want
FROM payment
WHERE amount > 7.99;

--Query displayy MAX amount greater than 7.99

SELECT MAX(amount) AS Min_Num_Payments -- this will change column title if you want
FROM payment
WHERE amount > 7.99;

--Query to display diferent amounts grouped together with 'GROUPED BY'
-- and count the amounts with SUM

SELECT amount, COUNT(amount)   --want to see all amounts and the number of them
FROM payment
GROUP BY amount
ORDER BY amount;

--Query to display different customer_ids with  the summed amounts for  each customer_id

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

--Query to display  customer_ids with  the amounts for  each customer_id

SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;

-----
--looking for customers that show up more than 0 times
-- and group by email..looking for  starting with j's and ends with 

SELECT COUNT(customer_id), email
FROM customer
-- WHERE email LIKE 'j__.w%' --you can do this if you want
GROUP BY email 
HAVING COUNT(customer_id) > 0
ORDER BY email    
-- LIMIT 10 OFFSET 2
