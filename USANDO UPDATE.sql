-- atualizar os valores na tabela

update depto set CHF = 31 where dn=2;

update paciente set doenca = upper(doenca) -- alterar o campo doença para maiúsculo
update paciente set doenca = lower(doenca) -- alterar o campo doença para miúsculo



-- ------------------------------------------------
-- CRIANDO COLUNAS E ATUALIZANDO OS VALORES
alter table p add column enf integer references E(en);

update P set enf = 1;
update P set enf = 2 where rg in (2,40,50);
update P set enf = 3 where rg in (55);

alter table C add column data date;
update C set data = date('2022-09-11');
update C set data = date('2022-05-30') where rg in (1, 50);
update C set data = date('2022-07-18') where rg in (40); 


-- ==============================================================

update medico2 set salario = salario * 1.495 where data_adm < '01/01/2021';



alter table c add column data date;
update c set data = "2003-04-17" where crm = 300;
update c set data = "2003-04-16" where rg = 1;
update c set data = "2003-05-17" where rg = 40;
update c set data = "2003-04-01" where rg = 50;
update c set data = "2003-04-03" where rg = 56;
update c set data = "2003-04-08" where rg = 57;
update c set data = "2003-04-07" where rg = 58;
update c set data = "2003-04-06" where rg = 59;
update c set data = "2003-04-011" where rg = 60;


alter table Palhaco_info add column tipo varchar(30) check (tipo in ('A','B','C'));