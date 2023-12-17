-- *****************POSTEGRES******************************

-- https://www.devmedia.com.br/trabalhando-com-stored-procedures-no-postgresql/33354


-- procedure são blocos de códigos que executam alguma ação dentro do BD 

-- retirar a parte de salário de um empregado e passar para outro

-- CODIGO COM EXPLICAÇÕES - ESTÁ DANDO ERRO 


create or replace procedure transferencia (origem integer, destino integer, valor decimal) -- nos parênteses irão os parâmetros criados
language plpgsql
as $$ -- o marcador lable($$) indica para o postegre que inicia-se ou termina um bloco de códigos.

-- declare -- serve para declarar as varíaveis. No caso, elas foram já declaradas nos patrâmetros

begin -- serve para inserir o corpo do código

	-- substraindo o montante transferido pela conta de origem
	update "SISED".emp 
	set	sal = sal - valor
	where en = origem;

	-- adicionar o montante transferido para a conta de destino
	update "SISED".emp
	set sal = sal + valor
	where en = destino;
	
end $$;


-- CÓDIGO SEM EXPLICAÇÕES - RODOU DE BOA

create or replace procedure transferencia (origem integer, destino integer, valor decimal) 
language plpgsql
as $$ 

begin 
	update "SISED".emp 
	set	sal = sal - valor
	where en = origem;

	update "SISED".emp
	set sal = sal + valor
	where en = destino;
	
end $$;



--*************** CHAMANDO A PROCEDURE *******************************************

call "SISED".transferencia (2,3,1000);

call "SISED".transferencia (1, 7, 2265.45);


