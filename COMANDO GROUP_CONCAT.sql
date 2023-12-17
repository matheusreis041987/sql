select *, GROUP_CONCAT(tel, ' | ') from emp join tele using(en); 



select uva, group_concat(produtor || garrafas, ' == ') as produtores from Tab_adega group by uva;


-- USO NO POSTGRES

select tadega.vinho, produtor|| ' -- ' || ano || ' -- ' || preco as importante from "Tadega".tadega