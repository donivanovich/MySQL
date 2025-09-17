create database ifkamhar;
use ifkamhar;

create table habilidad(
id_habilidad int primary key auto_increment,
nombre varchar(100)
);

create table tarea(
id_tarea int primary key auto_increment,
nombre varchar(100) not null,
carga decimal(7,2) not null
);

create table cargopenal(
id_cargo int primary key auto_increment,
nombre varchar(100) not null
);

create table moduloprision(
cod_esfera char(4) primary key,
nick varchar(30) not null,
diametro decimal(15,3) not null
);

create table inventario(
id_inventario int auto_increment primary key,
nombre varchar(100) not null,
descripcion varchar(3000)
);

create table funcionario(
id_funcionario int primary key auto_increment,
nombre varchar(50) not null,
apellido varchar(75) not null,
rango enum('C', 'B', 'A', 'S') not null,
cargo varchar(30),
fecha_nacimiento datetime not null,
fecha_alta datetime not null,
fecha_defuncion datetime
);

create table prisionero(
id_prisionero int primary key auto_increment,
nombre varchar(50) not null,
apellido varchar(75) not null,
alias varchar(75),
rango enum('C', 'B', 'A', 'S') not null,
fecha_nacimiento datetime not null,
fecha_ingreso datetime not null,
fecha_defuncion datetime,
estado enum('Fase Primaria', 'Fase Reinsertiva') not null
);

create table prisionero_cargopenal(
id_prisionero_cargoPenal int primary key auto_increment,
fk_prisionero int not null,
fk_cargo int not null,
foreign key (fk_prisionero) references prisionero(id_prisionero),
foreign key (fk_cargo) references cargopenal(id_cargo)
);

create table funcionario_habilidad(
id_funcionario_habilidad int primary key auto_increment,
nivel int not null,
fk_funcionario int not null,
fk_habilidad int not null,
foreign key (fk_funcionario) references funcionario(id_funcionario),
foreign key (fk_habilidad) references habilidad(id_habilidad)
);

create table inventario_funcionario(
id_inventario_funcionario int primary key auto_increment,
fk_inventario int not null,
fk_funcionario int not null,
foreign key (fk_inventario) references inventario(id_inventario),
foreign key (fk_funcionario) references funcionario(id_funcionario)
);

create table funcionario_prisionero(
id_funcionario_prisionero int primary key auto_increment,
fk_funcionario int not null,
fk_prisionero int not null,
foreign key (fk_funcionario) references funcionario(id_funcionario),
foreign key (fk_prisionero) references prisionero(id_prisionero)
);

create table tarea_funcionario(
id_tarea_funcionario int primary key auto_increment,
fk_tarea int not null,
fk_funcionario int not null,
foreign key (fk_tarea) references tarea(id_tarea),
foreign key (fk_funcionario) references funcionario(id_funcionario)
);

create table funcionario_moduloprision(
id_funcionario_moduloPrision int primary key auto_increment,
fk_funcionario int not null,
fk_cod_esfera char(4),
foreign key (fk_funcionario) references funcionario(id_funcionario),
foreign key (fk_cod_esfera) references moduloprision(cod_esfera)
);

create table celda(
id_celda int primary key auto_increment,
fk_cod_esfera char(4),
foreign key (fk_cod_esfera) references moduloprision(cod_esfera)
);

create table prisionero_celda(
id_prisionero_celda int primary key auto_increment,
fk_prisionero int not null,
fk_celda int not null,
foreign key (fk_prisionero) references prisionero(id_prisionero),
foreign key (fk_celda) references celda(id_celda)
);


-- Por favor rellene la siguiente plantilla con las consultas solicitadas:

-- Sin tener en cuenta la tarea de Mantenimiento de Reactor, devuelve el nombre de las tareas junto a su carga indicando cuántos funcionarios vivos hay asignados a cada una de ellas, descartando aquellas tareas que superen en 10 dicho número de funcionarios.

-- Devuelve el nombre y el rango de funcionarios rango S que sabiendo Kendo o Kung Fu Espiral tienen su inventario vacío;

-- Nombre, apellido y cargo de funcionarios rango A, la media ordenada de mayor a menor de la carga de tareas que tienen, que estén asignados a la esfera-modulo de prisión IF0, y quedandote con aquellos funcionarios cuya carga media supere 8
