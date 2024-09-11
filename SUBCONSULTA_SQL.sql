-- subconsultas

-- funcionarios com vendas

select * from db_restaurant.funcionario
select * from db_restaurant.venda
select funcionario_nome from db_restaurant.funcionario where funcionario_id in (select funcionario_id from db_restaurant.venda)

select funcionario_nome from db_restaurant.funcionario where funcionario_id in (select funcionario_id from db_restaurant.venda where date_part('year',venda_data_criacao) = '2023' )



-- ============================ ALURA ========================================================
select * from curso where categoria_id in (select id from categoria where nome not like '% %')


-- usar uma consulta como se fosse uma tabela

select * from (
	select  categoria.nome, count(aluno_curso.curso_id) as numero_alunos 
		from curso join aluno_curso on aluno_curso.curso_id = curso.id join categoria on categoria.id = curso.categoria_id
		group by 1 order by 2 desc
) as categoria_curso
where numero_alunos >= 3
