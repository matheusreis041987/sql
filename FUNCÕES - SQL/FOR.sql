create function instrutor_com_salario(out nome varchar, out salario_ok varchar) returns setof record as $$ -- o tipo record é um tipo genérico

	declare
		instrutor instrutor;
	begin
		for instrutor in select * from instrutor loop
			nome := instrutor.nome;
			salario_ok := salario_ok8(instrutor.id);
			return next;
		end loop;	
	end;
$$ language plpgsql 

select * from instrutor_com_salario();