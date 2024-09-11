create or replace function primeira_pl() returns integer as $$ 
	begin -- iniciamos o bloco de código	

		return 1 + 1; -- é necessário declarar um retorno
		
				
	end -- terminados o bloco de códigop
$$ language plpgsql;


select primeira_pl();