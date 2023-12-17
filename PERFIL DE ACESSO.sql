 --Gerente
 --É o grupo de usuário que pode modificar todos os registros de todas 
 --as tabelas e utilizar as funçõesadicionaReserva,adicionaHospedagem e realizaPedidos,
 --além de poder dar direitos de acesso aos demais usuários
 
 -- Atendente
 --É o grupo de usuários que pode manipular 
 --apenas as funçõesadicionaReserva, adicionaHospedagemerealizaPedido.
 
 -- Estagiário 
 
 -- É o grupo de usuário que só tem acesso a visãolistaClientes.
 
 
 create role gerente;
 
 create role atendente;
 
 create role estagiario;
 
 grant select on db_restaurant.produto,  db_restaurant.venda, db_restaurant.mesa to atendente;
 
 create role bernardo login password '1234' in role atendente;

alter role bernardo NOSUPERUSER  NOCREATEDB NOCREATEROLE


