alter table T1 add column GEA decimal(8,2);

alter table p add column enf integer references E(en);


-- alterar o nome de uma tabela
alter table medico3 rename to MEDICO4;

-- alterar o nome da tabela
Alter table Tadega rename column vinho to UVA;

-- deletar coluna
alter table Tadega drop column cod_barra;

alter table tadega add column ngarragas integer check(ngarrafas(beteween 1 and 10))



-- change alterar os tipos de dados de uma coluna, não só seu nome (não funciona no sqlitespy).
alter table tadega change column vinho vinhos varchar(40) not null;

-- Modify modifica somente o tipo de dado da coluna
-- você pode alterar a ordem de sua coluna usando:
-- first, last, before nome_coluna, after nome_coluna, socond, third, fourth, etc.


-- ADICIONAR CHAVE PRIMARIA COM A TABELA CRIADA

select clientename from "VetLab".client
alter table "VetLab".client add primary key (clientename);


-- ADICIONAR CHAVE ESTRANGEIRA COM A TABELA CRIADA

alter table "VetLab".orders add constraint fk2 foreign key (testordered) references "VetLab".Tests(testename);


alter table "VetLab".orders add constraint fk3 foreign key (salesperson) 
references "VetLab".employee(employeename) on delete cascade on update cascade ;

-- colocando o valor de cascata como null

alter table "VetLab".orders add constraint fk3 foreign key (salesperson) 
references "VetLab".employee(employeename) on delete set null on update set null ;


-- Postgres


-- inserir nova coluna
alter table db_restaurant.comissao add column comissao_data_pagamento int;

-- excluir coluna existente
ALTER TABLE	comissao	DROP COLUMN	comissao_data_pagamento;

-- inserir nova coluna
ALTER TABLE	comissao	ADD COLUMN	comissao_data_pagamento	TIMESTAMP
;



