select * from EMP where dn = (select dn from depto where nome like '%marketing%')

select  * from  emp join  depto  on  depto.nome like  '%marketing%'


