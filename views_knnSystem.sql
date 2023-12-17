-- contratos dentro do ano corrente

create or replace view sch_contratos.vw_contratos_ano_corrente as
select num_contrato, vigencia_inicial, vigencia_final, objeto, vlr_mensal_inicial, vlr_mensal_atual,
				fk_nome_gestor, fk_email_gestor, fk_nome_sindico,fk_email_sindico
		from sch_contratos.tbl_contrato where 
			(select extract (year from vigencia_final) from sch_contratos.tbl_contrato) = 
			(select extract (year from now()));


-- ===============================================================================================

-- contratos ativos

create or replace view sch_contratos.vw_contratos_ativos as
select num_contrato, vigencia_inicial, vigencia_final, objeto, vlr_mensal_inicial, vlr_mensal_atual,pct_multa,
				fk_nome_gestor, fk_email_gestor, fk_nome_sindico,fk_email_sindico
		from sch_contratos.tbl_contrato where status like '%ativo%' or status like'Ativo' or status like'ativo%'
											or status like 'ATIVO' or status like '%ATIVO%' or status like 'ATIVA'
											or status like '%ativa%' or status like'Ativa' or status like'ativa%';


-- ===============================================================================================


-- valor total dos contratos ativos

create or replace view sch_contratos.vw_vlr_total_contratos_ativos as
select sum (vlr_mensal_atual) as vlr_total_atual_contratos_ativos
		from sch_contratos.tbl_contrato where status like '%ativo%' or status like'Ativo' or status like'ativo%'
											or status like 'ATIVO' or status like '%ATIVO%' or status like 'ATIVA'
											or status like '%ativa%' or status like'Ativa' or status like'ativa%';

-- ===============================================================================================


-- contratos iniciados no ano corrente

create or replace view sch_contratos.vw_iniciados_ano_corrente as
select num_contrato, vigencia_inicial, vigencia_final, objeto, vlr_mensal_inicial, vlr_mensal_atual,
				fk_nome_gestor, fk_email_gestor, fk_nome_sindico,fk_email_sindico
		from sch_contratos.tbl_contrato where 
			(select extract (year from vigencia_inicial) from sch_contratos.tbl_contrato) = 
			(select extract (year from now()));


-- ===============================================================================================


-- Contratos e seus fornecedores

create or replace view sch_contratos.vw_contrato_fornecedores as
select co.num_contrato, co.objeto, co.vigencia_inicial, co.vigencia_final, co.status as status_contrato,
	co.fk_nome_gestor, co.vlr_mensal_inicial, co.vlr_mensal_atual,
	f.razao_social, f.cnpj, f.natureza_servico, f.email_corporativo, f.endereco, f.status as status_fornecedor
		from sch_contratos.tbl_contrato as co left join sch_contratos.tbl_fornecedor as f 
			on co.fk_id_fornecedor = f.pk_id;

-- ===============================================================================================

-- Contratos ativos e seus fornecedores

create or replace view sch_contratos.vw_contrato_ativos_fornecedores as
select co.num_contrato, co.objeto, co.vigencia_inicial, co.vigencia_final, co.status as status_contrato,
	co.fk_nome_gestor, co.vlr_mensal_inicial, co.vlr_mensal_atual,
	f.razao_social, f.cnpj, f.natureza_servico, f.email_corporativo, f.endereco, f.status as status_fornecedor
		from sch_contratos.tbl_contrato as co left join sch_contratos.tbl_fornecedor as f 
			on co.fk_id_fornecedor = f.pk_id where 
				co.status like '%ativo%' or co.status like'Ativo' or co.status like'ativo%'
				or co.status like 'ATIVO' or co.status like '%ATIVO%' or co.status like 'ATIVA'
				or co.status like '%ativa%' or co.status like'Ativa' or co.status like'ativa%';

-- ===============================================================================================

-- 	Contratos ativos e seus fornecedores/contas bancárias	

create or replace view sch_contratos.vw_contrato_ativos_fornecedores_domic_bancario as
select co.num_contrato, co.objeto, co.vigencia_inicial, co.vigencia_final, co.status as status_contrato,
	co.fk_nome_gestor, co.vlr_mensal_inicial, co.vlr_mensal_atual,
	f.razao_social, f.cnpj, f.natureza_servico, f.email_corporativo, f.endereco, f.status as status_fornecedor,
	d.agencia, d.conta, d.banco, d.chave_pix, d.status as status_conta
		from sch_contratos.tbl_contrato as co left join sch_contratos.tbl_fornecedor as f 
			on co.fk_id_fornecedor = f.pk_id
		left join sch_contratos.tbl_domicilio_bancario as d
			on co.fk_id_fornecedor = d.fk_id_fornecedor
			where 
				co.status like '%ativo%' or co.status like'Ativo' or co.status like'ativo%'
				or co.status like 'ATIVO' or co.status like '%ATIVO%' or co.status like 'ATIVA'
				or co.status like '%ativa%' or co.status like'Ativa' or co.status like'ativa%';


-- ===============================================================================================



