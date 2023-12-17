select * from depto;

select vinho, produtor, preco * 5 from tadega; -- Pode existir cálculos nos campos

select pessoa.cpf, pessoa.nome, pessoa.rg, telefone_paciente.telefone from pessoa, telefone_paciente
where pessoa.CPF = telefone_paciente.CPF; -- select com mais de 1 tabela


select * from paciente as p1 join paciente as p2 on p1.cpf = p2.cpf -- junção de 2 tabelas iguais (deve nomear cada uma)
select * from paciente as p1 join paciente as p2 using(cpf) -- junção de 2 tabelas iguais, mas usando o using para excluir uma coluna de cpf