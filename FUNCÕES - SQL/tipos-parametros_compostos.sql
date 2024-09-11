create table instrutor(
id serial primary key,
nome varchar not null,
	salario decimal(10,2)

)

insert into instrutor (nome, salario) values('Vinicius Dias',100);
insert into instrutor (nome, salario) values('Matheus Reis',3000);
insert into instrutor (nome, salario) values('Bernardo Costa',1000);



create function dobro_do_salario(nome instrutor) returns decimal as $$

select nome.salario * 2 as dobro;


$$ language sql;

select nome, dobro_do_salario(instrutor.*) as desejo from instrutor;

-- o parâmetro pode receber tanto tipo primitivos como compostos, como uma linha inteira dentro de uma tabela.