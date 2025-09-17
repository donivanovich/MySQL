delimiter //
-- drop procedure productosPorCategoria;

-- ((((((((((((( NO ENTIENDO LA PAGINACION ))))))))))))))))))))))

create procedure productosPorCategoria(in _id_categoria int,
										in _orden int,
                                        out _codigo int
                                        )
begin
	
    set _codigo = -99;
	
	if _orden like 1 then
		set _codigo = 0;
		
		select id_producto, marca, modelo, precio, stock
		from productos
		where fk_categoria = _id_categoria
        order by precio desc;
        
	elseif _orden like 2 then
		set _codigo = 0;
        
		select id_producto, marca, modelo, precio, stock
		from productos
		where fk_categoria = _id_categoria
        order by marca desc;
	
	else 
		set _codigo = -1; -- Orden incorrecto
        
        select _codigo as codigo
		from productos
		where fk_categoria = _id_categoria
        limit 1;
    
    end if;
end;//

delimiter ;


set @_codigo = 0;
call shawarmas.productosPorCategoria(1, 2, @_codigo);