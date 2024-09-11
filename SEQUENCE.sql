
-- SEQUENCE - criar um sequenciador numério, principalmente para campos que são incrementais, como o id


create sequence mesa_id_seq;

alter table db_restaurant.mesa alter column mesa_id set default nextval('mesa_id_seq')


DROP SEQUENCE	mesa_id_seq	CASCADE; -- para deletar a sequência 



===========ALURA===================================


CREATE [ { TEMPORARY | TEMP } | UNLOGGED ] SEQUENCE [ IF NOT EXISTS ] name
    [ AS data_type ]
    [ INCREMENT [ BY ] increment ]
    [ MINVALUE minvalue | NO MINVALUE ] [ MAXVALUE maxvalue | NO MAXVALUE ]
    [ START [ WITH ] start ] [ CACHE cache ] [ [ NO ] CYCLE ]
    [ OWNED BY { table_name.column_name | NONE } ]

Instrução para usar no create
https://www.postgresql.org/docs/15/functions-sequence.html


create sequence eu_criei;
create sequence eu_criei2 minvalue 21103208;

select nextval ('eu_criei2')


create temporary table auto (

		id integer primary key default nextval('eu_criei2'),
	nome varchar (30) not null

);

insert into auto (nome) values
('Matheus');

insert into auto  values
(4,'Thiago Reis');


select * from auto





