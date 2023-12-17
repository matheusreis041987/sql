on delete restrict -- restringir ao delatar em campo. susado na criação do BD
on update cascade -- usado para atualizar um campo quando outro for atualizado. Usado na criação do BD
on delete cascade -- usado para deletar um campo quando outro for atualizado. Usado na criação do BD
references Emp(EN) -- usado para fazer uma  chave estrangeira
drop table NomeTabela -- deletar uma tabela existente
create table NomeTabela -- usado para criar uma tabela
default -- comando usado para dar uma valor padrão a uma coluna. Usado na criação do DB
nome text primary key -- comando usado para indicar uma chave primária
primary key(aa,bb,cc) -- comando usado para indicar uma chave primária múltipla
insert into NomeTabela values (...) -- inserir dados no BD
delete from NomeTabela; -- deletar a tabela 
pragma foreign_keys = off; -- habilitar ou desabilitar a função de chave estrangeira na criação do BD
check(sal between 500 and 5000) --checar os valores da coluna 

 