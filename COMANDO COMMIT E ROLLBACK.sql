begin; -- iniciar a transação
select * from medico4;

delete from medico4 where crm = 869521;

commit; -- comando para salvar uma alteração no BD

rollback; -- comando para desfazer uma oepração no BD.