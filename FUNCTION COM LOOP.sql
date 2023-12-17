-- function com loop

create or replace function calc_comissao (data_ini timestamp, data_fim timestamp)
returns void as $$
declare
total_comissao double precision :=0;
porc_comissao double precision :=0;
reg record;
cr_porce cursor (func_id uuid) is select rt_valor_comissao (func_id);

begin 

for reg in (
		select 	venda_id,
				funcionario_id,
				venda_total
				from db_restaurant.venda
				where venda_data_criacao >= data_ini
				and venda_data_criacao <= data_fim
				and venda_comissionado = false
		
) loop

open cr_porce (re.funcionario_id);
fetch cr_porce into porc_comissao;
close cr_porce;

	total_comissao := (reg.venda_total * porc_comissao)/100;
	
insert into db_restaurant.comissao (
									comissao_id,
									funcionario_id,
									comissao_valor,
									comissao_ativo,
									comissao_data_criacao,
									comissao_data_atualizacao
)     				values (gen_random_uuid(),
							reg.funcionario_id,
							total_comissao,
							true,
							now(),
							now()
);

update db_restaurant.venda set venda_comissionado = true
									where venda_id = reg.venda_id;
total_comissao :=0;
porc_comissao :=0;

end loop;

end;

$$	LANGUAGE	PLPGSQL;

