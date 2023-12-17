-- ************** USANDO MERGE *****************************

--  merge é uma maneira conveniente de selecionar dados já existentes em algum lugar e copiá-los para um novo local 


drop table "SISED".bonus;
create table "SISED".bonus (
nome varchar(30) primary key,
bonus decimal default 100	
);

select * from "SISED".bonus

insert into "SISED".bonus (nome)
(select enome from "SISED".emp where dn= 5 );

merge into "SISED".bonus
using "SISED".emp
on (bonus.nome = emp.enome)
when not matched  then insert -- quando não coincidir, então insira
(nome, bonus)
values (emp.enome, 50);

