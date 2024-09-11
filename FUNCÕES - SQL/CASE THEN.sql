create function salario_ok7 (id_instrutor integer) returns varchar as $$ 

	declare
	instrutor instrutor;

	begin
		select * from instrutor where id = id_instrutor into instrutor;
		
		/*if instrutor.salario > 300 then
		return 'Salário está ok';
		else
			if instrutor.salario = 300 then
				return 'Salário pode aumentar';
			else
			return 'Salário está defasado';
			
			end if;
		end if;*/
		
		case 
			when instrutor.salario = 100 then 
				return 'salario muito baixo';
			when instrutor.salario > 100 and instrutor.salario < 1200 then 
				return 'salário baixo';
			when instrutor.salario > 1200 and instrutor.salario <2800 then
				return 'salário está bom' ;
			else	
				return 'Salário está bom';
		end case;
		
	end;
$$ language plpgsql;

select  nome, salario,  salario_ok7 (instrutor.id) from instrutor;


==============================================================================================================


create function salario_ok8 (id_instrutor integer) returns varchar as $$ 

	declare
	instrutor instrutor;

	begin
		select * from instrutor where id = id_instrutor into instrutor;
		
		case instrutor.salario
			when 100 then 
				return 'salario muito baixo';
			when 200 then 
				return 'salário baixo';
			when 300 then
				return 'salário ok' ;
			else	
				return 'Salário médio';
		end case;
		
	end;
$$ language plpgsql;

select  nome, salario,  salario_ok8 (instrutor.id) from instrutor;
