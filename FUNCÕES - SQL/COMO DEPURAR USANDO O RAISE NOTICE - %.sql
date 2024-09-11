COMO DEPURAR USANDO O RAISE NOTICE - %

create or replace function cria_instrutor2 () returns trigger as $$ 

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
			-- o % serve como goringa para que um valor entre ali
			raise notice 'Salario inserido: % Salario do instrutor existente: %', new.salario, salario;
			if new.salario > salario then
			instrutores_recebem_menos := instrutores_recebem_menos + 1;
			end if;
		end loop;
		
		raise notice 'instrutores que recebem menos: % | instrutores totais: % | Percentual: %', instrutores_recebem_menos, total_instrutores, percentual;
		percentual = instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
		assert percentual < 100::decimal, 'instrutores novos não podem receber mais que os antigos';
		
		insert into log_instrutores (informacao)
			values (new.nome || ' recebeu mais do que ' || percentual || '% da grade de instrutores');
			
			return new;
			
			exception -- BLOCO PARA TRATAR EXCEÇÃO - QUANDO ENCONTRA UM ERRO, O SISTEMA BUSCA UM BLOCO COM EXCEPTION
				when undefined_column then
				raise NOTICE 'aLGO DE ERRADO NÃO ESTÁ CERTO';
				raise EXCEPTION 'Erro complicado demais para resolver';
				when undefined_function then
				return null;
				when duplicate_database then
				return null;
				when assert_failure then
				raise notice 'Empregado ganha mais que todo mundo';
				raise exception 'Não é possível ganhar mais que todo mundo';
			
	end;
$$ language plpgsql;