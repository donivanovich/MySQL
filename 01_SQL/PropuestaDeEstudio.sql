-- Ejercicio 1
-- Devuelve la población diezmada de aquellos países que no tengan cabeza de estado o cuya superficie sea inferior a 2.000.000;
-- muestra también una columna con el nombre de dichos países concatenando su año de independecia
-- con un guion bajo, y todo valor de esa misma columna rodeada por '#' tantas como letras tenga su forma de gobierno

use world;
select Population / 10 as Population, HeadOfState, SurfaceArea, GovernmentForm, rpad(
																					lpad(
																						concat(Name, '_', IndepYear),
																						length(concat(Name, '_', IndepYear)) + length(GovernmentForm),
																						'#'
																					),
																					length(concat(Name, '_', IndepYear)) + length(GovernmentForm) * 2,
																					'#'
																				) as Filter
from country
where SurfaceArea < 2000000 or HeadOfState is null;