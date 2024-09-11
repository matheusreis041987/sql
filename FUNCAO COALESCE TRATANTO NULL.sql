

select 
x.id,
x.primeiro_nome,
x.data_nascimento,
coalesce (y.aluno_id,0) as aluno_id,
coalesce (y.curso_id,0) as curso_id,
coalesce(ca.nome,'aluno sem curso') as nome_curso
from aluno as x 
left join aluno_curso as y on (x.id = y.aluno_id)
left join categoria as ca on (y.curso_id = ca.id)