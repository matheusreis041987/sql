START TRANSACTION OU BEGIN;

https://www.postgresql.org/docs/current/tutorial-transactions.html

-- indicar aos postgres que irá iniciar uma transação (seria similiar a marcar om check point ou ponto de restauração)

START TRANSACTION; -- inicia a transação
--ou
BEGIN;

delete from academico.cursos_programacao

select * from academico.cursos_programacao 

-- confirmar a transação ao reverter

rollback; -- REVERTER O QUE FOI FEITO

select * from academico.cursos_programacao


===============================================================

begin;

delete from academico.cursos_programacao where id_curso = 4

select * from academico.cursos_programacao;

commit; -- CONFIRMAR O QUE FOI FEITO