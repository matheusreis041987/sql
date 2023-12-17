-- operador UNION
/*
O UNION é um operador SQL utilizado para combinar um ou mais resultados de uma consulta do tipo SELECT, 
porém é necessário que as colunas tenham o tipo de dados similar, mesma quantidade e ordem de colunas.

*/
select produtor from tadega union select produtor from produtor -- junta tudo retirando as repetidas
select produtor from tadega union all select produtor from produtor -- junta sem retiurar as repetidas

-- --------------------------------------------------------------
-- no union all aparece a repetição dos elementos, já no union não aparece

select * from emp union  select * from maior_sal;

select * from emp union all  select * from maior_sal; -- junta todos os elementos