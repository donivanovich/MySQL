-- Funciones de una sola fila

-- FUNCIONES DE FILA 
SELECT description, UPPER(description) AS "Descripcion en Mayusculas"
FROM film;

SELECT description, CONCAT("Pedazo de sinopsis: ",description, " Y aqui termina la sinopsis")
FROM film;

SELECT description, SUBSTR(desctiption, 3)
FROM film;

SELECT description, LENGTH(desctiption, "Cat")
FROM film
ORDER BY LENGTH(description) DESC;

SELECT description, REPLACE(description, "Butler", "Don Rafael Nadal")
FROM film;

SELECT CONCAT(amount, " $") AS Importe
FROM payment;

SELECT LOWER("PALABRA"); -- DEVUELVE LOS CARACTERES EN MINISCULAS
SELECT UPPER("PaLaBrA"); -- DEVUELVE LOS CARACTERES EN MAYUSCULAS

SELECT CONCAT("AA","bb",LOWER("CC")); -- CONCATENA

SELECT SUBSTR("En un lugar de la Mandcha",7,5); -- EL 7 REPRESENTA EL UNICO DE CARACTERES (l de 'lugar') Y EL 5 REPRESENTA EL FINAL DESDE EL INICIO DEL MINIMO (r de 'lugar')

SELECT LENGTH("palabra"); -- DEVUELVE EL NUMERO DE CARACTERES QUE SE INDICA

SELECT INSTR("En un lugar de la Mancha","Mancha"); -- DEVUELVE EL NUMERO DE CARACTERES PERO ESPECIFICANDO LA CADENA QUE NO DESEAS QUE DEVUELVA (X,Y)

SELECT LPAD("PALABRA",15,"@"); -- INTRODUCE APARTIR DE LA CADENA ESPECIFICADA (X), UN NUMERO DE CARACTERES, TENIENDO EN CUENTA QUE DEBES INCLUIR MAS CARACTERES QUE LA CADENA (Y(+X)), LA CADENA QUE DESEAS AÑADIR(Z) (X, Y, X)

SELECT RPAD("PALABRA",15,"@");

SELECT REPLACE("En un lugar de la Mancha","Mancha","Narnia"); --

SELECT TRIM("     EN UN LUGAR DE LA MACNHA       " ); -- DEVUELVE LA CADENA SIN ESPACIOS
