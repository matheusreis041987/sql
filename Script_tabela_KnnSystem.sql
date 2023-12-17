CREATE DATABASE "db_KnnSystem"
    WITH
    OWNER = bernardo
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- ======================================================


CREATE SCHEMA IF NOT EXISTS sch_pessoas
    AUTHORIZATION postgres;

CREATE SCHEMA IF NOT EXISTS sch_contratos
    AUTHORIZATION postgres;

CREATE SCHEMA IF NOT EXISTS sch_financeiro
    AUTHORIZATION postgres;


-- ======================================================


drop table if exists sch_pessoas.tbl_pessoa

create sequence id_pessoas_seq;

create table sch_pessoas.tbl_pessoa (
	pk_id bigint not null default nextval('id_pessoas_seq'),
	cpf character varying(11) not null unique,
	nome character varying(60) not null,
	email character varying(60) not null,
	status character varying(30) not null,
	constraint pk_pessoa primary key (pk_id)
);

-- ======================================================

drop table if exists sch_pessoas.tbl_telefone

create sequence id_telefone_seq;

create table sch_pessoas.tbl_telefone (
	pk_id bigint not null default nextval('id_telefone_seq'),
	numero character varying(15) not null,
	constraint pk_telefones primary key (pk_id),
	constraint fk_id_telefones foreign key (pk_id)
	references sch_pessoas.tbl_pessoa (pk_id) match simple
	on delete cascade
	on update cascade
);

-- ======================================================

drop table if exists sch_pessoas.tbl_proprietario

create sequence id_proprietario_seq;

create table sch_pessoas.tbl_proprietario (
	pk_id bigint not null default nextval('id_proprietario_seq'),
	num_rgi integer not null unique,
	constraint pk_proprietario primary key (pk_id),
	constraint fk_id_proprietario foreign key (pk_id)
	references sch_pessoas.tbl_pessoa (pk_id) match simple
	on delete cascade
	on update cascade
);

-- ======================================================

drop table if exists sch_pessoas.tbl_morador

create sequence id_morador_seq;

create table sch_pessoas.tbl_morador (
	pk_id bigint not null default nextval('id_proprietario_seq'),
	num_pat integer not null,
	bloco character varying(10) not null,
	constraint pk_morador primary key (pk_id),
	constraint fk_id_morador foreign key (pk_id)
	references sch_pessoas.tbl_pessoa (pk_id) match simple
	on delete cascade
	on update cascade	
);

-- ======================================================


drop table if exists sch_pessoas.tbl_usuario

create sequence id_usuario_seq;

create table sch_pessoas.tbl_usuario (
	pk_id bigint not null default nextval('id_usuario_seq'),
	cargo character varying(20)	not null,
	perfil character varying(20)	not null,
	dt_nasc date not null,
	senha character varying(20) not null,
	constraint pk_usuario primary key (pk_id),
	constraint fk_id_usuario foreign key (pk_id)
	references sch_pessoas.tbl_pessoa (pk_id) match simple
	on delete cascade
	on update cascade	
);

-- ======================================================

drop table if exists sch_pessoas.tbl_apartamento

create sequence id_apartamento_seq;

create table sch_pessoas.tbl_apartamento (
	pk_id bigint not null default nextval('id_apartamento_seq'),
	fk_proprietario integer not null,
	fk_morador integer not null,
	metragem integer not null,
	bloco character varying(10) not null,
	numero integer not null,
	status character varying(30) not null,
	constraint pk_apartamento primary key (pk_id),
	
	constraint fk_id_apartamento_proprietario foreign key (fk_proprietario)
	references sch_pessoas.tbl_proprietario (pk_id) match simple
	on delete cascade
	on update cascade,
	
	constraint fk_id_apartamento_morador foreign key (fk_morador)
	references sch_pessoas.tbl_morador (pk_id) match simple
	on delete cascade
	on update cascade	
	
);

-- ======================================================


drop table if exists sch_financeiro.tbl_boleto

create sequence id_boleto_seq;

create table sch_financeiro.tbl_boleto (
	pk_id bigint not null default nextval('id_boleto_seq'),
	fk_morador integer not null,
	fk_usuario integer not null,
	data_pagamento timestamp not null,
	pagamento numeric(15,2) not null check(valor_multa >=0),
	eh_segunda_via boolean,
	status character varying(30) not null,
	pct_multa character varying(10),
	valor_multa numeric(15,2) check(valor_multa >=0),
	valor_total numeric(15,2) not null check(valor_multa >=0),
	cod_barra character varying(40),
	competencia character varying(40) not null,
	constraint pk_boleto primary key (pk_id),
	
	constraint fk_id_boleto_morador foreign key (fk_morador)
	references sch_pessoas.tbl_morador (pk_id) match simple
	on delete cascade
	on update cascade,
	
	constraint fk_id_boleto_usuario foreign key (fk_usuario)
	references sch_pessoas.tbl_usuario (pk_id) match simple
	on delete cascade
	on update cascade
	
);

-- ======================================================

drop table if exists sch_contratos.tbl_gestor

create sequence id_gestor_seq;

create table sch_contratos.tbl_gestor (
	pk_cpf character varying(15) not null,
	nome character varying(60) not null,
	email character varying(60) not null,
	constraint pk_gestor primary key (pk_cpf)
	
);


-- ======================================================

drop table if exists sch_contratos.tbl_sindico

create sequence id_sindico_seq;

create table sch_contratos.tbl_sindico (
	pk_cpf character varying(15) not null,
	nome character varying(60) not null,
	email character varying(60) not null,
	constraint pk_sindico primary key (pk_cpf)
	
);

-- ======================================================

drop table if exists sch_contratos.tbl_responsavel

create sequence id_responsavel_seq;

