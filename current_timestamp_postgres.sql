
-- saber a data atual 

select current_timestamp;


-- usar como valor default


create table cargos(
	id serial primary key,
	nome_funcao varchar(255) not null,
	momento_insercao_bd timestamp default current_timestamp
);

insert into cargos (nome_funcao) values
('Auxiliar'),
('Tecnico'),
('Analista'),
('Supervisor'),
('Gerente de setor'),
('Gerente de divisão'),
('Gerente Departamento');

select * from cargos;


