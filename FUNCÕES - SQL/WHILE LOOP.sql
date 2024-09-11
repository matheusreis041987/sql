create or replace function tabuada3 (numero integer) returns setof varchar as $$ -- setof indica que retornaremos um conjunto

 	declare
	multiplicador integer default 1;

	begin

	-- multiplicador que começa com 1 e vai até < 10;
	-- numero * multiplicador;
	-- multiplicador := multiplicador + 1
	
		while multiplicador < 10 loop 
		
		return next numero::varchar || ' x ' || multiplicador::varchar || ' = ' || (numero * multiplicador)::varchar;
		
		multiplicador := multiplicador + 1;
				
		end loop;
		
		return next 'Elaborador por Matheus';
		
	end;
	
$$ language plpgsql

select tabuada3 (9);