select
distinct al.id,
al.primeiro_nome,
al.ultimo_nome,
al.data_nascimento,
ct.nome as nome_curso,

case when ct.nome is not null then 'Aluno Matriculado'
	 when  ct.nome is null then 'Aluno NAO Matriculado'
	 end as situacao_curso

from aluno as al 
left join aluno_curso as ac on (al.id = ac.aluno_id)
left join categoria as ct on (ac.curso_id = ct.id)
order by 1



select *, case when y.aluno_id is null then 0 else 1 end
from aluno as x left join aluno_curso as y on (x.id = y.aluno_id)



====================================================================================

-- USANDO O CASE DENTRO DA SUM()

select date_part('year',sales_month) as sales_year, 
sum( case when kind_of_business = 'Men''s clothing stores'
		then sales
end) as sales_men,
sum( case when kind_of_business = 'Women''s clothing stores'
		then sales
end) as sales_women
from retail_sales where kind_of_business in ('Men''s clothing stores', 'Women''s clothing stores') 
group by 1
order by 1;