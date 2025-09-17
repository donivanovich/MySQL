-- Listar todos los productos junto con su categoría.
select *
from productos join categorias
on (productos.categoria_id = categorias.id);

-- Mostrar los nombres de los productos y sus proveedores (asumiendo que los proveedores 
-- están relacionados con los productos).

-- Obtener los productos con un precio mayor a $100.
-- Contar cuántos productos hay en cada categoría.
select categorias.nombre,  count(productos.id) as cantidad_productos
from productos join categorias
on (productos.categoria_id = categorias.id)
where precio > 100
group by categorias.nombre;

-- Listar todos los clientes y los pedidos que han realizado (incluyendo clientes sin pedidos).
select clientes.id AS cliente_id, clientes.nombre AS cliente, pedidos.id AS pedido_id, pedidos.fecha_pedido, pedidos.total
from clientes left join pedidos
on(clientes.id = pedidos.cliente_id);

-- Calcular el total de ventas (suma de los totales de los pedidos) por cliente.
select clientes.nombre, sum(pedidos.total) as total_pedidos
from clientes left join pedidos
on(clientes.id = pedidos.cliente_id)
group by clientes.id;

-- Mostrar las categorías que tienen más de 5 productos.
select categorias.nombre, inventario.cantidad
from productos join categorias
on (productos.categoria_id = categorias.id) 
join inventario
on (productos.id = inventario.id)
where inventario.cantidad > 5;

-- Encontrar el producto más caro y el más barato.
select max(precio), min(precio)
from productos;

-- Calcular el precio promedio de los productos por categoría.
select categorias.nombre, avg(precio) as media
from productos join categorias
on (productos.categoria_id = categorias.id)
group by categoria_id;

-- Mostrar los detalles de los pedidos, incluyendo el nombre del cliente y 
-- el nombre del producto.
select detalles_pedido.id, detalles_pedido.cantidad, detalles_pedido.precio_unitario, clientes.nombre, productos.nombre
from productos join detalles_pedido
on(productos.id = detalles_pedido.producto_id)
join pedidos on (detalles_pedido.pedido_id = pedidos.id)
join clientes on(pedidos.cliente_id = clientes.id);

-- Listar los clientes que han gastado más de $200 en total.
select clientes.nombre, sum(total)
from clientes join pedidos
on(clientes.id = pedidos.cliente_id)
where total > 200
group by clientes.id;

-- Encontrar los productos que nunca han sido incluidos en un pedido.
select *
from productos left join detalles_pedido
on(productos.id = detalles_pedido.producto_id)
left join pedidos on(pedidos.id = detalles_pedido.pedido_id)
where pedidos.id is null;

-- Mostrar la cantidad total de productos vendidos por categoría.
select categorias.nombre, sum(detalles_pedido.cantidad)
from categorias join productos
on(categorias.id = productos.categoria_id)
join detalles_pedido on(detalles_pedido.producto_id = productos.id)
group by categorias.nombre;

-- Listar todos los proveedores y los productos que suministran (incluyendo proveedores sin productos).

-- Calcular el total de ventas por cliente, pero solo para pedidos realizados en octubre de 2023.
select clientes.id, clientes.nombre, sum(pedidos.total) as total
from pedidos join clientes
on(pedidos.cliente_id = clientes.id)
where year(fecha_pedido) = 2023 and month(fecha_pedido) = 10
group by clientes.id, clientes.nombre;

-- Encontrar el pedido más grande (en términos de monto total) por cliente.
select clientes.id, clientes.nombre, pedidos.id, pedidos.total
from clientes join pedidos
on(clientes.id = pedidos.cliente_id)
where pedido;

-- Mostrar los productos que tienen una cantidad en inventario menor que el promedio de inventario de todos los productos.
select productos.id, productos.nombre, inventario.cantidad, count(*)
from productos join inventario
on(productos.id = inventario.producto_id)
group by productos.id, productos.nombre
having count(*) < avg(inventario.cantidad);

-- Listar los productos, su categoría y las reseñas asociadas, pero solo para productos con al menos una reseña de 5 estrellas.
select productos.nombre as producto, categorias.nombre as categoria, resennas.calificacion
from categorias join productos
on(categorias.id = productos.categoria_id)
join resennas on(productos.id = resennas.producto_id)
where resennas.calificacion = 5;

-- Calcular el total de ventas por categoría, pero solo para categorías que tienen más de 10 productos vendidos.
select categorias.id, count(*) as total_ventas
from categorias join productos
on(categorias.id = productos.categoria_id) join detalles_pedido
on(detalles_pedido.producto_id = productos.id) join pedidos
on(pedidos.id = detalles_pedido.pedido_id) 
group by categorias.id
having total_ventas > 10; 

-- Mostrar los clientes que han realizado más de 2 pedidos y cuyo gasto total supera los $500.
select clientes.id, total
from pedidos join clientes
on(pedidos.cliente_id = clientes.id)
where total > 500
group by clientes.id, clientes.nombre;
