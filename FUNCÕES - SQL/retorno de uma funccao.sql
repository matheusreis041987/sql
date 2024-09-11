-- RETONO DA FUNCÃO

create or replace function cria_a(nome varchar) returns varchar as '

 insert into a (nome) values(cria_a.nome);
 
select nome

' language sql;

-- ultimo comando tem de ser o retorno da função

select cria_a('Matheus');

select * from a;



create or replace function cria_a2(nome varchar) returns  void as $$

 insert into a (nome) values(cria_a2.nome);
 

$$ language sql;

select cria_a2('Bernardo')


$$ é o delimitador da função