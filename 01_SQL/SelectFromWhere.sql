USE sakila;

-- Devolver nombre y apellido de los actores que se apelliden SMITH

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "SMITH";

-- Devolver titulo de peliculas que duren más de 120 o que tengan calificacion de edad PG-13

SELECT title
FROM film
WHERE length > 120 or rating LIKE 'PG-13';

-- Devolver titulo, duracion y coste de reemplazamiento de peliculas que duren entre 30 y 60, que hayan sido lanzadas despues de 1990 o su calificacion de edad sea 'R'

SELECT title , length, replacement_cost
FROM film
WHERE length > 30 and length < 60 and release_year > 1990 or rating LIKE 'R';

-- Devolver titulo y año de lanzamiento de peliculas en cuya descripcion aparezca al menos una vez la palabra "Chef"

SELECT title, release_year, description
FROM film
WHERE description LIKE '%Chef%';

-- Devolver precio de alquiler de peliculas de calificación 'G' y que contengan 'Escenas Eliminadas'

SELECT title, rating, special_features
FROM film
WHERE rating LIKE 'G' and special_features LIKE 'Deleted Scenes';