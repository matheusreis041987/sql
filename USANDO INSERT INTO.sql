-- inserir novos valores na tabela

insert into paciente values
(563256259, '20/08/1985', 'COVID', 32255365, 2, 104),
(562255689, '20/09/1985', 'COVID', 32255465, 2, 107),
(568259889, '18/08/1985', 'COVID', 32255365, 1, 104);

-- -----------------------------------------------------
insert into emp2 values 
(32, 'THIAGO', 6000,3);

-- ----------------------------------------------------
-- COMANDO PARA INSERIR UMA TABELA DENTRO DA OUTRA

INSERT INTO P SELECT * FROM P2; --FOI CRIADA UMA TABELA P2, IGUAL À P1, SENDO INSERIDO TODOS OS DADOS DE P EM P2

INSERT INTO TADEGA2(num,vinho,produtor,ano,garrafas,engarraf) VALUES
(2,'Chardonnay','Buena Vista',1997,1,1999),
(3,'Chardonnay','Geyser Peak',1997,5,1999),
(6,'Chardonnay','Simi',1996,4,1998),
(12,'John. Riesling','Jekel',1998,1,1999),
(21,'Fume Blanc','Ch. St. Jean',1997,4,1999),
(22,'Fume Blanc','Robt. Mondavi',1996,2,1998),
(30,'Gewurztraminer','Ch. St. Jean',1998,3,1999),
(43,'Cab. Sauvignon','Windsor',1991,12,2000),
(45,'Cab. Sauvignon','Geyser Peak',1994,12,2002),
(48,'Cab. Sauvignon','Robt. Mondavi',1993,12,2004),
(50,'Pinot Noir','Gary Farrell',1996,3,1999),
(51,'Pinot Noir','Fetzer',1993,3,2000),
(52,'Pinot Noir','Dehlinger',1995,2,1998),
(58,'Merlot','Clos du Bois',1994,9,2000),
(59,'Merlot','Buena Vista',2000,6,2001);


-- inserir os dados de uma coluna dentro de outra tabela


insert into interesse(rg) select rg from f group by rg order by rg;


-- insert into usando o select para inserir grande quantidade de dados de outra tabela

insert into "SISED".bonus (nome)
(select enome from "SISED".emp where dn = 5 );
