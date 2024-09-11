create or replace function instrutor_bem_pago2(valor_salario decimal) returns setof instrutor as $$ 

	begin

	return query select * from instrutor where salario > valor_salario;
	
	end;

$$ language plpgsql 


select * from instrutor_bem_pago2(900);



=====================================================================================


create or replace function buscar_instrutor3(nome_instrutor varchar) returns setof instrutor as $$ 

	begin

	return query select * from instrutor where nome like '%' || nome_instrutor || '%';

	end;
$$ language plpgsql;


select * from buscar_instrutor3('Matheus')