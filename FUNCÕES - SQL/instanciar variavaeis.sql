create or replace function primeira_pl2() returns integer as $$ 

	declare -- espaço de código para declarar uma variável
		primeira_variavel integer default 3;
		segunda_variavel integer := 10; -- atruibuir uma valor se escreve como :=

	begin
		-- espaço para os camondos sql
		
		primeira_variavel := primeira_variavel * 2; -- atruibuir uma valor se escreve como :=
		segunda_variavel := primeira_variavel / 25;
		
		
		return primeira_variavel + segunda_variavel;

	end

$$ language plpgsql


select primeira_pl2();