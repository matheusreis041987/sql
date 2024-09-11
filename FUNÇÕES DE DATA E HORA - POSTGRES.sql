select clock_timestamp();
-- Data	e	hora	atual

select	current_date;
-- Data	atual

select	current_time;
-- Hora	atua

select current_timestamp;
-- Data	e	hora	atual

select	localtime;
--Hora	atual 

select	localtimestamp;
-- Data	e	hora	atual

select	now();
-- Data	e	hora	atual

select statement_timestamp();
--  Data	e	hora	atual

select	timeofday();
-- Data	e	hora	atual	no	formato de	texto




-- extrair partes das informação da data e hora

select date_part('day', timestamp '19/04/1987 21:30:18');
select date_part('month', timestamp '19/04/1987 21:30:18');
select date_part('year', timestamp '19/04/1987 21:30:18');
select date_part('hour', timestamp '19/04/1987 21:30:18');
select date_part('minute', timestamp '19/04/1987 21:30:18');
select date_part('seconds', timestamp '19/04/1987 21:30:18');

select justify_days(interval '43 days');
--Conta	a	quantidade	de	meses em	um	intervalo	de	dias.

select justify_hours(interval '43 hours');
-- Conta	a	quantidade	de	dias em	um	intervalo	de	horas.

select justify_interval(interval '2 mon - 25 hours');
-- Calcula	a	quantidade	de meses,	dias	ou	horas, subtraindo	meses	com	horas.

select justify_interval(interval '2 mon - 14 days');
-- Calcula	a	quantidade	de meses,	dias	ou	horas, subtraindo	meses	com	dias.





-- extrair dados de data e hora da tabela

select extract (year from funcionario_data_criacao) from db_restaurant.funcionario

select extract (day from funcionario_data_criacao) from db_restaurant.funcionario

select extract (decade from funcionario_data_criacao) from db_restaurant.funcionario

select extract (day from funcionario_data_criacao) from db_restaurant.funcionario

select extract (hour from funcionario_data_criacao) from db_restaurant.funcionario





CONVERTER TIMESTAMP EM DATE

select nm_hospede, valor_anfitriao, momento_insercao::date from quarto_airbnb


select timeofday()

-- isola dentro do farmato de timestamp somente o ano
select date_trunc('year', now()::timestamp)




create table datas (

	id bigint not null default nextval('id_datas_seq'),
	nome varchar(255) not null,
	setor varchar(255) not null,
	tempo_entrada timestamp default now(),
	dia_semana varchar(255) default to_char(now(),'Day'),
	mes varchar(255) default to_char(now(),'Month'),
	hora decimal default  date_part('day',  now()),
	constraint pk_datas primary key (id)
	
);



MOSTRA O INERVALO COMPLETO
select age(date('2020-06-30'), date('2020-01-01'));

mostra a diferença de meses ntre as datas
select date_part('month', age('2020-06-30', '2020-01-01')) as month

== INTERVALO ENTRE DATAS

SELECT date('2020-05-31') - date('2020-06-30') as days;

select (date(now()) - date('1987-04-19'))/365 as idade;

select 
id,
nm_hospede,
valor_anfitriao,
date(momento_insercao),
date(now()) - momento_insercao as dias_insercao
from quarto_airbnb;


acrescentar 45 dias
select date(now()) +  interval '45 days' as data_45_mais;

subtrair 456 dias
select date(now()) +  interval '-45 days' as data_45_mais;

acrescentar 4 anos
select date(now()) +  interval '4 years' as data_4anos_mais;






== SÓ FUNCIONA NO TERMINAL
psql -U postgres -h localhost -p 5432 -d Alura


select make_date(2020,09,03);


SELECT TO_DATE(CONCAT(2020,'-',09,'-',03), 'yyyy-mm-dd');


select to_char(now(), 'Day');
select to_char(now(), 'Month');




================ HORAS ==============================================

SOMAR HORA
select time '05:00' + interval '2 hours' as nova_hora;

SUBTRAIR HORA
select time '05:00' - interval '2 hours' as nova_hora;

VERIFICAR INTERVALO ENTRE HORAS
select time '05:00' - time '15:00' as intervalo;

MULTIPLICAR HORA / SEGUNDOS
select time '08:30' * 2 as hora_multiplicada;
select interval '10 second' * 3000 as segundos_multiplicados;


HTTPS://ORELI.L




