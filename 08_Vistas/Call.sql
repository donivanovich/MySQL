call NombresQueEmpiezanPor("A");

set @resultado = -4344;
call AltaCliente(1, "Pepa", "Pig", "pepapig@lonchas.net", @resultado);
select @resultado;

call AltaTienda(3, 3);