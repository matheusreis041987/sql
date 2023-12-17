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