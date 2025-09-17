create database zapatillas;

use zapatillas;

drop table if exists detalles_pedido;
drop table if exists pedidos;
drop table if exists resennas;
drop table if exists inventario;
drop table if exists productos;
drop table if exists clientes;
drop table if exists categorias;
drop table if exists proveedores;

create table proveedores(
id int auto_increment primary key,
nombre varchar(100) not null,
contacto varchar(100),
telefono varchar(100),
direccion text
);

create table categorias(
id int auto_increment primary key,
nombre varchar(100) not null,
descripcion text
);

create table clientes(
id int auto_increment primary key,
nombre varchar(100) not null,
email varchar(100) not null,
telefono varchar(15),
direccion text
);

create table productos(
id int auto_increment primary key,
nombre varchar(100) not null,
descripcion text,
precio decimal not null,
categoria_id int,
foreign key (categoria_id) references categorias(id)
);

create table inventario(
id int auto_increment primary key,
producto_id int,
cantidad int not null,
foreign key (producto_id) references productos(id)
);

create table resennas(
id int auto_increment primary key,
producto_id int,
cliente_id int,
calificacion int,
comentario text,
fecha date not null,
foreign key (producto_id) references productos(id),
foreign key (cliente_id) references clientes(id)
);

create table pedidos(
id int auto_increment primary key,
cliente_id int,
fecha_pedido date not null,
total decimal not null,
foreign key (cliente_id) references clientes(id)
);

create table detalles_pedido(
id int auto_increment primary key,
pedido_id int,
producto_id int,
cantidad int not null,
precio_unitario decimal not null,
foreign key (pedido_id) references pedidos(id),
foreign key (producto_id) references productos(id)
);

-- Inserciones de ejemplo en la tabla Categorías
INSERT IGNORE INTO categorias (id, nombre, descripcion) VALUES
(1, 'Running', 'Zapatillas diseñadas para correr'),
(2, 'Baloncesto', 'Zapatillas para jugar baloncesto'),
(3, 'Casual', 'Zapatillas para uso diario');

-- Inserciones de ejemplo en la tabla Productos
INSERT IGNORE INTO productos (id, nombre, descripcion, precio, categoria_id) VALUES
(1, 'Zapatilla Runner X', 'Ideal para maratones', 120.00, 1),
(2, 'Zapatilla Dunk Pro', 'Diseño clásico para baloncesto', 150.00, 2),
(3, 'Zapatilla Urban Fit', 'Estilo moderno para el día a día', 80.00, 3);

-- Inserciones de ejemplo en la tabla Clientes
INSERT IGNORE INTO clientes (id, nombre, email, telefono, direccion) VALUES
(1, 'Juan Pérez', 'juan.perez@example.com', '555-1234', 'Calle Falsa 123'),
(2, 'María Gómez', 'maria.gomez@example.com', '555-5678', 'Avenida Siempre Viva 456');

-- Inserciones de ejemplo en la tabla Proveedores
INSERT IGNORE INTO proveedores (id, nombre, contacto, telefono, direccion) VALUES
(1, 'Deportes S.A.', 'Carlos López', '555-9876', 'Boulevard Industrial 789'),
(2, 'Calzados Rápidos', 'Ana Torres', '555-6543', 'Calle Veloz 321');

-- Inserciones de ejemplo en la tabla Inventario
INSERT IGNORE INTO inventario (id, producto_id, cantidad) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 100);

-- Inserciones de ejemplo en la tabla Pedidos
INSERT IGNORE INTO pedidos (id, cliente_id, fecha_pedido, total) VALUES
(1, 1, '2023-10-01', 240.00),
(2, 2, '2023-10-02', 150.00);

-- Inserciones de ejemplo en la tabla Detalles de Pedido
INSERT IGNORE INTO detalles_pedido (id, pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 2, 120.00),
(2, 2, 2, 1, 150.00);

-- Inserciones de ejemplo en la tabla Reseñas
INSERT IGNORE INTO resennas (id, producto_id, cliente_id, calificacion, comentario, fecha) VALUES
(1, 1, 1, 5, 'Excelente zapatilla, muy cómoda para correr.', '2023-10-05'),
(2, 2, 2, 4, 'Buena calidad, pero un poco pesada.', '2023-10-06');