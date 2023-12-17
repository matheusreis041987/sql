-- indice serve para acelar a pesquisa as tabelas. Serve para acessar rapidamente as informações das tabelas
-- Como é usado o comando create, índice é um objeto do BD
-- o unique indica que o valor não se repita, que ele seja único. Ele não deixa inserir valores repetidos no BD.

create unique index idx_produtor on produtor (produtor);  

INSERT INTO produtor values (2, 'Buena Vista');

create index indice_vinhos on tadega (vinho, produtor);

create index indice_vinho on tadega (vinho);

select * from tadega where vinho like '%noir%'


-- DELETAR UM ÍNDICE

drop index is exists indice_vinhos;