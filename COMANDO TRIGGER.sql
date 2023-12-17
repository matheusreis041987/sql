/* trigger é um objeto do banco de dados (criado por meio do comando create), sendo considerado
um mecanismo que dispara uma ação quando um evento de mudança ocorre numa tabela (ou view).
usado para realizar tarefas relacionadas com validações, restrições de acesso, rotinas de segurança
e consistência de dados.*/

 create trigger controle_ano after update of ano on tadega
begin
select 
       case when new.ano < 1800
            then raise (abort, 'vinho não pode ter ano menor que 1800')
        end;
end;  


CREATE TRIGGER INSPRECO  after insert ON Tadega
begin UPDATE TADEGA SET PRECO=NEW.PRECO;   -- ESSE UPDATE "CHAMA" O TRIGGER ACIMA
end;

CREATE TRIGGER UPDPRECO after update ON Tadega
begin
UPDATE Tadega SET preco=
     CASE WHEN NEW.ano<1992 THEN 350   -- O PREFIXO new SIGNIFICA O "novo valor". HA TAMBEM O PREFIXO old
          WHEN NEW.ano=1997 THEN 150
          ELSE 30+(NEW.engarraf-NEW.ano)*10 
     END;
end;


==============================================================================

https://imasters.com.br/data/triggers-no-postgresql

https://www.devmedia.com.br/trabalhando-com-triggers-no-postgresql/33531


/*
Após a criação das nossas tabelas definiremos uma trigger function, a qual chamaremos de funcionario_log_func, e será responsável 
por registrar as alterações feitas na tabela de funcionarios_auditoria depois de uma operação de INSERT na tabela funcionários*/

create or replace function funcionario_log_fun()
returns trigger LANGUAGE plpgsql
as
'begin
insert into "Tadega".auditoria_tadega 
(codigo_fun, data_alteracao)
values
(new.codigo_fun, current_timestamp);
return new;
end;';



/* Com a nossa função criada, definiremos agora a nossa trigger e em seguida, a associaremos a tabela de funcionários*/

create trigger log_trigger
after insert on "Tadega".funcionarios
for each row
execute procedure funcionario_log_fun();

