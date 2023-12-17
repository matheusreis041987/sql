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

select extract (doy from funcionario_data_criacao) from db_restaurant.funcionario

select extract (hour from funcionario_data_criacao) from db_restaurant.funcionario




