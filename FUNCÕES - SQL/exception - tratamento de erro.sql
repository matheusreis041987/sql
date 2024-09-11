
LISTA DE ERROS PARA TRATAMENTO
https://www.postgresql.org/docs/current/errcodes-appendix.html

create or replace function cria_instrutor3 () returns trigger as $$ 

	declare
	
	media_salarial decimal;
	instrutores_recebem_menos integer default 0;
	total_instrutores integer default 0;
	salario decimal;
	percentual decimal (5,2);
	begin
		
		select avg(instrutor.salario) into media_salarial from instrutor where id <> new.id;
	
		
		if new.salario > media_salarial then
			insert into log_instrutores(informacao) values (new.nome || ' recebe acima da média');
		end if;
		
		for salario in select instrutor.salario from instrutor where id <> new.id loop
		total_instrutores := total_instrutores  +1;
			
			if new.salario > salario then
			instrutores_recebem_menos := instrutores_recebem_menos + 1;
			end if;
		end loop;
		
		percentual = instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
		
		insert into log_instrutores (informacao, teste)
			values (new.nome || ' recebeu mais do que ' || percentual || '% da grade de instrutores');
			
			return new;
			
			exception -- BLOCO PARA TRATAR EXCEÇÃO - QUANDO ENCONTRA UM ERRO, O SISTEMA BUSCA UM BLOCO COM EXCEPTION
				when undefined_column then
				return new;
				when undefined_function then
				return null;
				when duplicate_database then
				return null;
			
	end;
$$ language plpgsql;