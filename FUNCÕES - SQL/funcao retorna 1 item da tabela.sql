-- função de devolve um item de uma tabela
create or replace function  criar_instrutor_false() returns instrutor as $$ 

		select 22 , 'Nome falso', 200::decimal -- fazer os cast do salário para converter para decimal
-- só precisa ter os mesmos valores que um instrutur, não necessáruamento existindo na tabela

$$ language sql

-- retornar um conjunto de elementos no retorno
select * from instrutor
