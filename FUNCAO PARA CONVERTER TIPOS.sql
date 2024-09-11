CONVERTER VALOR PARA OUTRO TIPO

USA-SE OS '::'

select concat(nome,' ', ultimo_nome) as nome_completo, now()::date as hoje, data_nascimento from aluno

select 12::numeric(12,2) as numero



select concat(nome,' ', ultimo_nome) as nome_completo, now()::date as hoje, data_nascimento, age(data_nascimento) as idade from aluno



FUNÇÕES DE CONVERSÃO


select to_char(now(),'DD/MM/YYYY')

select nome, to_char(data_nascimento,'DD/MM/YYYY') from aluno

select to_char(125.45:: real, '9999D99999999999')



https://www.postgresql.org/docs/9.5/functions-formatting.html


