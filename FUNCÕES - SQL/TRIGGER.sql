-- trigger forma de executar um código sempre que um evento ocorrer

-- o retorno da função tem de ser um TRIGGER 

-- quando o retorno é um trigger, não podemos receber nenhum parâmetro

/* variáveis do Postgres para o trigger

- new ==> tem a nova linha quando estiver realizando um Insert/Update, se for Delete, não vai ter nada
- old ==> tem a nova linha quando estiver realizando um Update/Delete, se for Insert, não vai ter nada
- tg_name ==> nome do trigger
- tg_when ==> quando o trigger vai ser executado (BEFORE, AFTER, INSTEAD OF)
- tg_level ==> nível, ou seja, se é para cada linha ou cada instrução
- tg_op ==> qual operação está sendo executado (insert, upodate, delete, truncate)
- tg_relid ==> id da tabela que está sendo modificada
- tg_table_name ==> nome da tabela que foi modificada
- tg_table_schema ==> nome do schema que está sendo modificado

*/


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
			
			if new.salario > salario then
			instrutores_recebem_menos := instrutores_recebem_menos + 1;
			end if;
		end loop;
		
		percentual = instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
		
		insert into log_instrutores (informacao)
			values (new.nome || ' recebeu mais do que ' || percentual || '% da grade de instrutores');
			
			return new; -- poderia ser null, mas é bom retornar a instrução executada.
		
	end;
$$ language plpgsql;

/*
Estrutura trigger:
CREATE [ OR REPLACE ] [ CONSTRAINT ] TRIGGER name { BEFORE | AFTER | INSTEAD OF } { event [ OR ... ] }    .... INSTEAD OF => no lugar de
    ON table_name
    [ FROM referenced_table_name ]
    [ NOT DEFERRABLE | [ DEFERRABLE ] [ INITIALLY IMMEDIATE | INITIALLY DEFERRED ] ]
    [ REFERENCING { { OLD | NEW } TABLE [ AS ] transition_relation_name } [ ... ] ]
    [ FOR [ EACH ] { ROW | STATEMENT } ]
    [ WHEN ( condition ) ]
    EXECUTE { FUNCTION | PROCEDURE } function_name ( arguments )

where event can be one of:

    INSERT
    UPDATE [ OF column_name [, ... ] ]
    DELETE
    TRUNCATE
	*/
	
	
create trigger cria_log_instrutor after insert on instrutor
	for each row execute function cria_instrutor2();
	
select * from instrutor;
select * from log_instrutores;
	
insert into instrutor (nome, salario) values ('Ana', 50)



======================================================================================

-- NÃO DEIXAR LANÇAR SALÁRIO MAIOR QUE O DE TODO MUNDO


create or replace function cancelar_salario_alto () returns trigger as $$ 

	declare
		salario decimal;
		instrutores_recebem_menos integer default 0;
		total_instrutores integer default 0;
		percentual decimal (5,2);
	
	begin

	for salario in select instrutor.salario from instrutor loop
		total_instrutores := total_instrutores  +1;
	
		if new.salario > salario then
		instrutores_recebem_menos := instrutores_recebem_menos + 1;

		end if;
	end loop;
	
	percentual := instrutores_recebem_menos::decimal / total_instrutores::decimal;
	
		if percentual = 1 then
			raise exception 'salário acima dos demais, operação não permitida' ;
			return null;
		end if;
	end;
$$ language plpgsql

create trigger parar_salario_alto before insert or update on instrutor
	for each row execute function cancelar_salario_alto ();



insert into instrutor (nome, salario) values ('Wanya', 11000)
select * from instrutor;
select * from log_instrutores;



