use pokemondb;
-- Dar una lista de los tipos de pokemon y cuantos hay de cada uno
select tipo.nombre, count(*)
from tipo join pokemon_tipo
	on(tipo.id_tipo = pokemon_tipo.id_tipo)
join pokemon
	on(pokemon_tipo.numero_pokedex = pokemon.numero_pokedex)
group by tipo.id_tipo, tipo.nombre;

-- Dar la media de peso de TODOS los pokemon
select avg(pokemon.peso) as media_peso_pokemon
from pokemon;

-- Dar la media de altura de los pokemon que sepan hacer PLACAJE
select movimiento.nombre, avg(pokemon.altura) as media_altura_pokemon
from pokemon join pokemon_movimiento_forma
	on(pokemon.numero_pokedex = pokemon_movimiento_forma.numero_pokedex)
join movimiento
	on(pokemon_movimiento_forma.id_movimiento = movimiento.id_movimiento)
where movimiento.nombre = "Placaje"
group by movimiento.nombre;

-- Movimientos que tengan en el nombre la palabra 'trueno' y una precision menor a 85
select *
from movimiento
where precision_mov <  85 and nombre like "%trueno%";

-- ¿Cuál es el pokemon que tiene más valor sumando TODAS sus estadisiticas base?
select pokemon.nombre, sum(ps) + sum(ataque) + sum(defensa) + sum(especial) + sum(velocidad) as pokemon_mamadisimo
from pokemon join estadisticas_base
	on (pokemon.numero_pokedex = estadisticas_base.numero_pokedex)
group by pokemon.numero_pokedex, pokemon.nombre
order by pokemon_mamadisimo desc
limit 1;

-- ¿Cuál es el pokemon que tiene menor valor sumando TODAS sus estadisiticas base?
select pokemon.nombre, sum(ps) + sum(ataque) + sum(defensa) + sum(especial) + sum(velocidad) as pokemon_mamadisimo
from pokemon join estadisticas_base
	on (pokemon.numero_pokedex = estadisticas_base.numero_pokedex)
group by pokemon.numero_pokedex, pokemon.nombre
order by pokemon_mamadisimo asc
limit 1;

-- Haz que TANGELA tenga las mismas estadisiticas base del pokemon más FUERTE


-- Devuelve TODOS los ataques que NO generen un estado alterado


-- Devuelve los ataques que produzcan SUEÑO


-- Cual es la media de potencia de los ataques que producen congelación
select *
from efecto_secundario join movimiento_efecto_secundario
	on(efecto_secundario.id_efecto_secundario = movimiento_efecto_secundario.id_efecto_secundario)
join movimiento
	on(movimiento_efecto_secundario.id_movimento = movimiento.id_movimento)

-- Qué pokemons no tienen un solo ataque que produzca estados alterados.


-- Cuantos pokemon conocen movimientos que provocan estados alterados.


-- Pokemons que evolucionan entre el nivel 10 y el 20


-- Cuantos pokemons hay que son última fase de su evolucion


-- Lista los movimientos que afectana la defensa


-- Implementa el efecto secundario Sueño, añadelo a un ataque, y que ese ataque lo conozcan todos los pokemon de tipo Psíquico.

