CLAUSUALA RETURNIG
Obter dados de linhas modificadas enquanto elas estão sendo manipuladas.



insert into academico.funcionarios (matricula, nome, sobrenome) values
('M007','Matheus', 'Reis Costa') returning id;



https://www.postgresql.org/docs/current/dml-returning.html