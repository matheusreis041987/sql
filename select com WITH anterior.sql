with nascimento_maior_1986 as (select * from aluno where data_nascimento>'1987-01-01')

select * from nascimento_maior_1986 as x left join
aluno_curso as y on (x.id = y.aluno_id) where aluno_id is not null




with aluno_com_curso as
( select * from aluno as a
 left join aluno_curso as b on a.id = b.aluno_id 
 left join curso as c on c.id = b.curso_id
)

select * from aluno_com_curso