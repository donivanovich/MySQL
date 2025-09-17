delimiter //

-- drop procedure cambiarContrasena;

create procedure cambiarContrasena(in _mail varchar(255),
								   in _nueva_passw varchar(1024),
								   out _codigo int
)
begin
    declare correosEncontrados int;
    declare _id int;
    declare _passw_antigua varchar(1024);
    declare _passw1 varchar (1024);
    declare _passw2 varchar (1024);
    declare _passw3 varchar (1024);
    declare _passw_temp varchar (1024);

    select count(*) into correosEncontrados from clientes where mail = _mail;

    if correosEncontrados = 0 then
        set _codigo = -1; -- CORREO NO ENCONTRADO

    elseif char_length(_nueva_passw) < 4 then
        set _codigo = -2; -- CONTRASEÑA CORTA
	
    else
		select id_user into _id from clientes where mail = _mail;
        select passw into _passw_antigua from clientes where mail = _mail;
        select passw1 into _passw1 from historial where fk_id_user = _id;
        select passw2 into _passw2 from historial where fk_id_user = _id;
        select passw3 into _passw3 from historial where fk_id_user = _id;
        
        if _passw1 like _passw_antigua or _passw2 like _passw_antigua or _passw3 like _passw_antigua then
			set _codigo = -4;
            
		else
			update clientes 
			set passw = _nueva_passw 
			where mail = _mail;
            
			update historial
            set passw3 = passw2, passw2 = passw3, passw1 = _passw_antigua
			where fk_id_user = _id;
			
            
			set _codigo = 0; -- EXITO
		end if;
    end if;
end;//

delimiter ;

set @_codigo = 0;
call shawarmas.cambiarContrasena('psoe@gmail.com', '1234', @_codigo);
select @_codigo;


create table historial(id_historial int primary key auto_increment,
							passw1 varchar(1024),
                            passw2 varchar(1024),
                            passw3 varchar(1024),
                            fk_id_user int not null,
						foreign key (fk_id_user) references clientes(id_user)
                        );
                        
                        select * from historial;
                        
                        drop table historial;
                        
                        insert into historial(passw1, passw2, passw3, fk_id_user) values ('', '', '', 1);