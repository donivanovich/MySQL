-- Consultas multitabla y de resumen:
use jardineria;
select * from cliente;
select nombre_cliente, codigo_empleado_rep_ventas
from cliente join pago
	on(cliente.codigo_cliente = pago.codigo_cliente);

select distinct cliente.nombre_cliente, producto.nombre
from cliente join pedido 
	on (cliente.codigo_cliente = pedido.codigo_cliente)
		join detalle_pedido
	on(pedido.codigo_pedido = detalle_pedido.codigo_pedido)
		join producto
	on(detalle_pedido.codigo_producto = producto.codigo_producto)
where producto.nombre like "Pala";

-- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
select cliente.nombre_cliente, producto.proveedor
from producto join detalle_pedido
	on(producto.codigo_producto = detalle_pedido.codigo_producto)
		join pedido
	on(detalle_pedido.codigo_pedido = pedido.codigo_pedido)
		join cliente
	on(pedido.codigo_cliente = cliente.codigo_cliente);
    
-- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
select distinct cliente.nombre_cliente,producto.proveedor, pago.total 
from producto join detalle_pedido
	on(producto.codigo_producto = detalle_pedido.codigo_producto)
		join pedido
	on(detalle_pedido.codigo_pedido = pedido.codigo_pedido)
		join cliente
	on(pedido.codigo_cliente = cliente.codigo_cliente)
		join pago
	on(cliente.codigo_cliente = pago.codigo_cliente)
where total > 0;

-- Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
select cliente.nombre_cliente,producto.proveedor, pago.total 
from producto join detalle_pedido
	on(producto.codigo_producto = detalle_pedido.codigo_producto)
		join pedido
	on(detalle_pedido.codigo_pedido = pedido.codigo_pedido)
		join cliente
	on(pedido.codigo_cliente = cliente.codigo_cliente)
		left join pago
	on(cliente.codigo_cliente = pago.codigo_cliente)
where pago.total is null;

-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select distinct cliente.nombre_cliente, producto.proveedor, pago.total, oficina.ciudad 
from producto join detalle_pedido
	on(producto.codigo_producto = detalle_pedido.codigo_producto)
		join pedido
	on(detalle_pedido.codigo_pedido = pedido.codigo_pedido)
		join cliente
	on(pedido.codigo_cliente = cliente.codigo_cliente)
		join pago
	on(pedido.codigo_cliente = cliente.codigo_cliente)
		join empleado
	on(cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado)
		join oficina
	on(empleado.codigo_oficina = oficina.codigo_oficina)
where total > 0;

-- Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select cliente.nombre_cliente, empleado.nombre AS nombre_empleado, oficina.ciudad
from producto 
join detalle_pedido 
	on producto.codigo_producto = detalle_pedido.codigo_producto
join pedido 
	on detalle_pedido.codigo_pedido = pedido.codigo_pedido
join cliente 
	on pedido.codigo_cliente = cliente.codigo_cliente
left join pago 
	on pedido.codigo_pedido = pago.codigo_cliente 
join empleado 
	on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
join oficina 
	on empleado.codigo_oficina = oficina.codigo_oficina
where pago.codigo_cliente is null;

-- Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
select oficina.linea_direccion1, cliente.linea_direccion2
from oficina
join empleado
	on oficina.codigo_oficina = empleado.codigo_oficina
join cliente
	on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
where cliente.linea_direccion2 like "Fuenlabrada";

-- Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select cliente.nombre_cliente, empleado.nombre as nombre_representante, oficina.ciudad
from oficina
join empleado
	on oficina.codigo_oficina = empleado.codigo_oficina
join cliente
	on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas;

-- Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
select trabajador.nombre as empleado, jefe.nombre as jefe
from empleado trabajador
join empleado jefe
	on trabajador.codigo_jefe = jefe.codigo_empleado
where trabajador.codigo_jefe is not null;

-- Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
select cliente.nombre_cliente, pedido.fecha_esperada, pedido.fecha_entrega
from pedido
join cliente
	on pedido.codigo_cliente = cliente.codigo_cliente
where fecha_entrega > fecha_esperada;

-- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
select * from producto;
select distinct producto.gama, pedido.codigo_cliente
from producto
join detalle_pedido
	on producto.codigo_producto = detalle_pedido.codigo_producto
