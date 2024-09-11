create or replace function salario_ok (instrutor instrutor) returns varchar as $$

	begin
	-- salario > 500, está ok, se não, pode aumentar
	
	if instrutor.salario > 500 then
		return 'Salário está ok';
	
	else 
		return 'Salário pode aumentar';
	end if;	-- if deve fechar com en if


	end;
$$ language plpgsql

select nome, salario, salario_ok (instrutor.*) from instrutor;
select nome, salario, salario_ok (instrutor) from instrutor;


========================================================================================================


create or replace function aumentar_salario (instrutor instrutor) returns decimal as $$

	begin
	-- salario < 500, multiplicar salario por 2
	
	if instrutor.salario < 500 then
		return instrutor.salario * 2;
	
	else 
		return instrutor.salario;
	end if;	


	end;
$$ language plpgsql

select nome, salario, aumentar_salario(instrutor.*) as salario_novo from instrutor


==========================================================================================================

create function salario_ok3 (id_instrutor integer) returns varchar as $$

	declare
	instrutor instrutor;

	begin

	select * from instrutor where id = id_instrutor into instrutor; -- armazenar o select dentro da variável instrutor
	
	if instrutor.salario > 500 then
	return 'salario: R$ ' || instrutor.salario::varchar || ' | salario não está ok |';
	else
	return 'salario: R$ ' || instrutor.salario::varchar || ' | salario precisa aumentar |';
	end if;
	end;
$$ language plpgsql


select nome, salario, salario_ok3(instrutor.id) from instrutor;




=========================================================================================================


drop function salario_ok4
create or replace function salario_ok4 (id_instrutor integer) returns decimal as $$ 

	declare
	instrutor instrutor;
	
	begin
	select * from instrutor where id = id_instrutor into instrutor;
	
	if instrutor.salario > 2000 then
		return  instrutor.salario * 1.2::decimal;
	
	elseif instrutor.salario < 2000 and instrutor.salario > 1000 then
		return  instrutor.salario * 1.2::decimal;
	
	else
		return  instrutor.salario * 2::decimal;
	
	end if;
	
	
	end;
$$ language plpgsql;


select id, nome, salario,  salario_ok4 (instrutor.id) from instrutor;



==============================================================================================

create function salario_ok6 (id_instrutor integer) returns varchar as $$ 

	declare
	instrutor instrutor;

	begin
		select * from instrutor where id = id_instrutor into instrutor;
		
		if instrutor.salario > 300 then
		return 'Salário está ok';
		else
			if instrutor.salario = 300 then
				return 'Salário pode aumentar';
			else
			return 'Salário está defasado';
			
			end if;
		end if;
		

	end;
$$ language plpgsql;

select  salario,  salario_ok6 (instrutor.id) from instrutor;

