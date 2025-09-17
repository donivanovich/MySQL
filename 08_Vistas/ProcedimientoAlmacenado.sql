-- PROCEDIMIENTO ALMACENADO

use sakila;

drop procedure NombresQueEmpiezanPor;
-- cambia punto y coma por lo que quieras
delimiter // 
create procedure NombresQueEmpiezanPor(in _letra char)
begin
	
	-- INSTRUCCIONES
	-- INSTRUCCIONES
	-- INSTRUCCIONES
    -- INSTRUCCION NUCLEAR LA MAS IMPORTANTE
    select first_name, last_name
    from actor
    where first_name like concat(_letra, "%");
end//
delimiter ;

drop procedure AltaCliente;
delimiter // 
create procedure AltaCliente(in _store_id int, in _first_name varchar(45), in _last_name varchar(45), in _email varchar(50), out _resultado int)
begin
	declare existe int;
    set existe = NULL;
    
	set _resultado = -99; -- CODIGO DE ERROR DESCONOCIDO
    
    if(select store_id from store where store_id = _store_id is null) then
		set _resultado = -1; -- CODIGO DE ERROR: TIENDA NO ENCONTRADA
    else
		-- INSTRUCCIONES
		-- INSTRUCCIONES
		-- INSTRUCCIONES
		-- INSTRUCCION NUCLEAR LA MAS IMPORTANTE
		INSERT INTO sakila.customer(store_id, first_name, last_name, email, address_id, create_date)
		VALUES(_store_id,_first_name, _last_name, _email, 1, sysdate());
        set _resultado = 0; -- CODIGO TODO OK
	end if;
end//
delimiter ;


