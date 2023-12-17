/*o uso de INTERSECT permite uma intersecção entre as consultas. 
Que diabos é intersecção? Então, seria como exibir somente 
os registros que as duas consultas têm em comum.*/

select * from emp2 intersect select * from emp;


select  en as tudo from emp 
intersect
select  dn from depto
intersect
select  id from PALHACO_INFO order by en;