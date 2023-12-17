
-- ************************** FUNÇÕES DE STRING********************


select instr('Matheus Reis Costa','h') -- achar a primeira posição da letra 

select instr('Matheus Reis Costa','Reis')-- achar a posição da palavra no texto

select length('Matheus') -- determinar a quantidade de caracter no texto

select length('Matheus Reis') -- determinar a quantidade de caracter no texto incluindo espaços
 
select replace('Matheus Reis Costa', 'Costa', 'Martins') -- replace('expressão onde acontecerá a pesquisa' , 'string procurada' , 'string  substitutiva ' )

--Basicamente, a função SQL SUBSTRING é utilizada quando queremos extrair um pequeno trecho de uma string de tamanho maior.
-- substring(<expressão>, <posição_inicial>,<tamanho>

select substring('Matheus Reis Costa', (select instr('Matheus Reis Costa','Reis')),(select length('Reis Costa')))
select substring('Matheus Reis Costa', (Select instr('Matheus Reis Costa', 'Reis')), (select length('matheus reis costa')))

select substring('Basicamente, a função SQL SUBSTRING é utilizada quando queremos extrair um pequeno',10, 100)

select substring(vinho,1,3) abreviação_vinho from tadega

select * from tadega where substring(vinho,1,1) = 'C' -- selecionar as linhas cujo nome do vinho inicial com C

select * from tadega where substring(vinho,1,2) = 'Ca' -- selecionar as linhas cujo nome do vinho inicial com Ca

-- retirar espaço em branco na esquerda

select ltrim('  Matheus Reis Costa    ')

-- retirar espaço em branco na direita

select rtrim ('  Matheus Reis Costa    ')



-- comando right e left não funcionam no sqlite spy

select right (vinho, 3) from tadega;

select left ('matheus', 3);

select reverse('matheus')


--ALGUNS COMANDOS NO POSTGRES

 select substring(vinho, 1, 5) from "Tadega".tadega;

 select substring('Matheus Reis Costa', 1,  position(' ' in 'Matheus Reis Costa')) as primeiro_nome

select substring('Matheus Reis Costa', position(' ' in 'Matheus Reis Costa' ), character_length ('Matheus Reis Costa') -  character_length ('Matheus')) as sobrenome
 

 select position(' ' in 'Matheus Reis Costa')


select trim('              eu me chamo      Matheus      Reis Costa          ');


SELECT MD5('matheus')

 select character_length ('Matheus Reis Costa')

 select translate ('Brasil', 'il', 'ão')

select upper('matheus reis costa')

select lower('MATHEUS REIS COSTA')

select regexp_count('meu nome é matheus reis costa', 'm') -- verificar a repetição de uma string