create table sch_contratos.tbl_responsavel (
	pk_cpf character varying(15) not null,
	nome character varying(60) not null,
	email character varying(60) not null,
	constraint pk_responsavel primary key (pk_cpf)
	
);

-- ======================================================

drop table if exists sch_contratos.tbl_rescisao

create sequence id_rescisao_seq;

create table sch_contratos.tbl_rescisao (
	pk_id bigint not null default nextval('id_rescisao_seq'),
	causador character varying(60) not null,
	valor numeric(15,2) not null check(valor >=0),
	pct_multa character varying(10) not null,
	dt_pgto date not null,
	constraint pk_rescisao primary key (pk_id)
);

-- ======================================================

drop table if exists sch_contratos.tbl_fornecedor

create sequence id_fornecedor_seq;

create table sch_contratos.tbl_fornecedor (
	pk_id bigint not null default nextval('id_fornecedor_seq'),
	razao_social character varying(80) not null,
	cnpj character varying(16) not null, 
	num_contr character varying(10) not null,
	natureza_servico character varying(30) not null,
	status character varying(30) not null,
	endereco character varying(80) not null,
	email_corporativo character varying(60) not null,
	fk_cpf_responsavel character varying(15) not null,
	constraint pk_fornecedor primary key (pk_id),
	
	constraint fk_id_fornecedor foreign key (fk_cpf_responsavel)
	references sch_contratos.tbl_responsavel (pk_cpf) match simple
	on delete cascade
	on update cascade
);

-- ======================================================

drop table if exists sch_contratos.tbl_domicilio_bancario

create sequence id_domicilio_bancario_seq;

create table sch_contratos.tbl_domicilio_bancario (
	pk_id bigint not null default nextval('id_domicilio_bancario_seq'),
	agencia character varying(10) not null,
	fk_id_fornecedor integer not null,
	conta character varying(10),
	banco character varying(20),	
	chave_pix character varying(10),
	status character varying(30),
	constraint pk_domicilio_bancario primary key (pk_id),
	
	constraint fk_domicilio_bancario foreign key (fk_id_fornecedor)
	references sch_contratos.tbl_fornecedor (pk_id) match simple
	on delete cascade
	on update cascade
	
);

-- ======================================================

drop table if exists sch_contratos.tbl_contrato

create sequence id_contrato_seq;

create table sch_contratos.tbl_contrato (
	pk_id bigint not null default nextval('id_contrato_seq'),
	fk_id_rescisao integer not null,
	fk_id_fornecedor integer not null,
	vigencia_inicial date not null,
	vigencia_final date not null check (vigencia_final > vigencia_inicial),
	num_contrato character varying(10) not null,
	pct_multa character varying(10),
	objeto character varying(100) not null,
	vlr_mensal_atual numeric(15,2) check(vlr_mensal_atual >=0),
	vlr_mensal_inicial numeric(15,2) check(vlr_mensal_inicial >=0),
	fk_nome_gestor character varying(60) not null,
	fk_nome_sindico character varying(60) not null,
	status character varying(30) not null,
	fk_cpf_gestor character varying(15) not null,
	fk_email_gestor character varying(60) not null,
	fk_cpf_sindico character varying(15) not null,
	fk_email_sindico character varying(60) not null,
	constraint pk_contrato primary key (pk_id),
	
	constraint fk_id_fornecedor foreign key (fk_id_fornecedor)
	references sch_contratos.tbl_fornecedor (pk_id) match simple
	on delete cascade
	on update cascade,
	
	constraint fk_id_rescisao foreign key (fk_id_rescisao)
	references sch_contratos.tbl_rescisao (pk_id) match simple
	on delete cascade
	on update cascade,
	
	
	
	constraint fk_cpf_gestor foreign key (fk_cpf_gestor)
	references sch_contratos.tbl_gestor (pk_cpf) match simple
	on delete cascade
	on update cascade,
	
		
	constraint fk_cpf_sindico foreign key (fk_cpf_sindico)
	references sch_contratos.tbl_sindico (pk_cpf) match simple
	on delete cascade
	on update cascade
	
);

-- ======================================================

drop table if exists sch_financeiro.tbl_pagamento;

create sequence id_pagamento_seq;

create table sch_financeiro.tbl_pagamento (
	pk_id bigint not null default nextval('id_pagamento_seq'),
	fk_usuario integer not null,
	data_hora timestamp not null,
	fk_contrato integer not null,
	aprovacao boolean,
	valor_pagamento numeric(15,2) not null check(valor_pagamento>=0),
	status character varying(30) not null,
	pct_juros numeric(15,2) check(pct_juros>=0),
	valor_juros numeric(15,2) check(valor_juros>=0),
	constraint pk_pagamento primary key (pk_id),
	
	constraint fk_id_usuario foreign key (fk_usuario)
	references sch_pessoas.tbl_usuario (pk_id) match simple
	on delete cascade
	on update cascade,					   

	constraint fk_id_contrato foreign key (fk_contrato)
	references sch_contratos.tbl_contrato (pk_id) match simple
	on delete cascade
	on update cascade							   					   
						   
);

-- ======================================================


drop table if exists sch_financeiro.tbl_fatura;

create sequence id_fatura_seq;

create table sch_financeiro.tbl_fatura (
	pk_id bigint not null default nextval('id_pagamento_seq'),
	fk_pagamento integer not null,
	vencimento date not null check (vencimento >= now()),
	valor numeric(15,2) check(valor>=0),
	numero integer not null,
	status character varying(30) not null,
	constraint pk_fatura primary key (pk_id),
	
	constraint fk_id_pagamento foreign key (fk_pagamento)
	references sch_financeiro.tbl_pagamento (pk_id) match simple
	on delete cascade
	on update cascade		
);

