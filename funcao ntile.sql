NTILE divide um conjunto de dados ordenado no número de faixas (buckets) indicado pela expressão, e atribui o número do intervalo apropriado a cada linha.

select razao_social, produto, valor_total, ntile(5) over (order by valor_total) as ntile_ from cliente