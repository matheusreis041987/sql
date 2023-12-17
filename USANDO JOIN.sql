select * from depto join adega.tadega
select  * from emp join tele on emp.en = tele.en;
select  enome AS NOME, tel as TELEFONE from emp as e join tele as p on e.en = p.en;
select  enome AS NOME, tel as TELEFONE from emp as e left join tele as p on e.en = p.en; -- o0 comando left join faz a junção mesmo dos campos que serão nulos


-- -------------------------------------------------------------

-- operador join (CROSS JOIN, OUTER JOIN, FULL OUTER JOIN, LEFT JOIN, RIGHT JOIN, INNER JOIN

select * from tadega join vinho;
select * from tadega join vinho where tadega.vinho = vinho.vinho;
select * from tadega cross join vinho;
select * from tadega inner join vinho where tadega.vinho = vinho.vinho;
select * from tadega left join vinho;
select * from tadega as ta join tadega as td on ta.vinho = td.vinho and ta.produtor=td.produtor;


-- ----------------------------------------------------------------


select * from pessoa join telefone_paciente using (cpf) -- o using é usado quando temos um campo com nome único nas 2 tabelas

select * from pessoa join telefone_paciente on pessoa.cpf = telefone_paciente.cpf;

select * from pessoa left join telefone_paciente using (cpf) -- o left vai mostrar todos, inclusive os sem telefone

select * from pessoa natural join telefone_paciente -- natural join retira as colunas repetidas 




-- ----------------------------------------------------------------------


-- consulta usada para cruzar informações que estão dentro da mesma tabela com uso de chafe estrangeira autoreferenciada, que é aquela que aponta para a chave primária dentro da mesma table



select p1.nome, p2.nome as chefe from PALHACO_INFO as p1 inner join PALHACO_INFO as p2 on p1.id_chefe = p2.id



-- construção

create table PALHACO_INFO 
(id integer primary key,
nome varchar(30) not null,
id_chefe integer references PALHACO_INFO(id)
);

insert into PALHACO_INFO values
(1, 'Elise', 3),
(2, 'Pickles', 5),
(3, 'Snuggles', 10),
(4, 'Mr. Hobo', 3),
(5, 'Clarabelle', 10),
(6, 'Scotter', 3),
(7, 'Zippo', 3),
(8, 'Babe', 5),
(9, 'Bonzo', 5),
(10, 'Mister Sniffles',10 );





================================================================================


-- JOIN EN POSTGRES



select distinct funcionario_nome from db_restaurant.funcionario as func, db_restaurant.venda as vend where func.funcionario_id = vend.funcionario_id 


-- INNER JOIN

select distinct funcionario_nome from db_restaurant.funcionario inner join db_restaurant.venda on (funcionario.funcionario_id = venda.funcionario_id) group by funcionario_nome


select distinct funcionario_nome from db_restaurant.funcionario join db_restaurant.venda on (funcionario.funcionario_id = venda.funcionario_id) group by funcionario_nome




-- LEFT JOIN

--Utilizando	 o	 	left	 outer	 join	,	 o	 SGBD	 realizará	 uma
--junção	interna	e,	para	cada	linha	listada	da	primeira	tabela	que	não
--satisfizer	a	condição	de	relacionamento	com	a	segunda	tabela,	vai
--ser	adicionada	uma	linha	juntada	com	valores	nulos	nas	colunas	da
--segunda	 tabela.	Com	isso,	o	resultado	de	nossa	consulta	possuirá,
--no	mínimo,	uma	linha	para	cada	linha	da	primeira	tabela.


select f.funcionario_nome, v.venda_id, v.venda_total from db_restaurant.funcionario as f left join db_restaurant.venda as v 
on f.funcionario_id = v.funcionario_id order by f.funcionario_nome;

-- só funcionario que começam com "V"
select f.funcionario_nome, v.venda_id, v.venda_total from db_restaurant.funcionario as f left join db_restaurant.venda as v 
on f.funcionario_id = v.funcionario_id where f.funcionario_nome like'%V%'


-- só funcionario que não começam com "V"
select f.funcionario_nome, v.venda_id, v.venda_total from db_restaurant.funcionario as f left join db_restaurant.venda as v 
on f.funcionario_id = v.funcionario_id where not f.funcionario_nome like'%V%'


-- RIGHT JOIN


select v.venda_id, f.funcionario_nome, v.venda_total from db_restaurant.venda as v right join db_restaurant.funcionario as f 
on f.funcionario_id = v.funcionario_id order by f.funcionario_nome;

-- só funcionario que começam com "V"
select v.venda_id, f.funcionario_nome, v.venda_total from db_restaurant.venda as v right join db_restaurant.funcionario as f 
on f.funcionario_id = v.funcionario_id where f.funcionario_nome like '%V%' order by f.funcionario_nome;


-- só funcionario que não começam com "V"

select v.venda_id, f.funcionario_nome, v.venda_total from db_restaurant.venda as v right join db_restaurant.funcionario as f 
on f.funcionario_id = v.funcionario_id where not f.funcionario_nome like '%V%' order by f.funcionario_nome;






