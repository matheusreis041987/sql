create table quarto_airbnb (
	id serial primary key,
	nm_hospede varchar(255) not null,
	qunt_noites integer not null,
	valor_noite decimal default 175.0,
	tx_aplicativo decimal,
	tx_limpeza decimal,
	valor_anfitriao decimal,
	momento_insercao timestamp default current_timestamp
);

-- taxa de limpeza até 2 dias 80,00, maior que 2 dias 120,00

create or replace function criar_hospedagem (nome_hospede varchar, quantidade_noites integer, diaria decimal) returns void as $$ 

	declare
		taxa_airbnb decimal default 0.12;
		limpeza decimal;
		valor_aplicativo decimal;
		diaria_curta integer default 2;
		liquido_anfitriao decimal;
	
	begin
		valor_aplicativo := quantidade_noites * diaria * taxa_airbnb;
		
		if quantidade_noites <= diaria_curta then
		limpeza := 80.00;
		else
		limpeza := 120.00;
		end if;
		
		liquido_anfitriao := (quantidade_noites * diaria) + limpeza - valor_aplicativo;
	
	insert into quarto_airbnb (nm_hospede, qunt_noites, valor_noite, tx_aplicativo, tx_limpeza, valor_anfitriao) values
	
	(nome_hospede, quantidade_noites, diaria, valor_aplicativo, limpeza, liquido_anfitriao);
	
	end;

$$ language plpgsql;

select criar_hospedagem ('Matheus Inacio De Campos', 12, 120)

select * from quarto_airbnb