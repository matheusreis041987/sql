-- CURSORES 

CREATE FUNCTION instrutores_internos ( id_instrutor integer) returns refcursor as  $$ 

	declare
	
		cursor_salarios refcursor; -- refcursor não está ligado a nenhuma query 
		salario decimal;
	
	begin

		open cursor_salarios for select instrutor.salario 
								from instrutor 
							   where id <> id_instrutor  
							    and salario > 0;
								
		
								
		return 	cursor_salarios;					


	end;
$$ language plpgsql

-- existem 2 tipos de cursores, os ligados a uma query e os que não estão ligados a uma query


-- https://www.postgresql.org/docs/current/plpgsql-cursors.html#PLPGSQL-CURSOR-USING