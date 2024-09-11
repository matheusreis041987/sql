-- FUNÇÕES EM POSTGRES


create or replace function retornar_nome_funcionario (func_codigo varchar(20))
returns text as
$$

	declare
		nome text;
		ativo boolean;
		begin
					select funcionario_nome,
						   funcionario_ativo
						   into nome, ativo
						   from db_restaurant.funcionario
						   where funcionario_codigo = func_codigo;
						   
						      if ativo = true then
							  	return nome || ' - Funcionário ativo';
							  else
							  	return nome || ' - Funcionário inativo';
								end if;
			end
$$
language PLPGSQL;


select retornar_nome_funcionario('Ab1')


-- $$ ==> tudo que está dentro o BD entende como função

-- Declare ==> serve para declarar e armazenar variáveis



--=================================================================================================

 create or replace function buscar_produto (prod_cod varchar(20))
 returns text as
 $$
 	declare
	nome text;
	ativo boolean;
	valor double precision;
	begin
		select produto_nome, produto_ativo, produto_valor 
		into nome, ativo, valor
		from db_restaurant.produto
		where produto_codigo = prod_cod;
		
		if ativo = true then
		return nome || ' que custa R$ ' || valor;
		elsif ativo = null then
		return 'Produto inexistente';
		else
		return nome || ' não está mais ativo';
	end if;
end
$$
LANGUAGE	PLPGSQL;



===========================================================


create or replace function rt_valor_comissao (func_codigo varchar(20))
returns double precision as
$$
	declare
		valor_comissao double precision;
	begin
		select funcionario_comissao
		into valor_comissao
		from db_restaurant.funcionario
		where funcionario_codigo = func_codigo;
		
			return valor_comissao;
	end
$$
LANGUAGE	PLPGSQL;

select rt_valor_comissao('Ab1')










