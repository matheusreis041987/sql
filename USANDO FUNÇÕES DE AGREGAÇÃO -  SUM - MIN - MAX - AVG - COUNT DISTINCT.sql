select sum(preco) as preco from tadega;
 select sum(garrafas) as soma_garrafa from tadega;
 select avg(preco) as média from tadega;
 select min(preco) as preco_min from tadega;
 select max(preco) as preco_maximo from tadega;
 select count(vinho) as quant_vinhos from Tadega; -- contará a quantidade de linhas
 select count(distinct vinho) as quant_vinhos from Tadega; -- contará a quantidade de vinhos sem contar os repetidos
select DISTINCT vinho from tadega;
select count(*) as quant_linhas from Tadega;-- contará a quantidade de linhas



select dn, count(*) from emp group by dn; -- group by usando função de contagem 




-- ALURA


select count(id), sum(id), max(id),min(id), round(avg(id),2)  from funcionarios

