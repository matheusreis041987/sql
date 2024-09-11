create table funcionario (

 	id serial primary key,
	nome varchar(255) not null,
	salario decimal

)

select * from funcionario

insert into funcionario (nome, salario) values 
('Thiago', 1500.25),
('Fernanda', 4000),
('Andreia', 11000),
('Jose', 3000);

create table cargo (

 	id serial primary key,
	cargo varchar(255) not null

);

insert into cargo (cargo) values
('Analista'),
('Tecnico'),
('Auxiliar')

select * from cargo

create table funcionario2 (

 	id serial primary key,
	nome_func varchar(255) not null,
	salario_func decimal,
	id_cargo integer not null,
	
	constraint fk_id_cargo foreign key (id_cargo)
	references cargo (id) match simple
	on delete cascade
	on update cascade
);

insert into funcionario2 (nome_func, salario_func, id_cargo) values
('Thiago', 1500.25,1),
('Fernanda', 4000,2),
('Andreia', 11000,2),
('Bernardo', 4000,3),
('Aurea', 6000,2);

select * from funcionario2


select func.id, nome_func, salario_func, c.cargo from funcionario2 as func left join cargo as c on func.id_cargo = c.id 


-- no intersect | exception | union os campos das duas tabelas devem ser dos mesmos tipos e na mesma ordem

-- EXCEPTION TODOS QUE ESTÃO CONTIDOS NA PRIMEIRA TABELA E NÃO ESTÃO NA SEGUNDA TABELA
select func.id, nome_func, salario_func from funcionario2 as func left join cargo as c on func.id_cargo = c.id except select * from funcionario

-- INTERSECT SÃO TODOS OS DADOS QUE EXISTEM IGUAIS NAS DUAS TABELAS
select func.id, nome_func, salario_func from funcionario2 as func left join cargo as c on func.id_cargo = c.id intersect select * from funcionario

-- UNION RETORNA TODOS OS ELEMENTOS DAS 2 TABELAS 
select func.id, nome_func, salario_func from funcionario2 as func left join cargo as c on func.id_cargo = c.id union select * from funcionario


-- TRAZENDO TODAS AS INFORMAÇÕES UNION
select  distinct f.id, f.nome_func, f.salario_func, c.cargo from 
(select func.id, nome_func, salario_func from funcionario2 as func left join cargo as c on func.id_cargo = c.id union select * from funcionario) as f
left join funcionario2 as fu on fu.id_cargo = f.id
left join cargo as c on fu.id_cargo = c.id;

-- TRAZENDO TODAS AS INFORMAÇÕES INTERSECT
select  distinct f.id, f.nome_func, f.salario_func, c.cargo from 
(select func.id, nome_func, salario_func from funcionario2 as func left join cargo as c on func.id_cargo = c.id intersect select * from funcionario) as f
left join funcionario2 as fu on fu.id_cargo = f.id
left join cargo as c on fu.id_cargo = c.id;

-- TRAZENDO TODAS AS INFORMAÇÕES EXCEPTION
select  distinct f.id, f.nome_func, f.salario_func, c.cargo from 
(select func.id, nome_func, salario_func from funcionario2 as func left join cargo as c on func.id_cargo = c.id except select * from funcionario) as f
left join funcionario2 as fu on fu.id_cargo = f.id
left join cargo as c on fu.id_cargo = c.id;