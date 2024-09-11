CRIANDO BANCO DE DADOS;

CREATE DATABASE alura
    WITH
    OWNER = postgres
    ENCONDING = "UTF8"
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = 01;


CRIANDO SCHEMAS


create schema academico;



create temporary table aluno_temp(
ind integer primary key,
nome text not null default 'Sem nome' check(nome <> '' or nome <>' '),
	data_nascimento date not null default now()::date
) 