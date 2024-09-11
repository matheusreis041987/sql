
COMANDO PARA CONCATENAR USANDO O GROUP BY
select
ct.nome as nome_curso,
string_agg(al.primeiro_nome,' | ') as alunos,
case when ct.nome is not null then count(distinct al.id)
	 end as quant_alunos

from aluno as al 
left join aluno_curso as ac on (al.id = ac.aluno_id)
left join categoria as ct on (ac.curso_id = ct.id)
 where ct.nome is not null 
 group by 1 order by 1;