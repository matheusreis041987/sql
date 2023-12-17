-- função date_part



select * from db_restaurant.venda where date_part('year', venda_data_criacao) = '2023'
select * from db_restaurant.venda where date_part('day', venda_data_criacao) = '23'
select * from db_restaurant.venda where date_part('month', venda_data_criacao) = '07'