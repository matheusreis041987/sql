FUNÇÕES POSTGRES

https://www.postgresql.org/docs/9.1/functions-string.html

STRING - ALGUMAS FUNÇÕES

CONCATENAÇÃO DE STRING --> ||

select (nome ||' '|| ultimo_nome) as nome_completo from aluno


-- A função concat consegue ignonar os elementos nulos
select concat('Matheus',' ', null, 'Costa' )
select concat (nome, ' ', ultimo_nome) from aluno

FUNÇÃO PARA INFORMAR A QUANTIDADE DE BIT DE UMA STRING

select bit_length('matheus')


PRIMEIRA LETRAS MAIUCULAS

select initcap ('MATHEUS REIS COSTA')


FUNÇÃO PARA SABER A QUANTIDADE DE CARACTERES

SELECT nome, character_length (nome) as quant_carac from aluno


FUNÇÃO PARA CONVERTER EM MINUSCULO

select lower(nome) from aluno 


FUNÇÃO PARA CONVERTER PARA MAIUSCULO

select upper(nome) from aluno


SUBSTITUIR O PARTE DE UMA STRING POR OUTRA

select overlay(nome placing 'MMM' from 3 for 5) from aluno



LOCALIZAR A POSIÇÃO DE UMA STRING DENTRO DE UM TEXTO

select position ('no' in 'Matheus trabalho no Serpro')


EXTRAIR PARTE DE UM TEXTO

select substring ('Matheus trabalha no Serpro ' from 3 for 10)

select substring ('Matheus trabalha no Serpro ' from '...$')


RETIRAR ESPEÇOS EM BRANCO

select trim ('       matheus       Reis       Costa')


TRABALHANDO COM VÁRIAS FUNÇÕES DE STRING

select trim(upper(concat(nome, '      ', ultimo_nome, '     '))) as nome_completo from aluno


achar o primeiro nome


select left('Matheus Reis Costa',position(' ' in 'Matheus Reis Costa'))


select left((trim(upper(concat(nome, '      ', ultimo_nome, '     '))) ),position(' ' in 'Matheus Reis Costa')) as primeiro_nome from aluno








FUNÇÕES DE DATA


https://www.postgresql.org/docs/9.1/functions-datetime.html

select concat(nome,' ', ultimo_nome) as nome_completo, now()::date as hoje, data_nascimento from aluno


FUNÇÃO PARA IDADE

select concat(nome,' ', ultimo_nome) as nome_completo, now()::date as hoje, data_nascimento, (now()::date - data_nascimento) / 365 as idade from aluno


select concat(nome,' ', ultimo_nome) as nome_completo, now()::date as hoje, data_nascimento, extract( year from age(data_nascimento)) as idade from aluno



FUNÇÃO EXTRACT PARA ANO, MES E DIA

select extract(year from now())

select extract(month from now())

select extract(day from now())

select extract(week from now())


FUNÇÕES MATEMATICAS


https://www.postgresql.org/docs/9.5/functions-math.html



select round(random() * 100)




 