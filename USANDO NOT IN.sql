select * from emp where en not in (select en from tele); -- comando not in 

select emp2.* from emp2 where en not in (select en from emp); -- verificar quem está fora de uma relação