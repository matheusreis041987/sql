


-- UUID gera um código para dificultar a identificação das chaves primnárias


select * from db_restaurant.mesa
create table if not exists "db_restaurant".funcionario(
	funcionario_id					uuid not null default gen_random_uuid(),
	funcionario_codigo				varchar(20),
	funcionario_nome				varchar(100),
	funcionario_ativo 				boolean default true,
	funcionario_comissao			double precision,
	funcionario_cargo				varchar(30),
	funcionario_data_criacao		timestamp without time zone,
	funcionario_data_atualizacao	timestamp without time zone,
	constraint funcionario_pkey		primary key (funcionario_id)

);


/*

Para	campos	UUID,	 também	podemos	fixar	um	valor	padrão
para	 a	 chave	 primária	 ser	 gerada	 automaticamente,	 através	 do
seguinte	comando: */

alter table db_restaurant.produto 
alter column produto_id set default gen_random_uuid();


/*
Com	 isso,	 o	 campo	 	 produto_id	 	 terá	 o	 mesmo
funcionamento	 do	 campo	 	 mesa_id	 .	 Ambos	 terão	 geração
automática	de	valores	únicos.

*/


-- na criação da tabela, deixar como valor default 

 funcionario_id	 UUID	 NOT	 NULL	 DEFAULT
gen_random_uuid()	.

