use shawarmas;

-- PRODUCTOS

DROP VIEW IF EXISTS catalogo; -- PARA ELIMINAR LA VISTA

CREATE VIEW catalogo AS -- CREAR LA VISTA
SELECT p.id_producto, p.marca, p.modelo, p.precio, p.stock, c.color, 
	   t.talla, cat.categoria, p.imagen,
	   IFNULL(SUM(pp.cantidad), 0) AS total_vendido
FROM productos p
LEFT JOIN colores c ON p.fk_color = c.id_color
LEFT JOIN tallas t ON p.fk_talla = t.id_talla
LEFT JOIN categorias cat ON p.fk_categoria = cat.id_categoria
LEFT JOIN productos_pedidos pp ON p.id_producto = pp.fk_producto
WHERE p.stock > 0
GROUP BY p.id_producto, p.marca, p.modelo, p.precio, p.stock, 
         c.color, t.talla, cat.categoria, p.imagen;

SELECT * FROM catalogo;

-- PEDIDOS

DROP VIEW IF EXISTS albaran;

CREATE VIEW albaran AS
SELECT 
    p.id_pedido,
    p.fecha_pedido,
    p.fecha_entrega,
    CONCAT(c.nombre, ' ', c.apellido1, ' ', IFNULL(c.apellido2, '')) AS cliente,
    c.mail AS email_cliente,
    t.ciudad AS ciudad_tienda,
    t.pais AS pais_tienda,
    p.calle AS direccion_envio,
    p.postal AS cp_envio,
    COUNT(pp.id_producto_pedido) AS total_productos,
    IFNULL(SUM(prod.precio * pp.cantidad), 0) AS total_pedido
FROM 
    pedidos p
JOIN clientes c ON p.fk_id_user = c.id_user
JOIN tiendas t ON p.fk_tienda = t.id_tienda
LEFT JOIN productos_pedidos pp ON p.id_pedido = pp.fk_pedido
LEFT JOIN productos prod ON pp.fk_producto = prod.id_producto
GROUP BY 
    p.id_pedido,
    p.fecha_pedido,
    p.fecha_entrega,
    cliente,
    email_cliente,
    ciudad_tienda,
    pais_tienda,
    direccion_envio,
    cp_envio;
    
SELECT * FROM albaran;