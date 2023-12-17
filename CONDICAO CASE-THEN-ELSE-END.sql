

select * from emp where dn = (case when (select avg(sal) from emp) > 3000 then 1 else 2 end)


select * from emp where dn = 
(case when (select avg(sal) from emp) > (select min(sal) * 3 from emp) 
then (select dn from depto where nome like "%adm%")
 else (select dn from depto where nome like "%preside%") 
 end)


select * from emp where dn = 
(case when (select avg(sal) from emp) > (select min(sal) * 3 from emp) 
then (select dn from depto where nome like "%adm%")
when (select avg(sal) from emp)  = (select min(sal) * 3 from emp)
then (select dn from depto where nome like "%sala impr%")
 else (select dn from depto where nome like "%preside%") 
 end)


update "Tadega".tadega set condicao = case 
				when preco > 50 
					then'está barato'
				when preco >=50 and preco <100
					then 'está no preço'
				when preco >=100
					then 'está caro'
				else 'erro lógico'
			end;


select * from "Tadega".tadega where condicao = 
(case when (select avg(preco) from "Tadega".tadega) > 55
then ('produto caro')
else ( 'barato')
end);