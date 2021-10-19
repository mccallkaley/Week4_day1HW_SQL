-- Worked with David, Mark, Eduardo, Tim for some of it in a group 
-- 1. How many actors are there with the last name ‘Wahlberg’? 


SELECT COUNT(last_name)
FROM actor
WHERE last_name ='Wahlberg';



-- 2. How many payments were made between $3.99 and $5.99?

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99 


-- 3. What film does the store have the most of? (search in inventory) 

SELECT COUNT(film_id), film_id
FROM inventory 
GROUP BY film_id 
HAVING COUNT(film_id) > 1
ORDER BY COUNT(film_id) DESC;

-- multiple movies with 8 (the most)

-- 4. How many customers have the last name ‘William’? 
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William';
-- 0 William, but 1 Williams


-- 5. What store employee (get the id) sold the most rentals? 

SELECT COUNT(staff_id), staff_id
FROM rental 
GROUP BY staff_id 
ORDER BY COUNT(staff_id) DESC
LIMIT 1



-- 6. How many different district names are there?

SELECT COUNT (DISTINCT district)
FROM address


-- 7. What film has the most actors in it? (use film_actor table and get film_id) 

SELECT COUNT(film_id), film_id   --counting occurences of how many times, and then film_id
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC
LIMIT 1

-- SELECT *
-- FROM film_actor


-- 8. From store_id 1, how many customers have a last name ending with ‘es’?
-- (use customer table)

 
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es'


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250
-- for customers  with ids between 380 and 430? (use group by and having > 250) 
SELECT COUNT(customer_id), amount
FROM payment
WHERE customer_id between 380 and 430
GROUP BY amount
HAVING COUNT(amount) > 250;
 


-- 10. Within the film table, how many rating categories are there? 
-- And what rating has the most  movies total?

SELECT COUNT(DISTINCT rating),rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT (film_id) DESC


-- answer is 5 but cant figure out how to show its 5 



