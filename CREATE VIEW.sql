-- CRIAÇÃO DE VIEWS

create view Total_Chardonnay as select (sum(preco) * count(garrafas)) as total_Chardonnay  from tadega where vinho like 'Chardon%'; 

create view Total_PinotNoir as select (sum(preco) * count (garrafas)) as total_PinotNoir from tadega where vinho like 'pinot%';

create view total_ano as select ano, sum(preco) * sum(garrafas) as total from tadega group by ano;

create view total_vinho as select vinho, sum(preco) * sum(garrafas) as total from tadega group by vinho;




-- POSTGRES


create or replace view venda_do_dia as
select distinct pr.produto_nome, sum(v.venda_total) from 
db_restaurant.produto as pr, db_restaurant.venda as v, db_restaurant.itens_venda as iv
where pr.produto_id = iv.produto_id and v.venda_id = iv.venda_id and v.venda_data_criacao = '01/01/2023'
group by pr.produto_nome



create or replace view vendas_dif_v as
select f.funcionario_nome, v.venda_id, v.venda_total from db_restaurant.funcionario as f left join db_restaurant.venda as v 
on f.funcionario_id = v.funcionario_id where not f.funcionario_nome like'%V%'

select * from vendas_dif_v

select * from vendas_dif_v where venda_total > 100




