PROCEDURE

Uma Procedure no PostgreSQL é exatamente igual a uma função tendo como diferença o fato de que não retorna nenhum valor.

Como não há retorno em Procedures, não podemos chamá-lo como parte de um comando SQL (como temos feito com funções, chamando-as como parte do SELECT). No lugar disso, utilizamos CALL nome_do_procedure para executar uma Procedure.

Tudo que for ensinado nesse treinamento sobre lógicas de execução se aplica a procedure, se atentando à diferença de que não há retorno.

Para saber mais, aqui tem a documentação oficial (que é bem curtinha) deste conceito: https://www.postgresql.org/docs/current/xproc.html



CREATE OR REPLACE PROCEDURE importar_arquivo()
AS $$
BEGIN
  -- Cria uma tabela temporária para armazenar o conteúdo do arquivo
  CREATE TEMPORARY TABLE temp_import (
    coluna1 TEXT,
    coluna2 TEXT,
    -- adicione mais colunas conforme necessário
  );

  -- Carrega o conteúdo do arquivo na tabela temporária
  COPY temp_import FROM '/caminho/do/arquivo.txt' DELIMITER ',' CSV HEADER;

  -- Insira as linhas filtradas na tabela final
  INSERT INTO tabela_final (coluna1, coluna2)
  SELECT coluna1, coluna2
  FROM temp_import
  WHERE -- adicione as condições de filtro aqui;

  -- Limpa a tabela temporária
  DROP TABLE temp_import;
END;
$$ LANGUAGE plpgsql;