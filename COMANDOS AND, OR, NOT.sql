select * from tadega where vinho like 'pinot%' and ano > 1994;
select * from tadega where ano > 1995 or preco > 120;
select * from tadega where ano not in (1995, 1996, 1997, 1998) -- not é o oposto, negação