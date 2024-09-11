select * from tadega order by produtor
select * from tadega order by produtor desc
select * from tadega order by produtor asc


select cpf, crm_med, doenca from paciente order by doenca
select cpf, crm_med, doenca from paciente order by upper(doenca) -- ordena primeiro as com letras maiúsculas




-- POSTGRES ALURA 


select * from funcionarios order by nome desc

select * from funcionarios order by nome, matricula asc -- mais de um campo para ordenação

select * from funcionarios order by 4 asc -- pode-se substituir o nome do campo pela posição da coluna (4 = quarta coluna)


select * from funcionarios order by 1 asc limit 5 offset 1; -- comando offset pula a quantidade de linha  

 