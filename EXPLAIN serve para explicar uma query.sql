EXPLAIN serve para explicar uma query


explain select * from instrutor2 where salario > 1500;









https://www.postgresql.org/docs/current/using-explain.html
https://www.postgresql.org/docs/current/sql-explain.html






--verificar a precisão das estimativas do planejado
explain analyze select * from instrutor2 where id = 1500;
