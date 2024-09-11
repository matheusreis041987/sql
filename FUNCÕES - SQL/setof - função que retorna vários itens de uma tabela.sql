create function instrutores_bem_pagos(valor_salario decimal) returns setof instrutor as $$ 

	select * from instrutor where salario > valor_salario; 

$$ language sql;

select * from instrutores_bem_pagos(800)

