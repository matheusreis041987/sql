-- subconsultas

-- funcionarios com vendas

select * from db_restaurant.funcionario
select * from db_restaurant.venda
select funcionario_nome from db_restaurant.funcionario where funcionario_id in (select funcionario_id from db_restaurant.venda)

select funcionario_nome from db_restaurant.funcionario where funcionario_id in (select funcionario_id from db_restaurant.venda where date_part('year',venda_data_criacao) = '2023' )
