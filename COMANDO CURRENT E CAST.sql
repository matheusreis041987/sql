--comando current


select current_date
select current_time


-- comando cast

select cast(2.25 as datetime);
select cast(2.25 as integer);
select id, primeiro_nome, cast(data_nascimento as varchar) from aluno
select id, primeiro_nome, cast(data_nascimento as timestamp) from aluno

