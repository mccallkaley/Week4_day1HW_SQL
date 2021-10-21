-- Week 5 - Wednesday Questions 
-- 1. List all customers who live in Texas (use 
-- JOINs) 
-- worked in a break out group in zoom with toan, alex, and I think mike?

--call upon customer address_id we make it = so we can put it together 

SELECT customer.first_name, customer.last_name, address.district
FROM customer
JOIN address
ON address.address_id = customer.address_id
WHERE district LIKE 'Texas'


-- 2. Get all payments above $6.99 with the Customer's Full Name 
-- HAVING GOES WITH GROUP BY!!!!
SELECT customer.first_name, customer.last_name, payment.amount
FROM payment
JOIN customer
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY amount DESC



-- 3. Show all customers names who have made payments over $175(use subqueries)
-- Subquery to find the 6 customers that have
-- A total amount of payments greater than 175

SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) >= 175
    ORDER BY SUM(amount)
    
)


-- 4. List all customers that live in Nepal (use the city 
-- table)
SELECT customer.first_name, customer.last_name, country
FROM customer
JOIN address
ON address.address_id = customer.address_id
JOIN city
ON address.city_id = city.city_id
Join country
ON city.country_id = country.country_id
WHERE country = 'Nepal'


-- 5. Which staff member had the most 
-- transactions? 

SELECT COUNT(staff_id), staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC
LIMIT 1





-- 6. How many movies of each rating are 
-- there? 

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC 

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT *
FROM customer
WHERE customer_id IN (
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING COUNT(DISTINCT(amount)) > 6.99
ORDER BY COUNT(DISTINCT (amount))
);


-- 8. Howmanyfreerentalsdidourstoresgive away?
SELECT customer.first_name, customer.last_name, payment.amount
From payment
JOIN customer
On customer.customer_id = payment.customer_id
Where amount = 0.00
