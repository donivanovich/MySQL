USE world;
SELECT * FROM countrylanguage
WHERE CountryCode LIKE "ESP";

-- DML (Data Manipulation Language)
-- Select, Insert, Update, Delete
-- INSERT
INSERT INTO countrylanguage(CountryCode,Language,IsOfficial,Percentage)
VALUES("ESP","Andaluz",'F',20.0),
                    ("ESP","Bable",'F',20.0),
                    ("ESP","Arnedano",'F',20.0);
                    
-- INSERT AGIL
-- INSERT INTO countrylanguage
--					VALUES("ESP", "Bable", 'F', 2.0);

-- UPDATE
USE sakila;

UPDATE actor
	SET last_name = "PARERA"
	WHERE actor_id = 16;
        
-- "No te olvides de poner el WHERE en el DELETE FROM"
DELETE FROM actor WHERE actor_id = 178;      


        
-- DDL (Data Definition Language)


-- TL (Transactional Language)        


-- 4GL (4tg Generation Language)