create or replace function cria_instrutor_falso2() returns instrutor as $$ -- retorno composto

	declare
	inst instrutor; -- declarar uma variavel do tipo instrutor
	
	begin
	
		select  24, 'Andreia Cristina', 212::decimal into inst; --adicionar o valor do select na variável inst
		
		return inst;
	
	end;

$$ language plpgsql;

select id, nome, salario from cria_instrutor_falso2();