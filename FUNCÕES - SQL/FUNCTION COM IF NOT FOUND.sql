create function cria_curso (nome_curso varchar, nome_categoria varchar) returns void as $$ 

	declare
	id_categoria integer;
	
	begin
		select id from categoria where nome = nome_categoria into id_categoria;
		
		-- found -> informar se houve retorno de algum resultado
		
		if not found then -- bloco para tratar erro
		insert into categoria (nome) values (nome_categoria) returning id into id_categoria;
		end if;
		
		insert into curso (nome, categoria_id) values (nome_curso,id_categoria);
		
	end;
$$ language plpgsql

select cria_curso('Python com machine learn', 'IA - Intelegência ARtificial');
select cria_curso('SQL com Maria DB', 'Banco de Dados');

select * from categoria
select * from curso
