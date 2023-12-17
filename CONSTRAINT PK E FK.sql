-- deletar

ALTER TABLE	comissao	DROP CONSTRAINT	comissao_funcionario_fk;

-- criar fora pk e fk 


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


-- crfiar dentro fk e pk

create table if not exists db_restaurant.itens_venda (
	itens_venda_id							uuid not null,
	produto_id								uuid,
	venda_id								uuid,
	itens_venda_valor						double precision,
	itens_venda_quantidade					integer,
	itens_venda_total						double precision,
	itens_data_criacao						timestamp without time zone,
	itens_data_atualizacao					timestamp without time zone,
	itens_venda_comissao					boolean default false,
	constraint itens_venda_pk				primary key (itens_venda_id),
	constraint itens_venda_produto_fk		foreign key (produto_id)
			references db_restaurant.produto (produto_id) match simple
			on update no action
			on delete no action,
	constraint itens_venda_venda_fk			foreign key (venda_id)
			references db_restaurant.venda (venda_id) match simple
			on update no action
			on delete no action
	
);
