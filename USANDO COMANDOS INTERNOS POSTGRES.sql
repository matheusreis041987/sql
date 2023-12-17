-- ********************* COMANDOS INTERNOS POSTGRES **********************


select version();
select current_date;
select current_user;
select current_schema();
select current_database();
select current_schemas(boolean);
select inet_client_addr();
select inet_client_port();
select inet_server_addr();
select inet_server_port();
select session_user;
select user;

/*
Nome	                Tipo retornado	        Descrição
current_database()	          name	        nome do banco de dados corrente
current_schema()	          name	        nome do esquema corrente
current_schemas             (boolean)	    name[]	nomes dos esquemas no caminho de procura incluindo, opcionalmente, os esquemas implícitos
current_user	              name	        nome do usuário do contexto de execução corrente
inet_client_addr()	          inet	        endereço da conexão remota
inet_client_port()	          int4	        porta da conexão remota
inet_server_addr()	          inet	        endereço da conexão local
inet_server_port()	          int4	        port da conexão local
session_user	              name	        nome do usuário da sessão
user	                      name	        equivale a current_user
version()	                  text	        informação da versão do PostgreSQL
*/

