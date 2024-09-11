-- https://www.youtube.com/watch?v=7vrH5RYy2Kc
create table estados (

	id integer primary key,
	nm_estado varchar(255),
	nm_regiao varchar(255),
	sg_estado varchar(2)

);

select * from estados

-- salvar arquivo excel com o tipo CSV UTRF-8 (Delimitar ´pr vírgulas)

-- comando copy: https://www.postgresql.org/docs/current/sql-copy.html

copy estados from 'C:\Users\Matheus\Desktop\POSTGRES\estados_pg.csv' delimiter ';'

-- se não funcionar, clicar com o botyão direito na tabela e escolher importar






Adicione o binário do PostgreSQL ao PATH: Durante a instalação, você pode escolher adicionar o diretório bin do PostgreSQL ao PATH do sistema. Se não fez isso durante a instalação, pode adicionar manualmente:

Vá para Painel de Controle > Sistema > Configurações avançadas do sistema > Variáveis de Ambiente.
Encontre a variável Path em Variáveis do sistema e clique em Editar.
Adicione o caminho para o diretório bin do PostgreSQL. Normalmente, é algo como C:\Program Files\PostgreSQL\<versão>\bin.



psql -U postgres -h localhost -p 5432 -d Alura
