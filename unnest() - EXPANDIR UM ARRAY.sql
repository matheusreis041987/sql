A função unnest() no PostgreSQL é usada para expandir um array em um conjunto de linhas. 
Ele pega um array como entrada e retorna uma nova tabela onde cada elemento do array ocupa uma linha separada. 
Esta função é particularmente útil ao lidar com arrays no PostgreSQL.



	select nm_hospede, 
	
	unnest(array['1980','2000','2018']) as ano
	
	from quarto_airbnb 
	


select unnest(array[1,2])




select * from contato_cliente

insert into contato_cliente values
(array['Matheus Reis Costa', 'Everton Batista de Oliveira'], '2159-3339', 'gestao_comercial@serpro.gov.br');
select * from contato_cliente
insert into contato_cliente values
(array['Rogerio Guimaraes', 'Danielle Oliveira', 'Claudia Von Borris'], '3335-8969', 'gecad@caixa.gov.br');
select * from contato_cliente

select unnest(nome), tel_comercial, email from contato_cliente




