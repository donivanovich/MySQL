-- Consultas resumen
use universidad;

-- Devuelve el número total de alumnas que hay.
select count(*)
from persona
where tipo like "alumno" and sexo like "M";

-- Calcula cuántos alumnos nacieron en 1999.
select count(*)
from persona
where tipo like "alumno" and year(fecha_nacimiento) = 1999;

-- Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
select count(id_profesor) as num_profesores, departamento.nombre
from profesor join departamento
	on(profesor.id_departamento = departamento.id)
group by departamento.id, departamento.nombre  
order by count(id_profesor) desc; 

-- Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
select departamento.nombre, count(profesor.id_profesor) as num_profesores
from departamento left join profesor
	on(departamento.id = profesor.id_departamento)
group by departamento.id, departamento.nombre;

-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
select grado.nombre, count(asignatura.id) as num_asignaturas
from grado left join asignatura
	on(grado.id = asignatura.id_grado)
group by grado.id, grado.nombre
order by num_asignaturas desc;

-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
select grado.nombre, count(asignatura.id) as num_asignaturas
from grado left join asignatura
	on(grado.id = asignatura.id_grado)
group by grado.id, grado.nombre
having count(asignatura.id) > 40;

-- Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo.
select grado.nombre as grado, asignatura.nombre as asignatura, sum(asignatura.creditos) as creditos
from grado left join asignatura
	on(grado.id = asignatura.id_grado)
group by grado.id, grado.nombre, asignatura.nombre;

-- Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
select curso_escolar.anyo_inicio, count(alumno_se_matricula_asignatura.id_alumno) as num_alumnos
from persona join alumno_se_matricula_asignatura
	on(persona.id = alumno_se_matricula_asignatura.id_alumno)
join curso_escolar
	on(alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id)
where persona.tipo like "alumno"
group by curso_escolar.id, curso_escolar.anyo_inicio;

-- Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
select profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.id) as num_asignaturas
from persona left join profesor
	on(persona.id = profesor.id_profesor)
left join asignatura 
	on(profesor.id_profesor = asignatura.id)
group by profesor.id_profesor,persona.nombre, persona.apellido1, persona.apellido2
order by count(asignatura.id) desc;

-- Subconsultas
use universidad;

-- Devuelve todos los datos del alumno más joven.
select * 
from persona
where fecha_nacimiento = (select max(fecha_nacimiento) from persona);

-- Devuelve un listado con los profesores que no están asociados a un departamento.
select * 
from persona join profesor
	on(persona.id = profesor.id_profesor)
left join departamento
	on(profesor.id_departamento = departamento.id)
where persona.tipo = "profesor" and profesor.id_departamento is null;

-- Devuelve un listado con los departamentos que no tienen profesores asociados.
select *
from departamento left join profesor
	on(departamento.id = profesor.id_departamento)
where profesor.id_profesor is null;

-- Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
select *
from departamento left join profesor
	on(departamento.id = profesor.id_departamento)
left join asignatura
	on(profesor.id_profesor = asignatura.id_profesor)
where profesor.id_departamento is not null and asignatura.id_profesor is null;

-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select * 
from asignatura left join profesor
	on(asignatura.id_profesor = profesor.id_profesor)
where profesor.id_profesor is null;

-- Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
select *
from departamento left join profesor
	on(departamento.id = profesor.id_departamento)
left join asignatura
	on(profesor.id_profesor = asignatura.id_profesor)
left join alumno_se_matricula_asignatura
	on(asignatura.id = alumno_se_matricula_asignatura.id_asignatura)
left join curso_escolar
	on(alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id)
where asignatura.id is null and curso_escolar.id is null;
