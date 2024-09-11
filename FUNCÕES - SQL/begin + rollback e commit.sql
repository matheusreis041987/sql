UM FUNÇÃO RODA DENTRO DO CÓDIGO QUE A CHAMOU, INCLUSIVE UMA TRIGGER.



begin;
insert into instrutor (nome, salario) values ('Paula', 2900);
rollback;