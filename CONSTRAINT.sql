
-- constraint - são validações de dados 

alter table db_restaurant.venda add check (venda_total>0);

alter table db_restaurant.funcionario add check (funcionario_nome <> null);


