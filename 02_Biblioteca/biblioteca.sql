-- CREACION DE LA BASE DE DATOS SI NO EXISTE
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;
-- DROPSs
DROP TABLE IF EXISTS ejemplar_socios;
DROP TABLE IF EXISTS libros_autor;
DROP TABLE IF EXISTS ejemplar;
DROP TABLE IF EXISTS socios;
DROP TABLE IF EXISTS autor;
DROP TABLE IF EXISTS libros;
-- CREATEs
CREATE TABLE libros(id_libro INT primary key auto_increment,
				    titulo VARCHAR(300) NOT NULL,
                    editorial VARCHAR(50),
                    fecha_edicion DATETIME,
                    tematica VARCHAR(20),
                    n_edicion INT
                    );
CREATE TABLE autor(id_autor INT primary key auto_increment,
				   nombre VARCHAR(30) NOT NULL,
                   ap1 VARCHAR(50) NOT NULL,
                   ap2 VARCHAR(50)
                   );
CREATE TABLE socios(mail VARCHAR(255) primary key,
				    nick VARCHAR(50),
                    fecha_alta DATETIME NOT NULL
                    );
CREATE TABLE ejemplar(codigo VARCHAR(20) primary key,
					  estado VARCHAR(300) NOT NULL,
                      fk_libro INT,                      
				FOREIGN KEY (fk_libro) REFERENCES libros(id_libro)
                      );
CREATE TABLE libros_autor(id_libro_autor INT primary key auto_increment,
						  fk_libro INT,
                          fk_autor INT,
						FOREIGN KEY (fk_libro) REFERENCES libros(id_libro),
						FOREIGN KEY (fK_autor) REFERENCES autor(id_autor)
                          );
CREATE TABLE ejemplar_socios(id_ejemplar_socio INT primary key auto_increment,
							 fk_codigo VARCHAR(20),
                             fk_mail VARCHAR(255),
                             fecha DATETIME,
						FOREIGN KEY (fk_codigo) REFERENCES ejemplar(codigo),
						FOREIGN KEY (fk_mail) REFERENCES socios(mail)
                             );
-- DATA
INSERT INTO libros(id_libro, titulo, editorial, fecha_edicion, tematica, n_edicion)
					   VALUES(1, LasMaravillas, USD, 2002-2-3, miedo, 13);
INSERT INTO autor(id_autor, nombre, ap1, ap2)
					   VALUES(1, Juan, Lopez, Jimenez);
