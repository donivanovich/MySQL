create database taller;
use taller;

drop table if exists facturas;
drop table if exists reparacion_repues;
drop table if exists reparaciones;
drop table if exists vehiculos;
drop table if exists repuestos;
drop table if exists empleados;
drop table if exists servicios;
drop table if exists clientes;

-- create table mios
create table clientes(
id_cliente int primary key auto_increment,
nombre varchar(50),
apellido varchar(50),
telefono varchar(10),
email varchar(255),
direccion varchar(200)
);

create table servicios(
id_servicio int primary key auto_increment,
nombre varchar(50),
descripcion varchar(500),
costo_estimado int,
tiempo_estimado datetime
);

create table empleados(
id_empleado int primary key auto_increment,
nombre varchar(50),
apellido varchar(50),
cargo varchar(40),
telefono varchar(10),
email varchar(255)
);

create table repuestos(
id_repuesto int primary key auto_increment,
nombre varchar(50),
descripcion varchar(500),
precio_unitario decimal,
stock int
);

create table vehiculos(
id_vehiculo int primary key auto_increment,
matricula varchar(10),
marca varchar(50),
modelo varchar(100),
año year,
vin varchar(50),
id_cliente int,
foreign key (id_cliente) references clientes(id_cliente)
);

create table reparaciones(
id_reparacion int primary key auto_increment,
fecha_inicio datetime,
fecha_fin datetime,
estado varchar(500),
id_cliente int,
id_empleado int,
id_servicio int,
foreign key (id_cliente) references clientes(id_cliente),
foreign key (id_empleado) references empleados(id_empleado),
foreign key (id_servicio) references servicios(id_servicio)
);

create table reparacion_repues(
id_reparacion int primary key auto_increment,
id_repuesto int,
foreign key (id_repuesto) references repuestos(id_repuesto)
);

create table facturas(
id_factura int primary key auto_increment,
fecha datetime,
total decimal,
metodo_pago varchar(100),
id_cliente int,
id_reparacion int,
foreign key (id_cliente) references clientes(id_cliente),
foreign key (id_reparacion) references reparaciones(id_reparacion)
);

-- create tables guille

CREATE TABLE clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Email VARCHAR(100),
    Direccion VARCHAR(200)
);

CREATE TABLE vehiculos (
    ID_Vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    Matricula VARCHAR(10) UNIQUE NOT NULL,
    Marca VARCHAR(30) NOT NULL,
    Modelo VARCHAR(30) NOT NULL,
    Año INT,
    VIN VARCHAR(17) UNIQUE NOT NULL,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES clientes(ID_Cliente)
);

CREATE TABLE empleados (
    ID_Empleado INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE servicios (
    ID_Servicio INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Costo_Estimado DECIMAL(10,2) NOT NULL,
    Tiempo_Estimado INT NOT NULL
);

CREATE TABLE repuestos (
    ID_Repuesto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Precio_Unitario DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE reparaciones (
    ID_Reparacion INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_Inicio DATE NOT NULL,
    Fecha_Fin DATE,
    Estado ENUM('Pendiente', 'En Proceso', 'Completado') NOT NULL,
    ID_Vehiculo INT NOT NULL,
    ID_Empleado INT NOT NULL,
    ID_Servicio INT NOT NULL,
    FOREIGN KEY (ID_Vehiculo) REFERENCES vehiculos(ID_Vehiculo),
    FOREIGN KEY (ID_Empleado) REFERENCES empleados(ID_Empleado),
    FOREIGN KEY (ID_Servicio) REFERENCES servicios(ID_Servicio)
);

CREATE TABLE reparacion_repuestos (
    ID_Reparacion INT,
    ID_Repuesto INT,
    Cantidad INT NOT NULL,
    PRIMARY KEY (ID_Reparacion, ID_Repuesto),
    FOREIGN KEY (ID_Reparacion) REFERENCES reparaciones(ID_Reparacion),
    FOREIGN KEY (ID_Repuesto) REFERENCES repuestos(ID_Repuesto)
);

CREATE TABLE facturas (
    ID_Factura INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    Metodo_Pago ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
    ID_Cliente INT NOT NULL,
    ID_Reparacion INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES clientes(ID_Cliente),
    FOREIGN KEY (ID_Reparacion) REFERENCES reparaciones(ID_Reparacion)
);

-- Insertar datos de prueba
INSERT INTO clientes (Nombre, Apellido, Telefono, Email, Direccion) VALUES
('Juan', 'Pérez', '600111222', 'juan@email.com', 'Calle Falsa 123'),
('María', 'Gómez', '600333444', 'maria@email.com', 'Avenida Real 45'),
('Carlos', 'López', '600555666', 'carlos@email.com', 'Plaza Mayor 6');

INSERT INTO vehiculos (Matricula, Marca, Modelo, Año, VIN, ID_Cliente) VALUES
('ABC123', 'Toyota', 'Corolla', 2018, '1HGCM82633A123456', 1),
('DEF456', 'Ford', 'Focus', 2020, '2FMDK4JC7ABA98765', 1),
('GHI789', 'Renault', 'Clio', 2019, '3FRWF4DE7AR654321', 2),
('JKL012', 'Seat', 'Ibiza', 2021, '4S3BMHB68B5432109', 3);

INSERT INTO empleados (Nombre, Apellido, Cargo, Telefono, Email) VALUES
('Luis', 'Martínez', 'Mecánico', '600777888', 'luis@taller.com'),
('Ana', 'Sánchez', 'Recepcionista', '600999000', 'ana@taller.com'),
('Pedro', 'Díaz', 'Mecánico', '600111000', 'pedro@taller.com');

INSERT INTO servicios (Nombre, Descripcion, Costo_Estimado, Tiempo_Estimado) VALUES
('Cambio de aceite', 'Reemplazo de aceite y filtro', 100.00, 1),
('Revisión de frenos', 'Comprobación de pastillas y discos', 80.00, 2),
('Alineación y balanceo', 'Alineación de ruedas y balanceo', 60.00, 2),
('Cambio de neumáticos', 'Montaje de neumáticos nuevos', 120.00, 3),
('Diagnóstico general', 'Escaneo de sistemas del vehículo', 50.00, 1);

INSERT INTO repuestos (Nombre, Descripcion, Precio_Unitario, Stock) VALUES
('Filtro de aceite', 'Filtro original Toyota', 15.00, 20),
('Aceite motor 5W30', 'Aceite sintético 5L', 30.00, 50),
('Pastillas de freno', 'Juego para Ford Focus', 45.00, 15),
('Neumático 205/55 R16', 'Michelin Pilot Sport 4', 90.00, 10),
('Batería 12V', 'Batería para Seat Ibiza', 120.00, 8);

INSERT INTO reparaciones (Fecha_Inicio, Fecha_Fin, Estado, ID_Vehiculo, ID_Empleado, ID_Servicio) VALUES
('2024-01-10', '2024-01-10', 'Completado', 1, 1, 1),
('2024-01-12', '2024-01-12', 'Completado', 2, 3, 2),
('2024-01-15', '2024-01-15', 'Completado', 3, 1, 4),
('2024-01-18', NULL, 'En Proceso', 4, 3, 5);

INSERT INTO reparacion_repuestos (ID_Reparacion, ID_Repuesto, Cantidad) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 2),
(3, 4, 4);

INSERT INTO facturas (Fecha, Total, Metodo_Pago, ID_Cliente, ID_Reparacion) VALUES
('2024-01-10', 145.00, 'Efectivo', 1, 1),
('2024-01-12', 170.00, 'Tarjeta', 1, 2),
('2024-01-15', 480.00, 'Transferencia', 2, 3);
