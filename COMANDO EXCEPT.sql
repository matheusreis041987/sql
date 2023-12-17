/*Quando se quer que apareçam os registros da tabela A 
que não são iguais aos da tabela B, temos a opção de ‘subtrair’ os registros utilizando EXCEPT.
*/



select * from EMP2 except select * from EMP

select * from emp2 except select * from emp; -- verifica quem está fora de um conjunto