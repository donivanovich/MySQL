use bloquitocraft;

-- Devuelve el nombre de los escenarios junto al nombre de los biomas que poseen. Ordenalos por fecha de mayor a menor
select escenario.nombre as escenario, bioma.nombre as bioma, escenario.fecha
from escenario join escenario_bioma
on(escenario_bioma.id_escenario = escenario.id_escenario)
join bioma on(bioma.id_bioma = escenario_bioma.id_bioma)
order by (escenario.fecha) asc; -- creo que te refieres a ordenar de mas antiguo a mas nuevo

-- ¿Cuál es el nombre del tipo de bloque más representado en el bioma 'Monte nevado'?
select tipo.nombre as tipo, count(tipo.id_tipo) as veces_representado
from tipo join bloquito
on(tipo.id_tipo = bloquito.tipo_bloquito)
join escenario on(escenario.id_escenario = bloquito.id_bloquito)
join escenario_bioma on(escenario_bioma.id_escenario = escenario.id_escenario)
join bioma on(bioma.id_bioma = escenario_bioma.id_bioma)
where bioma.nombre like "Monte nevado"
group by tipo.id_tipo
limit 1;

-- Determina cuántos bloques tiene cada construccion.
select construccion.nombre, count(bloquito.id_bloquito) as numero_de_bloques
from construccion join bloquito
on(construccion.id_construccion = bloquito.id_construccion)
group by construccion.id_construccion
order by numero_de_bloques desc;

-- Devuelve el nombre de escenario y su peso total de cada uno de los que estando en modo 'Superivencia' pesen más que 3500 Kg, ordenados de mayor a menor peso total.
select escenario.nombre, sum(tipo.peso_kg) as peso_total, escenario.modo
from tipo join bloquito
on(tipo.id_tipo = bloquito.tipo_bloquito)
join escenario on(bloquito.id_escenario = escenario.id_escenario)
where escenario.modo like "Supervivencia"
group by escenario.id_escenario, escenario.nombre
having peso_total > 3500
order by peso_total desc;