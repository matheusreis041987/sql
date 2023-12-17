nomselect * from loja.produto


-- _old _new coluna alteracao para armazenar a operacao realizada

drop table if exists loja.log_produto;
create table if not exists loja.log_produto(
	log_produto_id integer  primary key,
	log_produto_data_alteracao timestamp,
	log_produto_alteracao varchar(10),
	produto_identificador_old integer,
	produto_nome_old varchar(200),
	produto_quantidade_old integer,
	produto_valor_old numeric,
	produto_identificador_new integer,
	produto_nome_new varchar(200),
	produto_quantidade_new integer,
	produto_valor_new numeric
)


select * from loja.log_produto



create sequence log_produto_id_seq;
create sequence produto_identificador;


	
alter table loja.log_produto
	alter column log_produto_id set default
	nextval('log_produto_id_seq');
	
		
alter table loja.produto
	alter column identificador set default
	nextval('produto_identificador');


-- **********************************************************

create or replace function gera_log_produto()
returns trigger as
$$
begin

	if tg_op = 'INSERT' then
		insert into loja.log_produto(
			log_produto_data_alteracao,
			log_produto_alteracao,
			produto_identificador_new,
			produto_nome_new,
			produto_quantidade_new,
			produto_valor_new)
		
		values(
			now(),
			tg_op,
			new.identificador,
			new.nome,
			new.quantidade,
			new.valor);
			
			return new;

	elsif tg_op = 'UPDATE' then
		insert into loja.log_produto(
			log_produto_data_alteracao,
			log_produto_alteracao,
			produto_identificador_old,
			produto_nome_old,
			produto_quantidade_old,
			produto_valor_old,
			produto_identificador_new,
			produto_nome_new,
			produto_quantidade_new,
			produto_valor_new)
			
		values(
			now(),
			tg_op,
			old.identificador,
			old.nome,
			old.quantidade,
			old.valor,
			new.identificador,
			new.nome,
			new.quantidade,
			new.valor);
			
			return new;
			
	elsif tg_op = 'DELETE' then
		insert into loja.log_produto (
		log_produto_data_alteracao,
			log_produto_alteracao,
			produto_identificador_old,
			produto_nome_old,
			produto_quantidade_old,
			produto_valor_old)
			
			values (
			now(),
			tg_op,
			old.identificador,
			old.nome,
			old.quantidade,
			old.valor);
			
			return new;
		end if;
end;
$$
language 'plpgsql';


create trigger tri_log_produto
after insert or update or delete on loja.produto
for each row execute
procedure gera_log_produto();


select * from loja.log_produto
select * from loja.produto

insert into loja.produto (nome, quantidade, valor) values
('feijao', 16, 30.45);


insert into loja.produto (nome, quantidade, valor) values
('picanha', 1, 75.45),
('fraldinhha', 1, 45.54 ),
('maminha', 1, 38.45),
('contra-file', 1, 58.00),
('ancho', 1, 69.45),
('chorizo', 1, 52.85);

update loja.produto set nome = 'Maminha uruguaia' where identificador = 18;
update loja.produto set nome = 'picanha uruguaia' where identificador = 16;
update loja.produto set nome = 'fraldinha uruguaia' where identificador = 17;


delete from loja.produto where identificador = 1;
delete from loja.produto where identificador = 3;

