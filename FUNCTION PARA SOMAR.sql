-- function com loop

CREATE FUNCTION somar(integer, integer) 
RETURNS integer
AS 'select $1 + $2;'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;


CREATE FUNCTION somar2(double precision, double precision) 
RETURNS integer
AS 'select $1 + $2;'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;


select somar2((select sum(venda_total) from db_restaurant.venda), (select sum(venda_valor) from db_restaurant.venda) );