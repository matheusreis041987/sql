-- função date_part



select * from db_restaurant.venda where date_part('year', venda_data_criacao) = '2023'
select * from db_restaurant.venda where date_part('day', venda_data_criacao) = '23'
select * from db_restaurant.venda where date_part('month', venda_data_criacao) = '07'


select 
x.id,
x.primeiro_nome,
x.data_nascimento,
date_part('day',((now() - data_nascimento)/365)) as idade,
coalesce (y.aluno_id,0) as aluno_id,
coalesce (y.curso_id,0) as curso_id,
coalesce(ca.nome,'aluno sem curso') as nome_curso
from aluno as x 
left join aluno_curso as y on (x.id = y.aluno_id)
left join categoria as ca on (y.curso_id = ca.id)





with meses as (select momento_insercao,date_part('month',momento_insercao) as mes_num from quarto_airbnb)
select momento_insercao, mes_num,
case when mes_num = 1 then 'Janeiro'
	 when mes_num = 2 then 'Fevereiro'
	 when mes_num = 3 then 'Março'
	 when mes_num = 4 then 'Abril'
	 when mes_num = 5 then 'Maio'
	 when mes_num = 6 then 'Junho'
	 when mes_num = 7 then 'Julho'
	 when mes_num = 8 then 'Agosto'
	 when mes_num = 9 then 'Setembro'
	 when mes_num = 10 then 'Outubro'
	 when mes_num = 11 then 'Novembro'
	 when mes_num = 12 then 'Dezembro'
	 end as meses_string,
date_part('year', momento_insercao) as ano
from meses