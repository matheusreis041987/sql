create function instrutores_bem_pagos2(valor_salario decimal) returns table (id integer, nome varchar, salario decimal)  as $$ 

	select * from instrutor where salario > valor_salario; 

$$ language sql;

select nome, salario from instrutores_bem_pagos(800)

