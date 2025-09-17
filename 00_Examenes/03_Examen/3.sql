delimiter //
-- drop procedure obtenerPedido;
create procedure obtenerPedido(in _id_pedido int)

begin
    select p.id_pedido, p.fecha_pedido, p.fecha_entrega,
           c.nombre, c.apellido1, c.mail,
           pr.marca, pr.modelo, pp.cantidad, pr.stock, pr.disponibilidad
    from pedidos p
    join clientes c on p.fk_id_user = c.id_user
    join productos_pedidos pp on pp.fk_pedido = p.id_pedido
    join productos pr on pr.id_producto = pp.fk_producto
    where p.id_pedido = _id_pedido;
end;//

delimiter ;

select * from productos;
select * from productos_pedidos;

CALL obtenerPedido(1);

create table productos(id_producto int primary key auto_increment,
							marca varchar(50) not null,
                            modelo varchar(50) not null,
                            precio decimal(10,2) not null,
                            stock int not null,
                            imagen varchar(255),
                            disponibilidad varchar(15) not null,
                            fk_categoria int, 
                            fk_talla int, 
                            fk_color int,
						foreign key (fk_categoria) references categorias(id_categoria),
                        foreign key (fk_talla) references tallas(id_talla),
                        foreign key (fk_color) references colores(id_color)
						   );
                           
INSERT INTO productos (marca, modelo, precio, stock, fk_categoria, fk_talla, fk_color, imagen, disponibilidad) VALUES
('Nike', 'AirMax', 99.99, 0, 1, 1, 2, '/productos/airMax.png', 'agotado'),
('Nike', 'AirMax', 99.99, 0, 1, 2, 2, '/productos/airMax.png', 'agotado'),
('Nike', 'AirMax', 99.99, 700, 1, 2, 3, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 540, 1, 3, 2, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 700, 1, 3, 3, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 600, 1, 4, 1, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 540, 1, 5, 2, '/productos/airMax.png', 'disponible'),
-- ('Nike', 'AirMax', 99.99, 600, 1, 5, 1, '/productos/airMax.png'),
('Nike', 'AirMax', 99.99, 0, 1, 5, 3, '/productos/airMax.png', 'agotado'),
('Nike', 'AirMax', 99.99, 540, 1, 6, 2, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 600, 1, 6, 1, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 700, 1, 6, 3, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 580, 1, 7, 2, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 630, 1, 7, 1, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 750, 1, 7, 3, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 690, 1, 8, 2, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 640, 1, 8, 1, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 720, 1, 8, 3, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 710, 1, 9, 2, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 660, 1, 9, 1, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 730, 1, 9, 3, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 740, 1, 10, 2, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 620, 1, 10, 1, '/productos/airMax.png', 'disponible'),
('Nike', 'AirMax', 99.99, 710, 1, 10, 3, '/productos/airMax.png', 'disponible'),

-- Adidas Ultraboost (colores: Azul, Verde, Rojo)
('Adidas', 'Ultraboost', 129.99, 590, 1, 1, 4, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 620, 1, 1, 5, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 650, 1, 1, 6, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 600, 1, 2, 4, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 640, 1, 2, 5, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 670, 1, 2, 6, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 610, 1, 3, 4, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 660, 1, 3, 5, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 690, 1, 3, 6, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 610, 1, 4, 4, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 660, 1, 4, 5, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 690, 1, 4, 6, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 610, 1, 5, 4, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 660, 1, 5, 5, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 690, 1, 5, 6, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 500, 1, 6, 4, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 530, 1, 6, 5, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 560, 1, 6, 6, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 520, 1, 7, 4, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 540, 1, 7, 5, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 570, 1, 7, 6, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 530, 1, 8, 4, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 550, 1, 8, 5, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 590, 1, 8, 6, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 560, 1, 9, 4, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 580, 1, 9, 5, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 600, 1, 9, 6, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 570, 1, 10, 4, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 610, 1, 10, 5, '/productos/ultraboost.png', 'disponible'),
('Adidas', 'Ultraboost', 129.99, 630, 1, 10, 6, '/productos/ultraboost.png', 'disponible'),

-- Puma Classic (colores: Naranja, Amarillo, Rosa)
('Puma', 'Classic', 79.99, 720, 1, 1, 1, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 730, 1, 1, 2, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 720, 1, 2, 1, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 730, 1, 2, 2, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 720, 1, 3, 1, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 730, 1, 3, 2, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 690, 1, 4, 1, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 700, 1, 4, 2, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 660, 1, 5, 1, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 670, 1, 5, 2, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 510, 1, 6, 1, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 520, 1, 6, 2, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 540, 1, 7, 1, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 550, 1, 7, 2, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 570, 1, 8, 1, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 580, 1, 8, 2, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 600, 1, 9, 1, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 610, 1, 9, 2, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 630, 1, 10, 1, '/productos/pumaClassic.png', 'disponible'),
('Puma', 'Classic', 79.99, 640, 1, 10, 2, '/productos/pumaClassic.png', 'disponible');