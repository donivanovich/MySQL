-- INSTRUCCIONES DML (SELECT, INSERT, UPDATE, DELETE)
-- INSTRUCCIONES DDL (DESCRIBE, CREATE, ALTER, DROP)

-- CREAR DATABASE
create database arqueologia;
use arqueologia;

-- BORRAR TABLA
drop table arqueologos;

-- CREAR TABLAS A DATABASE
create table arqueologos(dni VARCHAR(15), 
						nombre VARCHAR(30), 
                        ap1 VARCHAR(30), 
                        ap2 VARCHAR(30),
                        mail VARCHAR(255),
                        salario DECIMAL(7,2)
                        );
                        
insert into arqueologos(dni, nombre, ap1, ap2, mail, salario)
				values("34278956-X", "Lara", "Croft", NULL, "croft@hotmail.com", 5600); 
insert into arqueologos(dni, nombre, ap1, ap2, mail, salario)
				values("14241223-L", "Indiana", "Jones", NULL, "indy@gallerycollege.com", 1600); 
                        
create table objetos(id_objeto INT,
					nombre VARCHAR(100),
                    fecha_desc DATETIME,
                    dia INT,
                    mes INT,
                    anno INT,
                    nivel_cons ENUM("Desastado","Conservado","pristino"),
                    descripcion TEXT
                    );
                    
insert into objetos(id_objeto, nombre, fecha_desc, dia, mes, anno, nivel_cons, descripcion)
				values("1", "Botijo", "2024-12-3", 23, "2", "6", "Desastado", "Botijo bonito"); 
insert into objetos(id_objeto, nombre, fecha_desc, dia, mes, anno, nivel_cons, descripcion)
				values("2", "Plato", "2021-1-15", 3, "6", "2", "Conservado", "Plato cuadrado");
                
create table excavaciones(id_excavacion INT,
						 nombre VARCHAR(100),
                         fecha DATETIME,
                         x INT,
                         y INT
                         );
insert into excavaciones(id_excavacion, nombre, fecha, x, y)
						values("1", "Mariscos Recio", "2024-8-23 15:15:15", 2, 3);
insert into excavaciones(id_excavacion, nombre, fecha, x, y)
						values("2", "Calle Azcona", "2022-5-3 5:22:1", 6, 7);

create table areas(id_area VARCHAR(10),
				   descripcion TEXT,
                   estado BOOL
                   );
			
insert into areas(id_area, descripcion, estado)
				values("15P", "area bakana", true);
insert into areas(id_area, descripcion, estado)
				values("2AF", "area parque placentero", false);
                   
create table arqueologos_objetos(id_arq_obj INT,
									merito INT
                                    );
                                    
insert into arqueologos_objetos(id_arq_obj, merito)
							values("9", "123");
insert into arqueologos_objetos(id_arq_obj, merito)
							values("5", "888");
                
select *
from arqueologos_objetos;