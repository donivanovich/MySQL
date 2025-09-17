-- Consultas multitabla (Composición interna)
use universidad;

-- Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
select * 
from persona join alumno_se_matricula_asignatura
	on(persona.id = alumno_se_matricula_asignatura.id_alumno)
join asignatura
	on (alumno_se_matricula_asignatura.id_asignatura = asignatura.id)
join grado 
	on(asignatura.id_grado = grado.id)
where persona.sexo like 'M' and grado.nombre like 'Grado en Ingeniería Informática (Plan 2015)';

-- Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
select * 
from asignatura join grado 
	on(asignatura.id_grado = grado.id)
where grado.nombre like 'Grado en Ingeniería Informática (Plan 2015)';

-- Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
select persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre
from persona join profesor
	on(persona.id = profesor.id_profesor)
join departamento
	on(profesor.id_departamento = departamento.id)
where persona.tipo like 'profesor'
order by persona.apellido1, persona.apellido2, persona.nombre asc;

-- Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
select asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin
from persona join alumno_se_matricula_asignatura
	on(persona.id = alumno_se_matricula_asignatura.id_alumno)
join asignatura
	on (alumno_se_matricula_asignatura.id_asignatura = asignatura.id)
join curso_escolar
	on (alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id)
where persona.nif like '26902806M';

-- Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
select *
from grado join asignatura
	on(grado.id = asignatura.id_grado)
join profesor
	on(asignatura.id_profesor = profesor.id_profesor)
join departamento
	on(profesor.id_departamento = departamento.id)
where grado.nombre like 'Grado en Ingeniería Informática (Plan 2015)';

-- Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
select persona.*, curso_escolar.anyo_inicio
from persona join alumno_se_matricula_asignatura
	on(persona.id = alumno_se_matricula_asignatura.id_alumno)
join curso_escolar
	on (alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id)
where curso_escolar.anyo_inicio = 2018;

-- Consultas multitabla (Composición externa)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
use universidad;

-- Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
select departamento.nombre as departamento, persona.apellido1, persona.apellido2, persona.nombre
from persona left join profesor
	on(persona.id = profesor.id_profesor)
left join departamento
	on(profesor.id_departamento = departamento.id)
where persona.tipo like 'profesor'
order by departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;

-- Devuelve un listado con los profesores que no están asociados a un departamento.
select persona.*
from persona left join profesor
	on(persona.id = profesor.id_profesor)
left join departamento
	on(profesor.id_departamento = departamento.id)
where persona.tipo like 'profesor' and profesor.id_departamento is null;

-- Devuelve un listado con los departamentos que no tienen profesores asociados.
select *
from departamento left join profesor
	on(departamento.id = profesor.id_departamento)
where id_profesor is null;

-- Devuelve un listado con los profesores que no imparten ninguna asignatura.
select persona.*
from persona left join profesor
	on(persona.id = profesor.id_profesor)
left join asignatura
	on(profesor.id_profesor = asignatura.id_profesor)
where persona.tipo like 'profesor' and asignatura.id is null;

-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select asignatura.*
from asignatura left join profesor
	on(asignatura.id_profesor = profesor.id_profesor)
where profesor.id_profesor is null;

-- Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
select departamento.*
from departamento left join profesor
	on(departamento.id = profesor.id_departamento)
left join asignatura
	on(profesor.id_profesor = asignatura.id_profesor)
left join alumno_se_matricula_asignatura
	on (asignatura.id = alumno_se_matricula_asignatura.id_asignatura)
where asignatura.id is null;
