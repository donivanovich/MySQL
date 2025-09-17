-- Consultas sobre una tabla
use universidad;

-- Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
select apellido1, apellido2, nombre
from persona
where tipo like 'alumno'
order by apellido1, apellido2, nombre asc;

-- Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
select apellido1, apellido2, nombre, telefono
from persona
where tipo like 'alumno' and telefono is null;

-- Devuelve el listado de los alumnos que nacieron en 1999.
select *
from persona
where tipo like 'alumno' and year(fecha_nacimiento) = 1999;

-- Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
select *
from persona
where tipo like 'profesor' and nif like '%K%' and telefono is null;

-- Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
select *
from asignatura
where id_grado = 7 and curso = 3 and cuatrimestre = 1