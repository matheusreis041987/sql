-- ************COMANDOS DE DATA E TEMPO******************

select date('now') -- data atual no formato YYYY-MM-DD 

select time('now') -- hora atual no forato hh:mm:ss

select date('now', 'start of year') -- primeiro dia do ano atual

select date('now', 'start of month') -- primeiro dia do mês atual

select date('now', 'start of day') -- início do dia atual

select date('now', '+3 months')  -- data de hoje mais 3 meses

select date('now', '+120 days') -- data de hoje mais 120 dias

select date('now', 'start of day', '+3 months', '+15 days')

select date('now', 'start of month','+1 month','-1 day') -- último dia do mês corrente

select datetime('now') -- apresenta o dia e a hora atual

select datetime('now', 'localtime') -- calcula o dia e o horário local (Brasil)

select julianday('2022-12-25') - julianday('now') -- quantos dias para o natal a partir da data atual

select julianday('2022-01-31') - julianday('2022-01-01') -- quantidade de dias entre 31/01/2022 e 01/01/2022

select (julianday('2022-01-31') - julianday('2022-01-01'))/30 -- quatidade de dias em janeiro dividido por 30






/*comandos internos - modificadores nas chamadas
DEVEM ESTAR ENTRE ASPAS SIMPLES (' ')
now
+9 month
+1 year
start of year
start of month
start of day
weekday 2
000 days
000 hours
000 minutes
000.0000 seconds
000 months
000 year




FOMATOS DE TEMPO
%d day of month: 00
%f fractional seconds: SS.SSS
%H hour: 00-24
%j day of year: 001-366
%J Julian day number (fractional)
%m month: 01-12
%M minute: 00-59
%s seconds since 1970-01-01
%S seconds: 00-59
%w day of week 0-6 with Sunday==0
%W week of year: 00-5



-- ---------------------------- PARA POSTGRES --------------------------------------------------


select now() + interval '7' day

select interval '17' day + interval '23' day

select interval '17' day + interval '2' yea


select extract(month from date '2023-04-19');

select extract(year from date '2023-04-19');

select extract(day from date '2023-04-19');

