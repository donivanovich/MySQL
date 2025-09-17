-- Listar todas las reparaciones con detalles del cliente, vehículo y empleado:
select *
from clientes join vehiculos
	on (clientes.ID_cliente = vehiculos.ID_Cliente)
join reparaciones 
	on(vehiculos.ID_Vehiculo = reparaciones.ID_Vehiculo)
join empleados
	on(reparaciones.ID_Empleado = empleados.ID_Empleado);

-- Mostrar los servicios realizados en cada reparación con el costo estimado:
select servicios.*, facturas.total
from servicios join reparaciones
	on(servicios.ID_Servicio = reparaciones.ID_Servicio)
join facturas
	on(reparaciones.ID_Reparacion = facturas.ID_Factura);

-- Listar todos los clientes y sus vehículos, incluso si no tienen vehículos registrados:
select *
from clientes right join vehiculos
	on (clientes.ID_cliente = vehiculos.ID_Cliente);


-- MAL  Mostrar todos los repuestos y las reparaciones en las que se usaron, incluso si no se han usado:
select *
from repuestos left join reparacion_repues
	on(repuestos.ID_Repuesto = reparacion_repues.ID_Repuesto)
left join reparaciones
	on(reparacion_repues.ID_Reparacion = reparaciones.ID_Reparacion);

-- 3. Agrupación y funciones de agregación
-- Calcular el total gastado por cada cliente en reparaciones:
select clientes.Nombre, sum(facturas.total) as gasto
from facturas join clientes
	on(facturas.id_factura = clientes.ID_Cliente)
group by clientes.id_cliente, clientes.Nombre;

-- Contar cuántas reparaciones ha realizado cada empleado:
select empleados.Nombre, count(reparaciones.ID_Reparacion) as n_reparaciones
from reparaciones right join empleados
	on(reparaciones.ID_Empleado = empleados.ID_Empleado)
group by empleados.ID_Empleado, empleados.Nombre;
    
-- MAL Calcular el costo total de repuestos usados en cada reparación:
select *
from repuestos;

-- 4. Filtrado con WHERE
-- Listar las reparaciones completadas en enero de 2024:

-- Mostrar los vehículos de la marca "Toyota":

-- 5. Filtrado con HAVING
-- Mostrar los clientes que han gastado más de 200€ en reparaciones:

-- Listar los repuestos que se han usado más de 2 veces en reparaciones:

-- 6. Consultas avanzadas
-- Mostrar el costo total de cada reparación (servicio + repuestos):

-- Listar los empleados que no han realizado ninguna reparación:

-- Mostrar los clientes que tienen más de un vehículo registrado: