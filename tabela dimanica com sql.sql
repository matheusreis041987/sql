select id,
sum(case when nome = 'Felipe' then salario
   else 0
   end) as Felipe,
sum(case when nome = 'Tulio' then salario
   else 0
   end) as Tulio
 from instrutor
 group by 1 order by 1





select 
id,
count(case when nome = 'Postgres' then nome

	 end) as Postgres,
count(case when nome = 'React' then nome

	 end) as React,
count(case when nome = 'Wan' then nome

	 end) as Wan
from curso
group by 1
