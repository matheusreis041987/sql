-- CRIAÇÃO DE ENUM, QUE SÃO ENUMERAÇÕES 



create type area_restaurante as enum('INTERNA', 'EXTERNA');

alter table db_restaurant.mesa add column mesa_area_restaurante area_restaurante;

insert into db_restaurant.mesa (mesa_codigo, mesa_ativo, mesa_data_criacao, mesa_data_atualizacao, mesa_area_restaurante) values
(19,false,now(),now(),'INTERNA');





=================ALURA==========================


create type Classificacao as enum ('livre', '12 anos', '14 anos', '16 anos', '18 anos');

create sequence id_filmes minvalue 1001;
create temporary table filme (
	id integer primary key default nextval('id_filmes'),
	nome varchar(255)not null,
	classificacao Classificacao

);