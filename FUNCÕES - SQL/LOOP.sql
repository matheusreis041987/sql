create or replace function tabuada (numero integer) returns setof integer as $$ -- setof indica que retornaremos umn conjunto

 	declare
	multiplicador integer default 1;

	begin

	-- multiplicador que começa com 1 e vai até < 10;
	-- numero * multiplicador;
	-- multiplicador := multiplicador + 1
	
		loop 
		
		return next numero * multiplicador;
		multiplicador := multiplicador + 1;
		
			exit when multiplicador = 11;
		end loop;	

	end;
	
$$ language plpgsql


select tabuada (2);


create or replace function tabuada2 (numero integer) returns setof varchar as $$ -- setof indica que retornaremos um conjunto

 	declare
	multiplicador integer default 1;

	begin

	-- multiplicador que começa com 1 e vai até < 10;
	-- numero * multiplicador;
	-- multiplicador := multiplicador + 1
	
		loop 
		
		return next numero::varchar || ' x ' || multiplicador::varchar || ' = ' || (numero * multiplicador)::varchar;
		
		multiplicador := multiplicador + 1;
		
			exit when multiplicador = 11;
		end loop;	

	end;
	
$$ language plpgsql

select tabuada2 (2);