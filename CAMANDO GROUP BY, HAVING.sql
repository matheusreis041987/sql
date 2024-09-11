/*A cláusula GROUP BY pode ser empregada, entre outras finalidades, 
para agrupar os produtos de acordo com cada tipo existente.*/

select ano, sum(preco) * sum(garrafas) as total from Tadega group by ano; -- serve para agrupar informações

select vinho, sum(preco) * sum(garrafas) as total from Tadega group by vinho;


select produtor, sum(preco) * sum(garrafas) as total from Tadega group by produtor order by produtor asc;

select produtor, vinho, sum(preco) * sum(garrafas) as total from Tadega group by produtor, vinho;

/* Cláusula HAVING com GROUP BY – A cláusula HAVING determina uma condição de 
busca para um grupo ou um conjunto de registros, definindo critérios para limitar os 
resultados obtidos a partir do agrupamento de registros. É importante lembrar que essa 
cláusula só pode ser usada em parceria com GROUP BY.*/

select vinho, sum(preco) * sum(garrafas) as total from Tadega group by vinho having vinho like 'c%';

select ano, sum(preco) * sum(garrafas) as total from Tadega group by ano having ano > 1996;

select produtor, sum(preco) * sum(garrafas) as total from Tadega group by produtor having produtor like'c%' order by produtor asc;

select ano, sum(preco) * sum(garrafas) as total from Tadega group by ano having garrafas > 4;

/*O HAVING é diferente do WHERE. O WHERE restringe os resultados obtidos sempre após 
o uso da cláusula FROM, ao passo que a cláusula HAVING filtra o retorno do agrupamento.*/



-- -----------------------------------------------------------------------------------------



select dn, count(*) from emp group by dn; -- group by usando função de contagem 

select dn, count(*) from emp group by dn having count(*)>2;



-- ================ ALURA ===================================

select curso.nome, count(aluno.id) from aluno 
join aluno_curso on aluno_curso.aluno_id = aluno.id  join curso on curso.id = aluno_curso.curso_id group by curso.nome order by 1

select contratos.esfera, count (contratos.id) from loja.contratos group by contratos.esfera


select contratos.produto, count(contratos.id) from loja.contratos group by contratos.produto order by 1


select curso.nome, count (aluno.id) 
from aluno 
join aluno_curso on aluno.id = aluno_curso.aluno_id 
join curso on curso.id = aluno_curso.curso_id
group by 1 order by 1



select curso.nome, count(aluno.id)
from curso 
left join aluno_curso on aluno_curso.curso_id = curso.id 
left join aluno on aluno.id = aluno_curso.aluno_id
group by 1
having count(aluno.id) = 0;


-- a função having funciona igual a um 'where', sendo usanda junto ao group by para aplicar filtros




select nome, count (id) from funcionarios group by nome having count(id) <> 1;
