-- PROCEDIMIENTOS ALMACENADOS SOBRE SAKILA
-- PROCEDIMIENTO ALMACENADO QUE DE ALTA UNA TIENDA
drop procedure if exists altatienda;
delimiter //

create procedure altatienda(in _store_id int, in _manager_staff_id int)
begin
    insert into sakila.store (store_id, manager_staff_id, address_id)
    values (_store_id, _manager_staff_id, 1);
end//

delimiter ;

-- PROCEDIMIENTO ALMACENADO QUE CAMBIE LA SINOPSIS DE UNA PELICULA POR OTRA RECIBIDA
drop procedure if exists cambiarsinopsis;
delimiter //

create procedure cambiarsinopsis(in _film_id int, in _nueva_sinopsis text)
begin
    update sakila.film
    set description = _nueva_sinopsis
    where film_id = _film_id;
end//

delimiter ;

-- PROCEDIMIENTO ALMACENADO QUE GRABE LA DEVOLUCION DE UN ALQUILER
drop procedure if exists grabardevolucion;
delimiter //

create procedure grabardevolucion(in _rental_id int, in _return_date datetime)
begin
    update sakila.rental
    set return_date = _return_date
    where rental_id = _rental_id;
end//

delimiter ;

-- PROCEDIMIENTO ALMACENADO QUE TRASLADE UN OBJETO DE INVENTARIO DE UNA TIENDA A OTRA
drop procedure if exists trasladarinventario;
delimiter //

create procedure trasladarinventario(in _film_id int, in _store_id_origen int, in _store_id_destino int)
begin
    delete from sakila.inventory
    where film_id = _film_id and store_id = _store_id_origen;

    insert into sakila.inventory (film_id, store_id, status)
    values (_film_id, _store_id_destino, 'available');
end//

delimiter ;