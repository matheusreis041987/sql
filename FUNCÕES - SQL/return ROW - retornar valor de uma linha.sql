create or replace function cria_instrutor_falso1() returns instrutor as $$ -- retorno composto

	begin
	
		return row ( 23, 'Tulio Maravilah', 550::decimal)::instrutor; -- row indica que todos os valores entrarão em uma linha
		
		
	
	end;

$$ language plpgsql;

select id, nome, salario from cria_instrutor_falso1();