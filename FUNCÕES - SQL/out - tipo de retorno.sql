-- recebe 2 parâmetros de entrada 

create function soma_e_produto (numero_1 integer, numero_2 integer, out soma integer, out produto integer) as $$ 

 select numero_1 + numero_2 as soma, numero_1 * numero_2 as produto;

$$ language sql


select * from soma_e_produto(3,3)

====================================


-- criando um tipo comporto para ser usado como saída
create type dois_valores as (soma integer, produto integer);

create function soma_e_produto2 (in numero_1 integer, in numero_2 integer) returns dois_valores as $$ 

 select numero_1 + numero_2 as soma, numero_1 * numero_2 as produto;

$$ language sql


select * from soma_e_produto2(3,6)