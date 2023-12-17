drop table if exists Tadega2;
create table Tadega2 (
num integer primary key,
vinho char(15),
produtor char(15),
ano integer,
garrafas integer,
engarraf integer,
preco integer AS ( 10 * (engarraf-ano) ), -- virtual(default) ou stored -- stored que é carregado(armazenado) quando criado o virtual é calculado sempre quando for usado
foto blob, -- a foto da garrafa do vinho
apres blob  -- a apresentação do vinho
);

-- coluna derivada é aquela que é calculada em função de outra coluna da tabel



drop table if exists Tadega2;
create table Tadega2 (
num integer primary key,
vinho char(15),
produtor char(15),
ano integer,
garrafas integer,
engarraf integer,
preco integer AS ( case when ano<1995 then 350 when ano = 1997 then 150 else 30+(engarraf-ano)*10 end), -- virtual(default) ou stored -- stored que é carregado(armazenado) quando criado o virtual é calculado sempre quando for usado
foto blob, -- a foto da garrafa do vinho
apres blob  -- a apresentação do vinho