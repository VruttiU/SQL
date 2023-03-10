
USE sakila;

-- 1. Which actors have the first name 'Scarlett'.
SELECT * FROM actor;
SELECT * FROM actor WHERE first_name = 'Scarlett';


-- 2. Which actors have the last name 'Johansson'.
SELECT * FROM actor;
SELECT * FROM ACTOR WHERE last_name = 'Johansson';


-- 3. How many distinct actors' last names are there?
SELECT last_name FROM actor;
SELECT COUNT(distinct last_name)
FROM actor;


-- 4. Which last names are not repeated?
SELECT * FROM actor;
SELECT DISTINCT last_name 
FROM actor;


-- 5. Which last names appear more than once?
SELECT * FROM actor;
SELECT COUNT(*), last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;


-- 6. Which actor has appeared in the most films?

SELECT actor.actor_id, actor.first_name, count(actor_id) as film_count
FROM actor JOIN film_actor USING (actor_id)
GROUP BY actor_id
ORDER BY film_count DESC
LIMIT 1;

SELECT actor.actor_id, actor.first_name, count(actor_id) as film_count
FROM actor JOIN film_actor USING (actor_id)
GROUP BY actor_id
ORDER BY film_count DESC
LIMIT 5;

-- 7. What is the average length of all the films in the sakila DB?
SELECT AVG(LENGTH) 
FROM film;

-- 8. What is the average length of films by category?
SELECT count(category_id) AS category_count, category.name
FROM film_category JOIN category USING (category_id)
GROUP BY category_id;

SELECT avg(length), film_category.category_id
FROM film_category JOIN film USING (film_id)
GROUP BY category_id;


-- 9. Which film categories are long? (compare with avg length).
SELECT avg(length), film_category.category_id
FROM film_category JOIN film USING (film_id)
GROUP BY category_id
HAVING avg(length) > (SELECT AVG(LENGTH) FROM film);




