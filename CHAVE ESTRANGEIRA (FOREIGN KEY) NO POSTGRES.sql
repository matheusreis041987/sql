create table if not exists db_restaurant.venda (
	venda_id 					uuid not null,
	venda_codigo				varchar(20),
	venda_valor					double precision,
	venda_total					double precision,
	venda_desconto				double precision,
	venda_ativo					boolean default true,
	venda_data_criacao			timestamp without time zone,
	venda_dataAtualizacao		timestamp without time zone,
	funcionario_id				uuid,
	mesa_id						integer,
	constraint	venda_pk		primary key (venda_id),
	constraint venda_fuincionario_fk	foreign key (funcionario_id)
			references db_restaurant.funcionario (funcionario_id) match simple
			on update no action
			on delete no action,
	constraint venda_mesa_fk		foreign key (mesa_id)
			references db_restaurant.mesa (mesa_id) match simple
			on update no action
			on delete no action
	not valid	
);


-- fazendo separado da criação


drop table if exists db_restaurant.comissao;
create table if not exists db_restaurant.comissao(
	comissao_id						uuid not null,
	funcionario_id					uuid,
	comissao_valor					double precision,
	comissao_ativo					boolean default true,
	comissao_data_criacao			timestamp without time zone,
	comissao_data_atualizacao		timestamp	without time zone	
);


alter table db_restaurant.comissao add constraint comissao_pk primary key (comissao_id);

alter table db_restaurant.comissao add constraint comissao_funcionario_fk foreign key (funcionario_id)
	references db_restaurant.funcionario (funcionario_id) match simple
	on update no action
	on delete no action;

