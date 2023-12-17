
-- SEQUENCE - criar um sequenciador numério, principalmente para campos que são incrementais, como o id


create sequence mesa_id_seq;

alter table db_restaurant.mesa alter column mesa_id set default nextval('mesa_id_seq')


DROP SEQUENCE	mesa_id_seq	CASCADE; -- para deletar a sequência 