join pedido
	on detalle_pedido.codigo_pedido = pedido.codigo_pedido
join cliente 
	on pedido.codigo_cliente = cliente.codigo_cliente;

-- ¿Cuántos empleados hay en la compañía?
select count(*) as empleados_en_la_compañia
from empleado;

-- ¿Cuántos clientes tiene cada país?
select oficina.pais, count(*) as total_clientes
from oficina
join empleado
	on oficina.codigo_oficina = empleado.codigo_oficina
join cliente
	on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
group by oficina.pais;

-- ¿Cuál fue el pago medio en 2009?
select round(avg(total), 2) as pago_medio
from pago
where year(fecha_pago) = 2009;

-- ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
select estado, count(*)
from pedido
group by estado;

-- Calcula el precio de venta del producto más caro y más barato en una misma consulta.
select max(precio_venta) as precio_mas_caro, min(precio_venta) as precio_mas_barato
from producto;

-- Calcula el número de clientes que tiene la empresa.
select count(*) as total_clientes
from cliente;

-- ¿Cuántos clientes tiene la ciudad de Madrid?
select count(*) as total_clientes_madrid, ciudad
from cliente
where ciudad like "Madrid"
group by ciudad;

-- ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
select count(*) as total_clientes, ciudad
from cliente
where ciudad like "M%"
group by ciudad;

-- Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
select count(*) as clientes_atendidos, empleado.nombre, empleado.apellido1
from empleado 
join cliente
	on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
group by codigo_empleado_rep_ventas;

-- Calcula el número de clientes que no tiene asignado representante de ventas.
select count(*) as clientes_sin_atender, codigo_empleado_rep_ventas
from empleado 
left join cliente
	on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
where codigo_empleado_rep_ventas is null
group by codigo_empleado_rep_ventas;

-- Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
select count(*) as numero_de_pedidos, cliente.nombre_cliente, min(fecha_pago) as primer_pago, max(fecha_pago) as ultimo_pago
from pedido
join cliente 
	on pedido.codigo_cliente = cliente.codigo_cliente
join pago
	on cliente.codigo_cliente = pago.codigo_cliente
group by pago.codigo_cliente;

-- Calcula el número de productos diferentes que hay en cada uno de los pedidos.
select count(*) as cantidad_de_productos, producto.nombre
from producto
join detalle_pedido
	on producto.codigo_producto = detalle_pedido.codigo_producto
group by producto.nombre;

-- Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
select dp.codigo_pedido, sum(dp.cantidad) as cantidad_total
from detalle_pedido dp
group by dp.codigo_pedido;

-- Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
select dp.codigo_producto, sum(dp.cantidad) as total_unidades_vendidas
from detalle_pedido dp
group by dp.codigo_producto
order by total_unidades_vendidas desc
limit 20;

-- La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. 
-- La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
select sum(p.precio_venta * dp.cantidad) as base_imponible, round(sum(p.precio_venta * dp.cantidad * 0.21), 2) as iva, round(sum(p.precio_venta * dp.cantidad * 1.21), 2) as total_facturado
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto;

-- La misma información que en la pregunta anterior, pero agrupada por código de producto.
select dp.codigo_producto, round(sum(p.precio_venta * dp.cantidad), 2) as base_imponible, round(sum(p.precio_venta * dp.cantidad * 0.21), 2) as iva, round(sum(p.precio_venta * dp.cantidad * 1.21), 2) as total_facturado
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto
group by dp.codigo_producto;

-- La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
select 
    dp.codigo_producto,
    round(sum(p.precio_venta * dp.cantidad), 2) as base_imponible,
    round(sum(p.precio_venta * dp.cantidad * 0.21), 2) as iva,
    round(sum(p.precio_venta * dp.cantidad * 1.21), 2) as total_facturado
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto
where dp.codigo_producto like 'OR%'
group by dp.codigo_producto;

-- Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
select 
    p.nombre_producto,
    sum(dp.cantidad) as unidades_vendidas,
    round(sum(p.precio_venta * dp.cantidad), 2) as total_facturado,
    round(sum(p.precio_venta * dp.cantidad * 1.21), 2) as total_facturado_con_iva
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto
group by dp.codigo_producto
having sum(p.precio_venta * dp.cantidad) > 3000;
