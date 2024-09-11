-- SUBBLOCO

create or replace function primeira_pl3() returns integer as $$ 

	declare 
		primeira_variavel integer default 3;
		segunda_variavel integer;

	begin
		
		
		primeira_variavel := primeira_variavel * 2; 
		segunda_variavel := primeira_variavel / 25;
		
		declare
		primeira_variavel integer;
		
		begin 
		
		-- quando termina o bloco, a variavel deixa de existir
			primeira_variavel := 7;	
		
		end;
		
		
		return primeira_variavel;

	end

$$ language plpgsql


select primeira_pl3();



===========================================================================




create or replace function primeira_pl3() returns integer as $$ 

	declare 
		primeira_variavel integer default 3;
		segunda_variavel integer;

	begin
		
		
		primeira_variavel := primeira_variavel * 2; 
		segunda_variavel := primeira_variavel / 25;
		
		-- quando não declaramos movamente a variavel e ela é inserida no sub-bloco, ela passar a ter valor fora do bloco.
		
		
		begin 
		
		-- quando termina o bloco, a variavel deixa de existir
			primeira_variavel := 7;	
		
		end;
		
		
		return primeira_variavel;

	end

$$ language plpgsql


select primeira_pl3();