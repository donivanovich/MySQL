-- Por favor rellene la siguiente plantilla con las consultas solicitadas:

-- Sin tener en cuenta la tarea de Mantenimiento de Reactor, devuelve el nombre de las tareas junto a su carga indicando cuántos funcionarios vivos hay asignados a cada una de ellas, 
-- descartando aquellas tareas que superen en 10 dicho número de funcionarios.
select tarea.nombre, tarea.carga, count(funcionario.id_funcionario) as n_funcionarios
from tarea left join tarea_funcionario
	on(tarea.id_tarea = tarea_funcionario.fk_tarea)
left join funcionario
	on(tarea_funcionario.fk_funcionario = funcionario.id_funcionario)
where tarea.nombre not like 'Mantenimiento de Reactor' and funcionario.fecha_defuncion is null
group by tarea.id_tarea, tarea.nombre
having count(funcionario.id_funcionario) > 10
;
-- Devuelve el nombre y el rango de funcionarios rango S que sabiendo Kendo o Kung Fu Espiral tienen su inventario vacío;
select funcionario.nombre, funcionario.apellido, funcionario.rango
from habilidad left join funcionario_habilidad
	on(habilidad.id_habilidad = funcionario_habilidad.id_funcionario_habilidad)
left join funcionario
	on(funcionario_habilidad.fk_funcionario = funcionario.id_funcionario)
left join inventario_funcionario
	on(funcionario.id_funcionario = inventario_funcionario.fk_funcionario)
left join inventario
	on(inventario_funcionario.id_inventario_funcionario = inventario.id_inventario)
where funcionario.rango like 'S' and (habilidad.nombre like 'Kendo' or habilidad.nombre like 'Kunk Fu Espiral') and id_inventario is null
;
-- Nombre, apellido y cargo de funcionarios rango A, la media ordenada de mayor a menor de la carga de tareas que tienen, que estén asignados a la esfera-modulo de prisión IF0, 
-- y quedandote con aquellos funcionarios cuya carga media supere 8
select funcionario.nombre, funcionario.apellido, funcionario.rango, avg(tarea.carga) as media_carga
from tarea join tarea_funcionario
	on(tarea.id_tarea = tarea_funcionario.fk_tarea)
join funcionario
	on(tarea_funcionario.fk_funcionario = funcionario.id_funcionario)
join funcionario_moduloprision
	on(funcionario.id_funcionario = funcionario_moduloprision.fk_funcionario)
join moduloprision
	on(funcionario_moduloprision.fk_cod_esfera = moduloprision.cod_esfera)
where funcionario.rango like 'A' and moduloprision.cod_esfera like 'IF0'
group by funcionario.id_funcionario, funcionario.nombre, tarea.carga
having media_carga > 8
order by tarea.carga desc;