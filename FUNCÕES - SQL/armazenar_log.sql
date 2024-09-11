create table log_instrutores (
	id serial primary key,
	informacao varchar(255),
	momento_criacao timestamp default current_timestamp
);

/*
- inserir instrutores com salário
- Se o salário for maior que a média, salvar em log
- salvar outro log dizendo que fulano recebeu mais do que X% da grade do instrutor
*/
create or replace function cria_instrutor (nome_instrutor varchar, salario_instrutor decimal) returns void as $$ 

	declare
	id_instrutor_inserido integer;
	media_salarial decimal;
	instrutores_recebem_menos integer default 0;
	total_instrutores integer default 0;
	salario decimal;
	percentual decimal;
	begin
	select avg(instrutor.salario) from instrutor into media_salarial; -- armazenei o valor da média na variável com "into"
		
		insert into instrutor (nome, salario) values (nome_instrutor, salario_instrutor) returning id into id_instrutor_inserido;
		
		if salario_instrutor > media_salarial then
			insert into log_instrutores(informacao) values (nome_instrutor || ' recebe acima da média');
		end if;
		
		for salario in select instrutor.salario from instrutor where id <> id_instrutor_inserido loop
		total_instrutores := total_instrutores  +1;
			
			if salario_instrutor > salario then
			instrutores_recebem_menos := instrutores_recebem_menos + 1;
			end if;
		end loop;
		
		percentual = instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
		insert into log_instrutores (informacao)
			values (nome_instrutor || ' recebeu mais do que ' || percentual || '% da grade de instrutores');
		
	end;
$$ language plpgsql;

select * from instrutor;
select cria_instrutor ('Thiago', 1500.52);
select * from log_instrutores;
