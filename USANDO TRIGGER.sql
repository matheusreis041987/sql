drop trigger if exists UPDPRECO;
create trigger UPDPRECO after update ON Tadega
begin
update Tadega set preco = 
case when NEW.ano<1992 then 350
     when NEW.ANO = 1997 then 150
     else 30 + (NEW.engarraf - NEW.ano) * 10 
     end;
end;

---------------------------------------------------------------------------------

drop trigger if exists INSPRECO;
create trigger INSPRECO after update on Tadega
begin
update Tadega set preco = new.preco; -- serve para chamar o trigger acima
end;     


     