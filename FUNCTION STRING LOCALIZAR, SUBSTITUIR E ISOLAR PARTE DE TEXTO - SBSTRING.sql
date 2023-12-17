
-- função para substituir parte de um texto na visualização 

select overlay (funcionario_nome placing '00000' from 3 for 5) from db_restaurant.funcionario 
where funcionario_codigo = '0001'

-- função para extrair parte de um texto

select substring (funcionario_nome from 1 for 6) from db_restaurant.funcionario where funcionario_codigo = 'Ab1'


-- função para achar o primeiro nome

select substring (funcionario_nome from 1 for (select position (' ' in funcionario_nome) 
	from db_restaurant.funcionario where funcionario_codigo = 'Ab1')) 
from db_restaurant.funcionario --where funcionario_codigo = 'Ab1'




