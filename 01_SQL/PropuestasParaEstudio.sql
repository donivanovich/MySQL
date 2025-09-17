-- Propuestas para estudio

-- Ejercicio 1
-- Reescribe los nombres de los actores con un formato en el que aparezca la inicial del nombre seguida de un punto y su apellido (El apellido deben estar en modo INITCAP)
-- Ej: STEVEN SEAGAL -----> S. Seagal
-- 	   UMA TRUMAN -----> U. Truman

USE sakila;
SELECT CONCAT(UPPER(LEFT(first_name, 1)), '. ', UPPER(LEFT(last_name, 1)), LOWER(SUBSTR(last_name, 2))) AS nombre
FROM actor
;

-- Ejercicio 2
-- Introduce por la derecha un numero de '@' al titulo de las películas equivalente a la 
-- cuarta parte de su duración.
-- Sustituye la palabra 'Drama' por 'Love Story' en todas las sinopsis de las
-- películas cuya duración sea inferior a 100 
-- y su título contenga una 'E'

use sakila;
select replace(description, "Drama", "Love Story") as description_modified
from film
where length < 100
;

use sakila;
select rpad(title, length / 4 ,'@') as title_modified
from film
;

-- Ejercicio 3.
-- Introduce en la sinopsis de películas para público adulto (R) sin Comentarios 
-- ni 'Behind the Scenes' 
-- la palabra 'Bloody' justo entre la 'A' inicial y la segunda palabra de la sinopsis.

use sakila; 
select replace(description, 'A ', 'A Bloody ')
from film
where rating = 'R' and special_features not like '%Behind the scenes%' 
	and special_features not like '%Commentaries%'
;

-- Ejercicio 4
-- Consigue que la primera mitad de las letras del título de una película
-- estén en mayúsculas y la segunda mitad en minúsculas.
-- Ejemplo:  ACADEMY DINOSAUR  ------------> ACADEMY dinosaur

use sakila;
select concat(substr(title, 1, instr(title, ' ') - 1), lower(substr(title, instr(title, ' ')))) as title_modified
from film
;

use sakila;
select * from film;


-- Ejercicio 5
-- Devuelve los alquileres del 30 y el 31 de Mayo del 2005 gestionados por el empleado 2 del videoclub

use sakila;
select *
from rental
where rental_date between '2005-05-30' and '2005-05-31' and staff_id = 2
;

-- Ejercicio 6
-- Devuelve las direcciones (solo la columna de la direccion) 
-- de aquellas cuyos teléfonos NO contengan el numero '1'

use sakila;
select address, phone
from address 
where phone not like '%1%'
;

-- Ejercicio 7
-- Filtra para que aparezca(n) la(s) ciudad(es) de la tabla city de sakila que contiene(n) un carácter
-- '/'. A continuación devuelve el nombre de esa ciudad con '#' por la izquierda equivalentes al numero 
-- de letras que estaban a la izquierda de la barra y un numero de '@' equivalentes al numero de letras que estaban a la derecha de la barra.

use sakila;
select CONCAT(LPAD("Halle/Saale",16,"#"), RPAD("",5,"@")) AS city_modified
from city 
where city like '%/%'
;

-- Ejercicio 8
-- TOMA EL NOMBRE DE LOS PAISES QUE SEAN TERRITORIO DEPENDIENTE DE UK O QUE
-- SU POBLACION EXCEDA LOS 11.000.000 DE HABITANTES Y CONCATENALE
-- EL GOVERNANTE A LA DERECHA, POR LA IZQUIERDA LOGRA INTRODUCIR UN NUMERO DE '#'
-- EQUIVALENTE A LA MITAD DE LAS LETRAS DE DICHO GOVERNANTE	

use world;
select concat(lpad('#', length(headofstate) / 2, "#"), name, headofstate) as modified_column
from country
where population > 11000000 or headofstate like 'Elisabeth II'
;

-- Ejercicio 9
-- Devuelve el titulo de peliculas para publico "G"eneral
-- que tenga 6 dias de duracion de alquiler
-- o que siendo de publico "G"eneral no contenga escenas eliminadas 
-- concatenando al final del titulo un numero de "@" equivalente 
-- a cuantas letras tenga la segunda palabra de la sinopsis

use sakila;
select title, description, rating, rental_duration, special_features,
	rpad(title, length(title) + length(substr(description, instr(description, ' ') + 1, instr(substr(description, instr(description, ' ') + 1), ' ') - 1)), '@') as title_modified
from film
where rating = 'G' and rental_duration = '6' or rating = 'G' and special_features not like '%Deleted Scenes%'
;

use sakila;
select * from film;
