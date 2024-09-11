select * from tadega where ano > 1995;
select * from tadega where ano in (1997, 1998, 1996, 1993);
select * from tadega where preco between 50 and 110;
select * from tadega where vinho like 'p%';


select * from paciente where doenca in ('COVID', 'Sarampo', 'Diabetes');

-- ------------------------------------------------------
select * from emp2 where en in (select en from emp);




select * from aluno where nome <> 'Diogo'
select * from aluno where nome != 'Diogo'

select * from aluno where nome like '_iogo' -- significa qualquer caracter naquela posição

select * from aluno where nome not like 'Di_go' -- not like funciona como um 'diferente  <>'

select * from aluno where nome like '%s'


select * from aluno where nome like '% %' -- traz todos que tem espaço no nome


select * from aluno where idade between 10 and 40





----------------------------ALURA-------------------------------------------

IN - receber vários parâmetros e busca o resultado para esses parâmetros - funciona como um while varrendo uma lista
O operador IN compara algo com todos os valores presentes em uma lista

select * from curso where categoria_id in (1,2)






