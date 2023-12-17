-- CRIAÇÃO DE ENUM, QUE SÃO ENUMERAÇÕES 



create type area_restaurante as enum('INTERNA', 'EXTERNA');

alter table db_restaurant.mesa add column mesa_area_restaurante area_restaurante;

insert into db_restaurant.mesa (mesa_codigo, mesa_ativo, mesa_data_criacao, mesa_data_atualizacao, mesa_area_restaurante) values
(19,false,now(),now(),'INTERNA');

