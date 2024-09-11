create function soma_dois_numeros(numero_1 integer, numero_2 integer) returns integer as '

select numero_1 + numero_2


' language sql;

select soma_dois_numeros (2,2);


create function soma_dois_numeros2(integer, integer) returns integer as '

select $1 + $2


' language sql;

select soma_dois_numeros2(10,15)




objetivo dos parâmetros:
permitir manipular dentro da função, valores vindos de fora dela (externos)
