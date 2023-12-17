-- CRIANDO DOMINIO PARA CHECAR DADOS EM UMA TABELA. ELE É APLCIADO COMO UM TIPO DE DADO

-- O comando CREATE DOMAIN cria um domínio. O domínio é, essencialmente, um tipo de dado com restrições opcionais (restrições no conjunto de valores permitidos). O usuário que cria o domínio se torna o seu dono.

create domain LeagueDom char(8)
check (value in ('Brasil', 'EUA'));

create table TEAM(
	TeamName				char(20) not null,
	Leangue 				LeagueDom not null 		
);